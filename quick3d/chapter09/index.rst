..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------


Shaders
=======

In the previous chapters, we have seen that we can define `Effects` with a texture and different material properties for our geometry in QML/3D. For most areas of applications, we do not need more than that, but if we want to achieve a custom effect, this technique has its limits. It is, however, possible in Qt Quick 2.0 and QML/3D to define custom effects as shader programs that allow you to extend the functionality of the built in effects.

The basics of shader programming are not covered in this guide. There are several tutorials out there, some of them even Qt specific. If you do not yet have any experience with shaders, we recommend that you first read the `OpenGL-Tutorial <http://qt.nokia.com/learning/guides>`_. In this section, we will only give you advice on how to use shaders in QML/3D and show you how to use them.

In QML/3D, shader programming is possible using the `ShaderProgram` element, which is derived from the more general `Effect` element. The `ShaderProgram` element has been extended by two properties: `fragmentShader` and `vertexShader`. Both take a string that contains the GLSL shader code.

Bulletshader
------------

The shader for the fired bullets will mix two textures, rotate them and adjust the interpolation level over time. The result should be the impression of a rotating and blinking object.

For rotation and interpolation, we are defining two new properties in the `ShaderProgram` element. A special feature of the `ShaderProgram` is the automatic property to uniform binding. This means that if we define a uniform variable in either of the shaders (fragment or vertex), the uniform is automatically bound to the `ShaderProgram's` property when they have the same name. The following code serves as an example:

.. code-block:: js

      //Lasershader.qml
      import QtQuick 2.0
      import Qt3D 1.0

      ShaderProgram {
          blending: true
          property real angle : 1.0
          property real interpolationFactor : 1.0
          property string texture2: "texture2.png"
          ...
          fragmentShader: "
          uniform mediump float angle;
          uniform mediump float interpolationFactor;
          uniform sampler2D texture2;
          ...
          "
      }

What you should also notice is that you can not only bind simple integer and float variables to uniforms, but also textures and matrices. Textures are therefore defined as string properties, however, the first texture can be defined using the `Effect's` `texture` property and is bound to the `qt_Texture0` uniform.

First we want to define the vertex shader, because it is a fairly simple task:

.. code-block:: js

      //Lasershader.qml
      ShaderProgram {
      ...
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
      }

There are the predefined attributes `qt_Vertex` (vertex position), `qt_MultiTexCoord0` (texture coordinates) of the currently processed vertex and the `qt_ModelViewProjectionMatrix`. We want to pass the texture coordinates to the next stage so we define a varying `texCoord` that we assign the texture coordinates to.

The fragment shader will be a bit more involved. There are two major tasks that we have to accomplish. Firstly, we need to rotate the texture according to the `angle` value and then we have to interpolate between the two `Sampler2Ds` that have been assigned to the shader. The rotation will be accomplished by rotating the texture coordinates with a 2D rotation matrix. Afterwards, we will be using the built in `mix` function in order to mix two color values and hand over the interpolation factor as a third parameter:

.. code-block:: js

    //Lasershader.qml
    ShaderProgram {
    ...
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

Now we also want to animate the `interpolationFactor` and `angle` properties:

.. code-block:: js

    //Lasershader.qml

    ShaderProgram {
      ...
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
    }


For enabling this `Effect` on our bullets, we have two options. The first option would be to directly assign the `Lasershader` to the `effect` property of the bullet, which would mean that whenever a new bullet is created, a new `ShaderProgram` is also created:

.. code-block:: js

    //Bullet.qml
    ...
    effect: Lasershader { }
    ...

The second option would be to create it globally in `game.qml` and assign the id of the effect to the bullet's `effect` property. The latter method saves more resources, but as you might notice, the `angle` and `interpolationFactor` stay the same for all bullets that are shot, and therefore, do not look as good as in the first method:

.. code-block:: js

    //game.qml
    ...
    Viewport {
      ...
      Lasershader {id:bulleteffect}
    }


.. code-block:: js

    //Bullet.qml
    ...
    Quad {
      effect: bulleteffect
    ...


Explosion
---------

There are many ways to create explosions. Most of them, however, are quite difficult to implement. Our approach will be a very simple one, but quite aesthetic and realistic looking. We use the     Billboarding* technique again and combine it with an animation. When an object explodes, one or more quads are created on which an explosion is shown that has been created before with a special program for example. In this context, *Animated* means that several pictures of an explosion are shown after each other (the same concept, as when watching a movie).

For a good explosion animation, we need at least 10 to 16 pictures to shown one after the other. We can, however, not include them separately in the vertex shader because we only have a certain amount of texture slots available on the graphic card. That is why we merge all explosion frames together into one big texture. This texture will be uploaded to the GPU and the fragment shader chooses which parts of the texture to use according to a time value. But first of all we create a new file called `Explosion.qml`. This will contain one `BillboardItem3D` that uses a quad as a mesh:

.. code-block:: js

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
  }

As already mentioned, we need a `lifetime` property for our explosion that has to be available in the fragment shader:

.. code-block:: js

    //Explosion.qml
    ...
    Quad{
      ...
      NumberAnimation
      {
      running:true
      target: program
      property: "lifetime"
      from: 0.0
      to: 1.0;
      duration: 1000
      onRunningChanged: {
          if(running==false)
          explosionItem.enabled= false;
      }
      }
    }

The `ShaderProgram` consists of the `lifetime` property used above, the `explo.png` texture, which has 16 explosion frames, a vertex and a fragment shader:

.. code-block:: js

    //Explosion.qml
    ...
    Quad{
      ...
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
      ...
      }
    }

