..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------

Using States and Transitions to Animate Pages and Page Markers
==============================================================

Previously, we saw a rather convenient approach to defining simple animations upon the property changes of an element using the :qt:`Behavior <qml-behavior.html>` and :qt:`NumberAnimation <qml-numberanimation.html>` elements.

Certainly, there are cases in which animations depend on a set or property changes that could be represented by a :qt:`State
<qml-state.html>`.

Let's see how we can further improve the UI of     NoteApp*.

The `Marker` items seem to be static when it comes to user interaction. What if we could add some animations based on different user interaction scenarios? Moreover, we would like to make the current active marker more visible to the user, hence the current page that the user is creating notes for.

Animating the Marker Items using Transitions
--------------------------------------------

If we are about to summarize the possible scenarios for enhancing user interaction with `Marker` items, the following use cases are depicted:

     The current active `Marker` item should be more visible. A marker becomes active when the user clicks on it. The active marker is slightly bigger and, in fact, could slide from left to right (just like a drawer).
     When the user hovers a marker with the mouse, the marker slides from left to right but not as much as an active marker would slide.

Considering the scenarios mentioned above, we need to work on the `Marker` and `MarkerPanel` components.

While reading the description above about the desired behavior (the sliding effect from left to right), changing the `x` property of the `Marker` item immediately comes to mind because the `x` property represents the position of the item on the X-axis. Moreover, as the `Marker` item should be aware if it is the current active marker, a new property called `active` can be introduced.

We can introduce two states for the `Marker` component that can represent the depicted behavior above:

     `hovered` will update the `x` property of the marker when the user hovers it using the mouse
     `selected` will update the `x` property of the marker when the marker becomes an active one, meaning clicked by the user


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

.. note:: For the `containsMouse` property of the `mouseArea` element, the `hoverEnabled` property should be set to true

The :qt:`Transition <qml-transition.html>` QML Element is used to define the behavior of the item when moving from one state to another, meaning we can define various animations on the properties that change when a state becomes active.

.. note:: The default state of an item is referred to as a an empty string, ("")

While in the `MarkerPanel` component, we make sure to set the `active` property of the `Marker` item to true only when it is clicked as described in previous steps. Please check `MarkerPanel.qml` for more details.


Adding Transitions to PagePanel
-------------------------------

In the `PagePanel` component, we are using states to manage navigation between pages. Adding transitions comes naturally to mind. Since we simply the `opacity` property in each state, we can add `Transition` for all states that run a `NumberAnimation` on the opacity values for creating the fade-in and fade-out effect.

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
