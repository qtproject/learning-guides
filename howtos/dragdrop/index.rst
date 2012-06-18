..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------


How to enable drag&drop
=======================

The :qt:`MouseArea<qml-mousearea.html>` QML Element has a grouped property :qt:`drag<qml-mousearea.html#drag.active-prop>` that enables us to have drag and drop functionality for our QML items.

The following example displays a rectangle that can be dragged along the X-axis. The opacity of the rectangle is reduced when it is dragged to the right.

.. code-block:: js

     import QtQuick 1.1

     Rectangle {
         width: 480
         height: 320
         Rectangle {
             x: 30; y: 30
             width: 300; height: 240
             color: "lightsteelblue"

             MouseArea {
                 anchors.fill: parent
                 drag.target: parent;
                 drag.axis: "XAxis"
                 drag.minimumX: 30
                 drag.maximumX: 150
                 drag.filterChildren: true

                 Rectangle {
                     color: "yellow"
                     x: 50; y : 50
                     width: 100; height: 100
                     MouseArea {
                         anchors.fill: parent
                         onClicked: console.log("Clicked")
                     }
                 }
             }
         }
     }

