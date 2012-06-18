..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------

Using Javascript to Enhance the Note Item Functionality
=======================================================

A nifty functionality for the `Note` items would be to have the note grow as more text is entered. Let's say for simplicity reasons that the note will grow vertically as more text is entered while it wraps the text to fit the width.

The :qt:`Text <qml-text.html>` element has a :qt:`paintedHeight <qml-text.html#paintedHeight-prop>` property that gives us the actual height of the text painted on the screen. Based on this value, we can increase or decrease the height of the note itself.

First let's define a Javascript helper function that would calculate the proper value for the :qt:`height <qml-item.html#height-prop>` property of the `Item` element as the top-level element for the `Note` component.

.. code-block:: js

    // Note.qml

    ...
    // javascript helper function that calculates the height of
    // the note as more text is entered or removed.
    function updateNoteHeight() {
        // a note should have a minimum height
        var noteMinHeight = 200
        var currentHeight = editArea.paintedHeight + toolbar.height +40
        root.height = noteMinHeight

        if(currentHeight >= noteMinHeight) {
            root.height = currentHeight
        }
    }
    ...

Since the `updateNoteHeight()` function updates the `height` property of the `root` element based on the :qt:`paintedHeight <qml-text.html#paintedHeight-prop>` property of `editArea`, we need to call this function upon a change on `paintedHeight`.

.. code-block:: js

    // Note.qml
    ...
    // creating a TextEdit item
    TextEdit {
        id: editArea
         ...
        // called when the painterHeight property changes
        // then the note height has to be updated based
        // on the text input
        onPaintedHeightChanged: updateNoteHeight()
        ...
    }

.. note:: Every property has a notifier signal that is emitted each time the property changes


The `updateNoteHeight()` Javascript function changes the `height` property so we can define a behavior for this using the :qt:`Behavior <qml-behavior.html>` element.

.. code-block:: js

    // Note.qml

    ...
    // defining a behavior when the height property changes
    // for the root element
    Behavior on height { NumberAnimation {} }
    ...


.. rubric:: What's Next?

The next step will show how to use the `z` property of the `Item` element to properly order the notes.
