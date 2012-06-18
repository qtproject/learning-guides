..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------

Installing Sphinx
=================

Sphinx is a documentation tool written in Python. It is available for Windows, Mac and Linux. It's easiest maintained by the new PIP (python installer) tool.

     To install python packages we use the pip tool
     For image scaling in documents you need the python image library (PIL)
     For Latex/PDF you neeed a latex distribution be installed

.. note:: To install pip it's sometimes necessary to install the python setup tool (``easy_install.py``) first, this is a little bit annoying.

Linux (xbuntu)
--------------

First you need to install python and pip (python package manager) and sphinx::

    $ sudo apt-get install python pip python-sphinx python-imaging

for latex (large)::

    $ sudo apt-get install texlive

Windows
-------

First you need to install python and the pip installer manager

     Install Python http://python.org/download/ (e.g. Python 2.7)
     Setup a Path to your interpreter e.g. ``C:\python27``
     Install the setup tools http://pypi.python.org/pypi/setuptools
     Installl PIP from prompt ``$ easy_install.py pip``

Now you are able to install other python packages more easily::

    $ pip install sphinx
    $ pip install pil

To upgrade use::

    $ pip install sphinx --upgrade

For Latex/PDF build you need to install the Latex packages::

    http://miktex.org/2.9/setup (large)

Mac
---

Python and easy_install is pre-installed on mac.

So you need to install pip only::

    $ sudo easy_install.py pip

Now you can use pip to install other packages::

    $ sudo pip install sphinx
    $ sudo pip install pil

For latex, you can use: http://www.tug.org/mactex/2011/ (large)

Upgrades with PIP
-----------------

After installation you can upgrade the python packages with::

    $ pip install sphinx --upgrade

It will upgrade also all depending packages

Finally
-------

You can check if sphinx works by following this guide: http://sphinx.pocoo.org/tutorial.html

Enjoy!!


