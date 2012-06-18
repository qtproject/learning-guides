..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------

How to make a transparent Rectangle
===================================

.. code-block:: js

    import QtQuick 1.1

    Rectangle {
        width: 300; height: 300
        // use the color named "transparent"
        color: "transparent"
        border { color: "black"; width: 2 }
    }
