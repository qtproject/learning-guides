..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------

FAQ: How can I load QML components dynamically?
===============================================

You can use the  Qt.createComponent(url) function on the QML Global Object

.. code-block:: js

    import QtQuick 1.1

    Item {
        id: root
        width: 300; height: 300

        function loadMyComponent() {
            var component = Qt.createComponent("MyComponent.qml");

            if (component.status == Component.Ready) {
                print("Component loaded successfully!")
            }
        }

        Component.onCompleted: loadMyComponent()
    }

This is the ``MyComponent`` component.

.. code-block:: js

    import QtQuick 1.1

    Rectangle {
        width: 100
        height: 62
        color: "red"
    }


In the example above, a component is loaded inside the `loadMyComponent()` javascript function.
