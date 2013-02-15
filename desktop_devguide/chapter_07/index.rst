..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------

Deploying the NoteApp Application
=================================

We have reached the point where we would like to make the application available and deployable for a typical desktop environment. As described in the first chapters, we have used a Qt Quick UI project in Qt Creator to develop the NoteApp* application. This means that `qmlscene` is used to load the `main.qml` file, and therefore, have *NoteApp* running.

At first, the simplest way of making NoteApp* available is to create a package that bundles all the qml files, `qmlscene` and a simple script that loads the `main.qml` file using `qmlscene`. You need to refer to the documentation of each desktop platform on how to create small script. For instance, under a Linux platform, you could use a small `bash` shell script for this, while for Windows a simple batch file. This approach works well as being so straightforward, but it could be the case that you would not want to ship the source code because your application is using proprietary code. The application should be shipped in a binary format, in which all the qml files are bundled. This could help make the installation process and the user experience even more pleasant.

Hence, we need to create an executable file for NoteApp* that should be fairly simple to install and use. In this chapter, you will you see how to create a Qt Quick application that bundles qml files and images in an executable binary file. Moreover, we will explore how to use the Qt Resource System with QML.

.. note::

    You will find the implementation related to this chapter in the zip file provided in the :ref:`get-source-code` section.


This chapter has the following steps:

.. toctree::
  :maxdepth: 2

  step_1
