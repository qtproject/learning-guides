..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------

Store and Load Data from a Database
===================================

So far we have implemented the core functionality of NoteApp*: creating and managing note items on the fly.

In this step, we will go through a detailed implementation of storing notes in a local database. QML offers a simple :qt5:`Qt Quick Local Storage API <qtquick/qmlmodule-qtquick-localstorage2-qtquick-localstorage-2.html>`, which uses the SQLite database for implementing our required feature.

The preferred approach for the NoteApp* would be to load notes from the database on application start-up and save them when the application is closed. The user is not prompted at all.


Defining the Database
---------------------

The database for NoteApp* should be a simple one. It has just one table, the *note* table, that will contain the information for our saved notes.

.. list-table::
    :widths: 20 30 50
    :header-rows: 1

     * - Field
       - Type
       - Description

     * - `noteId`
       - INTEGER (PRIMARY KEY AUTOINCREMENT)
       - Unique identifier for the note item

     * - `x`
       - INTEGER
       - The `x` property of the note item holding the position on the horizontal axis

     * - `y`
       - INTEGER
       - The `y` property of the note item holding the position on the vertical axis

     * - `noteText`
       - TEXT
       - For the note item text

     * - `markerId`
       - TEXT
       - `markerId` represents the page to which this note item belongs


Looking at the Table definition, let's try to figure out from the information stated above what the `Note` component already has and if any new data should be introduced.

     The `x` and `y` are geometrical properties that each QML item has. Getting these values from the `Note` items should be straightforward. These values will be used to store the position of a note within its page.
     `noteText` is the actual text of the note and we can retrieve it from the `Text` element in our `Note` component, however, a property alias could be defined for this and we can call it `noteText`. This will be shown later on.
     `noteId` and `markerId` are identifiers that every note item should have. `noteId` will be a unique identifier required by the database while `markerId` will help us identify the page to which this note item belongs. So we would need two new properties in the `Note` component.


In the `Note` component, we define the new required properties:

.. code-block:: js

    // Note.qml

    Item {
    id: root
    width: 200; height: 200

    ...

        property string markerId
        property int noteId
        property alias noteText: editArea.text

    ...

    }

Considering that the `Page` component is responsible for creating `Note` items, it should also know which `markerId` it is associated with. When a new `Note` item is created (not loaded from the database), the `Page` should set the `Note` item's `markerId` property.

We'll use a Javascript helper function for this:

.. code-block:: js

    // Page.qml

    Item {
    id: root
    ...

        // this property is held for helping store
        // the note items in the database
        property string markerId

    ...

        // this Javascript helper function is used to create,
        // Note items not loaded from database so that it will set
        // the markerId property of the note.
        function newNote() {
            // calling the newNoteObject and passing the a set of
            // arguments where the markerId is set.
            newNoteObject( { "markerId": root.markerId } )
        }

    ...

    }

Previously, in `main.qml`, we used the `newNoteObject()` function, but as explained above, that doesn't fit our purpose any longer so we need to replace it with the `newNote()` function.

We have a `markerId` property for the `Page` component that is used to set the `markerId` of `Note` items when created. We must ensure that a page's `markerId` property is set properly when the `Page` items are created in the `PagePanel` component.

.. code-block:: js


    // PagePanel.qml

    Item {
    id: root

    ...

        // creating three Page items that are anchored to fill the parent
        Page { id: personalpage; anchors.fill: parent; markerId: "personal" }
        Page { id: funpage; anchors.fill: parent; markerId: "fun" }
        Page { id: workpage; anchors.fill: parent; markerId: "work" }

    ...

    }


We have so far ensured that the:

 * relation between notes and pages is correct from a relational database perspective,

 * a `Note` item has a unique ID that belongs to a page identified by a marker ID,

 * and these property values are set properly.

Now let's work on how to load and store the notes.

Stateless JavaScript Library
----------------------------

To simplify the development effort, it would be a good idea to create a JavaScript interface that interacts with the database and provides us with convenient functions to use in our QML code.

In Qt Creator, we create a new JavaScript file named, `noteDB.js`, and make sure that we check the     Stateless Library* option. The idea is to make the `noteDB.js` file act like a library and provide stateless helper functions. In this way, there will be just one instance of this file loaded and used for each QML component where the `noteDB.js` is imported and used. This also ensures that there's just one global variable for storing the database instance, `_db`.

.. note:: Non-stateless JavaScript files are useful when imported in a QML component, perform operations on that component, and all the variables are valid within that context only. Each import creates a separate instance of the JavaScript file.

The `noteDB.js` should provide the following functionality:

    * Open/Create a local database instance

    * Create the necessary database tables

    * Read notes from the database

    * Delete all notes

We will see in greater detail how the functions in `noteDB.js` are implemented when describing the implementation of loading and saving note items to the database. Now, let's consider the following functions implemented for us:

    * `function openDB()` - Creates the database if one doesn't already exist and, if it does, it opens it

    * `function createNoteTable()` - Creates the `note` table if one doesn't already exist. This function is only called in the `openDB()` function

    * `function clearNoteTable()` - Removes all rows from the `note` table

    * `function readNotesFromPage(markerId)` - This helper function reads all the notes that are related to the `markerId` specified, and returns a dictionary of data.

    * `function saveNotes(noteItems, markerId)` - Used to save note items in the database. The arguments, `noteItems` represents a list of note items, and the `markerId` representing the corresponding page to which the note items belong.

.. note:: As all these JavaScript functions access the database using the Qt Quick Local Storage API, add the statement, `.import QtQuick.LocalStorage 2.0 as Sql`, at the beginning of `noteDB.js`.

