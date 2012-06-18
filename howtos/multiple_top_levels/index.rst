..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------

How to make and handle multiple toplevel windows
================================================

You can use the ``visible`` or the ``opacity`` property to hide a toplevel element. Visually, both choices look the same. The only difference is that the ``visible`` property changes the focus behavior. You should keep this in mind and check what is better in your case.

A simple version without any control elements:

.. code-block:: js

    import QtQuick 1.1

    Item {
        width: 360
        height: 360

        Rectangle {
            id: top1
            anchors.fill: parent
            Text {
                anchors.centerIn: parent
                text: "I'm top #1, click me to hide"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    top1.visible=false
                    top2.visible=true
                }
            }
        }

        Rectangle {
            id: top2
            anchors.fill: parent
            Text {
                anchors.centerIn: parent
                text: "I'm top #2, click me to hide"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    top2.visible=false
                    top1.visible=true
                }
            }
        }
    }


A more complex version with a component for a button:

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


.. code-block:: js

    import QtQuick 1.1

    Item {
        width: 360
        height: 360

        Rectangle {
            id: top1
            anchors.fill: parent
            Text {
                anchors.centerIn: parent
                text: "I'm top #1"
            }

            Button2 {
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                color: "lightblue"
                label: "Open top 2"
                onClicked: {
                    top1.visible=false
                    top2.visible=true
                }
            }
        }

        Rectangle {
            id: top2
            anchors.fill: parent
            Text {
                anchors.centerIn: parent
                text: "I'm top #2"
            }
            Button2 {
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                color: "lightgrey"
                label: "Open top 1"
                onClicked: {
                    top2.visible=false
                    top1.visible=true
                }
            }
        }
    }
