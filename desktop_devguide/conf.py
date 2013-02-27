
import sys, os

# register path to our extensions relative to this file
sys.path.insert(0, os.path.abspath('../scripts'))

# install the shared default configuration
from qtextensions.shared.conf import *

# -- General configuration -----------------------------------------------------

# General information about the project.
project = u'Qt Quick Application Developer Guide for Desktop'

# exclude the _build and research folder
exclude_patterns = ['_build', 'research']

# The version info for the project you're documenting, acts as replacement for
# |version| and |release|, also used in various other places throughout the
# built documents.
#
# The short X.Y version.
version = '1.0'
# The full version, including alpha/beta/rc tags.
release = '1.0'


# -- Options for HTML output ---------------------------------------------------

#html_theme = 'ADCtheme'

# The name for this set of Sphinx documents.  If None, it defaults to
# "<project> v<release> documentation".
html_title = 'Qt Quick Application Developer Guide for Desktop'

# A shorter title for the navigation bar.  Default is the same as html_title.
html_short_title = 'QML Application Guide'

# Output file base name for HTML help builder.
htmlhelp_basename = 'QtQuickApplicationGuide4Desktop'


# -- Options for LaTeX output --------------------------------------------------

# Grouping the document tree into LaTeX files. List of tuples
# (source start file, target name, title, author, documentclass [howto/manual]).
latex_documents = [
  ('index', 'QtQuickApplicationGuide4Desktop.tex', u'Qt Quick Application Developer Guide for Desktop',
   u'Digia, Qt Learning', 'manual'),
]


# -- Options for Epub output ---------------------------------------------------

# The basename for the epub file. It defaults to the project name w/o spaces
epub_basename = 'QtQuickApplicationGuide4Desktop'

# Bibliographic Dublin Core info.
epub_title = u'Qt Quick Application Developer Guide for Desktop'

# -- Options for Qt Help output ---------------------------------------------------
# The basename for the Qt help file. It defaults to the project name w/o spaces
qthelp_basename = 'QtQuickApplicationGuide4Desktop'
