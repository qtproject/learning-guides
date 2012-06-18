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

This tutorial explains the basics of developing applications with Qt Quick by walking the reader through the code of complete applications. The tutorial extends the standard Qt Quick documentation provided in Qt and relies on it as a source of more detailed information about Qt Quick APIs and fundamental concepts.

This tutorial is thought to precede in-depth content as a prerequisite for those of you who are new to Qt Quick. Even though it starts with the basics, you still have to be familiar with principles of programming. Some basic knowledge of JavaScript is highly recommended.

After completing this tutorial, you should be able to write your own Qt Quick applications and start discovering more by reading advanced materials or analyzing the code of complex applications.

The journey is the target
-------------------------

This tutorial will start with the traditional "Hello World" application and end up with a full-featured Qt Quick application you can use on a daily basis. The features of this final application have been selected to cover major Qt Quick programming aspects.

.. Topic:: Features are never enough

    No doubt many more features could have been added, but it had to be finished at a certain level to keep the size of this tutorial in limits. Feel free to take the source code of the final application and extend it. You will know how to do it!

The tutorial will be a journey through these aspects. We will stop at famous places, watch some remarkable scenery and use the gained knowledge to enhance the application more and more. At each of those steps we will look into code samples and discuss what is happening there and how we use this in our application. At the end, you might be surprised that the application turned to be fairly simple compared to the length of the tutorial. This is on purpose: our target is not getting this application coded as quickly as possible, learning through the journey is the target.

Right after "Hello World", we will make a simple application that shows the current time and date in the nostalgic format of an old LED clock. The next step will be another application which reads, parses and displays weather forecasts from the Internet. Later, we will combine these two applications as components into a larger application: a clock with integrated weather forecasting.

Please note that some advanced aspects are left out of scope of this tutorial to keep it as short as possible. We will mention some of them in the last chapter. One piece of advice that we have for you is to remember the old developer saying: :qt:`“Documentation is your friend”<index.html>`...

.. _get-primer-source-code:

Downloads
---------

A .zip file that contains the source code of each chapter is provided so you can compare it to your own code:

     :download:`Source code<qtquickappdevintro/qt_quick_app_dev_intro_src.zip>`

The guide is available in the following formats:

     :download:`PDF<qtquickappdevintro/QtQuickAppDevIntro.pdf>`
     :download:`ePub<qtquickappdevintro/QtQuickAppDevIntro.epub>`
     :download:`Qt Help<qtquickappdevintro/QtQuickAppDevIntro.qch>`.

.. Topic:: What is ePub?

  ePub is a content container for ebook readers. Further details can be found `in this Wikipedia article <http://en.wikipedia.org/wiki/EPUB#Software_reading_systems>`_.

.. Topic:: Installing additional Qt Help files in Qt Assistant and Qt Creator

  In Qt Assistant, go to the :qt:`Preferences Dialog <assistant-details.html#preferences-dialog>`, in the `Documentation` tab (in a collapsible menu for Mac users), click on the `Add` button in order to add this guide in .qch format. Do the same in Qt Creator under the `Options` dialog. In the `Help` section, you can add this guide under the `Documentation` tab.

The provided code has been developed with Qt 4.8.x and Qt Quick 1.1 running on Linux and Windows. Please refer to the section :ref:`porting-primer-to-qt5` for details of how to get example applications running with Qt5.

Help us help you
----------------

We would greatly appreciate any feedback or comments from you that can help us improve the content of this guide.

Please use the form at `this form <http://qt.nokia.com/forms/feedback/developer-guides>`_ to give us your feedback.

Related material
-----------------

    *Other guides**

As mentioned before, there are other developer Qt Learning Guides for Qt Quick. At the time of writing, the following guides have been published:

         Programming with Qt Quick for Symbian and MeeGo Harmattan Devices
         Qt Quick Application Developer Guide for Desktop

Check :guides-homepage:`this link<>` to download these and other guides.

    *Qt documentation**

There are two major sets of documents in Qt we will be referring the most. We recommend reading them to learn all the key details about Qt Quick:

         :qt:`Qt Quick landing page in the Qt documentation <qtquick.html>`
         :qt:`Introduction to the QML Language <qdeclarativeintroduction.html>`

    *Training materials**

You may consider looking into the training materials published `on the Qt Training web page <http://qt.nokia.com/learning/online/training>`_ . In addition to training slides, training materials contain a lot of useful examples.

    *Videos**

The recordings of training sessions and technical talks given at Qt Developer Days in 2010 and 2011 are another interesting learning resource. They are available in `the Qt's video collection <http://qt-project.org/videos>`_ .

    *Examples and demos**

Qt Quick comes with a wide range of demos and examples. You can access all of them either from the Qt Creator welcome page in Qt SDK or from the :qt:`Qt Quick Code Samples  <qdeclarativeexamples.html>` page in Qt documentation.

The wiki on the `Qt Project website <http://qt-project.org/>`_ has two listings of examples and demos:

     `Demos and Examples <http://qt-project.org/wiki/Category:Learning::Demos_and_Examples>`_
     `Example Applications for Qt Quick <http://qt-project.org/wiki/qml_examples_directory>`_


License
-------

Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
All rights reserved.

This work, unless otherwise expressly stated, is licensed under a Creative Commons Attribution-ShareAlike 2.5.

The full license document is available from http://creativecommons.org/licenses/by-sa/2.5/legalcode .

Qt and the Qt logo is a registered trade mark of Digia plc and/or its subsidiaries and is used pursuant to a license from Digia plc and/or its subsidiaries. All other trademarks are property of their respective owners.

.. rubric:: What's Next?

The next chapter covers how to set up the development environment and run your first Qt Quick application.
