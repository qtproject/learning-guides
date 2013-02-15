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

// Note.qml

Item {
    id: root
    width: 200; height: 200

    property string markerId
    property int noteId
    property alias noteText: editArea.text

    BorderImage {
        id: noteImage
        anchors { fill: parent}
        source: "images/personal_note.png"
        border.left: 20; border.top: 20
        border.right: 20; border.bottom: 20
    }

    // creating a NoteToolbar item that
    // will be anchored to its parent
    NoteToolbar {
        id: toolbar
        height: 40
        anchors {
            top: root.top
            left: root.left
            right: root.right
        }

        // using the drag property alias to
        //set the drag.target to our Note item.
        drag.target: root

        // creating the `delete` tool for deleting the note item
        Tool {
            id: deleteItem
            source: "images/delete.png"
            onClicked: root.destroy()
        }
    }

    // creating a TextEdit item
    TextEdit {
        id: editArea
        height: 150
        anchors {
            top: toolbar.bottom
            left: parent.left
            right: parent.right
            topMargin: 0
            leftMargin: 20
            rightMargin: 20
            bottomMargin: 100
        }

        wrapMode: TextEdit.WrapAnywhere
    }
}
