..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------


How to do logging and debugging in your Qt Quick application
===========================================================

You can use the ``console.log`` javascript function for printing debugging information to the console.

.. code-block:: js

    import QtQuick 1.1

     Rectangle {
         width: 200; height: 200
         MouseArea {
             anchors.fill: parent
             onClicked: console.log("clicked")
         }
     }

Further detailed information for debugging techniques and approaches can be in :qt:`Debugging QML<qdeclarativedebugging.html>` documentation.
