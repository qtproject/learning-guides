..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------

Finalize the Prototype
======================

We now have our QML components in place and they're ready to be used to build our prototype. Here is a list of the implemented components:

    * `Note`
    * `NoteToolbar`
    * `Marker`
    * `MarkerPanel`
    * `Page`

It is very likely that more QML components might come up as we go along in later phases.

As previously mentioned, Qt Creator generates a `main.qml` file which is considered the main file to load in order to run NoteApp*. Therefore, we will start laying out our components inside the `main.qml` file to compose the prototype.


Composing the Prototype
-----------------------

Going back to the UI concepts and looking at the design provided, we start laying out the QML components. We have the panel of `Maker`, that is the `MarkerPanel` component placed on the right, and the `Page` component in the center. We haven't yet covered the toolbar so let's do that now.

The toolbar contains two tools: one for creating new note and one for clearing the page. For simplicity, we will not create a component for this, but rather define it inside the `main.qml` file.

The code could look something like this:

.. code-block:: js

    // using a Rectangle element to represent our toolbar
    // it helps to align the column better with the rest of the components
    Rectangle {
        id: toolbar

        // setting a width because there is no right anchoring
        width: 50

        color: "#444a4b"
        anchors {
            left: window.left
            top: window.top; bottom: window.bottom
            topMargin: 100; bottomMargin: 100
        }

        // using a Column type to place the tools
        Column {
            anchors { anchors.fill: parent; topMargin: 30  }
            spacing: 20

            // For the purpose of this prototype we simply use
            //a Repeater to generate two Rectangle items.
            Repeater {
                model: 2
                // using a Rectangle item to represent
                // our tools, just for prototype only.
                Rectangle { width: 50; height: 50;  color: "red" }
            }
        }
    }

Now, we are ready to actually finalize our prototype. Here is how the `main.qml` file would look:

.. literalinclude:: src/notezapp/main.qml
   :language: js
   :lines: 35-


The following screen shows how the prototype looks when either running it using Qt Creator or *qmlscene**:

.. image:: img/prototype.png
   :scale: 65%
   :align: center


Making Note Components Draggable
--------------------------------

So far we have managed to get a very basic prototype that will be our basis for the NoteApp UI. An interesting UI functionality we can quickly add during the prototype phase is to enable the user to drag note items within the page. To achieve this, the :qt5:`MouseArea QML Type <qtquick/qml-qtquick2-mousearea.html>` has a grouped property called :qt5:`drag <qtquick/qml-qtquick2-mousearea.html#drag.target-prop>`. We will use the *drag.target** property by setting it to the **id** of our note component.

Considering that the user should use the `NoteToolbar` to drag a note, the MouseArea* type should be inside the `NoteToolbar` component. The `NoteToolbar` component handles the dragging operation by the user, so we should set the :qt5:`drag.target <qtquick/qml-qtquick2-mousearea.html#drag.target-prop>` to the `Note` component.

To achieve this, we need to allow `NoteToolbar` used inside the `Note` component to bind the :qt5:`drag.target <qtquick/qml-qtquick2-mousearea.html#drag.target-prop>` property of `MouseArea` with the `Note` component's *id**. QML provides :qt5:`Property Aliases <qtqml/qtqml-syntax-objectattributes.html#property-aliases>` to enable this.

Let's take the `NoteToolbar` component and create a property alias for the *drag** grouped property of `MouseArea`:

.. literalinclude:: src/notezapp/NoteToolbar.qml
   :language: js
   :lines: 35-

In the code shown above, we see the *drag** property alias for `NoteToolbar`, which is bound to the **drag** property of *MouseArea*, and now we will see how to use that in our `Note` component.

.. literalinclude:: src/notezapp/Note.qml
   :language: js
   :lines: 35-

Detailed information on property bindings in QML can be found on the :qt5:`Property Binding <qtqml/qtqml-syntax-propertybinding.html>` documentation page.


.. rubric:: What's Next?

Next, we will start implementing the UI and basic functionality based on the prototype.
