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

//Explosion.qml
import QtQuick 2.0
import Qt3D 1.0
import Qt3D.Shapes 1.0

Quad{
    id: explosionItem

    scale:5

    transform: [
        Rotation3D{
            angle: 90
            axis: Qt.vector3d(1, 0, 0)
        },
            LookAt{ subject: camPos}
    ]
    //wrapper around the camera position
    Item3D { id: camPos
    position: cam.eye
    }

    NumberAnimation
    {
        running:true
        target: program
        property: "lifetime"
        from: 0.0
        to: 1.0;
        duration: 1000
        onRunningChanged: {
            if (running==false) {
                print("running changed");
                explosionItem.destroy();
            }
        }
    }

    effect: program
    ShaderProgram {
        id: program
        texture: "explo.png"
        property real lifetime : 1.0
        blending: true
        vertexShader: "
        attribute highp vec4 qt_Vertex;
        uniform mediump mat4 qt_ModelViewProjectionMatrix;

        attribute highp vec4 qt_MultiTexCoord0;
        uniform mediump float textureOffsetX;
        varying mediump vec4 texCoord;

        void main(void)
        {
        gl_Position = qt_ModelViewProjectionMatrix * qt_Vertex;
        texCoord.st = qt_MultiTexCoord0.st;
        }
        "
        fragmentShader: "
        varying highp vec4 texCoord;
        uniform sampler2D qt_Texture0;
        uniform mediump float lifetime;

        void main(void)
        {
        mediump int life = int(lifetime*16.0);
        mediump int row = int(mod(float(life),4.0));
        mediump int column = int(float(life) / 4.0);
        mediump vec4 textureColor = texture2D(qt_Texture0, vec2(texCoord.s/4.0+0.25*float(row) , 1.0-texCoord.t/4.0-0.25*float(column)));
        gl_FragColor = textureColor;
        }
        "
    }
}

