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
// [0]
import QtQuick 2.0

Rectangle {
    id: root
    width: 640
    height: 360
    color: "#3C3C3C"

    ListModel {
        id: model
        ListElement { label:"Scientific Research";
                      value:21; color:"#99e600" }
        ListElement { label:"Engineering & Design";
                      value:18; color:"#99cc00" }
        ListElement { label:"Automotive";
                      value:14; color:"#99b300" }
        ListElement { label:"Aerospace";
                      value:13; color:"#9f991a" }
        ListElement { label:"Automation & Machine Tools";
                      value:13; color:"#a48033" }
        ListElement { label:"Medical & Bioinformatics";
                      value:13; color:"#a9664d" }
        ListElement { label:"Imaging & Special Effects";
                      value:12; color:"#ae4d66" }
        ListElement { label:"Defense";
                      value:11; color:"#b33380" }
        ListElement { label:"Test & Measurement Systems";
                      value:9;  color:"#a64086" }
        ListElement { label:"Oil & Gas";
                      value:9;  color:"#994d8d" }
        ListElement { label:"Entertainment & Broadcasting";
                      value:7;  color:"#8d5a93" }
        ListElement { label:"Financial";
                      value:6;  color:"#806699" }
        ListElement { label:"Consumer Electronics";
                      value:4;  color:"#8073a6" }
        ListElement { label:"Other";
                      value:38; color:"#8080b3" }
    }

    // [0]

    // [1]
    Canvas {
        id: canvas
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.horizontalCenter
    }
    // [1]

    // [2]
    ListView {
        id: view
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.horizontalCenter
        anchors.right: parent.right
        anchors.margins: 16
        clip: true
        focus: true
        model: model
        delegate: Item {
            width: view.width
            height: 32
            Rectangle {
                anchors.fill: parent
                anchors.margins: 1
                radius: 2
                color: model.color
                border.color: Qt.lighter(root.color)
            }
            Text {
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.margins: 8
                text: model.label
                color: "#1C1C1C"
            }
            Text {
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.margins: 8
                text: model.value
                color: "#1C1C1C"
            }
        }
    }
}
// [2]
