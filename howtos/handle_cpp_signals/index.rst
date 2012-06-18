..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------

How to hadle signals from a C++ Object
======================================

To Handle signals from a C++ objects in your QML code, you need to add a signal handler within the object in the QML side that refers to the signal defined in the C++ code as follows:

.. code-block:: cpp

    // file.cpp

    class MyCppObject: public QObject
    {
        ...
        signals:
        void objectSelected(const QString& message);

    }

And here how to handle the signal above in QML:

.. code-block:: js

    // file.qml

    MyObject {
        ...
        onObjectSelected :
        console.log(message)
    }
