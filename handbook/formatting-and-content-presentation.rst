..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------


Formatting and content presentation
===================================

This page covers how to format and present your content within a page.


Important notes for body text
-----------------------------

     The length of a line we well as soft and hard spaces play a special role in reST. Due to this it is vital to use a ``monospace`` font in you editor

     Like Python, reST syntax is sensitive to indentation

     reST requires blank lines between paragraphs


Body Text Formatting Syntax: Bold, Italic, Verbatim and Special Characters
--------------------------------------------------------------------------

     Use one asterisk on each side of a text you want to emphasize in  *italic* and 2 asterisks in you want to make it **bold**::

            italic*

            *bold**

        ``verbatim``


      This will generate:

            italic*

            *bold**

        ``verbatim``




When to use italics:

     When referring to titles within your text
     When emphasizing what something is called, alternative names for things etc


.. Note:: Only use quotation marks when quoting a person or written text!


When to use verbatim:

     Qt creator menu instructions: `File --> &New File or Project`
     File names: `main.qml`
     Inline code, elements, properties, aliases, components, folder names etc


.. Note::

         EVERYTIME you refer to your code, use verbatim
         EVERYTIME a referable term is used - use a link

.. SeeAlso:: :ref:`hyperlinking_and_citations`

When to use bold:

     Titles under subsections
     When you want to emphasize a word (e.g. This **is** the way we use bold.)


.. Note:: Use 4 spaces for indentation. Do not use tab ("\t")! The most frequent use of 4 spaces is the beginning of a paragraph.

     Double backquotes are used to make a text verbatim and displayed in a monospace font. For instance, if you want to use special characters such as ``*``,  ``*`` is not interpreted

     Finally, the single backquote is used for reST special commands. e.g. for hyperlinks like this one:  `Qt Learning home page <http://qt.nokia.com/learning>`_

.. Note:: If asterisks or backquotes appear in running text and could be confused with inline markup delimiters, they have to be escaped with a backslash


     Be aware of some of this markup's restrictions:

      It may not be nested

      Content may not start or end with whitespace: ``* text*`` is wrong

      It must be separated from surrounding text by non-word characters

     Use a backslash escaped space to work around that:

      ``this is a *longish* paragraph`` is correct and gives *longish*

      ``this is a long*ish* paragraph`` is not interpreted as expected. You
      should use ``this is a long\     ish* paragraph`` to obtain long\ *ish* paragraph


Spacing
-------

Use proper spacing:

     Before and after subsection titles

     Before and after images for content related to the image (smaller font, less space)

     Before and after images for content nonrelated to the image

     Before and after warning, note and codeblocks


Numbered and Bullet Lists
-------------------------

The following code::

         This is a bullet list
         It has two items, the second
      item uses two lines. (note the indentation).
      Nested lists are possible they must be separated from the parent list items by blank lines

           this is the next level of the items, and
           the next level continues

    1. This is a numbered list
    2. It has two items too

    Normal text stops numbering sequence, which is then started again in a new one:

     #. This is a numbered list
     #. It has two items too. Nested lists are possible they must be separated from the parent list items by blank lines
      #. sub list item
      #. another sub list item
      #. and one more

results in:

     This is a bulleted list
     It has two items, the second
  item uses two lines. (note the indentation).
  Nested lists are possible they must be separated from the parent list items by blank lines

      this is the next level of the items, and
      the next level continues (note the indentation here too)

1. This is a numbered list
2. It has two items too

Normal text stops numbering sequence, which is then started again in a new one:

#. This is a numbered list
#. It has two items too. Nested lists are possible they must be separated from the parent list items by blank lines

 #. sub list item
 #. another sub list item
 #. and one more

.. Note:: If two lists are separated by a blank line only, then the two lists are not differentiated as you can see above


Tables
------

There are several ways to write tables in reST. We use the one as defined below which you can write as a raw table or a list. the latter might be simpler to extend and change. See this `link <http://docutils.sourceforge.net/docs/ref/rst/directives.html#table>`_ for more details.

A table with column titles: ::

  .. table:: Truth table for "not"

    =====  =====
      A    not A
    =====  =====
    False  True
    True   False
    =====  =====


which results in:

.. table:: Truth table for "not"

  =====  =====
    A    not A
  =====  =====
  False  True
  True   False
  =====  =====

.. Note:: The directive has to separated by an empty line from the table content

.. Note:: A table has to have a title

Another way is to write the content of a table as a list. This is easier to change and extend since you do not need to mock-up the table itself.

This looks like this::

  .. list-table:: Frozen Delights!
    :widths: 15 10 30
    :header-rows: 1

         - Treat
      - Quantity
      - Description
         - Albatross
      - 2.99
      - On a stick!
         - Crunchy Frog
      - 1.49
      - If we took the bones out, it wouldn't be
    crunchy, now would it?
         - Gannet Ripple
      - 1.99
      - On a stick!

This results in:

.. list-table:: Frozen Delights!
   :widths: 15 10 30
   :header-rows: 1

        - Treat
     - Quantity
     - Description
        - Albatross
     - 2.99
     - On a stick!
        - Crunchy Frog
     - 1.49
     - If we took the bones out, it wouldn't be
       crunchy, now would it?
        - Gannet Ripple
     - 1.99
     - On a stick!
