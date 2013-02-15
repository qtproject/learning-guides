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


// main.qml

Rectangle {
    // using window as the identifier for this item as
    // it will the only window of the NoteApp
    id: window
    width: 800; height: 600

    //creating a webfont property that holds the font
    //loading using FontLoader
    property variant webfont: FontLoader {
        source: "fonts/juleeregular.ttf"
        onStatusChanged: {
            if (webfontloader.status == FontLoader.Ready)
                console.log('Loaded')
        }
    }

    BorderImage {
        id: background
        anchors.fill: parent
        anchors.margins: -5
        source: "images/background.png"
        border.left: 70; border.top: 77
        border.right: 90; border.bottom: 91
    }

    // creating a MarkerPanel item
    MarkerPanel {
        id: markerPanel
        width: 120
        anchors { right: window.right; top: window.top; bottom: window.bottom
            topMargin: 30
        }
    }

    // creating a PagePanel item
    PagePanel {
        id: pagePanel
        state: markerPanel.activeMarker
        anchors { right: markerPanel.left; left: toolbar.right; top: parent.top; bottom: parent.bottom
            leftMargin: 1; rightMargin: -50; topMargin: 3; bottomMargin: 15
        }
    }

    // the toolbar's background
    Rectangle {
        anchors.fill: toolbar
        color: "white"
        opacity: 0.15
        radius: 16
        border { color: "#600"; width: 4 }
    }

    // the toolbar -
    // using a Column type to layout the Tool items vertically
    Column {
        id: toolbar
        spacing: 16
        anchors {
            top: window.top; left: window.left; bottom: window.bottom;
            topMargin: 50; bottomMargin: 50; leftMargin: 8
        }

        //the `new note` tool, also known as the plus icon
        Tool {
            id: newNoteTool
            source: "images/add.png"
            onClicked: pagePanel.currentPage.newNote()
        }

        // the `clear` tool
        Tool {
            id: clearAllTool
            source: "images/clear.png"
            onClicked: pagePanel.currentPage.clear()
        }
    }

    // the quit tool on the righ bottom corner of NoteApp
    Tool {
        id: quitTool
        anchors {
            bottom: pagePanel.bottom; right: parent.right
            bottomMargin: 24; rightMargin: 28
        }
        source: "images/close.png"
        onClicked: Qt.quit()
    }

    // this signal is emitted up Component loading complition
    Component.onCompleted: {
        NoteDB.openDB()
    }
}
