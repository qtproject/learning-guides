
# ---------------------------------------------------------------------------
# Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
# All rights reserved.
# This work, unless otherwise expressly stated, is licensed under a
# Creative Commons Attribution-ShareAlike 2.5.
# The full license document is available from
# http://creativecommons.org/licenses/by-sa/2.5/legalcode .
# ---------------------------------------------------------------------------


# -*- coding: utf-8 -*-

import sys, os

# register path to our extensions relative to this file
sys.path.insert(0, os.path.abspath('../scripts'))

# install the shared default configuration
from qtextensions.shared.conf import *

# The version info for the project you're documenting, acts as replacement for
# |version| and |release|, also used in various other places throughout the
# built documents.
#
# The short X.Y version.
# 
# Do not forget to update the version number in the ./src/readme_XYZ.txt to match the version below
version = '1.1'
# The full version, including alpha/beta/rc tags.
release = '1.1'

# -- Options for HTML output --------------------------------------------------

# The name for this set of Sphinx documents.  If None, it defaults to
# "<project> v<release> documentation".
html_title = 'Programming with Qt Quick for Symbian and MeeGo Harmattan Devices'

# A shorter title for the navigation bar.  Default is the same as html_title.
html_short_title = 'Programming with Qt Quick for Symbian and MeeGo Harmattan Devices'

# Output file base name for HTML help builder.
htmlhelp_basename = 'ProgrammingQtQuick4SymbianHarmattanDevices'


# -- Options for LaTeX output --------------------------------------------------

# Grouping the document tree into LaTeX files. List of tuples
# (source start file, target name, title, author, documentclass [howto/manual]).
latex_documents = [
  ('index', 'ProgrammingQtQuick4SymbianHarmattanDevices.tex', u'Programming with Qt Quick for Symbian and MeeGo Harmattan Devices',
   u'Nokia, http://qt.nokia.com/learning', 'manual'),
]
# -- Options for Epub output ---------------------------------------------------

# The basename for the epub file. It defaults to the project name w/o spaces
epub_basename = 'ProgrammingQtQuick4SymbianHarmattanDevices'

# Bibliographic Dublin Core info.
epub_title = u'Programming with Qt Quick for Symbian and Harma Harmattan Devices'

# -- Options for Qt Help output ---------------------------------------------------
# The basename for the Qt help file. It defaults to the project name w/o spaces
qthelp_basename = 'ProgrammingQtQuick4SymbianHarmattanDevices'

