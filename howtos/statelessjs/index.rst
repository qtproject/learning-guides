..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------

.. _stateless_javascript_library:

What is a stateless js library?
===============================

As mentioned in documentation about :qt:`Integrating Javascript <qdeclerativejavascript.html>`, some JavaScript files act more like libraries - they provide a set of stateless helper functions that take input and compute output, but never manipulate QML component instances directly.
As it would be wasteful for each QML component instance to have a unique copy of these libraries, the JavaScript programmer can indicate a particular file as a stateless library through the use of a pragma, as shown in the following example.

.. Note:: The pragma declaration must appear before any JavaScript code (with the exception of comments)

As they are shared, stateless library files cannot access QML component instance objects or properties directly, although QML values can be passed as function parameters.

.. code-block:: js

    // factorial.js
     .pragma library

     function factorial(a) {
         a = parseInt(a);
         if (a <= 0)
             return 1;
         else
             return a * factorial(a - 1
