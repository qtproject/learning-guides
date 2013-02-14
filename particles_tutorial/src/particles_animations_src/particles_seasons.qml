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
import QtQuick.Particles 2.0

Rectangle {
    id: root
    width: 600
    focus: true
    height: 600
    color: "black"

    Keys.onPressed: {
        if (event.key == Qt.Key_Space){
            switch (state) {
            case  "":
                toSpring();
                break;
            case "spring":
                toSummer();
                break;
            case "summer":
                toAutumn() ;
                break;
            case "autumn":
                toWinter();
                break;
            }

        }
    }

    function toSpring()
    {
        print("toSpring...")
        state = "spring"
        snowEmitter.enabled = false
        butterFlyEmitter.enabled = true
        flowerEmitter.enabled = true
        ballonAnim.running = true
    }

    function toSummer() {
        print("toSummer...")
        state = "summer"

        butterFlyEmitter.enabled = false
        flowerEmitter.enabled = false
        summerEmitter.enabled = true

        fireworksEmitter.enabled = true
        trailEmitter.enabled = true
        sunAnimation.running = true
    }

    function toAutumn() {

        print("toAutumn...")
        state = "autumn"

        summerEmitter.enabled = false
        fireworksEmitter.enabled = false
        autumnEmitter.enabled = true

        wanderer.enabled = true
    }

    function  toWinter (){
        state = ""

        snowEmitter.enabled = true
        autumnEmitter.enabled = false
        wanderer.enabled = false
    }

    states :[
        State {
            name: "summer"
            PropertyChanges { target: background; source: "resources/summer.png"  }
        },

        State {
            name:"spring"
            PropertyChanges{ target: background; source: "resources/spring.png"}
        },

        State {
            name:"autumn"
            PropertyChanges{ target: background; source: "resources/autumn.png"}
        }
    ]

    Image {
        id: background
        anchors.fill: parent
        source: "resources/winter.png"

        onSourceChanged {
            SequentialAnimation {
                ParallelAnimation {
                    NumberAnimation { targets: background; properties: "opacity"; to: 0 }
                    NumberAnimation { target: background; property: "scale"; to : 2 }
                }

                PropertyAction {target: background; property: "source"}

                ParallelAnimation {
                    NumberAnimation { targets: background; properties: "opacity"; to: 1 }
                    NumberAnimation { target: background; property: "scale"; to : 1}
                }
            }
        }
    }

    Image {
        id: ballon
        x: root.width / 2 - width/2
        y: root.height
        source: "resources/ballonAir.png"
        NumberAnimation on y {id: ballonAnim;running: false; from: root.height;to: - height*2; duration: 15000}
    }

    Image {
        id: welcome_flag
        anchors.top: ballon.bottom
        anchors.horizontalCenter: ballon.horizontalCenter
        source: "resources/welcome.png";
    }


    //   Shader Effect
    ShaderEffect {
        id: shaderEffect
        anchors.fill: welcome_flag
        property variant source: welcome_flag
        property real amplitude: 0.01
        property real frequency: 20
        property real time: 0
        NumberAnimation on time { loops: Animation.Infinite; from: 0; to: Math.PI * 2; duration: 600 }
        fragmentShader:
            "uniform lowp float qt_Opacity;" +
            "uniform highp float amplitude;" +
            "uniform highp float frequency;" +
            "uniform highp float time;" +
            "uniform sampler2D source;" +
            "varying highp vec2 qt_TexCoord0;" +
            "void main() {" +
            "    highp vec2 p = sin(time + frequency * qt_TexCoord0);" +
            "    gl_FragColor = texture2D(source, qt_TexCoord0 + amplitude * vec2(p.y, -p.x)) * qt_Opacity;" +
            "}"
    }

    ParticleSystem { id: sysSeason}


    ImageParticle {
        id: firework
        system: sysSeason
        source: "resources/particle.png"
        color: "red"
        groups: ["D"]
    }

    ImageParticle {
    id: particle
        system: sysSeason
        source: "resources/particle.png"
        color:" yellow"
        groups: ["G"]
    }

    ImageParticle {
    id: butterfly
        system: sysSeason
        source: "resources/butterfly.png"
        colorVariation: 0.5
        groups: ["C"]
    }

    ImageParticle {
    id: flower
        system: sysSeason
        source: "resources/flower.png"
        colorVariation: 0.4
        groups: ["B"]
    }

    ImageParticle {
        id: smoke
        system: sysSeason
        groups: ["E","F"]
        source: "resources/particle.png"
        colorVariation: 0
        color: "#00111111"
    }

    ImageParticle {
        id: snow
        system: sysSeason
        source: "resources/snow.png"
        groups: ["A"]
    }

    ImageParticle {
        id: leaf
        system: sysSeason
        source: "resources/autumn_leaf.png"
        groups: ["H"]
    }


    Emitter {
        id: snowEmitter
        enabled: true
        system: sysSeason
        group: "A"
        lifeSpan: 8000
        anchors{
            left: parent.left
            right: parent.right
            top: parent.top
        }

        velocity : AngleDirection {angle: 90; angleVariation : 20; magnitude: 100}
        size: 20
        sizeVariation: 10
    }

    TrailEmitter {
        id: trailEmitter
        system: sysSeason
        group: "E"
        follow: "D"
        enabled: false
        anchors.fill: parent
        emitRatePerParticle: 80
        velocity: PointDirection {yVariation: 16; xVariation: 5}
        acceleration: PointDirection {y: -16}
    }

    // ParticlesGroup
    ParticleGroup {
        name: "lighting"
        duration: 300
        system: sysSeason

        TrailEmitter {
            enabled: true
            anchors.fill: parent
            group: "F"
            emitRatePerParticle: 80
            lifeSpan: 2000
            velocity: AngleDirection {magnitude: 64; angleVariation: 360}
        }

    }

    Emitter {
        id: fireworksEmitter
        enabled: false
        group: "D"
        system: sysSeason
        lifeSpan: 3000
        anchors.bottom: parent.bottom
        width: parent.width
        velocity : PointDirection {y: -120 ; xVariation: 16}
        size: 20
        GroupGoal {
            groups: ["D"]
            goalState: "lighting"
            jump: true
            system: sysSeason
            //            x: - root.width/2
            y: - root.height / 2
            width: root.width
            height: 10
        }
    }

    Emitter {
        id: summerEmitter
        enabled: false
        system: sysSeason
        lifeSpan: 200
        group: "G"
        y: parent.height / 5
        emitRate: 800
        velocity : AngleDirection { angleVariation : 360 ; magnitude: 20}
        size: 100
        sizeVariation: 20

        SequentialAnimation {
            id: sunAnimation
            ParallelAnimation {
                NumberAnimation  {target: summerEmitter; property: "x" ; from: 0; to: root.width/2; duration: 10000; running: false }
                NumberAnimation  {target: summerEmitter; property: "y" ; from: root.height/4; to: 0; duration: 10000; running: false }
            }
            ParallelAnimation {
                NumberAnimation  {target: summerEmitter; property: "x" ; from: root.width/2; to: root.width; duration: 10000; running: false }
                NumberAnimation  {target: summerEmitter; property: "y" ; from: 0; to: root.height/4; duration: 10000; running: false }
            }
        }
    }

    Emitter {
        id: autumnEmitter
        enabled: false
        system: sysSeason
        group: "H"
        lifeSpan: 8000
        anchors{
            left: parent.left
            right: parent.right
            top: parent.top
        }
        velocity : AngleDirection {angle: 90; angleVariation : 20; magnitude: 80}
        size: 30
        sizeVariation: 20
    }

    Wander {
        id: wanderer
        enabled: false
        system: sysSeason
        anchors.fill: parent
        xVariance: 360;
        pace: 300;
    }

    Emitter {
        id: butterFlyEmitter
        enabled: false
        system: sysSeason
        lifeSpan: 5000
        group: "C"
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        velocity : AngleDirection { angle : 300; angleVariation: 30; magnitude: 100}
        size: 50
        sizeVariation: 20
    }

    Emitter {
        id: flowerEmitter
        enabled: false
        system: sysSeason
        lifeSpan: 5000
        group: "B"
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        velocity : AngleDirection { angle : 250; angleVariation: 40; magnitude: 100}
        size: 50
        sizeVariation: 10
    }


}
