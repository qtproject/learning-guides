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

Why Would You Want to Read this Guide?
--------------------------------------

This guide provides an overview of QML and Qt Quick technology with regards to developing feature-rich applications that you can deploy onto various desktop platforms.

The focus is on Qt Quick and how to use it efficiently for writing entire applications without using C++. It guides you step-by-step from the initial development environment set up to project creation to a ready-to-deploy application. We have implemented a simple application (NoteApp*) that helps users manage daily notes.

There are several chapters consisting of multiple steps. Each step describes specific features of the application, the development approach and the detailed QML code used.
The application covers various aspects such as advanced UI concepts including animations, database storage and Javascript usage for application logic.

The application will not look and feel like a typical or classical desktop application, as the common UI elements used in desktop applications such as toolbars, menus, dialogs, and so on, are not used. This application is inspired by the modern fluid UIs, but the deployable target is a desktop environment.

In order to make it easy to work with the code, there is a version of NoteApp* for each chapter with all the features implemented as described in that chapter. It is recommended to refer to that code while reading the contents of this guide.

At the end of this guide, you should be able to have a solid understanding of how to develop an application using QML and Qt Quick as a technology and learn practical use of the QML language.

.. image:: img/noteapp.png
    :scale: 80%
    :align: center

A screenshot of the NoteApp* application that will be developed in this guide.

.. _get-desktop-source-code:

Get the Source Code and the Guide in Different Formats
------------------------------------------------------

A .zip file that contains the source code of each chapter is provided:

     :download:`Source code <qtquickdesktop/notezapp_src.zip>`_

The guide is available in the following formats:

     :download:`PDF <qtquickdesktop/QtQuickApplicationGuide4Desktop.pdf>`_

     :download:`ePub <qtquickdesktop/QtQuickApplicationGuide4Desktop.epub>`_ for ebook readers. Further details can be found `here <http://en.wikipedia.org/wiki/EPUB#Software_reading_systems>`_.

     :download:`Qt Help <qtquickdesktop/QtQuickApplicationGuide4Desktop.qch>`_ for Qt Assistant and Qt Creator. In Qt Assistant under the :creator:`Preferences Dialog <creator-help.html#adding-external-documentation>`, in the `Documentation` tab (in a collapsible menu for Mac users), you click on the Add button in order to add this guide in the .qch format. We do the same in Qt Creator, under the `Options` dialog, in the `Help` section you, can add this guide in the `Documentation` tab.


License
-------

Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
All rights reserved.

This work, unless otherwise expressly stated, is licensed under a Creative Commons Attribution-ShareAlike 2.5.

The full license document is available from http://creativecommons.org/licenses/by-sa/2.5/legalcode .

Qt and the Qt logo is a registered trade mark of Digia plc and/or its subsidiaries and is used pursuant to a license from Digia plc and/or its subsidiaries. All other trademarks are property of their respective owners.


.. rubric:: What's Next?

Next, you will start to prototype the NoteApp* application and find out the power that QML offers for prototyping.
