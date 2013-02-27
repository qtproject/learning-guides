import sys, os

# register path to our extensions relative to this file
sys.path.insert(0, os.path.abspath('../scripts'))

# install the shared default configuration
from qtextensions.shared.conf import *

# -- General configuration -----------------------------------------------------

# General information about the project.
project = u'Developing an arcade game with Qt3D'

# -- Options for HTML output ---------------------------------------------------

# The name for this set of Sphinx documents.  If None, it defaults to
# "<project> v<release> documentation".
html_title = "Developing an arcade game with Qt3D"

# A shorter title for the navigation bar.  Default is the same as html_title.
html_short_title = "Game Development Qt3D"

# Output file base name for HTML help builder.
htmlhelp_basename = 'GameDevelopmentQt3D'


# -- Options for LaTeX output --------------------------------------------------

latex_documents = [
  ('index', 'GameDevelopmentQt3D.tex', u'Developing an arcade game with Qt3D',
   u'DIgia, Qt Learning', 'manual'),
]

# -- Options for Epub output ---------------------------------------------------

# The basename for the epub file. It defaults to the project name w/o spaces
epub_basename = 'GameDevelopmentQt3D'

# Bibliographic Dublin Core info.
epub_title = u'GameDevelopmentQt3D'

# -- Options for Qt Help output ---------------------------------------------------
# The basename for the Qt help file. It defaults to the project name w/o spaces
qthelp_basename = 'GameDevelopmentQt3D'


version = '1.0'

