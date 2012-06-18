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

// game.qml
import QtQuick 2.0
import Qt3D 1.0

// A Viewport element with defined geometries
Viewport {
    id: root
    width: 1000
    height: 800

    property real x_bound: 4.5
    property real y_bound: 5
    property int score: 0
    property int targetCount: 0

    state: "Menu"

    states:[
    State{
        name: "Menu"
        PropertyChanges {target: player; ax: 0; ay: 0; vx: 0; vy:0; position: Qt.vector3d(0, 0, 0); hitpoints: 10; energy:500; restoreEntryValues: false}
        PropertyChanges {target: root; score: 0; targetCount:0; restoreEntryValues: false}
        PropertyChanges {target: cam; center: Qt.vector3d(0, 0, 0) }
        PropertyChanges {target: gamemenu; visible: true;}
        PropertyChanges {target: hamburgerRotation; running: true;}
        PropertyChanges {target: hud; visible: false;}
    },
    State{
        name: "Highscore"
        extend: "Menu"
    },
    State{
        name: "EnterHighscore"
        PropertyChanges {target: hud; visible: true;}
        PropertyChanges {target: highscoreDialog; visible: true;}
    },
    State{
        name: "Game"
        PropertyChanges {target: moveBehindHamburger; running: true;}
        PropertyChanges {target: hud; visible: true;}
    },
    State{
        name: "BossFight"
        PropertyChanges {target: hud; visible: true;}
        PropertyChanges {target: player; ay: 0; vy:0; position: Qt.vector3d(0, 0, 0); restoreEntryValues: false}
    },
    State{
        name: "BossRotation"
    }
    ]

    Skybox{
        //The folder containing the skybox textures
        source: "space"
    }

    Item3D {
    sortChildren: Item3D.BackToFront
        id: level

        Player {
            id: player
        }
    }

    //The game camera
    camera: Camera {
          id: cam
    property real angle:0;
    eye: Qt.vector3d(20*Math.sin(angle), 10, 20*Math.cos(angle))
    NumberAnimation on angle{
        id: hamburgerRotation
        to: 100
        running: false
        duration: 1000000;
    }
    PropertyAnimation on eye {
        id: moveBehindHamburger
        to: Qt.vector3d(0, 0,-30)
        duration: 2000
        running: false
    }
    }

    //Head up display
    Hud {id: hud}

    Menu {id: gamemenu}

    HighscoreDialog {id: highscoreDialog}

    Gamelogic {id: gameLogic}
}
