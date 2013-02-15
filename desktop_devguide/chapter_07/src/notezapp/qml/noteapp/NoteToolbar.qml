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

// NoteToolbar.qml

Item {
    id: root
    width: 100
    height: 62

    //this signal is emitted when the toolbar is pressed by the user
    signal pressed()

    BorderImage {
        source: "images/notetoolbar.png"
        anchors.fill: parent
        border.left: 10; border.top: 10
        border.right: 10; border.bottom: 10
    }

    //declaring a property alias to the drag property of MouseArea type
    property alias drag: mousearea.drag

    //this default property enables us to create QML Items that will be automatically
    //laid out in the Row type and considered as toolItems
    default property alias toolItems: layout.children

    MouseArea {
        id: mousearea
        anchors.fill: parent

        //setting hoverEnabled property to true in order for the MouseArea to be able to get
        //hover events
        hoverEnabled: true

        //emitting the pressed() signal on a mouse press event
        onPressed: root.pressed()
    }

    //using a Row type for laying out tool items to be added when using the NoteToolbar
    Row {
        id: layout
        layoutDirection: Qt.RightToLeft
        anchors { verticalCenter: parent.verticalCenter; left: parent.left; right: parent.right
            leftMargin: 15; rightMargin: 15
        }
        spacing: 20

        //the opacity depends if the mousearea types has the cursor of the mouse.
        opacity: mousearea.containsMouse ? 1 : 0

        //using the behavior type to specify the behavior of the layout type
        //when on the opacity changes.
        Behavior on opacity {
            //Using NumberAnimation to animate the opacity value in a duration of 350 ms
            NumberAnimation { duration: 350 }
        }
    }
}
