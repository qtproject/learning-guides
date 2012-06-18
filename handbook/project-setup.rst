..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------


Project Setup
=============


Setting up Your Editor
----------------------

The length of a line we well as soft and hard spaces play a special role in reST. Due to this it is vital to use a ``monospace`` font in you editor.


The Working Environment
-----------------------

We write the guide in reStructuredText format using the `Sphinx publishing system <http://sphinx.pocoo.org/>`_.

The raw text is hosted on ``https://source.nokia.com`` together with other MXXXXXX sub-projects. Our project is called QmlBook

We will use other parts of the MXXXXXX development infrastructure on later steps. This will include automated builds and package generation.

Setting up Your Environment
---------------------------

You can login into the project hosted on ``https://source.nokia.com`` with your NOE account. You will get an invitation email to join the project. After this, the project will be listed on your Dashboard and on the "My Projects" list.

You need to install a few addtional package on your Linux to contribute and build the guide. Do the following on your console::

    sudo apt-get install python-sphinx
    sudo apt-get install texlive

Make an initial clone for the project baseline::

    git clone <URL>
    # enter your <YOUR_NOE_PASSWORD>

Test that you can build successfully::

    make html

Open the ``index.html`` page in ``_build/html`` and make sure it looks correct.


References
----------

A list of links to other relevant known documents:

     Qt Documentation Style Guidelines:
    http://developer.qt.nokia.com/wiki/WritingQtDocumentation
