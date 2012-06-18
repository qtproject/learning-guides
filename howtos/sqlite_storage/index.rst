..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------

Where is the sqlite db file stored?
===================================

You can retrieve the full absolute path where the SQLite db file is stored by using the :qt:`offlineStoragePath() <qdeclarativeengine.html#offlineStoragePath-prop>` method of the :qt:`QDeclarativeEngine <qdeclarativeengine.html#offlineStoragePath-prop>` class.

The default location is QML/OfflineStorage in the platform-standard user application data directory.

.. Note:: The path may not currently exist on the filesystem, so callers wanting to create new files at this location should create it first

Moreover, you can actually set your own preferred location for the SQLite DB file using the :qt:`setOfflineStoragePath() <qdeclarativeengine.html#offlineStoragePath-prop>` method.
