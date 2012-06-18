import sys, os

# register path to our extensions relative to this file
sys.path.insert(0, os.path.abspath('../scripts'))

# install the shared default configuration
from qtextensions.shared.conf import *

# -- General configuration -----------------------------------------------------

# General information about the project.
project = u'Qt OpenGL Tutorial'

# -- Options for HTML output ---------------------------------------------------

# The name for this set of Sphinx documents.  If None, it defaults to
# "<project> v<release> documentation".
html_title = "Qt OpenGL Tutorial"

# A shorter title for the navigation bar.  Default is the same as html_title.
html_short_title = "OpenGL Tutorial"

# Output file base name for HTML help builder.
htmlhelp_basename = 'OpenGLTutorial'


# -- Options for LaTeX output --------------------------------------------------

latex_documents = [
  ('index', 'OpenGLTutorial.tex', u'OpenGL Tutorial',
   u'Nokia, Qt Learning', 'manual'),
]

# -- Options for Epub output ---------------------------------------------------

# The basename for the epub file. It defaults to the project name w/o spaces
epub_basename = 'OpenGLTutorial'

# Bibliographic Dublin Core info.
epub_title = u'OpenGLTutorial'

# -- Options for Qt Help output ---------------------------------------------------
# The basename for the Qt help file. It defaults to the project name w/o spaces
qthelp_basename = 'OpenGLTutorial'

show_authors = True
version = '1.0'
release = '1.0'

