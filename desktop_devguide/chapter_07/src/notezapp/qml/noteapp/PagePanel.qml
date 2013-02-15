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

// PagePane.qml

Item {
    id: root

    // this property holds the current visible page
    property Page currentPage: personalpage

    // setting an initial value for the state property
    state: "personal"

    // creating the list of states
    states: [
        //creating a State item with its corresponding name
        State {
            name: "personal"
            PropertyChanges { target: personalpage; opacity:1.0; restoreEntryValues: true }
            PropertyChanges { target: root; currentPage: personalpage; explicit: true }
        },

        State {
            name: "fun"
            PropertyChanges { target: funpage; opacity:1.0; restoreEntryValues: true }
            PropertyChanges { target: root; currentPage: funpage;  explicit: true }
        },
        State {
            name: "work"
            PropertyChanges { target: workpage; opacity:1.0; restoreEntryValues: true }
            PropertyChanges { target: root; currentPage: workpage; explicit: true }
        }
    ]

    // creating a list of transitions for the different states of the PagePanel
    transitions: [
        Transition {
            //for all states run the same transition
            from: "*"; to: "*"
            NumberAnimation { property: "opacity"; duration: 500 }
        }
    ]

    BorderImage {
        id: background
        anchors.fill: parent
        source: "images/page.png"
        border.left: 68; border.top: 69
        border.right: 40; border.bottom: 80
    }

    // creating three Page items that are anchored to fill the parent.
    Page { id: personalpage; anchors.fill: parent; markerId: "personal" }
    Page { id: funpage; anchors.fill: parent; markerId: "fun" }
    Page { id: workpage; anchors.fill: parent; markerId: "work" }

    Component.onDestruction: saveNotesToDB()

    // a javascript function that saves all notes from the pages
    function saveNotesToDB() {
        // clearing the DB table before populating with new data
        NoteDB.clearNoteTable();

        //storing notes for each individual page
        NoteDB.saveNotes(personalpage.notes, personalpage.markerId)
        NoteDB.saveNotes(funpage.notes, funpage.markerId)
        NoteDB.saveNotes(workpage.notes, workpage.markerId)
    }
}
