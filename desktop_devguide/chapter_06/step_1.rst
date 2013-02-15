..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------

Enhancing the Note Item Functionality
=====================================

A nifty functionality for the `Note` items would be to have the note grow as more text is entered. Let's say for simplicity reasons that the note will grow vertically as more text is entered while it wraps the text to fit the width.

The :qt5:`Text <qtquick/qml-qtquick2-text.html>` type has a :qt5:`paintedHeight <qtquick/qml-qtquick2-text.html#paintedHeight-prop>` property that gives us the actual height of the text painted on the screen. Based on this value, we can increase or decrease the height of the note itself.

First, let's define a JavaScript helper function that calculates the value for the :qt5:`height <qtquick/qml-qtquick2-item.html#height-prop>` property of the `Item` type, which is the top-level type for the `Note` component.

.. code-block:: js

    // Note.qml

    ...
    // JavaScript helper function that calculates the height of
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

As the `updateNoteHeight()` function updates the `height` property of the `root` based on the :qt5:`paintedHeight <qtquick/qml-qtquick2-text.html#paintedHeight-prop>` property of `editArea`, we need to call this function upon a change on `paintedHeight`.

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


The `updateNoteHeight()` JavaScript function changes the `height` property so we can define a behavior for this using the :qt5:`Behavior <qtquick/qml-qtquick2-behavior.html>` type.

.. code-block:: js

    // Note.qml

    ...
    // defining a behavior when the height property changes
    // for the root element
    Behavior on height { NumberAnimation {} }
    ...


.. rubric:: What's Next?

The next step will show how to use the `z` property of the `Item` type to properly order the notes.
