..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------

How to use system-wide look&feel properties?
============================================

The :qt:`SystemPalette<qml-systempalette.html>` element provides access to the Qt application palettes. This provides information about the standard colors used for application windows, buttons and other features.

The following example creates a palette from the     Active* color group and uses this to color the window and text items appropriately:

.. code-block:: js

    import QtQuick 1.1

     Rectangle {
         SystemPalette { id: myPalette; colorGroup: SystemPalette.Active }

         width: 640; height: 480
         color: myPalette.window

         Text {
             anchors.fill: parent
             text: "Hello!"; color: myPalette.windowText
         }
     }
