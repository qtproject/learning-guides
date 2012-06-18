..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------


Admonitions & Other Blocks
==========================

Notes
-----

You write a note to attract user's special attention.

In oder to create a note you write::

  .. Note:: This is a `note` box

This results in:

.. Note:: This is a `note` box


SeeAlso Admonitions
-------------------

Although you can use cross references, sometimes you would like to refer to a special place in the documentation with a high importance to the user. This is what the `SeeAlso` directive is for. You write::

  .. SeeAlso:: This is a simple `SeeAlso` note. This is a normal text where you can use any other formatting. Other inline directive may be included (e.g., math :math:`\alpha`), but not all of them

This results in:

.. SeeAlso:: This is a simple `SeeAlso` note. This is a normal text where you can use any other formatting. Other inline directive may be included (e.g., math :math:`\alpha`), but not all of them


Warning Admonitions
-------------------

`Warnings` are comparable to `Notes`, but tell people what they should not do. You write them as following::

  .. Warning:: If you miss and underscore behind a link, the link will not appear

This results in:

.. Warning:: If you miss and underscore behind a link, the link will not appear


ToDo Admonitions
----------------

`ToDos` are used as internal notes for the project. The final version of the document may not have any notes. You write a `ToDo` entry like this::

  .. ToDo:: A `ToDo` box where you have to put only one item. Use multiple boxes for more items

This results in:

.. ToDo:: A `ToDo` box where you have to put only one item. Use multiple boxes for more items



Topic Directive
---------------

Sometimes you like to write a note, but have a special title for this. This when you use `topic` directive instead of `note`.::

    .. Topic:: Topic title

        Subsequent indented lines comprise
        the body of the `Topic`, and are
        interpreted as body elements

This results in:

.. Topic:: Topic title

    Subsequent indented lines comprise
    the body of the `Topic`, and are
    interpreted as body elements


Comments and Aliases
--------------------

Like in the software source code, you often need to write comments. Comments can be made by adding two dots at the beginning of a line as follows::

    .. This text is a comment and will not be included in the actual output

This results in:

.. This text will not be included in the actual output

(You should see no text between this one and the phrase "This results in:"




Literal blocks
==============

Content from literal blocks is copied to the output "as is" in a monospace font. Literal blocks are introduced by ending a paragraph with the double column `::`. The literal block must be indented and, like all paragraphs, separated from the surrounding ones by blank lines. For example::

  This is a simple QML example::

  import QtQuick 1.0

    Rectangle {
      Text { text: "Hello World" }
    }


which results in:

This is a simple QML example::

  import QtQuick 1.0

    Rectangle {
      Text { text: "Hello World" }
    }


.. note:: Literal blocks do not have any syntax highlighting. It is just a verbatim text!


Code blocks
===========

Code blocks used to portions of code in are pre-formated and include syntax highlighting. We do not have the latter for QML yet so we use JavaScript highlighting.

By default the syntax of the language is Python, but you can specify the language using the     *code-block** directive as follows::

  .. code-block:: js

  import QtQuick 1.0

  Rectangle {
    width: 360
    height: 360
    Text {
        anchors.centerIn: parent
        text: "Hello World"
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            Qt.quit();
        }
    }
  }

which results in:

.. code-block:: js

  import QtQuick 1.0

  Rectangle {
    width: 360
    height: 360
    Text {
        anchors.centerIn: parent
        text: "Hello World"
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            Qt.quit();
        }
    }
  }
