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
import Qt3D 1.0

Item3D {
    property real vx: 0
    property real vy: 0

    property real ax: 0
    property real ay: 0

    property real radius: 1.5

    property int hitpoints
    property real maxHitPoints: 10

    property int energy
    property int maxEnergy: 500

    mesh: Mesh { source: "hamburger/models/hamburger.dae" }

    transform: [
        Rotation3D {
            angle: -10*ay
            axis: "1, 0, 0"
        },
        Rotation3D {
            angle: 5*ax
            axis: "0, 1, 0"
        },
        Rotation3D {
            angle: -20*ax
            axis: "0, 0, 1"
        }
    ]

    pretransform: [
        Scale3D {
            scale: 0.1
        },
        //Moving the objects origin into the balance point
        Translation3D {
            translate: "0,-1,0"
        },
        Rotation3D {
            angle: 45
            axis: "0, 1, 0"
        }
    ]

    function hit() {
      print("player was hit")
    hitpoints--
    if (hitpoints <= 0) {
        explode();
    }
    }

    function explode () {
    root.state="EnterHighscore"
    }
}
