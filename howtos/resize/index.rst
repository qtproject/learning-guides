..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------

How to make the QML root element resizable
==========================================

You have to set another resize mode for the QDeclarativeView:

.. code-block:: cpp

   view.setResizeMode(QDeclarativeView::SizeRootObjectToView);

How to resize images
--------------------

Sometimes you might need to paint an image in a smaller or a larger size than it actually is. An obvious choice would be to use the ``scale`` property:

.. code-block:: js

    myImage.scale = 0.5

The ``scale`` property is inherited from :qt:`Item <qml-item.html>` and only changes the painted size, but not the bounding rectangle of the image. If you check the ``width`` and ``height`` of ``myImage``, you will realize that they still have original values. If ``scale`` is less then 1 (smaller painting size), the image will also be placed in the a corner of the bounding rectangle.

If you need to scale an image together with its bounding rectangle, the best way is to this is:

.. code-block:: js

            Image {
                id: myImage
                source: "image_file.png"
                fillMode: Image.PreserveAspectFit
                width: sourceSize.width/2
            }

Note that we use ``sourceSize`` to bind a new value to ``width``. ``height`` will be calculated automatically because ``fillMode`` is set to preserve the aspect ratio.

Another way of scaling an image is to use the :qt:`Scale <qml-scale.html>` element:

.. code-block:: js

            Image {
                id: myImage
                source: "image_file.png"
                transform: Scale { xScale: 0.5, yScale: 0.5}
            }
