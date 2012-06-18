..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------


Qt3D, the basics
=================

In order to starting using Qt3D API in Qt Quick you need to import it in your application with the statement:

.. code-block:: js

  import Qt3D 1.0

After this, you can load items provided by the Qt3D module. Most important from them are:

    *Viewport**
    The :qt5:`Viewport <qml-viewport.html>` element specifies a viewport for the whole scene. It is the root element and defines the camera and (scene-)lights as well as rendering parameters. It is usually the outermost element in a 3D scene.

    *Camera**
    The :qt5:`Camera <qml-camera.html>` element is assigned to the camera property of the viewport. It defines a viewing position and direction as well as the projection. Furthermore stereo projections are supported.

    *Item3D**
    The :qt5:`Item3D <qml-item3d.html>` is used for creating visible 3D objects in a scene. It defines basic parameters and methods for manipulating an object. To create a visible object, a mesh has to be specified for the Item3D. Futhermore tree structures can be built out of Item3Ds which allows the creation of logical groups. Children of an Item3D are placed relatively to their parent object in the 3D scene. I.e. if the parent object is moved or rotated, all the children will also be rotated.

    *Mesh**
    The :qt5:`Mesh <qml-mesh.html>` is used to load geometry in such a way that it can be used in Qt3D. File loading is done automatically after a filename is specified. The mesh element chooses the appropriate model loader from the file ending. The supported model formats are e.g. 3ds, dae, bez and obj.

    *Effect**
    An :qt5:`Effect <qml-effect.html>` defines a very basic and simple way on how an item is rendered on the screen. With it simple lighting, material and texture effects can be achieved.

    *ShaderProgram**
    The :qt5:`ShaderProgram <qml-shaderprogram.html>` element is derived from Effect and gives the user the means for creating custom shader programs in GLSL. You can specify a fragment and a vertex shader. The texture property inherited from the Effect element will be maped to the `qt_Texture0` in the shader program code. The ShaderProgram automatically binds custom properties to your fragment and vertex shaders if they exist under the same name. If you want e.g. to specify more then one texture you may do so by adding a string property with the path to your texture.

    *Material**
    :qt5:`Materials <qml-material.html>` provide some information for an effect, like lighting properties and colors.

    *Transformations**
    There are currently four transformations available in Qt3D: :qt5:`Rotation3D <qml-rotation3d.html>`, :qt5:`Translation3D <qml-translation3d.html>`, :qt5:`Scale3D <qml-scale3d.html>` and :qt5:`LookAtTransform <qml-lookattransform.html>`. All of these can be applied to an Item3D and rotate, translate, scale or change the orientation of an item. The order in which the transformations are specified are very important for the result. It makes a difference if an item is rotated first and then translated or the other way round.


Before you try the first example
---------------------------------

Qt3D is available for Qt 4.8 as an add-on. Qt5 is the first Qt version where Qt3D is available as an `Essential Module <http://qt-project.org/wiki/Qt-Essentials-Modules>`_.  In this guide, we will use Qt5 only. If required, the game can be ported to Qt4.8 with a minimal effort. If you already have installed Qt5, please make sure that OpenGL is supported. More information where to download Qt5 and how get it installed is available on the `Qt Project homepage <http://qt-project.org/wiki/Qt_5.0>`_.

In-line examples and the final game are available as QML files. Please use the program `qmlscene` from the `qtbase/bin` directory to try the code.

.. rubric:: What's Next?

Next we will be using the elements explained above in a very simple example.
