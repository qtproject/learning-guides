..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------


How to handle errors of components
==================================

You can use the :qt:`status<qml-component.html#status-prop> property of the :qt:`Component<qml-component.html>` element to check whether the component had an error while loaded.

The :qt:`status<qml-component.html#status-prop> property can be checked on the :qt:`onCompleted<qml-component.html#onCompleted-signal>` attached signal.

.. code-block:: js

    import QtQuick 1.1

     Rectangle {
        Component.onCompleted: {
            console.log("Component loaded")
        }

        onStatusChanged: {
            //check component status property
        }
     }
