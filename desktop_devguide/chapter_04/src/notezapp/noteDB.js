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

// making the nodeDB.js a stateless library
.pragma library

// declaring a global variable for storing the database instance
var _db

function openDB() {
    print("noteDB.createDB()")
    _db = openDatabaseSync("StickyNotesDB","1.0","The stickynotes Database",1000000);
    createNoteTable();
}

function createNoteTable() {
    print("noteDB.createTable()")
    _db.transaction( function(tx) {
        tx.executeSql("CREATE TABLE IF NOT EXISTS note (noteId INTEGER PRIMARY KEY AUTOINCREMENT, x INTEGER, y INTEGER, noteText TEXT, markerId TEXT)");
    })
}

function clearNoteTable() {
    print("noteDB.clearNoteTable()")
    _db.transaction( function(tx) {
        tx.executeSql("DELETE FROM note");
    })
}

function readNotesFromPage(markerId) {
    print("noteDB.readNotesFromPage() " + markerId)
    var noteItems = {}
    _db.readTransaction( function(tx) {
        var rs = tx.executeSql("SELECT * FROM note WHERE markerId=? ORDER BY markerid DESC", [markerId] );
        var item
        for (var i=0; i< rs.rows.length; i++) {
            item = rs.rows.item(i)
            noteItems[item.noteId] = item;
        }
    })

    return noteItems;
}

function saveNotes(noteItems, markerId) {
    print("noteDB.saveNotes() for page: " +markerId +" notes.length: " + noteItems.length)
    for (var i=0; i<noteItems.length; ++i) {
        var noteItem = noteItems[i]
        _db.transaction( function(tx) {
            tx.executeSql("INSERT INTO note (markerId, x, y, noteText) VALUES(?,?,?,?)",[markerId, noteItem.x, noteItem.y, noteItem.noteText]);
        })
    }
}
