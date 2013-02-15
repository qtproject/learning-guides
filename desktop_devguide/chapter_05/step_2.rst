..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------

Using States and Transitions
============================

In the previous step, we saw a convenient approach to defining simple animations based on the property changes, using the :qt5:`Behavior <qtquick/qml-qtquick2-behavior.html>` and :qt5:`NumberAnimation <qtquick/qml-qtquick2-numberanimation.html>` types.

Certainly, there are cases in which animations depend on a set or property changes that could be represented by a :qt5:`State <qtquick/qml-qtquick2-state.html>`.

Let's see how we can further improve the UI of NoteApp*.

The `Marker` items seem to be static when it comes to user interaction. What if we could add some animations based on different user interaction scenarios? Moreover, we would like to make the current active marker and the current page more visible to the user.

Animating the Marker Items
--------------------------

If we are about to summarize the possible scenarios for enhancing user interaction with `Marker` items, the following use cases are depicted:

    * The current active `Marker` item should be more visible. A marker becomes active when the user clicks on it. The active marker is slightly bigger, and it could slide from left to right (just like a drawer).

    * When the user hovers a marker with the mouse, the marker slides from left to right but not as much as an active marker would slide.

Considering the scenarios mentioned above, we need to work on the `Marker` and `MarkerPanel` components.

While reading the description above about the desired behavior (the sliding effect from left to right), the immediate thought I get is to change the `x` property of the `Marker` item as it represents the position of the item on the X-axis. Moreover, as the `Marker` item should be aware if it is the current active marker, a new property called `active` can be introduced.

We can introduce two states for the `Marker` component that can represent the depicted behavior above:

    * `hovered` - will update the `x` property of the marker when the user hovers it using the mouse

    * `selected` - will update the `x` property of the marker when the marker becomes an active one, that is, when it is clicked by the user.


.. code-block:: js

    // Marker.qml
    ...
    // this property indicates whether this marker item
    // is the current active one. Initially it is set to false
    property bool active: false

    // creating the two states representing the respective
    // set of property changes
    states: [
        // the hovered state is set when the user has
        // the mouse hovering the marker item.
        State {
            name: "hovered"
            // this condition makes this state active
            when: mouseArea.containsMouse && !root.active
            PropertyChanges { target: root; x: 5 }
        },

        State {
            name: "selected"
            when: root.active
            PropertyChanges { target: root; x: 20 }
        }
    ]

    // list of transitions that apply when the state changes
    transitions: [
        Transition {
            to: "hovered"
            NumberAnimation { target: root; property: "x"; duration: 300 }
        },

        Transition {
            to: "selected"
            NumberAnimation { target: root; property: "x"; duration: 300 }
        },

        Transition {
            to: ""
            NumberAnimation { target: root; property: "x"; duration: 300 }
        }
    ]
    ...

So we have two states declared that represent the respective property changes based on the user's behavior. Each state is bound to a condition that is expressed in the `when` property.

.. note:: For the `containsMouse` property of the `MouseArea` type, the `hoverEnabled` property must be set to `true`.

The :qt5:`Transition <qtquick/qml-qtquick2-transition.html>` type is used to define the behavior of the item when moving from one state to another. That is, we can define various animations on the properties that change when a state becomes active.

.. note:: The default state of an item is an empty string, ("")

While in the `MarkerPanel` component, we must set the `active` property of the `Marker` item to `true` when it is clicked. Refer to `MarkerPanel.qml` for the updated code.


Adding Transitions to PagePanel
-------------------------------

In the `PagePanel` component, we are using states to manage navigation between pages. Adding transitions comes naturally to mind. As we change the `opacity` property in each state, we can add `Transition` for all states that run a `NumberAnimation` on the opacity values for creating the fade-in and fade-out effect.

.. code-block:: js

    // PagePanel.qml

    ...
    // creating a list of transitions for
    // the different states of the PagePanel
    transitions: [
        Transition {
            // run the same transition for all states
            from: "    "; to: "*"
            NumberAnimation { property: "opacity"; duration: 500 }
        }
    ]
    ...

.. note:: The `opacity` value of an item is propagated to its child elements too

.. rubric:: What's Next?

In the next step, we will learn how to further enhance the UI and see what more could be done.
