..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------

How to load a font
==================

You load and use a new font by:

.. code-block:: js

    FontLoader {
        id: newFont
        source: "./my_fonts/cool_font.ttf"
    }

    ...
    Text {
        id: myTextWithNewFont
        text: "Cool text painted with the Cool Font"
        font.family: newFont.name

    }

Our new font ``cool_font.ttf`` is stored in the folder ``./my_fonts/`` which is located in the same folder as the QML files of our application.

Loading external content can always end up with problems, e.g. files are misplaced or the network connection is too slow. :qt:`Image<qml-image.html>` and :qt:`FontLoader<qml-fontloader.html>` provide ``status`` and ``progress`` properties to handle such situations. ``progress`` changes its value from ``0.0`` to ``1.0`` in accordance to the actual loading progress. If content is loaded from the file system, ``progress`` becomes ``1.0`` almost instantly. It does not make much sense to use it in our application. So we are going to only use the ``status`` property. We can use the "on-Changed" handler for this:

.. code-block:: js

    FontLoader {
        id: newFont
        source: "./my_fonts/cool_font.ttf"
        onStatusChanged: if (ledFont.status == FontLoader.Error)
                            console.log ("Font \"" +
                                        source +
                                        "\" cannot be loaded")
    }

If it will not load for some reason, an error message will be posted on the console and the application will continue using a default font.

You might be interested finding out which fonts are pre-installed. The Qt example ``declarative/text/fonts/availableFonts.qml`` does this for you:

.. code-block:: js

    import QtQuick 1.1

    Rectangle {
        width: 480; height: 640; color: "steelblue"

        ListView {
            anchors.fill: parent; model: Qt.fontFamilies()

            delegate: Item {
                height: 40; width: ListView.view.width
                Text {
                     anchors.centerIn: parent
                     text: modelData; font.family: modelData;
                     font.pixelSize: 24; color: "white"
                }
            }
        }
    }
