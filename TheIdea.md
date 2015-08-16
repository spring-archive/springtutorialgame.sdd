# Introduction #

For new modders it is hard to find a starting place for their new game.
The idea is to create a spring game with just the very basic stuff.

# Details #

Popular "base mods" seem to be zeroK and various TA based games but those are usually too big, complicated and still have some leftover mistakes. It is also hard to filter what files are mandatory and what files are game specific.
Read http://springrts.com/phpbb/viewtopic.php?f=14&t=25831

# Documentation #
Is not excatcly the goal of this project to explain everything in the code, even though it should be well commentated. Creating a second wiki/documentation would not be desireable.
For documentation on certain subjects use the wiki at http://springrts.com/wiki/Main_Page
You can then link to that wiki.

WRONG:
```

--HITBOX

collisionVolumeTest       =  1,
collisionVolumeOffsets    =  [[0 0 0]], --position in x,y,z coordinates. x is left/right, y is up/down z is front/back
collisionVolumeType       =  [[box]], --what shape the hitbox has. possible are box, sphere and cylinder
collisionVolumeScales     =  [[55 65 55]], --the dimension in x,y,z
```

RIGHT:
```

--HITBOX: learn more at http://springrts.com/wiki/Unit_collision_volumes

collisionVolumeTest       =  1,
collisionVolumeOffsets    =  [[0 0 0]],
collisionVolumeType       =  [[box]],
collisionVolumeScales     =  [[55 65 55]],
```