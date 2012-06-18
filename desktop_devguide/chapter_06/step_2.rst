..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------

Ordering Notes Upon User Interaction
====================================

Notes within a `Page` are not aware which note the user is currently working on. By default, all `Note` items created have the same default value for the :qt:`z <qml-item.html#z-prop>` property and in this case QML creates a default ordering stack of items based on which item was created first.

The desired behavior would be to change the order of the notes upon a user's interaction.
When the user clicks on the note toolbar or starts editing the note, then this note should come up and not be under other notes, hence the `z` value should be higher than the rest of the notes.

.. code-block:: js

    // Note.qml
    Item {
        id: root
        ...
        // setting the z order to 1 if the text area has the focus
        z: editArea.activeFocus ? 1:0
        ...
    }

The :qt:`activeFocus <qml-item.html#activeFocus-prop>` property becomes true when the `editArea` element has input focus. So, it would be safe to make the `z` property of the `root` element dependent on the `activeFocus` of the `editArea`. However, we need to make sure that the `editArea` element has input focus even when the toolbar is clicked by the user. Let's define a `pressed()` signal in the `NoteToolbar` component that is emitted upon a mouse press.

.. code-block:: js

    // NoteToolbar.qml

    ...
    // this signal is emitted when the toolbar is pressed by the user
    signal pressed()
    ...

    MouseArea {
        id: mousearea
        ...
        // emitting the pressed() signal on a mouse press event
        onPressed: root.pressed()
    }
    ...

Hence, on the :qt:`onPressed <qml-mousearea.html#onPressed-signal>` signal handler in the `mousearea` element, we emit the `pressed()` signal of the `root` element of `NoteToolbar`.

The `pressed()` signal of the `NoteToolbar` component is handled in the `Note` component.

.. code-block:: js

    // Note.qml

    ...
    // creating a NoteToolbar item that will be anchored to its parent
    NoteToolbar {
        id: toolbar
        ...
        // setting the focus on the text area when the toolbar is pressed
        onPressed: editArea.focus = true
        ...
    }

In the code above, we set the :qt:`focus <qml-item.html#focus-prop>` property of the `editArea` element to `true` so that the `editArea` will receive the input focus, meaning that the `activeFocus` property becomes true, therefore the note item will update its `z` value.


.. rubric:: What's Next?

The next step will show how to load and use a custom local font file for `NoteApp`.
