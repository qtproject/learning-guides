..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------

Shader Effects
==============

Overview
--------

In order to perform advanced graphical effects, Qt Quick 2 enables you to use vertex and fragment shader programs with your QML local properties via the :qt5:`ShaderEffect <qtquick/qml-qtquick2-shadereffect.html>` QML type.

This type enables you to combine your GLSL program with your QML code to control the graphics at a much lower level using custom shaders. `ShaderEffect` enables you to implement a vertex or fragment shader program in your QML code via the :qt5:`vertexShader <qml-qtquick2-shadereffect.html#vertexShader-prop>` and :qt5:`fragmentShader <qtquick/qml-qtquick2-shadereffect.html#fragmentShader-prop>` properties. When you specify a QML item as variant property in your `ShaderEffect`, the item is provided to your vertex or fragment shader as `Sampler2D`.

Consider the following example:

.. code-block:: js

    import QtQuick 2.0

    Rectangle {
        id: root
        color: "white"
        width: 600
        height: 300

        Image {
            id: background
            width: parent.width/2
            height: parent.height
            source: "resources/Qt.png"
            anchors {
                right: parent.right
                top: parent.top
            }
        }

        ShaderEffect {
            id: shaderEffect
            width: parent.width/2
            height: parent.height
            anchors {
                left: parent.left
                top: parent.top
            }

            property variant source: background

        }

    }

The `ShaderEffect` type takes the background QML item, provides it as a `Sampler2D` to the fragment shader and paints the result on the screen (at the position of the `ShaderEffect`). In the above example, we did not specify any fragment or vertex shader. So the default shaders that apply no special effects are used.

.. image:: images/shader_1.png
    :scale: 60%
    :align: center

You can then add your vertex or fragment shader program using `fragmentVertex` or `fragmentShader`. For example, we can add an effect using a fragment shader as follows

.. code-block:: js

    import QtQuick 2.0

    Rectangle {
        id: root
        color: "white"
        width: 600
        height: 300

        Image {
            id: background
            width: parent.width/2
            height: parent.height
            source: "resources/Qt.png"
            anchors {
                right: parent.right
                top: parent.top
            }
        }

        ShaderEffect {
            id: shaderEffect
            width: parent.width/2
            height: parent.height
            anchors {
                left: parent.left
                top: parent.top
            }

            property variant source: background
            property real frequency: 20
            property real amplitude: 0.05
            property real time

            NumberAnimation on time {
                from: 0; to: Math.PI * 2
                duration: 1000
                loops: Animation.Infinite
            }

         fragmentShader:
                "varying highp vec2 qt_TexCoord0;
                uniform sampler2D source;
                uniform lowp float qt_Opacity;
                uniform highp float frequency;
                uniform highp float amplitude;
                uniform highp float time;
                void main(){
                      vec2 p= sin(time + frequency * qt_TexCoord0);
                      gl_FragColor = texture2D(source, qt_TexCoord0 + amplitude *vec2(p.y, -p.x))* qt_Opacity;
                           }";

        }

    }


Again the background QML item is provided as `Sampler2D` in the fragment shader. Another very important feature that is introduced in the code above is the automatic property binding between QML and GLSL code.

If an `uniform` variable in the vertex or fragment shader program has the same name as a property defined in the `ShaderEffect`, the value of this property is bound to the uniform.

In the above code snippet we are using this feature in conjunction with a `NumberAnimation` to produce a animated wobbling effect. The effect is shown in the screenshot below:

.. image:: images/shader_2.png
    :scale: 60%
    :align: center

For more details concerning GLSL and the use of Shaders in QML, refer to the related links listed at the end of this tutorial.

What's next?
------------

Next, we will be implementing a demo application that illustrates the use of the ``Particles`` module and ``ShaderEffect`` type in QML.
