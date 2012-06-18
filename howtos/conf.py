# -*- coding: utf-8 -*-
#

import sys, os

# register path to our extensions relative to this file
sys.path.insert(0, os.path.abspath('../scripts'))

# install the shared default configuration
from qtextensions.shared.conf import *

# General information about the project.
project = u'Qml Howto\'s'

# -- Options for HTML output ---------------------------------------------------

# The name for this set of Sphinx documents.  If None, it defaults to
# "<project> v<release> documentation".
html_title = u'Qml How To\'s'

# A shorter title for the navigation bar.  Default is the same as html_title.
html_short_title = 'How To'

# Output file base name for HTML help builder.
htmlhelp_basename = 'QmlHowTos'

# -- Options for LaTeX output --------------------------------------------------

# Grouping the document tree into LaTeX files. List of tuples
# (source start file, target name, title, author, documentclass [howto/manual]).
latex_documents = [
  ('index', 'QmlHowTos.tex', u'Qml Howto\'s',
   u'QtLearning', 'manual'),
]


# -- Options for Epub output ---------------------------------------------------

# The basename for the epub file. It defaults to the project name w/o spaces
epub_basename = 'QmlHowTos'

# Bibliographic Dublin Core info.
epub_title = u'Qml Howto\'s'

# -- Options for Qt Help output ---------------------------------------------------
# The basename for the Qt help file. It defaults to the project name w/o spaces
qthelp_basename = 'QmlHowTos'

version = '1.0'
release = '1.0'
