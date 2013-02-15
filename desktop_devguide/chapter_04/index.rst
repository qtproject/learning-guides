..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------

Managing Note Objects Dynamically
=================================

We have so far seen that QML is quite a powerful declarative language, but combining it with with JavaScript makes it even more powerful. QML not only enables us to have :qt5:`inline JavaScript <qtqml/qtqml-javascript-expressions.html#custom-methods>` functions, but also to import entire JavaScript libraries or files.

Part of the core functionality of NoteApp* is to enable users to create, edit, and delete notes as they like, but the application should also be able to store notes automatically without prompting them.

This chapter will guide you about using JavaScript to add logic to QML code, and implementing local storage using :qt5:`Qt Quick Local Storage <qtquick/qmlmodule-qtquick-localstorage2-qtquick-localstorage-2.html>`.

.. note::

    You will find the implementation related to this chapter in the zip file provided in the :ref:`get-desktop-source-code` section.


The main topics covered in this chapter are:

    * Using JavaScript for implementing the functionality of Dynamic Object Management

    * How to store data locally using the Qt Quick Database API

This chapter has the following steps:

.. toctree::
  :maxdepth: 2

  step_1
  step_2
