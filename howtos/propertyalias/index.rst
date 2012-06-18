..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------

What is a property alias?
=========================

.. code-block:: js

    import QtQuick 1.1

    Rectangle {

     property alias buttonLabel: label.text

     Text {
         id: label
         text: "empty label"
         anchors.fill: parent
     }

Unlike a property definition, which allocates a new, unique storage space for the property, a property alias connects the newly declared property, called the aliasing property as a direct reference to an existing property, the aliased property. Read or write operations on the aliasing property results in a read or write operations on the aliased property, respectively.

Further reading can be found in the :qt:`Property Binding<propertybinding.html#property-aliases>` documentation.
