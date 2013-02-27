import sys, os

# register path to our extensions relative to this file
sys.path.insert(0, os.path.abspath('../scripts'))

# install the shared default configuration
from qtextensions.shared.conf import *

# -- General configuration -----------------------------------------------------

# General information about the project.
project = u'Introduction to Application Development with Qt Quick'

# The short X.Y version.
version = '1.0'
# The full version, including alpha/beta/rc tags.
release = '1.0'

# -- Options for HTML output ---------------------------------------------------

# The name for this set of Sphinx documents.  If None, it defaults to
# "<project> v<release> documentation".
html_title = "Introduction to Application Development with Qt Quick"

# A shorter title for the navigation bar.  Default is the same as html_title.
html_short_title = "Intro to Qt Quick App Dev"

# Output file base name for HTML help builder.
htmlhelp_basename = 'IntroToApplicationDevelopmentWithQtQuick'


# -- Options for LaTeX output --------------------------------------------------

latex_documents = [
  ('index', 'QtQuickAppDevIntro.tex', u'Introduction to Application Development with Qt Quick',
   u'Digia, Qt Learning', 'manual'),
]

# -- Options for Epub output ---------------------------------------------------

# The basename for the epub file. It defaults to the project name w/o spaces
epub_basename = 'QtQuickAppDevIntro'

# Bibliographic Dublin Core info.
epub_title = u'Qt Quick Application Development Primer'

# -- Options for Qt Help output ---------------------------------------------------
# The basename for the Qt help file. It defaults to the project name w/o spaces
qthelp_basename = 'QtQuickAppDevIntro'