The vertex shader is not really exciting because it just computes the position of the vertex and passes on the texture coordinates. The fragment shader, however, looks a bit more involved. We first multiply the `lifetime` by the number of frames we have in our texture and then try to find out which row and column position is the closest to our current `lifetime` value:

.. code-block:: js

    //Explosion.qml
    ...
    ShaderProgram{
      ...
      fragmentShader: "
      varying highp vec4 texCoord;
      uniform sampler2D qt_Texture0;
      uniform mediump float lifetime;

      void main(void)
      {
      mediump int life = int(lifetime    16.0);
      mediump int row = life % 4;
      mediump int column = life / 4;
      mediump vec4 textureColor = texture2D(qt_Texture0,
        vec2(texCoord.s/4.0+0.25*float(row) ,
        1.0-texCoord.t/4.0-0.25*float(column)));
      gl_FragColor = textureColor;
      }
      "
    }

Suitable animated explosions can be found everywhere on the internet. There is also software that can produce these textures from scratch. This technique is not only limited to displaying explosions. Thunderbolts and fire can also be animated.

The last thing needed for our explosion to work is the integration into our game. There are several ways of doing this. Either we define a global explosion which can be moved to the position of the exploding object or we implement the explosion in the objects. We now create a completely new component that can handle all possible explosions. For that the new component `ExplosionSystem.qml` is created:

.. code-block:: js

  //ExplosionSystem.qml
  import QtQuick 2.0

  Timer {
      id: explosion
      running: true
      property int loops: 40
      property variant position: Qt.vector3d(0,0,0)
      property variant explosionComponent: Qt.createComponent("Explosion.qml")
      property real variation: 3

      signal finished()

      interval: 200
      repeat: true
      onTriggered: {
      loops--
      var object = explosionComponent.createObject(level,
        {"x": position.x+(Math.random()-0.5) * variation,
        "y": position.y+(Math.random()-0.5) * variation,
        "z": position.z+(Math.random()-0.5) * variation})
      if (loops==0) {
          finished()
          explosion.destroy()
      }
      }
  }

.. Note:: Because we destroy the object after the `loops` property reaches `0`, the `ExplosionSystem` component may only be created dynamically with the `createObject` function.

The `ExplosionSystem` is created if the player has no hitpoints anymore:

.. code-block:: js

    //Player.qml
    ...
    Item3D {
    ...
    function explode () {
        root.state="EnterHighscore"
        var component = Qt.createComponent("ExplosionSystem.qml")
        var object = component.createObject(level, {"position": position})
        object.finished.connect(enemy.exploded)
    }
    }


The same applies for the enemey:

.. code-block:: js

    //Enemy.qml
    ...
    Item3D {
    ...
    function explode () {
        root.score+=20
        var component = Qt.createComponent("ExplosionSystem.qml")
        var object = component.createObject(level, {"position": position})
        object.finished.connect(enemy.exploded)
        shootTimer.running=false
        bossMovement.running=false
        root.state="EnterHighscore"
    }
    }

.. rubric:: What's Next?

For this tutorial, this will be the final version of the game. Next we will however talk about how we can extend and improve it and give some ideas and instructions for further enhancement.
