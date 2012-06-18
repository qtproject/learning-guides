..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------


.. _formatting_guide_beginning_anchor:
.. _hyperlinking_and_citations:

Hyperlinking & Citations
========================


External Weblinks
-----------------

     External links refer to pages located on the Internet. In order to link to external links simply use::

        `Qt Homepage (http://qt.nokia.com) <http://qt.nokia.com/>`_

      This is rendered as a normal hyperlink: `Qt Homepage (http://qt.nokia.com) <http://qt.nokia.com/>`_

.. Note:: If you have an underscore within the label/name, escape it with a '\\' character

.. Note:: Remember to put the URL in parentheses next to the name for those who will prefer to read a printed version of documentation


Internal Cross-references
-------------------------

Internal references are those which refer to a certain places in the same or other documents in a project. These "places" are marked with labels. After calling ``make`` , internal references become hyperlinks which jump to the place they refer to. Generally, internal links are trickier to handle since the addressing of their targets is not well unified.

Standard reST uses notation similar to external links. Sphinx extends this to allow referencing across files even if the content under an anchor has been changed. See `http://sphinx.pocoo.org/markup/inline.html#ref-role <http://sphinx.pocoo.org/markup/inline.html#ref-role>`_ for more details).

In order to refer to a place in the text in any document of the project, place a label directly before a section or figure title. You can reference to it with ``:ref:`label-name``.


How to Make Anchors
-------------------

     For example, there is an anchor at the top of the page which looks like:

    ``.. _formatting_guide_beginning_anchor:``

     In order to add a link to the beginning of this page, we write:

    ``see :ref:`formatting_guide_beginning_anchor```.

     The link will look like this because the anchor is just above the "Hyperlinking & Citations" title at the beginning of this page:

    see :ref:`formatting_guide_beginning_anchor`


.. note:: The hyperlinked text will automatically take the name of the title that follows the anchor


     Sometimes we will need to use another text that differs from the one in the anchor label. In this case you write:

    ``It refers to the section itself, see :ref:`this <formatting_guide_beginning_anchor>`.``

     This link will look like this:

    It refers to the section itself, see :ref:`this <formatting_guide_beginning_anchor>`.


Downloads
---------

Sometimes you want to link to files within your source tree which are not documents that can be viewed, but files that can be downloaded.

We use the ``:Download:`` role for this.

When when it is used, the referenced file is automatically marked for inclusion in the output when building (obviously, for HTML output only). All downloadable files are put into the _downloads subdirectory of the output directory; duplicate filenames are handled::

        :download:`download hello.qml <hello.qml>`

generates :download:`download hello.qml <hello.qml>`


References to Qt, C++, QML, and Qt Creator Documentation
--------------------------------------------------------

Each time you use an new keyword in Qt or Qt Quick or any other important docs in Qt doc, add a link to Qt documentation. This is how to do so:


this::

#. :qt:`QPushButton <qpushbutton.html>`
#. :creator:`Qt Creator User Interface <creator-quick-tour.html>`
#. :mobility:`Connectivity <connectivity-api.html>`
#. :component:`ApplicationWindow <qml-applicationwindow.html>`
#. :sdk:`SDK Overview <sdk-overview.html>`
#. :simulator:`Qt Simulator Manual <simulator-description.html>`
#. :qtquick-repo:`Introduction to the QML Language <qdeclarativeintroduction.html>`
#. :mobility:`Location API <location-overview.html>`
#. :component:`Introduction to the Qt Quick Components <qt-components-introduction.html>`
#. :publish:`How to correctly format headings </handbook/page-setup-and-formatting.html#headings>`
#. :installer:`Devices Supported by Nokia Smart Installer for Symbian <smartinstaller-supported-devices.html>`



will result in:

#. :qt:`QPushButton <qpushbutton.html>`

#. :creator:`Qt Creator User Interface <creator-quick-tour.html>`

#. :mobility:`Connectivity <connectivity-api.html>`

#. :component:`ApplicationWindow <qml-applicationwindow.html>`

#. :sdk:`SDK Overview <sdk-overview.html>`

#. :simulator:`Qt Simulator Manual <simulator-description.html>`

#. :qtquick-repo:`Introduction to the QML Language <qdeclarativeintroduction.html>`

#. :mobility:`Location API <location-overview.html>`

#. :component:`Introduction to the Qt Quick Components <qt-components-introduction.html>`

#. :publish:`How to correctly format headings </handbook/page-setup-and-formatting.html#headings>`

#. :installer:`Devices Supported by Nokia Smart Installer for Symbian <smartinstaller-supported-devices.html>`


Citations
---------

We use citations to quote a text from another sources, e.g. books. Once defined, a citation can be used in all documents::

  "Qt is used in coffee makers" [Ref]_ and other embedded devices.

  .. [Ref] "Using Qt to make coffee" by John Doe, Coffee Publishing Inc, 2042, ISBN 234245345345.

which results in:

"Qt is used in coffee makers" [Ref]_ and other embedded devices.

.. [Ref] "Using Qt to make coffee" by John Doe, Coffee Publishing Inc, 2042, ISBN 234245345345.
