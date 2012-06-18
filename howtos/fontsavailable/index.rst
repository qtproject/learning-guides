..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------


How to find available fonts in your system
==========================================

The :qt:`QFontDatabase<`qfontdatabase.html> class has a :qt:`QStringList QFontDatabase::families ( WritingSystem writingSystem = Any ) const<qfontdatabase.html#families>` method that returns a sorted list of the available font families which support the writing system.

.. code-block:: cpp

    //main.cpp

    #include <QtGui>
    #include <QFontDatabase>
    #include <QDebug>

    int main(int argc, char **argv)
    {
       QApplication app(argc, argv);
       QFontDatabase fontdatabase;

       qDebug()<<fontdatabase.families();

       return app.exec();
    }
