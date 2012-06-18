..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------

How to do localization
======================

When starting to develop an application, it makes a lot of sense to make some basic thoughts about international versions even if you do not planning it for now. Qt provides a set of tools for this. Qt Quick uses them as a base. If you already know and use the essential part of the tools in the beginning of your development, it can save a lot of time later when your application becomes a complex system with a lot of code.

Qt Quick provides almost the same APIs for translation as known in Qt Script (see the section "Produce Translations" in :qt:`Making Applications Scriptable<scripting.html>`). The major API is the ``qsTr()`` function which should be used for all visual strings in an application. The error message we introduced before should be written like this:

.. code-block:: js

    Image {
        id: background
        source: "./content/resources/light_background.png"
        fillMode: "Tile"
        anchors.fill: parent
        onStatusChanged: if (background.status == Image.Error)
                            console.log (qsTr("Background image \"") +
                                        source +
                                        qsTr("\" cannot be loaded")
    }

``qsTr()`` also supports variable substitution "%n" via arg(), e.g.:

.. code-block:: js

    qsTr("This is page %1 of %2").arg(pageNumber()).arg(pagesTotal())

The application continues to run as before using ``qsTr()``. You need to use the Qt translation tool chain to prepare translation files. See the :qt:`QML Internationalization<qdeclarativei18n.html>` article for more details.

When translation files are available, there are three options for loading them into the current Qt Quick version:

     by using the ``qmlviewer`` command line option ``-translate``
     by placing them in the ``i18n`` sub-folder (see :qt:`this example<declarative-i18n.html>`)
     by modifying the default behavior of the ``qmlviewer`` and loading QML and translation files in your own way (this is out of the scope of this guide)

Currently, it is not possible to load a new language after a QML application has already started. See this article on the Qt developer Wiki about possible workarounds: `"How to do dynamic translation in QML" <http://developer.qt.nokia.com/wiki/How_to_do_dynamic_translation_in_QML/>`_

If your plan is to make a version of an application for right-left languages, e.g. Arabic, please take a look on the article :qt:`QML Right-to-left User Interfaces<qml-righttoleft.html>`.

If you are interested in more details, check out the further readings about internationalization in Qt:

     Qt documentation: :qt:`Writing Source Code for Translation<i18n-source-translation.html>`
     Qt documentation: :qt:`Internationalization with Qt<internationalization.html>`
     Qt developer Wiki: `"Qt Internationalization" article <http://developer.qt.nokia.com/wiki/QtInternationalization>`_
