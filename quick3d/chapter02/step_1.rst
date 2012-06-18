..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------


Overview of the "SpaceBurger" game
==================================

Application idea
----------------

Our game will be called `SpaceBurger`. Playing this game, your mission is to steer a hamburger through the darkness of the space and to try to hit as many onion rings as possible. Each onion ring brings additional scope. During the flight, it is possible increase maneuverability and firepower by hitting small power-ups. The player has to pass multiple levels including a special challenge at the end of every level: a fight against a     boss* enemy. Once the boss has been defeated, the next level begins.

Controls
--------

While having to hit several targets along the way, the hamburger is shown from behind. It can be controlled using the ``A`` (left), ``S`` (down), ``D`` (right) and ``W`` (up) keys. We will use basic movement equations to achieve realistic flight behavior.

The fight against the boss enemy at the end of every level is shown from the top view. During the fight, the hamburger can then only be moved left and right. Weapons can be fired using the ``space`` key.

Game menu
---------

When starting the application, a game menu will be displayed. The player can start a new game and review the achieved results in a highscore table.
