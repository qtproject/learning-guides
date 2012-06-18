..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------


Our Customized Sphinx Environment
=================================

Sphinx out of the box is already very usable. For our advanced and multi-project setup we extended sphinx in several ways. We have not customized sphinx itself so the installation is a plain sphinx download. Sphinx as a tool is very flexible and which can be extended at several points.

Here we offer a short description how we customized our sphinx setup.

Multi Project Setup
-------------------

The current guides are combined in a multi project setup. Each guide has it's own folder structure.

     Desktop Guide resides in ``$PROJECTROOT/desktop_devguide``
     Symbian Guide resides in ``$PROJECTROOT/symbian_dev_guide``
     This Handbook resides in ``$PROJECTROOT/handbook``
     ...

Each project can be build individually by navigating into the folder and calling ``make html``. What happens is that the ``sphinx-builder`` is called using the local ``conf.py`` configuration file.

A top-level project on ``$PROJECTROOT/`` allows us to build all guides with additional documentation in one piece. This is driven by the ``$PROJECTROOT/conf.py`` and ``$PROJECTROOT/index.rst`` file. Later one, includes just all sub-project ``index.rst`` files.

The structure applies to all output variations (e.g. html, latexpdf, singlehtml, ...)

Shared Configuration
--------------------

Sphinx output is heavily influenced by a configuration file called ``conf.py``. It contains all configuration needed to customize Sphinx input and output behavior. To avoid updating each ``conf.py`` for each project, we use a shared `conf.py`` file, residing in ``$PROJECTROOT/scripts/qtextensions/shared/conf.py``. This shared configuration file defines all default settings for our projects. Each project includes these shared settings and can override particular settings.

The sharing is achieved through::

    # register path to our extensions relative to this file
    sys.path.insert(0, os.path.abspath('../scripts'))

    # install the shared default configuration
    from qtextensions.shared.conf import *

This is prepended to each local configuration file. The configuration file is just a python module and all python commands and libraries can be used here. This allows very flexible setups.

.. SeeAlso::

    * http://sphinx.pocoo.org/tutorial.html
    * http://sphinx.pocoo.org/config.html#build-config


Themes
------

We have added 2 themes to our project to mimic the ``qdoc3`` html output. Both themes are located in $PROJECTROOT/themes.

The ``qtweb`` theme is designed after the ``qdoc3`` output for ``Qt 4.7.x``. The ``qtcreator`` theme is a more compact version of the web theme, suitable for QtCreator distribution.

To be able that we ca use the themes, we added an additional theme path to our shared configuration::

    # Add any paths that contain custom themes here, relative to this directory.
    html_theme_path = ['../themes/']

As the location is relative to the location of the local ``conf.py`` and not to the shared ``conf.py`` it was necessary to override this setting for the top-level project::

    html_theme_path = ['themes/']

The template engine used in sphinx is called ``Jinja2`` and is a very flexible engine. The main concepts are template inheritance and blocks which you can ovverride. Sphinx additional allows to configure a theme in a ``theme.conf`` file.

For our purpose it was mostly enough to extend the default layout and provide our own css file.

.. topic:: Qt Help Theme

    For the qthelp output we needed to modify the `Makefile` to override the theme to be used, otherwise our standard `qtweb` theme would be used. It would also be possible to use different configuration files.

.. SeeAlso::

     * http://sphinx.pocoo.org/theming.html
     * http://sphinx.pocoo.org/templating.html

Short Links
-----------

It is required in documentation to link often outside the current document. Besides various ways sphinx provides for linking internally or between several sphinx instances it provides an extension for link aliases.

Instead of writing::

    `Qml Column Element <http://doc.qt.nokia.com/latest/qml-column.html>`_

you can write::

    :qt:`Qml Column Element <qml-column.html>`

The extension is enabled in our shared `conf.py` file and also the aliases are configured there (see ``extlinks``). This allows us to change the links based on a configuration. This will be required for example for the qthelp output.

.. SeeAlso::

    * http://sphinx.pocoo.org/latest/ext/extlinks.html
    * http://sphinx.pocoo.org/config.html#confval-extensions

Document Structure
------------------

We agreed on a simple but very practical folder structure. Each folder needs to have an ``index.rst`` file. Each chapter in a guide is a numbered folder (e.g. ``chapter_00`` for the introduction chapter). Inside each folder are the topics, which are included from the folders ``index.rst`` file.

When sphinx generates documentation, each folder will result in a url part (e.g. file://chapter_01/index.rst => http:://chapter_01/index.html). Using chapter numbers made it easier for us to find the documentation back.

Each ``rst`` file contains one top-level heading (underlining it with ``=``) and can contain 2nd-level headings (underlining it with ``-``) or 3rd level heading (underlining it with ``~``). This is by convention and sphinx just looks in which order these markers come. If you need more than 3 headings you should think about splitting the document into smaller topics.
