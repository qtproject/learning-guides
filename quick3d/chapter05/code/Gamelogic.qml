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

Item {
    property bool upPressed: false
    property bool downPressed: false
    property bool leftPressed: false
    property bool rightPressed: false

    property variant targetComponent: Qt.createComponent("Target.qml");

    property real maneuverability: 0.3
    //The game timer is our event loop. It processes the key events and updates the position of the hamburger
    Timer {
        id: gameTimer;
        running: true
        interval: 50;
        repeat: true;
        onTriggered: {
            //Velocity is updated
            player.vx+=player.ax*0.05;
            player.vy+=player.ay*0.05;
            //Acceleration is updated
            player.ax=(player.ax+maneuverability*leftPressed - maneuverability*rightPressed)/1.1;
            player.ay=(player.ay+maneuverability*downPressed - maneuverability*upPressed)/1.1;
            //Position is updated
            player.position.x += player.vx*0.05;
            player.position.y += player.vy*0.05;
            //If the player exceeds a boundary, the movement is stopped
            if (player.position.x>x_bound) {
                player.position.x = x_bound
                player.vx = 0;
                if (player.ax>0)
                    player.ax = 0;
            }
            else if (player.position.x<-x_bound) {
                player.position.x = -x_bound
                player.vx = 0;
                if (player.ax<0)
                    player.ax = 0;
            }
            else if (player.position.y<-y_bound) {
                player.position.y = -y_bound
                player.vy = 0;
                if (player.ay<0)
                    player.ay = 0;
            }
            else if (player.position.y>y_bound) {
                player.position.y = y_bound
                player.vy = 0;
                if (player.ay>0)
                    player.ay = 0;
            }
        }
    }
    focus: true
    //Handling of basic key events
    Keys.onPressed: {
        if (event.key == Qt.Key_A)
            leftPressed = true
        if (event.key == Qt.Key_D)
            rightPressed = true
        if (event.key == Qt.Key_W)
            upPressed = true
        if (event.key == Qt.Key_S)
            downPressed = true
    }
    Keys.onReleased: {
        if (event.key == Qt.Key_A)
            leftPressed = false
        if (event.key == Qt.Key_D)
            rightPressed = false
        if (event.key == Qt.Key_W)
            upPressed = false
        if (event.key == Qt.Key_S)
            downPressed = false
    }

    //Timer creates targets in a certain interval
    Timer {
      id: targetTimer
      interval: 4000
      repeat: true
      running: true
      onTriggered: {
      targetCount++
      var object = targetComponent.createObject(level, {"position.x": (Math.random()-0.5) *8, "position.y":  (Math.random()-0.5) *6,
      "scale": 3-0.2*targetCount, "collisionTarget": player})
      object.collisionDetected.connect(targetCollision)
    }

    function targetCollision(sender) {
    score++
    }
}

}
