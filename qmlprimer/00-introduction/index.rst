..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------

Introduction
============

Who should read this tutorial and why
-------------------------------------

This tutorial explains the basics of developing Qt Quick applications with the help of code walkthroughs of complete applications. The tutorial extends the standard Qt Quick documentation provided with Qt and relies on it as a source of more detailed information about Qt Quick APIs and fundamental concepts.

This tutorial is thought to precede in-depth content as a prerequisite for those of you who are new to Qt Quick. Even though it starts with the basics, you still have to be familiar with principles of programming. Some basic knowledge of JavaScript is highly recommended.

After completing this tutorial, you should be able to write your own Qt Quick applications and start discovering more by reading advanced materials or analyzing the code of complex applications.

The journey is the target
-------------------------

This tutorial starts with the traditional "Hello World" application and ends with a full-featured Qt Quick application that can be used on a daily basis. The features of this final application covers the major Qt Quick programming aspects.

.. Topic:: Features are never enough

    No doubt many more features could have been added, but it had to be finished at a certain level to keep the size of this tutorial in limits. Feel free to take the source code of the final application and extend it. You will know how to do it!

The tutorial is a journey through these aspects. We will stop at famous places, watch some remarkable scenery, and use the gained knowledge to enhance the application more and more. At each of those steps we will look into code samples, and discuss what is happening there and how we use it in our application. At the end, you might be surprised that the application is fairly simple compared to the length of the tutorial. This is on purpose: our target is not to develop the application quickly, but to learn through the journey.

Right after "Hello World", we're going to develop a simple application that shows the current time and date in the nostalgic format of an old LED clock. The next step is another application which reads, parses, and displays weather forecasts from the Internet. Later, we try to combine these two applications as components into a larger application: a clock with integrated weather forecasting.

Note that some advanced aspects are not discussed in this tutorial to keep it simple. Those aspects are mentioned in the last chapter. One piece of advice that we have for you is to remember the old developer saying: :qt:`“Documentation is your friend”<index.html>`...

.. _get-primer-source-code:

Downloads
---------

A .zip file that contains the source code of each chapter is provided so you can compare it with your code:

     :download:`Source code<qtquickappdevintro/qt_quick_app_dev_intro_src.zip>`

This tutorial is available in the following formats:

     :download:`PDF<qtquickappdevintro/QtQuickAppDevIntro.pdf>`

     :download:`ePub<qtquickappdevintro/QtQuickAppDevIntro.epub>`

     :download:`Qt Help<qtquickappdevintro/QtQuickAppDevIntro.qch>`.

..note: The example application referred in this guide is developed with Qt 4.8.x and Qt Quick 1.1 running on Linux and Windows. Refer to the section,
  :ref:`porting-primer-to-qt5` for details about how to get this example application running with Qt5.

Help us help you
----------------

We would greatly appreciate any feedback or comments from you that can help us improve the content of this guide.

Use the Qt Bug Tracker to give us feedback.

Related material
-----------------

    *Other guides*

As mentioned before, the following Qt Learning Guides for Qt Quick could be useful if you're developing for desktop and mobile devices on Symbian and MeeGo:

    * Programming with Qt Quick for Symbian and MeeGo Harmattan Devices
    * Qt Quick Application Developer Guide for Desktop

Check :guides-homepage:`this link<>` to download these and other guides.

    *Qt documentation*

There are two major sets of documents in Qt that we will be referring to. We recommend reading them to learn all the key details about Qt Quick:

     * :qt:`Qt Quick landing page in the Qt documentation <qtquick.html>`
     * :qt:`Introduction to the QML Language <qdeclarativeintroduction.html>`

    *Training materials*

You may consider looking into the training materials published `on the Qt Training web page <http://qt.digia.com/Product/Learning/Topics/QML-Qt-Quick/>`_ . In addition to training slides, training materials contain a lot of useful examples.

    *Videos**

The recordings of training sessions and technical talks given at Qt Developer Days are another interesting learning resource. They are available in `the Qt's video collection <http://qt-project.org/videos>`_ .

    *Examples and demos**

Qt Quick comes with a wide range of demos and examples. You can access all of them either from the Qt Creator welcome page or from the :qt:`Qt Quick Code Samples  <qdeclarativeexamples.html>` page in Qt documentation.

The wiki on the `Qt Project website <http://qt-project.org/>`_ has two listings of examples and demos:

    * `Demos and Examples <http://qt-project.org/wiki/Category:Learning::Demos_and_Examples>`_
    * `Example Applications for Qt Quick <http://qt-project.org/wiki/qml_examples_directory>`_


License
-------

Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
All rights reserved.

This work, unless otherwise expressly stated, is licensed under a Creative Commons Attribution-ShareAlike 2.5.

The full license document is available from http://creativecommons.org/licenses/by-sa/2.5/legalcode .

Qt and the Qt logo is a registered trade mark of Digia plc and/or its subsidiaries and is used pursuant to a license from Digia plc and/or its subsidiaries. All other trademarks are property of their respective owners.

.. rubric:: What's Next?

The next chapter covers how to set up the development environment and run your first Qt Quick application.
