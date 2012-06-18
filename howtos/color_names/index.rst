..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------


How to find a list of available color names
===========================================

Qt Quick uses the Qt's set of color names available in::

    QStringList QColor::colorNames ()

You can use the following small Qt application to get a full list:

.. code-block:: cpp

    #include <QtCore/QCoreApplication>
    #include <QStringList>
    #include <QColor>
    #include <QTextStream>
    #include <iostream>

    int main(int argc, char     argv[])
    {
        QCoreApplication a(argc, argv);
        QTextStream output(stdout);
        QStringList colorNames = QColor::colorNames();

        output << "Qt version \""
               << QT_VERSION_STR
               << "\" knows following colors:"
               << endl;

        for (int i = 0; i < colorNames.size(); ++i) {
            output << colorNames[i] << endl;
        }

        output.flush();

        return a.exec();
    }

This produces the following output on the console::

    Qt version "4.8.0" knows following colors:
    aliceblue
    antiquewhite
    aqua
    aquamarine
    azure
    beige
    bisque
    black
    blanchedalmond
    blue
    blueviolet
    brown
    burlywood
    cadetblue
    chartreuse
    chocolate
    coral
    cornflowerblue
    cornsilk
    crimson
    cyan
    darkblue
    darkcyan
    darkgoldenrod
    darkgray
    darkgreen
    darkgrey
    darkkhaki
    darkmagenta
    darkolivegreen
    darkorange
    darkorchid
    darkred
    darksalmon
    darkseagreen
    darkslateblue
    darkslategray
    darkslategrey
    darkturquoise
    darkviolet
    deeppink
    deepskyblue
    dimgray
    dimgrey
    dodgerblue
    firebrick
    floralwhite
    forestgreen
    fuchsia
    gainsboro
    ghostwhite
    gold
    goldenrod
    gray
    green
    greenyellow
    grey
    honeydew
    hotpink
    indianred
    indigo
    ivory
    khaki
    lavender
    lavenderblush
    lawngreen
    lemonchiffon
    lightblue
    lightcoral
    lightcyan
    lightgoldenrodyellow
    lightgray
    lightgreen
    lightgrey
    lightpink
    lightsalmon
    lightseagreen
    lightskyblue
    lightslategray
    lightslategrey
    lightsteelblue
    lightyellow
    lime
    limegreen
    linen
    magenta
    maroon
    mediumaquamarine
    mediumblue
    mediumorchid
    mediumpurple
    mediumseagreen
    mediumslateblue
    mediumspringgreen
    mediumturquoise
    mediumvioletred
    midnightblue
    mintcream
    mistyrose
    moccasin
    navajowhite
    navy
    oldlace
    olive
    olivedrab
    orange
    orangered
    orchid
    palegoldenrod
    palegreen
    paleturquoise
    palevioletred
    papayawhip
    peachpuff
    peru
    pink
    plum
    powderblue
    purple
    red
    rosybrown
    royalblue
    saddlebrown
    salmon
    sandybrown
    seagreen
    seashell
    sienna
    silver
    skyblue
    slateblue
    slategray
    slategrey
    snow
    springgreen
    steelblue
    tan
    teal
    thistle
    tomato
    transparent
    turquoise
    violet
    wheat
    white
    whitesmoke
    yellow
    yellowgreen


Another way to find what they are is to check `Recognized color keyword names <http://www.w3.org/TR/SVG/types.html#ColorKeywords>`_ in the SVG specification.

