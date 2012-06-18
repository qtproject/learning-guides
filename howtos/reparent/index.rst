..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------

How to reparent a QML element
=============================

The :qt:`ParentChange<qml-parentchange.html>` element allows you to reparent an item in a state change.

The example below displays a large red rectangle and a small blue rectangle side by side. When `blueRect` is clicked, it changes to the     reparented* state: its parent is changed to `redRect` and it is positioned at (10, 10) within the red rectangle as specified in `ParentChange`.

.. code-block:: js

    import QtQuick 1.1

     Item {
         width: 200; height: 100

         Rectangle {
             id: redRect
             width: 100; height: 100
             color: "red"
         }

         Rectangle {
             id: blueRect
             x: redRect.width
             width: 50; height: 50
             color: "blue"

             states: State {
                 name: "reparented"
                 ParentChange { target: blueRect; parent: redRect; x: 10; y: 10 }
             }

             MouseArea { anchors.fill: parent; onClicked: blueRect.state = "reparented" }
         }
     }
