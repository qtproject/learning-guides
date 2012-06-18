..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------

Adding a Test Page
==================

Now that the application works pretty well, try to provide an additional page that enables you to test the database connection by resetting the SQL table and adding random items. To do so, you need to create a new `ToolPage` page that will contain a list of useful actions. Create a `reset` action for the page that resets the `Todo` table from the database and actions to insert 10, 100 or 1000 new items into the database.

Here's how your UI form of `ToolPage` should look:

.. image:: img/toolpage-concept.png
    :scale: 40%
    :align: center

You also need to declare the following elements:

     `ListView`: the main list that displays actions via `listModel`
     `ListModel`: contains the `ListElements`
     `ToolBarLayout`: contains a `ToolButton` to go back to the `HomePage`

On the list view, you can use a `BoxItemDelegate`. You may need to add a function for creating random items. The result should be a `ToolPage` that looks like this:

.. image:: img/toolpage.png
    :scale: 40%
    :align: center

.. rubric:: What's next?

Next we'll have you add an archive page and an action to move todos from one box to another.
