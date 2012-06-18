..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------

How to make a simple button
===========================

A button is basically a rectangle which you can press.

.. code-block:: js

    // Button1.qml
    import QtQuick 1.1

    Rectangle {
        id: root
        width: 64; height: 32
        color: "red"

        signal clicked()

        MouseArea {
            anchors.fill: parent
            onClicked: root.clicked()
        }
    }

This is how you use the button:

.. code-block:: js

    import QtQuick 1.1

    // main.qml
    Rectangle {
        width: 300; height: 300
        color: "black"

        Button1 {
            anchors.centerIn: parent
            onClicked: print("Button Pressed")
        }
    }

This is indeed a very simple button. You could add a ``Text`` element centered on the button to make it even more useful, e.g. something like this:

.. code-block:: js

    import QtQuick 1.1

    Rectangle {
        id: root
        property string label: "no label"
        width: labelText.width + 10
        height: labelText.height + 10
        color: "red"
        radius: 8

        signal clicked()

        Text {
            id: labelText
            text: label
            anchors.centerIn: parent
        }

        MouseArea {
            anchors.fill: parent
            onClicked: root.clicked()
        }
    }
