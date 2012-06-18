..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------

Referencing Code
================

This page provides instructions and guidelines for the different options we have for referencing code.


Code Blocks
-----------

Code blocks used for portions of code are pre-formatted and include syntax highlighting. By default, the syntax of the language is Python, but you can specify the language using the     *code-block** directive. We do not yet have syntax highlighting for QML so we use JavaScript highlighting by specifying ``.. code-block:: js`` to introduce code blocks with QML code as follows::

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




In the following example, there is a space between the 2 slashes and filename and an extra breakline under the filename:

.. code-block:: js

  // main.qml    
    
  StatusBar {
    id: statusBar
    anchors.top: window.top
  }



Including an Entire Source Code File
------------------------------------

It is also possible to include the contents of a file::

  .. literalinclude:: hello.qml
    :language: js

The text below is produced by the directive above:

.. literalinclude:: hello.qml
  :language: js

If the file you like to include contains a copyright notice in the beginning, it make no sense to display it in the text. You can hide it by specifying the string from which the literal include should start::

  .. literalinclude:: hello.qml
    :language: js
    ::start-after:      ***/

This will display the content of ``hello.qml`` after the string ``    ***/``


.. Note:: The path to the file is relative to the path of the document and has to be specified accordingly



Providing Multiple Versions of One Specific Project in Zip Files
----------------------------------------------------------------

A tutorial provides several zip files, each of which implementing a version of the application, but if all of the versions have the same name, the user won't be able to open them all at once and compare them. So instead of having multiple versions with the same name, make sure to end the name with "version1", "version2", "version3" etc. Say, for example, you have a project called "Project" for which there are 3 versions. These zip files should be called "Projectversion1", "Projectversion2" and "Projectversion3"

Literal Blocks
--------------

.. Note:: Literal blocks should only be used when we need to use unformated text. Avoid using Literal blocks for posting code. Code blocks should be used for this instead

Content from literal blocks is copied to the output "as is" in a monospace font. Literal blocks are introduced by ending a paragraph with the double column `::`. The literal block must be indented and, like all paragraphs, separated from the surrounding ones by blank lines. For example::

  I don't think we use literal blocks for anything yet::

  BUT...

    if...                     you...
      for...    some reason decide...
    to use...
                     literal blocks...
    this...
            is...            what...           it could...
    look...
     like!


which results in:

  I don't think we use literal blocks for anything yet:


  BUT...

    if...                     you...
      for...    some reason decide...
    to use...
                     literal blocks...
    this...
            is...            what...           it could...
    look...
     like!




.. Note:: Literal blocks do not have any syntax highlighting. It is just a verbatim text!

