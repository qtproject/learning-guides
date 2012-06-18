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

Why You Should to Read this Guide?
----------------------------------

This guide is an introduction to the development of modern mobile applications with QML. More specifically, it focuses on the use of Qt Quick Components for Symbian^3 with an additional chapter that focuses on the use of Meego Harmattan Components. We will develop a complete mobile application for managing todo lists. Basic knowledge of QML is suggested before continuing, but not required.

Strong emphasis is placed on using various UI elements provided by Qt Quick Components to build mobile apps for Symbian^3 and MeeGo Harmattan devices. This guide will show you step by step how to build a mobile application entirely in QML with some extra JavaScript. Many details and references are provided throughout the chapters so that anyone with at least a basic understanding of QML will be able to get the most out of it.

The purpose of the application that we'll be building throughout this guide will be to record our daily and upcoming list of tasks to be completed, sort them into several categories and manage them. The application was inspired by the     Getting Things Done ®* [#f1]_ system. It covers various aspects of Qt Quick and especially Qt Quick Components programming such as the page navigation concept, database storage and the use of animation to edit, create or display details.

.. [#f1] GTD® and Getting Things Done® are registered trademarks of David Allen & Co. (see http://www.davidco.com/about-gtd)

This guide is split into several chapters, where each chapter adds value to our application. Each chapter contains several easy to follow steps, where each step will focus on a particular issue. We will begin by covering the UI concept and we will end with a deployable application. Feel free to switch between the chapters to learn at a quicker pace according to your level of knowledge and experience in QML.

At the end of the guide, you should be able to understand how to develop mobile apps on Symbian^3 and MeeGo Harmmatan devices using QML and Qt Quick Components as well as learn some tricks for enhancing the look and feel of your mobile application.

The figure below presents some screenshots that show how the UI of the     TodoList* application should look once it is completed:

.. image:: img/todolist.
    :align: center


.. _get-source-code:

Get the Source Code and the Guide in Different Formats
------------------------------------------------------

A .zip file that contains the source code of each chapter is provided, so that you can compare to your own code:

     `Source code <http://get.qt.nokia.com/developerguides/qtquicksymbian/todolist_src.zip>`_

The guide is also available in the following formats:

     `PDF <http://get.qt.nokia.com/developerguides/qtquicksymbian/ProgrammingQtQuick4SymbianHarmattanDevices.pdf>`_
     `ePub <http://get.qt.nokia.com/developerguides/qtquicksymbian/ProgrammingQtQuick4SymbianHarmattanDevices.epub>`_ for ebook readers. Further details can be found `here <http://en.wikipedia.org/wiki/EPUB#Software_reading_systems>`_.
     `Qt Help <http://get.qt.nokia.com/developerguides/qtquicksymbian/ProgrammingQtQuick4SymbianHarmattanDevices.qch>`_ for Qt Assistant and Qt Creator. In Qt Assistant under the :qt:`Preferences Dialog <assistant-details.html#preferences-dialog>`, in the `Documentation` tab (in a collapsible menu for Mac users), you click on the Add button in order to add this guide in the .qch format. We do the same in Qt Creator, under the `Options` dialog, in the `Help` section you, can add this guide in the `Documentation` tab.



Help Us Help You
----------------

We would greatly appreciate any feedback or comments from you that can help us improve the content of this guide.

Please use the form at the link below to give us your feedback:

     http://qt.nokia.com/forms/feedback/qtquicksymbian-guide


License
-------

Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
All rights reserved.

This work, unless otherwise expressly stated, is licensed under a Creative Commons Attribution-ShareAlike 2.5.

The full license document is available from http://creativecommons.org/licenses/by-sa/2.5/legalcode .

Qt and the Qt logo is a registered trade mark of Digia plc and/or its subsidiaries and is used pursuant to a license from Digia plc and/or its subsidiaries. All other trademarks are property of their respective owners.

.. rubric:: What's next?

Let's get started! The first chapter explains how to properly setup your development environment with Qt Creator in order to compile, run and deploy a basic Qt Quick project using Symbian^3 Components.
