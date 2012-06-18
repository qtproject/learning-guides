..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------

How to resize a Positioner based on the children size
-----------------------------------------------------

You can use the childrenRect.width and childrenRect.height properties to adapt your positioner (Row, Column, Grid) to the size of the children:

.. code-block:: js

    import QtQuick 1.1

    Rectangle {
        width: 800; height: 600
        color: "black"

        Column {
            width: childrenRect.width
            height: childrenRect.height
            spacing: 16
            anchors.centerIn: parent

            Repeater {
                model: 4
                Rectangle { width: 80; height: 40; color: "red" }
            }
            Tracer { color: "blue" }
        }
    }

