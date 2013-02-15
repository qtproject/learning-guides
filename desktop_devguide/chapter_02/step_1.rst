..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------

Overview of the NoteApp Application
====================================

The NoteApp* application is a `Post-it note <http://en.wikipedia.org/wiki/Post-it_note>`_ application that helps users create notes and store them locally. It would be easier to manage notes if they belonged to a category, so let's consider having three different categories that the notes can belong to. From a visual perspective, a category can be represented by an area where notes of the same category can be placed. Let's introduce the concept of Page*. A *Page* is an area where notes will be created and placed.

The user should be able to delete notes one by one as well as all of them at once. Notes can be moved freely by the user within a Page* area. For simplicity reasons, let's define three pages and identify  each page by using *Marker*. Additionally, each marker can have a different color.

An interesting feature would be to store notes locally and perhaps have this done automatically so that we can avoid user prompts asking to save the notes.

To summarize the list of features:

    * Create / Delete Note items
    * Edit Notes and position them anywhere in the page
    * Store notes locally
    * Three different pages indicated by a page marker


UI Elements
-----------

Based on the requirements discussed earlier, let's start with the wire-frame design shown in the picture below. As there could be many possible designs for the *NoteApp*, let's consider the following one.

.. image:: img/prototype_drawing.png
    :align: center

The picture above gives us a good idea of what the user expects to see from the UI perspective, but it also can help you identify possible UI elements and interactions that could be implemented later on.


UI Flows
--------

As mentioned previously, there are three Pages* that can contain *Note* items. We can also see the *Marker* items on the right side and the toolbar on the left. The toolbar contains: the `New Note` tool for creating new notes and the `Clear All` tool to clear the entire page. *Note* items have a toolbar that can be used to drag notes within the page by moving the mouse while holding the left-click button down. Additionally, there is a *delete* tool in the note toolbar that enables the user to delete the note.


.. rubric:: What's Next?

Next, we will work on identifying the QML components needed to implement our features and learn how to create them.
