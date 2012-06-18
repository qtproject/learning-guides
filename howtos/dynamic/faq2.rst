..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------


FAQ: How can I create QML object dynamically from a component?
==============================================================

You can use the 'createObject(Item parent, object properties)' method of the component

.. code-block:: js

    import QtQuick 1.1

    Rectangle {
        width: 300; height: 300
        id: root

        Component {
            id: mycomponent;
            MyComponent {}
        }
        Component.onCompleted: {
            mycomponent.createObject(root, { x: 50, y: 50 } )
        }
    }


This is the ``MyComponent`` component.

.. code-block:: js

    import QtQuick 1.1

    Rectangle {
        width: 100
        height: 62
        color: "red"
    }

In the example above, we have loaded a `MyComponent` component and afterwards we create an object of that component using 'createObject()'.
