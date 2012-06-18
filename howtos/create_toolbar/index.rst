..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------


How to create a toolbar with QML
================================

QML does not provide a standard QML Element ready to use as a typical toolbar. Nevertheless, creating a toolbar should be fairly simple.
Use an `Item` QML element as a top root element that has a default layout for items created for the toolbar.

For example:

.. code-block:: js

    //Toolbar
    Item {
        width: 500; height: 62

        // this default property enables us to create QML Items
        // that will be automatically laid out in the Row element
        // and considered as toolItems
        default property alias toolItems: layout.children


        Row {
            id: layout
            layoutDirection: Qt.RightToLeft

            anchors {
                verticalCenter: parent.verticalCenter;
                left: parent.left; right: parent.right
                leftMargin: 15; rightMargin: 15
            }

            spacing: 20
        }
    }


This is how you would use the above ``Toolbar`` Component:

.. code-block:: js

    Item {
        id: root
        width: 500; height: 600

        Toolbar {
            id: toolbar
            anchors { top: root.top; left: root.left; right: root.right }

            Image {
                id: toolicon
                source: "path/to/icon.png"
            }
        }
    }

