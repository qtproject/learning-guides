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

//Enemy.qml
import QtQuick 2.0
import Qt3D 1.0

//Creates an enemy
Item3D {
    id: enemy

    //Size of the object for the collision detection
    property real radius: 1.5

    property int hitpoints: 10

    mesh: Mesh { source: "Fruits/Fruits.3ds"; options: "ForceSmooth";}

    pretransform : [
        Rotation3D {
            angle: -180
            axis: Qt.vector3d(0, 1, 0)
        },
        Scale3D {
            scale: 0.01
        }
    ]
    //The enemy movement
    SequentialAnimation {
    id: bossMovement
    running: root.state=="BossFight"
    loops: Animation.Infinite
    PropertyAnimation{
        target: enemy
        properties: "x"
        duration: 5000
        to: -16
        easing.type: Easing.InOutSine
    }
    PropertyAnimation{
        target: enemy
        properties: "x"
        duration: 5000
        easing.type: Easing.InOutSine
        to: 16
    }
    }

    //Animation which moves the the enemy towards the player
    NumberAnimation on z{
        running: true
        duration: 10000
        from: 200
        to: 40
        onRunningChanged: { if (running == false) root.state="BossRotation" }
    }

    Timer {
    id: shootTimer
    interval: 500
    repeat: true
    running: root.state=="BossFight"
    onTriggered: {
        shootLaser()
    }
    }

    function hit() {
    hitpoints--
    if (hitpoints <= 0) {
        explode();
    }
    }

    function explode () {
    enemy.destroy()
    root.state="EnterHighscore"
    }

    //Shoots a bullet
    function shootLaser() {
    var component = Qt.createComponent("Bullet.qml")
    var object = component.createObject(level, {"position": enemy.position, "radius": 0.2,
          "dir": Qt.vector3d(0,0,-1), "collisionTarget": player});
    object.collisionDetected.connect(player.hit)
    object.collisionDetected.connect(object.destroy)
    }
}
