..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------

States
======

In previous chapters, we have implemented most of our game logic and added many new components. In this chapter we will see how to use the `states` concept in Qt Quick to define every major event, that requires e.g. camera adjustment, or changes important parameters.

Let's summarize, once again, the game flow. Once the application is started, a game menu is shown and the player has two options: View the highscore table or start the game. When starting the game, the camera has to move to the back of the     hamburger* and the keyboard controls will be enabled. The `onion rings` start to fly toward the player who has to try to hit them. After a certain number of `onion rings`, the boss enemy should appear. The final fight will take place from the birds eye view so the camera has to be moved first. Once the boss or player have been destroyed, a dialog appears to enable the player to enter his name with his score to store them in the highscore table.

We define the following states:

     The **Menu** state: it's the initial state where only the 3 buttons of the menu are shown.

     The **Highscore** state: it's an extension to the **Menu** state where the highscore table is also displayed.

     The **Enter Highscore** state: Provides a `textfield` to enter the player's name in the highscore table. The whole game scene will be frozen.

     The **Game** state: Moves the camera behind the *hamburger* and starts the game. The keyboard controls are enabled and the game timer starts running.

     The **Boss Rotation** state: Rotates the camera around the boss enemy then to a position above the scenery.

     The **Boss Fight** state: Adjusts the *x-bound* after the camera has moved to a different point and starts the fight against the boss enemy.

.. code-block:: js

    //game.qml
    ...
    state: "Menu"

    states:[
        State{
            name: "Menu"
            PropertyChanges {target: player; ax: 0; ay: 0; vx: 0; vy:0;
                              position: Qt.vector3d(0, 0, 0); restoreEntryValues: false}
            PropertyChanges {target: root; score: 0; targetCount:0;
                              restoreEntryValues: false}
            PropertyChanges {target: cam; center: Qt.vector3d(0, 0, 0) }

        },
        State{
            name: "Highscore"
            extend: "Menu"
        },
        State{
            name: "EnterHighscore"
        },
        State{
            name: "Game"
            PropertyChanges {target: player; position: Qt.vector3d(0, 0, 0) }
        },
        State{
            name: "BossFight"
        PropertyChanges {target: player; ay: 0; vy:0;
          position: Qt.vector3d(0, 0, 0); restoreEntryValues: false}
        },
        State{
            name: "BossRotation"
            PropertyChanges {target: player; position: Qt.vector3d(0, 0, 0) }
        }
    ]
    ...

.. Note:: We will cover the implementation of the game menu and the highscore dialog in the next chapter.

The `targetTimer` and `gameTimer` should not start until either `Game` or `BossFight` state are reached:

.. code-block:: js

    //Gamelogic.qml
    ...
    id: targetTimer
    running: root.state=="Game"
    ...
    id: gameTimer;
    running: root.state=="Game"||root.state=="BossFight"
    ...

Also, The player will not be able to move on the `y` axis during the fight against the boss enemy and shooting lasers obviously must only be possible when there is a target to shoot. Later, we will be implementing a `fireLaser` function.

.. code-block:: js

    //Gamelogic.qml
    ...
    if(event.key == Qt.Key_W && root.state == "Game")
       upPressed = true
    if(event.key == Qt.Key_S && root.state == "Game")
       downPressed = true
    if(event.key == Qt.Key_Space && root.state == "BossFight")
       fireLaser();
    ...


.. note:: Note that the default state of our game is `Menu`. As we didn't yet implement the game menu, at this stage of the implementation the user can not start the game as it's supposed to be.

.. rubric:: What's Next?

Next we will implement the main menu for our game.
