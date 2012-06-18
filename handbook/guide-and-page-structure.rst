..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------


Guide and page structure
========================

This page includes guidelines for writing your and structuring your guide.


Developing an application for a tutorial
----------------------------------------

     The tutorial document is split into chapters

     The first chapter describes your application and its purpose

     The development of the application begins in the second chapter

     Each following chapter covers the further development of your application and leads to it's final completion, after which finishing touches and extra features are covered

     A chapter has two or more steps showing the evolution of the application

     A tutorial application has to be runnable at the end of each step, but there is no full source code package for a step

     The a package with the source code of the application is provided in each chapter

     Each chapter starts with "Motivation" (what this chapter about. why do we need the steps in the chapter) and ends with "Lessons learned"

     Each section starts with "Motivation" and ends with "What's Next?"




Naming and folder structure
---------------------------

     Each chapter and all its files reside in its own folder

     Each chapter in a guide is a numbered folder (e.g. ``chapter_01``,  ``chapter_02`` etc).

     Each folder must include the following elements:

      An ``image`` folder which contains all pictures used in the text as well as working files used to create them

      An ``src`` folder with the code of the version of the application developed in the chapter

      An ``index.rst`` file with the starting pages of the chapter and references to all other =rst= files, most of them are files from steps.

      All of the other .rst files in your chapter. Each step is numbered (e.g. ``step_1.rst``,  ``step_2.rst`` etc).

      Make sure titles have a clear meaning which sufficiently covers the content of the section (remove the word "step" from every name)

      If figures are made with a drawing tool, place the project files into the appropriate image directory and push them into Git


.. Note:: File names may contain only ASCII letters, digits or the ``-`` (dash) sign

     Define a table of contents by adding the following to your index.rst file. Then list the files in that directory followed by 4 spaces and leave out the suffix like so, e.g::

    .. toctree::
       :maxdepth: 2

           filename-1
           filename-2
           filename-3
           filename-4
           filename-5

More information `here (http://sphinx.pocoo.org/markup/toctree.html) <http://sphinx.pocoo.org/markup/toctree.html>`_



Headings
--------

We limit the number of heading levels to two in one file. Headings inside the file are not shown in the "bread crumbs" line, but are nonetheless a major navigation element. If your page has grown and you realize a need for more than two levels of headings, you should consider splitting one page into several where each would have a maximum of two levels of headings.

Headings are made by underlining text with different characters. A file should have a title and sub-titles - depending on where the file resides in the folder structures the title will be a part, chapter or section title.

     We currently use only the following for titles::

    section
    =======

    subsection
    ----------

     A rst file should only contain these 2 levels of headings. Titles should be formatted with `===` and subtitles with `----`.



     Use at least as many characters as the length of the title

     Character usage is quite flexible, but be consistent

     Titles should be not too long

     Use deeper nested folder rather than deep nested documents

     Headings should tell people what they are going to learn as well as which new features will be implemented in the application


.. SeeAlso:: :ref:`capitalization_in_titles`


     The following list shows all of the options for titles should we decide to use more than 2 types::

    ####
    Part
    ####

        ******
    Chapter
        ******

    section
    =======

    subsection
    ----------

    subsubsection
    ^^^^^^^^^^^^^

    paragraph
    """""""""
