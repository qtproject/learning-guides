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

//Menu.qml

import QtQuick 2.0
import Qt3D 1.0
import "gameDB.js" as GameDB

Item {
    anchors.fill: parent
    visible: false
    //focus: true
    //The button group

    ListModel {
        id: highscoreModel;
    }

    Component.onCompleted: {
        GameDB.openDB();
        GameDB.saveHighscore(10,"name")
    }

    Column {
        id: buttonGroup
        anchors.verticalCenter: parent.verticalCenter;
        anchors.left: parent.left;
        anchors.leftMargin: 20
        spacing: 10

        Button {
            buttonText: "Start game"
            onButtonClicked: root.state="Game"
        }
        Button {
            buttonText: "Highscore"
            onButtonClicked: root.state="Highscore"
        }
        Button {
            buttonText: "Exit"
            onButtonClicked: Qt.quit()
        }
    }

    Rectangle {
        id: highscore
        visible: root.state=="Highscore"
        anchors.left: buttonGroup.right
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: parent.top
        anchors.margins: 50
        radius: 5
        border.color: "black"
        border.width: 2
        color: "darkblue"
        //opacity: 1
        onVisibleChanged: {
            if (visible == true) {
                var highscoreTable=GameDB.readHighscore();
                highscoreModel.clear();
                for (var i in highscoreTable) {
                    print(highscoreTable[i])
                    highscoreModel.append(highscoreTable[i]);
                }
            }
        }

        Text {
            id: title
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 20
            text: "Highscore"
            font.bold: true
            font.pointSize: 15
            color: "white"
        }
        //The highscore table
        ListView {
            anchors.top: title.bottom
            anchors.topMargin: 50
            anchors.verticalCenter: parent.verticalCenter
            width: parent.width-70
            height: parent.height-title.height-50
            model: highscoreModel;
            delegate: Item {
                anchors.left: parent.left; anchors.right: parent.right; anchors.margins: 40
                height: 30
                Text{anchors.left: parent.left;   text: name;  font.bold: true; font.pointSize: 20; color: "white"}
                Text{anchors.right: parent.right; text: score; font.bold: true; font.pointSize: 20; color: "white"}
            }
        }
    }
}

