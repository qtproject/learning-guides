..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------

How to handle keyboard events in QML?
=====================================

Key events are accepted while an :qt:`Item<qml-item.html>` has focus, meaning the :qt:`focus<qml-item#focus-prop>` property is set to true.

.. code-block:: js

    import QtQuick 1.1

    Rectangle {
         width: 100; height: 100
         focus: true
         Keys.onPressed: {
             if (event.key == Qt.Key_A) {
                 console.log('Key A was pressed');
                 event.accepted = true;
             }
         }
     }

The :qt:`KeyEvent<qml-keyevent.html>` object provides information about a key event.
Further detailed information regarding key board focus and handling in Qt Quick can be found in the :qt:`Keyboard Focus in QML<qdeclarativefocus.html#qmlfocus>` documentation.
