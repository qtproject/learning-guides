..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------

Using Repeater and Delegate to Create List of Markers
=====================================================

Previously, we saw how to create QML components such as `Note`, `NoteToolbar`, `Page` and `Marker`, and how to place these QML components using anchors*.

Looking back at the previous chapters on design concepts, one thing we noticed is that there are three `Marker` elements laid out vertically. Using anchors* could also work as we can anchor UI elements with each other, but nevertheless it will increase the complexity of the code. QML has other convenient approaches such as the layout and positioning types. The :qt5:`Column type <qtquick/qml-qtquick2-column.html>` is one such type, enables arranging the UI elements one below the other in a column.

As we want to place the three `Marker` components within a :qt5:`Column type <qtquick/qml-qtquick2-column.html>`, let's use a nifty QML type called :qt5:`Repeater <qtquick/qml-qtquick2-repeater.html>`.

Now let's have a look at the code described above:

.. code-block:: js

    Column {
        id: layout
        // spacing property can set to let the item have space between them
        spacing: 10

        // a Repeater item that uses a simple model with 3 items
        Repeater {
            model: 3
            delegate:
                // using the Marker component as our delegate
                Marker { id: marker }
        }
    }


In the code shown above, `Repeater` generates three QML components based on the model and will use a *delegate** to display them. As we want to have three `Marker` items, we simply use the `Marker` component as the delegate.

For more information about positioning, refer to :qt5:`Important Concepts In Qt Quick - Positioning <qtquick/qtquick-positioning-topic.html>` documentation.

Naturally the question "where in my qml files should I place the code shown above and how should I use it?" arises. Well, we need a separate QML Component for that which we'll call `MarkerPanel`. In short, `MarkerPanel` is simply a list of three `Marker` items that can easily be used as a UI element. We will know later on how.

Here is how the `MarkerPanel` component would look:

.. literalinclude:: src/notezapp/MarkerPanel.qml
   :language: js
   :lines: 35-

.. note:: It is always recommended to run and test components individually in the prototype phase because you can spot the problems right away.

If we run the `MarkerPanel` component using Qt Creator or load it with *qmlscene** then it should look like this:

.. image:: img/markerpanel.png
   :scale: 65%
   :align: center

.. rubric:: What's Next?

In the next chapter, we will see how to use the components we've implemented so far to finalize our prototype.

