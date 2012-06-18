..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------

How to visually trace the size of an item
=========================================

You can make your own tracer component:

.. code-block:: js

    import QtQuick 1.1

    Item {
        id: root
        anchors.fill: parent
        property color color: "red"
        Rectangle {
            id: rect
            anchors.fill: parent
            color: "transparent"
            border { color: root.color; width: 2 }
        }
    }


You use it like this:

.. code-block:: js

    import QtQuick 1.1

    Rectangle {
        width: 300; height: 300

        Item {
            width: 100; height: 100
            anchors.centerIn: parent
            Tracer { color: "blue" }
        }
    }
