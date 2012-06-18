..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------


Getting to know the markup language
===================================

This page is and introduction to reStructuredText (reST), the markup language used when writing these guides.


About reStructuredText (reST)
-----------------------------

Once you have a working environment, it is time to take learn basics of reStructuredText.

reStructuredText (reST) is an easy-to-read, what-you-see-is-what-you-get plain text markup syntax and parser system. It is useful for inline program documentation
(such as Python docstrings), for quickly creating simple web pages and for standalone documents. Sphinx code is written in reST. Sphinx adds many additional directives on top of the reST syntax. Therefore sphinx code may not be fully compatible with reST.

There is a wide variety of elements in reStructuredText which can be used to write and structure content (e.g. bullet symbols and directives, such as "note", "hint", etc, are used). Such a style guide has now become a part of the Author's Handbook located under "additions" in the Git repo of this project.

Though reST and Sphinx provide a range of formatting commands, we have to define a project specific subset of the standard formatting along with additional rules all authors have to follow.

Most of the formatting is done with so-called "directives" and "roles". These is text surrounded by spaces and ``..``. Make sure to not miss those characters.

.. note:: If you are new to reStructuredText, it might make sense to have a playground project to try it out. Just create a new folder in your work area and call it "sphinx-quickstart" for example. Use default answers for a quick setup.


reStructuredText References
---------------------------

     A sample doc project explained: `http://matplotlib.sourceforge.net/sampledoc/ <http://matplotlib.sourceforge.net/sampledoc/>`_

     An overview of the reStructuredText tools on Stackoverflow: `http://stackoverflow.com/questions/2746692/restructuredtext-tool-support <http://stackoverflow.com/questions/2746692/restructuredtext-tool-support>`_

     We might need to write some extensions to get the content tightly integrated in Qt docs or in QtCreator. This is a good place to start researching the development of such features: `http://sphinx.pocoo.org/ext/tutorial.html <http://sphinx.pocoo.org/ext/tutorial.html>`_
