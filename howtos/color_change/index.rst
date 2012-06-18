..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------

How to make a lighter and darker color
======================================

The :qt:`QML global Qt <qml-qt.html>` object provides useful enums and functions from Qt. Hence we use the :qt:`Qt.lighter(color baseColor, real factor) <qml-qt.html#lighter-method>` and :qt:`Qt.darker(color baseColor, real factor) <qml-qt.html#darker-method>` methods to make a color lighter or darker respectively.

.. code-block:: js

    import QtQuick 1.1

    Rectangle {
        width: 360
        height: 360

        Column {
            anchors.fill: parent

            Rectangle {
                width: 50; height: 50
                color: "blue"
            }
            Rectangle {
                width: 50; height: 50
                color: Qt.lighter("blue")
            }
            Rectangle {
                width: 50; height: 50
                color: Qt.darker("blue")
            }
        }
    }

