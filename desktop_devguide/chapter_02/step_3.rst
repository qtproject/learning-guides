..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------

Anchoring QML Items and Implementing the QML Components
=======================================================

The :qt5:`Rectangle QML type <qtquick/qml-qtquick2-rectangle.html>` is the natural choice to build UI blocks and the initial QML Component in the prototype phase. It is a visual type that has properties, which you can tweak to make it easier to prototype and test.

.. note::

    It is a good practice to always give default geometry values to your defined components as it helps in testing.

Let's have a closer look at the code of our QML Components. At first, we start by implementing the `Note` component.


Note and NoteToolbar Component
------------------------------
First, as seen in the previous step, we have created the new QML files that we can use to implement the required components.

To match the given wire-frame design, the code for `NoteToolbar` could look as follows:

.. code-block:: js

    // NoteToolbar.qml

    import QtQuick 2.0

    // A Rectangle element with defined geometries and color.
    Rectangle {
        id: root
        width: 100
        height: 62
        color: "#9e964a"
    }

The `Note` component will have a toolbar UI element and the `NoteToolbar` component will be used for that. Additionally, there is a text input element for getting the input text from the user. We will use the :qt5:`TextEdit QML type <qtquick/qml-qtquick2-textedit.html>` for this. In order to place these UI elements within the `Note` component, the `anchor` property is used. This property is inherited from the :qt5:`Item type <qtquick/qml-qtquick2-item.html>`, which is the base class that every other QML component inherits by default.

Refer to the :qt5:`Anchor-based Layout in QML <qtquick/qtquick-positioning-anchors.html>` documentation for more details about anchoring and laying out QML components.

.. note:: Anchor-based layouts can not be mixed with absolute positioning

.. code-block:: js

    // Note.qml

    import QtQuick 2.0

    Rectangle {
        id: root
        width: 200
        height: 200
        color: "#cabf1b"

        // creating a NoteToolbar that will
        // be anchored to its parent on the top, left and right
        NoteToolbar {
            id: toolbar
            // height is required to be specified
            // since there is no bottom anchoring.
            height: 40

            // anchoring it to the parent
            // using just three anchors
            anchors {
                top: root.top
                left: root.left
                right: root.right
            }
        }

        // creating a TextEdit used for the text input from user.
        TextEdit {
            anchors {
                top: toolbar.bottom
                bottom: root.bottom
                right: root.right
                left: root.left
            }
            wrapMode: TextEdit.WrapAnywhere
        }
    }

.. warning::

    For performance reasons, you should only anchor a component to its siblings and direct parent.


Page
----

Once we have the `Note` component ready, let's work on getting the `Page` component with a couple of note items inside.

.. literalinclude:: src/notezapp/Page.qml
    :language: js
    :lines: 35-


In Qt Creator, you can simply run the file above, which in fact will simply use *qmlscene** to load the `Page.qml`. The output result should look like this:

.. image:: img/pagesnapshot.png
   :scale: 50%
   :align: center


Marker
------

Same as with the rest of the components, the `Marker` component will also use a Rectangle type with predefined geometries. Later on, as described in the next chapter, we will
show how the `Marker` component is used.

.. literalinclude:: src/notezapp/Marker.qml
    :language: js
    :lines: 35-

.. rubric:: What's Next?

In the next chapter, we will see how to use a Repeater QML type and a Column to manage a static list of markers.
