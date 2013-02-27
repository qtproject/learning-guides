..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------

How we Proceed
===============

In the following chapters, we will start with the development of our game. We will proceed step-by-step and take a deeper look on Qt3D Qt Qtuick API and related technologies. The source code archive accompanying this guide contains the final version of the application. Since this guide in on an advanced level, we will discuss relevant code samples directly taken from this version and omit making small applications for each topic.

First, we will cover basics of the Qt Quick Qt3D API. After this, we learn how to load models and textures. We will also cover dynamic model creation, making Head up Displays, states, a game menu, and the usage of GLSL shaders.

In the course of the guide, we will explain basics of Qt Quick Qt3D API. Nevertheless, you should read the :qt5:`detailed description provided in the Qt documentation <qt3d-reference.html>`.

As previously mentioned, we use only QML in the development in order to stay focused on Qt Quick. This is sufficient for many basic use cases. Qt3D's C++ API provides more features and a better control over the elements imported in Qt Quick. When developing a more complex game or a real 3D application, you will sooner or later need to define your own modules in C++ and exposing them to Qt Quick. This is a more advanced topic out of scope of this guide.
