..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------


Finalizing the game
===================

Although the game is already playable, a few things are obviously still missing to bring it up to a round figure. We have to extend the current game for that - add new levels and enemies and make small adjustments to enhance game play.

More levels can easily be added. We need, however, a level counter and to exend the `GameLogic.qml`. After the `BossFight`, the highscore dialog will be shown but the `Game` state will be revoked again. In further levels, the targets could for example change into something else and not fly straight towards the player but maybe move on the way on the y- or x-axis. This makes it more difficult for the player to hit them.

Furthermore, small power-ups could be collected that could improve the hitpoints, energy level or enhance maneuverability. In future levels, there could also be targets that have to be avoided because they might cause damage to the player or decrease abilities.

As mentioned before, the boss enemy could also be greatly improved by giving it a different moving pattern and other weapons. It should be able to move back and forth, avoid the players weaponfire and perform some unexpected movements.

All of this can be accomplished by just extending the current structure.

