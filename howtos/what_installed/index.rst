..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------

How to find out which Qt Quick modules are pre-installed
========================================================

First of all, read about the :qt:`Modules<qdeclarativemodules.html>` in Qt documentation.

All available Qt Quick modules are located in ``$QTDIR/imports``. This directory contains folders where modules reside. Some of those folders might contain sub-folders if a module has a deeper structure. For example, if there is ``./$QTDIR/imports/QtQuick/XmlListModel``, you need to write ``import QtQuick.XmlListModel 1.0``.

You can check the version you need to use in the ``qmldir`` file for modules with QML based components.

Unfortunately, there is no way to find out the version of modules (plug-ins) written in C++ (like in the example above), since their version is compiled in C++ code and is not noted in the ``qmldir`` file. If documentation does not say what you have, you have to guess-n-try. Alternatively, you can set the environment variable ``QML_IMPORT_TRACE`` to ``1`` (see :qt:`here<qdeclarativedebugging.html>`) and watch the log.
