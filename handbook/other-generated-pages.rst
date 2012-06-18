..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------


Other Generated Pages
=====================

Glossary
--------

A glossary is a collection of definitions. One definition consist of a term and its explanation. We do not use this yet, but if we will use it, there will be one glossary for the entire project.

You write a glossary like this::

  .. Glossary::

    Environment
    A structure where information about all documents under the root is
    saved, and used for cross-referencing.  The environment is pickled
    after the parsing stage, so that successive runs only need to read
    and parse new and changed documents.

    Source Directory
    The directory which, including its subdirectories, contains all
    source files for one Sphinx project.

which results in:

.. Glossary::

   Environment
      A structure where information about all documents under the root is
      saved, and used for cross-referencing.  The environment is pickled
      after the parsing stage, so that successive runs only need to read
      and parse new and changed documents.

   Source directory
      The directory which, including its subdirectories, contains all
      source files for one Sphinx project.

Entries in the glossary are also listed in the generated index. See  :ref:`genindex`


.. _index-anchor:


Index
-----

An index is a list of keywords and associated page numbers or links to where useful material relating to that keyword can be found in a document.

The index directive contains one or more keyword entries separated by comma::

  .. Index:: index, reference list of keywords

Since some keywords can be used in different contexts, an index should be able to present the keyworks in that context. In above, for example, the keyword ``index`` alone is too generic. You can add context in the front of a keyword separated by a colon::

  .. Index:: formatting; index, index, index; in sphinx, index; formatting, reference list of keywords

which does not produce any output, and the following line will be empty in the out put:

.. Index:: formatting; index, index, index; in sphinx, index; formatting, reference list of keywords

In order to get the index visible, you have to generate it by writing::

  :ref:`genindex`

This creates a link pointing to an index page with all terms from above:

:ref:`genindex`

Click on the Index link above and see how the keywords were sorted into various contexts.

You should no do this on each page, but only on one page which is supposed to host a link to the index page.
