..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------

How to add your own "How To's"
==============================

This project contains a collection of Qt Quick How-Tos. It collects interesting topics we discovered during the work and thought they are worth mentioning to others.

Any contributions are welcome. There are two ways to proceed. See below.

We currently host all How-Tos in one directory. As soon as some groups of topics can be identified, we sort them according to those topics.


Bring Your Own (BYO :-) )
-------------------------

All how How-Tos have to be based on a small application which uses that particular trick you wanted to explain.

You can post the code of the application as a code block in the text or add it a ``qml`` file. Do not forget to refer it in the text in the latter case!

Once you get the code, create a new ``.rst`` file with an understandable name. Inside that file, add a title which starts with "How to ...". Write the text and refer to the code.

Add a reference to the new ``.rst`` file in the ``index.rst`` in this directory.

Take one from the menu
----------------------

Check the :ref:`list of open How-Tos<open_howtos_anchor>`. If there is something you always wanted tell to be proud of. Then:

     pick one and proceed as described in the previous section
     delete the related entry from the :ref:`list of open How-Tos<open_howtos_anchor>`

How to formulate a How-To
-------------------------

The most important thing to know is that the title says it is a "how to" and not a quiz question. The title should solve a real problem in development and may not be a an IQ test or a trick, e.g.     What is the difference between packages and modules*.

The text consists of three mandatory parts: a problem, a solution and a discussion. Outline a typical situation where this How-To is useful: a     problem*. The *solution* shows how it is done. *Discussion* explains why and how this solution is selected as well as includes external references if needed.

