..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------


How do I quit my application?
=============================

The :qt:`QML global Qt <qml-qt.html>` object provides useful enums and functions from Qt. We use the :qt:`Qt.quit() <qml-qt.html#quit-method>` method in order to quit an application:

.. code-block:: js

    import QtQuick 1.1

    Rectangle {
        width: 360
        height: 360

        MouseArea {
            anchors.fill: parent

            onClicked: Qt.quit()
        }
    }
