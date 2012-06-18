..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------

How is the visual order of the elements done?
=============================================

The visual order of QML elements is done according to the :qt:`z <qml-item.html#z-prop>` property of the :qt:`Item<qml-item.html>` QML Element.
By default, the value of the :qt:`z <qml-item.html#z-prop>` property is 0 and the visual order is then done based on item creation order.
