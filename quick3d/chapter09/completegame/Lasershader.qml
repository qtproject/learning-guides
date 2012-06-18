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

//The shadereffect, that is applied to every laseritem
ShaderProgram {
    property real angle : 1.0
    property string texture2: "laser2.png"

    property real interpolationFactor : 1.0
    SequentialAnimation on interpolationFactor
    {
        running: true; loops: Animation.Infinite
        NumberAnimation {
            from: 0.3; to: 0.7;
            duration: 800
        }
        PauseAnimation { duration: 200 }
        NumberAnimation {
            from: 0.7; to: 0.3;
            duration: 800
        }
        PauseAnimation { duration: 500 }
    }


    NumberAnimation on angle{
        from:0
        to: Math.PI
        duration: 1000;
        running: true; loops: Animation.Infinite;
    }

    blending: true
    texture: "laser.png"
    vertexShader: "
    attribute highp vec4 qt_Vertex;
    uniform mediump mat4 qt_ModelViewProjectionMatrix;

    attribute highp vec4 qt_MultiTexCoord0;
    varying mediump vec4 texCoord;

    void main(void)
    {
    gl_Position = qt_ModelViewProjectionMatrix * qt_Vertex;
    texCoord = qt_MultiTexCoord0;
    }
    "
    fragmentShader: "
    varying highp vec4 texCoord;
    uniform sampler2D qt_Texture0;
    uniform sampler2D texture2;
    uniform mediump float angle;
    uniform mediump float interpolationFactor;
    uniform mediump float hallo;
    void main()
    {
    //The rotation matrix
    mat2 RotationMatrix = mat2( cos( angle ), -sin( angle ),
                                sin( angle ),  cos( angle ));

    vec2 textureC = RotationMatrix*(texCoord.st-vec2(0.5))+vec2(0.5);

    mediump vec4 texture1Color = texture2D(qt_Texture0, textureC);
    mediump vec4 texture2Color = texture2D(texture2, textureC);
    mediump vec4 textureColor = mix(texture1Color, texture2Color,
    interpolationFactor);
    gl_FragColor = textureColor;
    }
    "
}

