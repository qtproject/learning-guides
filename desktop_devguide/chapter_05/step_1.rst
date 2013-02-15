..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------

Animating the NoteToolbar
=========================

Let's see how we can improve the `Note` Component and add a behavior based on user's interaction. The `Note` Component has a toolbar with a Delete* tool for deleting the note. Moreover, the toolbar is used to drag the note around by keeping the mouse pressed on it.

An improvement could be to make the `Delete` tool visible only when needed. For instance, making the `Delete` tool visible only when the toolbar is hovered, and it would be nice to do this using fade-in and fade-out effects.

QML provides several approaches to implement this by using `Animation` and `Transition` types. In this specific case, we will use the :qt5:`Behavior <qtquick/qml-qtquick2-behavior.html>` QML type, and later on cover the reason behind this.


Behavior and NumberAnimation Types
----------------------------------

In the `NoteToolbar` component, we use the :qt5:`Row <qtquick/qml-qtquick2-row.html>` type to layout the     Delete* tool, so changing the `opacity` property of the :qt5:`Row <qtquick/qml-qtquick2-row.html>` type will also effect the opacity of the *Delete* tool.

.. note:: The value of the `opacity` property is propagated from the parent to the child items.

The :qt5:`Behavior <qtquick/qml-qtquick2-behavior.html>` type helps you define the behavior of the item based on the property changes of that item as shown in the following code:

.. code-block:: js

    // NoteToolbar.qml

    ...
    MouseArea {
        id: mousearea
        anchors.fill: parent

        // setting hoverEnabled property to true
        // in order for the MouseArea to be able to get
        // hover events
        hoverEnabled: true
    }

    // using a Row element for laying out tool
    // items to be added when using the NoteToolbar
    Row {
        id: layout
        layoutDirection: Qt.RightToLeft
        anchors {
            verticalCenter: parent.verticalCenter;
            left: parent.left;
            right: parent.right
            leftMargin: 15;
            rightMargin: 15
        }
        spacing: 20

        // the opacity depends if the mousearea
        // has the cursor of the mouse.
        opacity: mousearea.containsMouse ? 1 : 0

        // using the behavior element to specify the
        // behavior of the layout element
        // when on the opacity changes.
        Behavior on opacity {
            // using NumberAnimation to animate
            // the opacity value in a duration of 350 ms
            NumberAnimation { duration: 350 }
        }
    }
    ...

As you can see in the code above, we enable the *hoverEnabled** property of :qt5:`MouseArea <qtquick/qml-qtquick2-mousearea.html>` type to accept mouse hover events. Afterwards, we toggle the `opacity` of the `Row` type to `0` if the `Mousearea` type is not hovered and to `1` otherwise. The :qt5:`containsMouse <qtquick/qml-qtquick2-mousearea.html#containsMouse-prop>` property of `MouseArea` is used to decide the opacity value for the Row type.

So the :qt5:`Behavior <qtquick/qml-qtquick2-behavior.html>` type is created inside the `Row` type to define its behavior based on its `opacity` property. When the opacity value changes, the :qt5:`NumberAnimation <qtquick/qml-qtquick2-numberanimation.html>` is applied.

The :qt5:`NumberAnimation <qtquick/qml-qtquick2-numberanimation.html>` type applies an animation based on numerical value changes, so we use it for the `opacity` property of the `Row` for a duration of 350 milliseconds.

.. note:: The `NumberAnimation` type is inherited from :qt5:`PropertyAnimation <qtquick/qml-qtquick2-propertyanimation.html>`, which has `Easing.Linear` as the default easing curve animation.


.. rubric:: What's Next?

In the next step, we will see how to implement an animation using Transition* and other QML animation types.
