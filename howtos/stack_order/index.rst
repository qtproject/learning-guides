..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------

How to change the stack order of elements
=========================================

The stack order of elements can be changed by setting the :qt:`z <qml-item.html#z-prop>` property of the :qt:`Item <qml-item.html>` QML Element.

.. code-block:: js

    import QtQuick 1.1

    Rectangle {
        width: 360
        height: 360

        Rectangle {
            width: 100; height: 100
            color: "green"
            z:1
        }

        Rectangle {
            width: 200; height: 200
            color: "blue"
            z:0
        }

        Rectangle {
            width: 20; height: 20
            color: "red"
            z:2
        }
    }
