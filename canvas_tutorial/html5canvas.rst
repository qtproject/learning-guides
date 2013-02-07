..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------


Porting HTML5 Canvas Code to Qt Quick
=====================================

In this page, we want to show how easy it is to port existing HTML5 Canvas code to Qt Quick using the Canvas element.

.. note::
    A general list of the necessary changes can be found in `the Qt documentation for :qt5-snapshot: Qt Quick Canvas <qtquick/qml-qtquick2-canvas.html>`_.


The HTML5 Canvas Code
---------------------

We are going to port the `spirograph <http://en.wikipedia.org/wiki/Spirograph>`_ example used in this `HTML5 Canvas Tutorial <https://developer.mozilla.org/en/Canvas_tutorial/Transformations>`_.

The HTML5 code looks like this:

.. literalinclude:: src/spirograph-html.js
    :language: js


The Qt Quick Canvas Code
------------------------

To port this code to a Qt Quick application, we can copy the code for drawing function into the ``onPaint`` handler of Qt Quick Canvas. We only need to change the line in which we acquire the drawing context: instead of using a DOM API call (``document.getElementById('canvas')``), we access the canvas directly. The JavaScript function can be inserted as a member function of the canvas.

.. literalinclude:: src/spirograph.qml
    :language: js

This is how the ported Qt Quick application looks like:

.. image:: img/spirograph.png
    :scale: 50%

As you can see, it is surprisingly easy to use existing HTML5 Canvas code in your Qt Quick application.

.. rubric:: What's Next?

The next chapter concludes this tutorial.
