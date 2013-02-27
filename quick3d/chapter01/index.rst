..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------


About this Guide
================

Why should you read this guide?
-------------------------------

The Qt3D module is a set of APIs that use OpenGL and aim on making 3D development easier and more platform independent. It includes features like asset loading, shapes, texture management and shaders.

Qt3D has both, a C++ and a Qt Quick API.

The main aim of the C++ API is to make 3D programming platform independent. You don't have to worry anymore what 3D architecture in use. It should be no matter whether it is desktop or embedded OpenGL or whether a fixed or dynamic pipeline is used.

The Qt3D Qt Quick module provides more abstraction and makes it possible to write complete 3D applications in Qt Quick only. Using the Qt3D Qt Quick module, you can very easily mix 2D and 3D elements, implement head up displays overlaying a 3D scene, or even embed 3D elements in a 2D Qt Quick user interface.

Qt3D was initially developed as an add-on project in Qt4. Today, it is a part of Qt5. It is a good time to take a closer look on this in an hands-on example and get ready to use it in the future.

The purpose of this guide is to give a brief overview of the Qt3D Qt Quick by walking the reader through the development of an arcade game:

.. image:: img/game.png
    :scale: 30%
    :align: center

This guide will show how the 2D and 3D worlds can be combined in one application. Additionally we will talk about basic lighting, material and texture topics. While developing the game, you will get an :qt5:`overview of major Qt Quick elements<qt3d-qml3d.html>` provided by the Qt3D module and learn how to use them.

This guide uses QML only without any C++ code. A solid Qt Quick knowledge is a prerequisite for reading this guide. Additionally, some basic understanding of computer graphics, `OpenGL <http://www.opengl.org>`_ in general, OpenGL shaders and GLSL (OpenGL Shading Language) is required. If you do not have sufficient knowledge in OpenGL, you should strongly consider reading the :guides-homepage:`OpenGL tutorial <index.html>` first.

In this guide, we will focus on 3D and graphic aspects. Generic aspects of application development for desktop and mobile are in focus in other guides. If you are interested in this, consider :guides-homepage:`reading them first<>`.

After completion of this guide, you should have a good understanding of how the Qt3D Qt Quick API works as well as how to develop basic desktop and mobile applications with this technology.

Get the source code and the guide in different formats
------------------------------------------------------

A .zip file that contains the source code of each chapter is provided here:

     :download:`Source code <gamedevelopmentqt3d/completegame_src.zip>`

The guide is available in the following formats:

    * :download:`PDF <gamedevelopmentqt3d/GameDevelopmentQt3D.pdf>`

    * :download:`ePub <gamedevelopmentqt3d/GameDevelopmentQt3D.epub>` for ebook readers.

    * :download:`Qt Help <gamedevelopmentqt3d/GameDevelopmentQt3D.qch>` for Qt Assistant and Qt Creator.

License
-------

Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
All rights reserved.

This work, unless otherwise expressly stated, is licensed under a Creative Commons Attribution-ShareAlike 2.5.

The full license document is available from http://creativecommons.org/licenses/by-sa/2.5/legalcode .

Qt and the Qt logo is a registered trade mark of Digia plc and/or its subsidiaries and is used pursuant to a license from Digia plc and/or its subsidiaries. All other trademarks are property of their respective owners.

.. rubric:: What's Next?

In the next chapter we will explain the application concept and look at small first examples.
