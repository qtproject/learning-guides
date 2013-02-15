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

// Marker.qml
// The Image type as top level is convenient as the Marker component
// simply is a graphical UI with a clicked() signal.
Image {
    id: root

    // declaring the clicked() signal to be used in the MarkerPanel
    signal clicked()

    // this property indicates whether this marker item is the current
    // active one. Initially it is set to false
    property bool active: false

    // creating the two states representing the respective
    // set of property changes
    states: [
        // the hovered state is set when the user has the mouse hovering
        // the marker item.
        State {
            name: "hovered"
            //this condition makes this state active
            when: mouseArea.containsMouse && !root.active
            PropertyChanges { target: root; x: 5 }
        },

        State {
            name: "selected"
            when: root.active
            PropertyChanges { target: root; x: 20 }
        }
    ]

    // list of transitions that apply when the state changes
    transitions: [
        Transition {
            to: "hovered"
            NumberAnimation { target: root; property: "x"; duration: 300 }
        },

        Transition {
            to: "selected"
            NumberAnimation { target: root; property: "x"; duration: 300 }
        },

        //a transition for the default state
        Transition {
            to: ""
            NumberAnimation { target: root; property: "x"; duration: 300 }
        }
    ]

    // creating a MouseArea type to intercept the mouse click
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        onClicked: root.clicked()
    }
}
