..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------

Create and Manage Note Items
============================

The user should be able to create and delete notes on the fly and this means that our code should be able to dynamically create and delete Note* items. There are several ways to create and manage QML objects. In fact, we have seen one already using the :qt5:`Repeater <qtquick/qml-qtquick2-repeater.html>` type. Creating a QML object means that the component has to be created and loaded before creating instances of that component.

QML objects can be created by calling the :qt5:`createObject(Item parent, object properties) <qtqml/qml-qtquick2-component.html#createObject-method>` JavaScript function on the component. Refer to :qt5:`Dynamic Object Management in QML <qtqml/qtqml-javascript-dynamicobjectcreation.html>` for further details.

Let's see how we can create note item objects in our components.


Note Object Creation Dynamically
--------------------------------

We know that a `Note` item belongs to the `Page` component, which is responsible for the note object creation as well as to loading notes from the database.

As mentioned before, we first load the `Note` component in the `Page` component:

.. code-block:: js

     // Page.qml

     ...
     // loading the Note Component
    Component {
        id: noteComponent
        Note { }
    }
     ...

Now let's define a Javascript function that will create QML `Note` objects. While creating a QML object, we must ensure that one of the arguments is the parent of the `this` object. Considering to have a `Note` item container within the `Page` component would be a good idea for managing our note objects, as we would like to save these notes in a database.

.. code-block:: js

     // Page.qml

    ...
    // creating an Item element that will be used as a note container
    Item { id: container }

     ...
    // a Javascript helper function for creating QML Note objects
    function newNoteObject(args) {
        // calling the createObject() function on noteComponent item
        // and the container item will be the parent of the new
        // object and args as the set of arguments
        var note = noteComponent.createObject(container, args)
        if(note == null) {
            console.log("note object failed to be created!")
        }
    }
    ...

So in the code shown above, we see how a new note* item object can be created in the *newNoteObject()* function. The newly created note objects will belong to the *container* item.

Now we would like to call this function when the new note* tool is pressed on the toolbar, which is created in the `main.qml` file. As the `PagePanel` component is aware of the current visible *page* item, we can create a new property in `PagePanel` to store that page.

We will access this property in the `main.qml` file and call the function to create new note items.

.. code-block:: js

    // PagePanel.qml
    ...

    // this property holds the current visible page
    property Page currentPage: personalpage

    // creating the list of states
    states: [
        // creating a State item with its corresponding name
        State {
            name: "personal"
            PropertyChanges {
                target: personalpage
                opacity:1.0
                restoreEntryValues: true
            }
            PropertyChanges {
                target: root
                currentPage: personalpage
                explicit: true
            }
        },
        State {
            name: "fun"
            PropertyChanges {
                target: funpage
                opacity:1.0
                restoreEntryValues: true
            }
            PropertyChanges {
                target: root
                currentPage: funpage
                explicit: true
            }
        },
        State {
            name: "work"
            PropertyChanges {
                target: workpage
                opacity:1.0
                restoreEntryValues: true
            }
            PropertyChanges {
                target: root
                currentPage: workpage
                explicit: true
            }
        }
    ]
    ...

We modify our three states for setting the appropriate value for the `currentPage` property.

In the `main.qml` file, let's see how to call the function for creating new note objects when the new note* tool is clicked:

.. code-block:: js

    // main.qml

    ...
    // using a Column element to layout the Tool items vertically
    Column {
        id: toolbar
        spacing: 16
        anchors {
            top: window.top; left: window.left; bottom: window.bottom;
            topMargin: 50; bottomMargin: 50; leftMargin: 8
        }

        // the new note tool, also known as the plus icon
        Tool {
            id: newNoteTool
            source: "images/add.png"

            // using the currentPage property of PagePanel and
            // calling newNoteObject() function without any arguments.
            onClicked: pagePanel.currentPage.newNoteObject()
        }
    }
    ...


Deleting Note Objects
---------------------

Deleting the `Note` objects is a more straightforward process because the QML :qt5:`Item <qtquick/qml-qtquick2-item.html>` type provides a JavaScript function called :qt5:`destroy() <qtqml/qtqml-javascript-dynamicobjectcreation.html#deleting-objects-dynamically>`. As we already have a container item whose children are `Note` items, we can simply iterate through the list of children and call :qt5:`destroy() <qtqml/qtqml-javascript-dynamicobjectcreation.html#deleting-objects-dynamically>` on each of them.

In the `Page` component, let's define a function to perform this operation for us:

.. code-block:: js

    // Page.qml
    ...

    // a JavaScript helper function for iterating through the children elements of the
    // container item and calls destroy() for deleting them
    function clear() {
        for(var i=0; i<container.children.length; ++i) {
            container.children[i].destroy()
        }
    }
    ...

In the `main.qml` file, we call the `clear()` function when the `clear` tool is pressed:

.. code-block:: js

    // main.qml
    ...

    // the `clear` tool
    Tool {
        id: clearAllTool
        source: "images/clear.png"
        onClicked: pagePanel.currentPage.clear()
    }
    ...

In order to allow the user to delete each note individually, we add a tool in the `NoteToolbar` component to our `Note` component. We can use the `Tool` component that was implemented earlier for this:

.. code-block:: js

    // Note.qml
    ...

    // creating a NoteToolbar item that will be anchored to its parent
    NoteToolbar {
        id: toolbar
        height: 40
        anchors { top: root.top; left: root.left; right: root.right }
        // using the drag property alias to set the drag.target
        // to our Note item.
        drag.target: root

        // creating the `delete` tool for deleting the note item
        Tool {
            id: deleteItem
            source: "images/delete.png"
            onClicked: root.destroy()
        }
    }
    ...

.. rubric:: What's Next?

Next, there will be a detailed step on how store the note items in a database locally.
