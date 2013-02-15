..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------

Loading a Custom Font
=====================

It is a very common approach in modern applications to use and deploy custom fonts and not depend on the system fonts. For `NoteApp`, we would like to do the same and we will use what QML offers for this.

The :qt5:`FontLoader <qtquick/qml-qtquick2-fontloader.html>` QML type enables you to load fonts by name or URL path. As the loaded font could be widely used in the entire application, we recommend loading the font in the `main.qml` file and use it in the rest of the components.

.. code-block:: js

    // main.qml

    Rectangle {
        // using window as the identifier for this item as
        // it will the only window of the NoteApp
        id: window
        ...
        // creating a webfont property that holds the font
        // loading using FontLoader
        property variant webfont: FontLoader {
            source: "fonts/juleeregular.ttf"
            onStatusChanged: {
                if (webfontloader.status == FontLoader.Ready)
                    console.log('Loaded')
            }
        }
        ...
    }

So we have created a `webfont` property for the `window` item. This property can be safely used in the rest of the components, so let us use it for the `editArea` in the `Note` component.

.. code-block:: js

    // Note.qml

    ...
    // creating a TextEdit item
    TextEdit {
        id: editArea
        font.family: window.webfont.name; font.pointSize: 13
        ...
    }

To set the font for `editArea`, we use the :qt5:`font.family <qtquick/qml-qtquick2-text.html#font.family-prop>` property. From the `window`, we use its `webfont` property to get the font name to be set.

.. rubric:: What's Next?

The next step will take you through the details of making NoteApp* ready for deployment.
