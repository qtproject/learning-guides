..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------

Using the Behavior Element to Animate NoteToolbar
=================================================

Let's see how we can improve the `Note` Component and add a behavior to the element based on user's interaction. The `Note` Component has a toolbar with a     Delete* tool for deleting the note. Moreover, the note-toolbar is used to drag the note around by keeping the mouse pressed on it and moving the mouse.

An improvement could be to make the `Delete` tool of the `Note Toolbar` visible only when needed. For instance, what we could show the `Delete` tool only when the toolbar is
hovered and it would be nice to do this in a transitional approach, meaning using fading in and out effects.

QML provides several approaches to implement this by using `Animation` and `Transition` elements as we will see later on. For this specific case, however, we use the :qt:`Behavior <qml-behavior.html>` QML Element and later on cover the reason behind this.


Behavior and NumberAnimation QML Elements
-----------------------------------------

In the `NoteToolbar` component, we use the :qt:`Row <qml-row.html>` element to layout the     Delete* tool so changing the `opacity` property of the :qt:`Row <qml-row.html>` element will also effect the opacity of the *Delete* tool.

.. note:: The value of the `opacity` property is propagated from the parent to the child items.

The :qt:`Behavior <qml-behavior.html>` element helps you define the behavior of your element based on the property changes of that element as shown in the following code in `NoteToolbar.qml`:

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

        // the opacity depends if the mousearea elements
        // have the cursor of the mouse.
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

As we can see from the code shown above, we enable the     *hoverEnabled** property in the :qt:`MouseArea <qml-mousearea.html>` element, which allows `MouseArea` to accept mouse hover events. Afterwards, we toggle the `opacity` of the `Row` element to `0` if the `mousearea` element is not hovered and to `1` otherwise. The :qt:`containsMouse <qml-mousearea.html#containsMouse-prop>` property of `MouseArea` is used for this, which is set to true only when `mousearea` is hovered.

So the :qt:`Behavior <qml-behavior.html>` element is created inside the `Row` element to define a behavior for it when the opacity` property is toggled and therefore changed so a :qt:`NumberAnimation <qml-numberanimation.html>` element is created to animate this change.

The :qt:`NumberAnimation <qml-numberanimation.html>` element applies an animation based on numerical value changes so we use it for the `opacity` property of the `Row` for a duration of 350 milliseconds.

.. note:: The `NumberAnimation` element inherits from :qt:`PropertyAnimation <qml-propertyanimation.html>`, which have `Easing.Linear` as the default easing curve of the animation.


.. rubric:: What's Next?

In the next step, we will see how to implement an animation using     Transition* and other QML animation elements.
