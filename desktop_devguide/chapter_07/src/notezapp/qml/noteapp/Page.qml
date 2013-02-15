/****************************************************************************
**
** Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
** Contact: http://www.qt-project.org/legal
**
** $QT_BEGIN_LICENSE:BSD$
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of Digia Plc and its Subsidiary(-ies) nor the names
**     of its contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.0

import "noteDB.js" as NoteDB

// Page.qml

Item {
    id: root
    // by default a page should not be visible,
    // page's visibility is mananged by the PagePanel
    // the opacity property is sufficient
    opacity: 0.0

    // this property is held for helping to store the note
    // items in the database
    property string markerId

    // this property is used by the PagePanel componet
    // for retrieving all the notes of a page and storing
    // them in the Database.
    property alias notes: container.children

    // loading the Note Component
    Component {
        id: noteComponent
        Note { }
    }

    // creting an Item type that will be used as a note container
    // we anchor the container to fill the parent as it will be used
    // later in the code to control the dragging area for notes
    Item { id: container; anchors.fill: parent }

    // when the Component is loaded then the call the loadNotes() function
    // to load notes from the database
    Component.onCompleted: loadNotes()

    // a helper Javascript function that is reads the note data from DB
    function loadNotes() {
        var noteItems = NoteDB.readNotesFromPage(markerId)
        for (var i in noteItems) {
            newNoteObject(noteItems[i])
        }
    }

    // a Javascript helper function for creating Note QML objects
    function newNoteObject(args) {
        // setting the container property of the note to the
        // actual container see Note.qml what the container
        // property is used for
        args.container = container

        // calling the createObject() function on the noteComponent
        // for creating Note objects.
        // the container will be the parent of the new object
        // and args as the set of arguments
        var note = noteComponent.createObject(container, args)
        if (note == null) {
            console.log("note object failed to be created!")
        }
    }

    // a Javascript helper function for iterating through
    // the children types of the container item
    // and calls destroy() for deleting them
    function clear() {
        for (var i=0; i<container.children.length; ++i) {
            container.children[i].destroy()
        }
    }

    // this Javascript helper function is used to create,
    // not loaded from db, Note items so that it will
    // set the markerId property of the note.
    function newNote() {
        // calling the newNoteObject and passing the a set of arguments where the markerId is set.
        newNoteObject( { "markerId": root.markerId } )
    }

}