Loading and Storing Notes
-------------------------

Now that we have the `noteDB.js` implemented, we would like to use the given functions to load and store notes.

A good practice as to when and where to initialize or open the database connection is to do so in the     main* qml file. This way, we can use the JavaScript functions defined in the `noteDB.js` file without reinitializing the database.

We import the `noteDB.js` and `QtQuick.LocalStorage 2.0` in the `main.qml` file, but the question is when to call the `openDB()` function. QML offers helpful attached signals, :qt5:`onCompleted() <qtqml/qml-qtquick2-component.html#onCompleted-signal>` and :qt5:`onDestruction() <qtqml/qml-qtquick2-component.html#onDestruction-signal>`, which are emitted when the component is fully loaded and destroyed respectively.

.. code-block:: js

    // main.qml

    import QtQuick 2.0
    import "noteDB.js" as NoteDB

    ...
    // this signal is emitted upon component loading completion
    Component.onCompleted: {
        NoteDB.openDB()
    }
    ...


Here is the implementation of the `openDB` function. It calls the :qt5:`openDatabaseSync() <qtquick/qmlmodule-qtquick-localstorage2-qtquick-localstorage-2.html#opendatabasesync>` function for creating the database and afterwards calls the `createNoteTable()` function for creating the `note` table.

.. code-block:: js

    //noteDB.js

    ...
    function openDB() {
        print("noteDB.createDB()")
        _db = openDatabaseSync("StickyNotesDB","1.0",
                               "The stickynotes Database", 1000000);

        createNoteTable();
    }

    function createNoteTable() {
        print("noteDB.createTable()")
        _db.transaction( function(tx) {
            tx.executeSql(
                "CREATE TABLE IF NOT EXISTS note
                (noteId INTEGER PRIMARY KEY AUTOINCREMENT,
                 x INTEGER,
                 y INTEGER,
                 noteText TEXT,
                 markerId TEXT)")
        })
    }
    ...


In the `main.qml` file, we initialize the database so it is pretty safe to start loading our `Note` items in the `Page` component. Above, we have mentioned the `readNotesFromPage(markerId)` function that returns a list of data arrays (referred as dictionary in the scripting world) and each array represents a row in the database with the data of a note.

.. code-block:: js

    //noteDB.js

    ...
    function readNotesFromPage(markerId) {
        print("noteDB.readNotesFromPage() " + markerId)
        var noteItems = {}
        _db.readTransaction( function(tx) {
            var rs = tx.executeSql(
                "SELECT      FROM note WHERE markerId=?
                 ORDER BY markerid DESC", [markerId] );
            var item
            for (var i=0; i< rs.rows.length; i++) {
                item = rs.rows.item(i)
                noteItems[item.noteId] = item;
            }
        })

        return noteItems
    }


Tthe `Page` component will read the notes and create the respective QML note* objects.

.. code-block:: js

    // Page.qml

    ...
    // when the component is loaded, call the loadNotes()
    // function to load notes from the database
    Component.onCompleted: loadNotes()

    // a Javascript helper function that reads the note data from database
    function loadNotes() {
        var noteItems = NoteDB.readNotesFromPage(markerId)
        for (var i in noteItems) {
            newNoteObject(noteItems[i])
        }
    }
    ...

We can see that the `newNoteObject()` function, defined previously in `Page.qml`, takes the array of data as arguments, which are in fact values for the `x`, `y`, `noteText`,
`markerId` and `noteId` properties.

.. note:: Notice that the `note` table field names are same as the `Note` component properties. This helps us pass the data of a table row as arguments when creating the note QML object.

Now that we have implemented a function to load the `Note` items from the database, the next logical step is to implement a function to save notes into `DB`. In our code, we know that the `PagePanel` component is responsible for creating the `Page` items, so it should be able to access the notes on each page and call the `saveNotes()` JavaScript function from `noteDB.js` to save the notes into `DB`.

.. code-block:: js

    //noteDB.js

    ...

    function saveNotes(noteItems, markerId) {
        for (var i=0; i<noteItems.length; ++i) {
            var noteItem = noteItems[i]
            _db.transaction( function(tx) {
                tx.executeSql(
                    "INSERT INTO note (markerId, x, y, noteText)
                    VALUES(?,?,?,?)",
                    [markerId, noteItem.x, noteItem.y, noteItem.noteText]);
            })
        }
    }

So at first we define a property alias that will expose the `Note` items, which are childrens of the     container Item* created in the `Page` component:

.. code-block:: js

    // Page.qml

    Item {
    id: root
    ...

        // this property is used by the PagePanel component
        // for retrieving all the notes of a page and storing
        // them in the Database.
        property alias notes: container.children

    ...

    }

In the `PagePanel`, we implement the functionality for saving notes to DB*:

.. code-block:: js

    // PagePanel.qml

    ...
    Component.onDestruction: saveNotesToDB()

    // a JavaScript function that saves all notes from the pages
    function saveNotesToDB() {
        // clearing the DB table before populating with new data
        NoteDB.clearNoteTable();

        // storing notes for each individual page
        NoteDB.saveNotes(personalpage.notes, personalpage.markerId)
        NoteDB.saveNotes(funpage.notes, funpage.markerId)
        NoteDB.saveNotes(workpage.notes, workpage.markerId)
    }
    ...

In order to reduce the complexity of our code, we clear all the data in DB* before saving our notes. This avoids the need to have code for updating existing *Note* items.

By the end of this chapter, the users are able to create and delete new notes as they like while the application saves and loads notes automatically for them.

.. rubric:: What's Next?

The next chapter will introduce some fancy animations and how these are implemented in several steps and approaches.
