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

If you want to draw custom graphics within your Qt Quick application, the :qt5-snapshot:`Qt Quick Canvas <qtquick/qml-qtquick2-canvas.html>`_ item is your choice.

The Canvas type was introduced in Qt Quick 2.0 and provides an area in which you can draw using JavaScript. It uses a high-level command-set based on `the HTML5 Canvas specification <http://www.w3.org/TR/html5/the-canvas-element.html>`_. The Canvas type allows you to draw basic and complex shapes, add color, gradients, shadows, images, text, and access low-level pixel data. Using JavaScript, facilitates the presentation of dynamic content.

After a brief introduction to the Canvas type, we'll develop an interactive pie chart visualization. Later in this guide, we'll see how to port existing HTML5 Canvas code to a Qt Quick 2 application.

This tutorial introduces you to the Qt Quick Canvas using example programs and is not meant to show each and every aspect of this type. A detailed description of the Canvas type and its supported rendering commands can be found in the Qt documentation pages (:qt5-snapshot:`Canvas <qtquick/qml-qtquick2-canvas.html>`_, :qt5-snapshot:`Context2D <qtquick/qml-qtquick2-context2d.html>`_). Also note that a large number of good HTML5 Canvas API tutorials are available on the internet. As the Qt Quick Canvas type is based on the HTML5 specification, these tutorials can serve as an excellent starting point to learn drawing. We have listed a few of those tutorials at `the end of this tutorial <conclusion.html>`_. We also assume that you are already familiar with Qt Quick in general, as this tutorial does refer to some the non-Canvas features.


A Basic Example
---------------

The Qt Quick Canvas type provides a place in your application to draw upon. The actual drawing as well as the resource handling is done by its associated :qt5-snapshot:`Context2D <qtquick/qml-qtquick2-context2d.html>`_ type, which provides the drawing API and manages the transformation stack and style state. It also lets you customize some of its internals such as multithreading, tiling, and the usage of hardware acceleration.

Let's start with a simple example: a small piece of code that displays a colored rectangle:

.. image:: img/canvas.png
    :scale: 50%

This is the source code:

.. literalinclude:: src/canvas.qml
    :language: js

The usual way is to declare a ``Canvas`` type and place the drawing commands inside its ``onPaint`` handler. After acquiring the drawing context, we prepare a rectangular path using ``rect(real x, real y, real w, real h)``. Then we set up the fill color state to yellow using ``fillStyle`` and fill the rectangle by calling ``fill()``. The green border of the rectangle is drawn by setting ``strokeStyle`` and calling ``stroke()`` respectively. The ``lineWidth`` property sets the width of the stroke.

.. note::
    The order of ``stroke()`` and ``fill()`` matters: The stroke pattern is drawn centered along the path (in this example with a 2 px width pattern to the left side and a 2 px width pattern to the right side). If we call ``stroke()`` before ``fill()``, ``fill()`` would over paint the inner part of the border resulting in a 2 px wide border.


Essential Context2D Properties / Methods
----------------------------------------

Here is an overview of the most frequently used drawing commands:

================== ================================== =========================
Group              Operation                          Note
================== ================================== =========================
Path               beginPath()                        Begin new path
Path               moveTo(x, y)                       Move to position
Path               lineTo(x, y)                       Add line path
Path               rect(x, y, width, height)          Add rect path
Path               ellipse(x, y, width, height)       Add ellipse path
Path               arc(x, y, radius, startAngle,      Add arc path
                       endAngle, anticlockwise)
Path               arcTo(x1, y1, x2, y2, radius)      Add arc path
Path               text(text, x, y)                   Add text path
Transformation     translate(x, y)                    Move coordinate system
Transformation     rotate(angle)                      Rotate coordinate system
Transformation     scale(x, y)                        Scale coordinate system
Transformation     shear(sh, sv)                      Shear coordinate system
Style              strokeStyle                        Set up line style
Style              lineWidth                          Set up line width
Style              fillStyle                          Set up fill style
Drawing            stroke()                           Draw path using style
Drawing            fill()                             Fill path using style
================== ================================== =========================


.. rubric:: What's Next?

In the next chapter we will go through some more advanced usage of the API by drawing a Pie Chart.
