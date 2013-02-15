..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------

Adding Graphics
===============

Due to the nature of QML, developers and designers are entitled to work closely throughout the development cycle. Nowadays, using graphics does make a big difference to the user experience and how the application is perceived by users.

QML encourages the use of graphics as much as possible while implementing the UI. The collaboration between the developers with graphic designers is easier and efficient with QML, as designers can test their graphics right away on basic UI elements. This helps designers to understand what a developer requires while developing new components, and also makes the application's UI more appealing and certainly easier to maintain.

Let's start adding graphics to our components.

Setting Background Images to Components
---------------------------------------

The :qt5:`BorderImage <qtquick/qml-qtquick2-borderimage.html>` type is recommended to be used in cases where you would like to have the image scaled, but keep its borders as is. A good use case for this type is background images that has a shadowing effect for your QML item. Your item might scale at some point but you would like to keep corners untouched.

Let's see how to set a `BorderImage` type as a background for our components.

Inside the `PagePanel.qml`, we add the `BorderImage` type:

.. code-block:: js

    // PagePanel.qml

    ...
    BorderImage {
        id: background

        // filling the entire PagePanel
        anchors.fill: parent
        source: "images/page.png"

        // specifying the border margins for each corner,
        // this info should be given by the designer
        border.left: 68; border.top: 69
        border.right: 40; border.bottom: 80
    }
    ...

We do the same for the `Note` component in the `Note.qml` file:

.. code-block:: js

    // Note.qml

    ...
    BorderImage {
        id: noteImage
        anchors { fill: parent}
        source: "images/personal_note.png"
        border.left: 20; border.top: 20
        border.right: 20; border.bottom: 20
    }

    // creating a NoteToolbar item that will be anchored to its parent
    NoteToolbar {
        id: toolbar
    ...

.. warning:: Make sure that the `BorderImage` type is used in the correct order within your component implementation, as the implementation order defines the appearance order. Items with the same `z` value will appear in the order they are declared. Further details regarding the stack ordering of items can be found in :qt5:`z property <qtquick/qml-qtquick2-item.html#z-prop>` documentation.

You may be wondering by now what would be the best approach to set a background for the `Marker` items when these items are created inside the `MarkerPanel` component. The approach is already present in the `MarkerPanel` component.

There is already a `markerData` list that we are using as a model for the `Repeater` to create `Marker` items, and set `markerid` as the `activeMarker` when a marker item is clicked. We can extend the `markerData` to have a url path to an image and use the :qt5:`Image <qtquick/qml-qtquick2-image.html>` type as the top-level type for the `Marker` component.

.. literalinclude:: src/notezapp/Marker.qml
   :language: js
   :lines: 35-

So now let's see how to enhance the `MarkerPanel` component:

.. code-block:: js

     // MarkerPanel.qml

     ...
    // for the markerData, we add the img value pointing to the image url
    property variant markerData: [
        { img: "images/personalmarker.png", markerid: "personal" },
        { img: "images/funmarker.png", markerid: "fun" },
        { img: "images/workmarker.png", markerid: "work" }
    ]

    Column {
        id: layout
        anchors.fill: parent
        spacing: 5

        Repeater {
            // using the defined list as our model
            model: markerData
            delegate:
                Marker {
                id: marker

                // binding the source property of Marker to that
                // of the modelData's img value.
                // note that the Marker is an Image element
                source: modelData.img

                // handling the clicked signal of the Marker item,
                // setting the currentMarker property
                // of MarkerPanel based on the clicked Marker
                onClicked: root.activeMarker = modelData.markerid
            }
        }
    }

In the code shown above, we see how the `Marker` item's `source` property is bound to our `markerData` model's `img` value.

We use the `BorderImage` type to set a background for the `NoteToolbar` component and also for the top-level type in the `main.qml` file.

.. note:: Always consult with the graphics designer regarding an image's border margins and how these images should be anchored and aligned.

By running the `MarkerPanel` component in Qt Creator or by simply loading it using `qmlscene`, you should be able to get the following:

.. image:: img/markerpanel.png
    :scale: 80%
    :align: center

Now let's see how to use graphics to enhance the toolbar as proposed during the prototype phase.


Creating the Tool Component
---------------------------

Taking code re-usability into consideration, defining a new component to be used in the toolbar for the     *New Note* and *Clear All* tools would make sense. This is why we have implemented a `Tool` component that uses an :qt5:`Image type <qtquick/qml-qtquick2-image.html>` as a top-level type and handles the mouse click from the user.

The :qt5:`Image type <qtquick/qml-qtquick2-image.html>` is often used as an UI element on its own, regardless of whether it's a static or animated image. It is laid out in a pixel perfect way and well defined by design requirements.

.. literalinclude:: src/notezapp/Tool.qml
   :language: js
   :lines: 35-

Now that we have the `Tool` component lets use it to create the toolbar. We modify the code from the prototype phase in order to use `tool` items instead of the `Rectangle` element.

.. code-block:: js

    // main.qml

    ...
    // toolbar background
    Rectangle {
        anchors.fill: toolbar
        color: "white"
        opacity: 0.15
        radius: 16
        border { color: "#600"; width: 4 }
    }

    // using a Column element to layout
    // the Tool items vertically
    Column { // sidebar toolbar
        id: toolbar
        spacing: 16
        anchors {
            top: window.top
            left: window.left
            bottom: window.bottom
            topMargin: 50
            bottomMargin: 50
            leftMargin: 8
        }

        // new note tool
        Tool {
            id: newNoteTool
            source: "images/add.png"
        }

        // clear page tool
        Tool {
            id: clearAllTool
            source: "images/clear.png"
        }
    }
    ...

Now that we have all the graphics set for our components, the application should have a more appealing look and a more defined UI.

.. image:: img/noteapp.png
    :scale: 80%
    :align: center

.. rubric:: What's Next?

In the next chapter, there will be a detailed step on how to create and manage `Note` items dynamically and how to store them locally in a database.
