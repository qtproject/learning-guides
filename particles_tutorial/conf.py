import sys, os

# register path to our extensions relative to this file
sys.path.insert(0, os.path.abspath('../scripts'))


# Do not forget to update the version number in the ./src/readme_XYZ.txt to match the version below


# install the shared default configuration
from qtextensions.shared.conf import *

# -- General configuration -----------------------------------------------------

# General information about the project.
project = u'Particles and Graphics Effects in Qt Quick 2'

# -- Options for HTML output ---------------------------------------------------

# The name for this set of Sphinx documents.  If None, it defaults to
# "<project> v<release> documentation".
html_title = "Particles and Graphics Effects in Qt Quick 2"

# A shorter title for the navigation bar.  Default is the same as html_title.
html_short_title = "Particles and Graphics Effects in Qt Quick 2"

# Output file base name for HTML help builder.
htmlhelp_basename = 'ParticlesTutorial'


# -- Options for LaTeX output --------------------------------------------------

latex_documents = [
  ('index', 'ParticlesTutorial.tex', u'Particles and Graphics Effects in Qt Quick 2',
   u'Nokia, Qt Learning', 'manual'),
]

# -- Options for Epub output ---------------------------------------------------

# The basename for the epub file. It defaults to the project name w/o spaces
epub_basename = 'ParticlesTutorial'

# Bibliographic Dublin Core info.
epub_title = u'Particles and Graphics Effects in Qt Quick 2'

# -- Options for Qt Help output ---------------------------------------------------
# The basename for the Qt help file. It defaults to the project name w/o spaces
qthelp_basename = 'ParticlesTutorial'

show_authors = True

version = '1.0'
release = '1.0'