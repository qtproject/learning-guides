# -*- coding: utf-8 -*-
#
import sys, os

# register path to our extensions relative to this file
sys.path.insert(0, os.path.abspath('scripts'))

# install the shared default configuration
from qtextensions.shared.conf import *

# General information about the project.
project = u'Qt Learning Material'

# exclude research folder from build
exclude_patterns.append('research')


# -- Options for HTML output ---------------------------------------------------

# Add any paths that contain custom themes here, relative to this directory.
html_theme_path = ['themes/']

# The name for this set of Sphinx documents.  If None, it defaults to
# "<project> v<release> documentation".
html_title = 'Qt Learning QML Guides'

# A shorter title for the navigation bar.  Default is the same as html_title.
html_short_title = 'QML Guides'

# Output file base name for HTML help builder.
htmlhelp_basename = 'QtLearning'


# -- Options for LaTeX output --------------------------------------------------

# Grouping the document tree into LaTeX files. List of tuples
# (source start file, target name, title, author, documentclass [howto/manual]).
latex_documents = [
  ('index', 'QtLearningQMLGuides.tex', u'Qt Learning QML Guides Material',
   u'(C) 2011 Nokia. http://qt.nokia.com/learning', 'manual'),
]

# -- Options for Epub output ---------------------------------------------------

# The basename for the epub file. It defaults to the project name w/o spaces
epub_basename = 'ProgrammingWithQtQuick'

# Bibliographic Dublin Core info.
epub_title = u'Programming with Qt Quick - Developer Guide'

# -- Options for Qt Help output ---------------------------------------------------
# The basename for the Qt help file. It defaults to the project name w/o spaces
qthelp_basename = 'ProgrammingWithQtQuick'

