# Configure Bots (submenu)

## **Slot (label)**
### Bot Slot <slot>
  * Type: int
  * Range: 0 - 11
  * Small Step: -/+ 1
  * Large Step: -/+ 1
### Override from Slot <slot>
  * Type: int
  * Range: 0 - 11
  * Small Step: -/+ 1
  * Large Step: -/+ 1
## **Bot Parameters (label)**
### Bot Hero Pool <hero, toggle>
  * Type: List, List
  * Options: Heroes ordered by hero release order for backwards compatibility, toggle
  * Color: Green/Red based on status
  * Small Step: prev/prev hero
  * Large Step: toggle All/toggle selected
### Bot Health <Health%, Self-Heal Timer, HPS>
  * Type: int, real, int
  * Range: 0% - 1000%, 0s - 600s, 0-1000 
  * Small Step: -/+ 1%, -/+ 0.01, -/+ 1
  * Large Step: -/+ 10%, -/+ 1, -/+ 10
  * Subitems
### Bot Scale <Type, min, max, time> 
  * Type: int, int, list, real
  * Options: Static, Random, Health, Loop
  * Range: 0% - 1000%
  * Small Step: -/+ 1%
  * Large Step: -/+ 10%
  * Subitems
### Gravity <Gravity%>
  * Type: int, real, int
  * Range: 0% - 1000%
  * Small Step: -/+ 1%
  * Large Step: -/+ 10%
  * Subitems
## **Bot Spawn and Boundaries (label)**
### Spawn Type<Type, X, Y, Z>
* Type: list, real, real, real
* Option: Position, Random within Boundaries
* Range: -/+ 1000
* Small Step: -/+ 0.01
* Large Step: -/+ 1
* Subitems
* Populate Command
### Facing <Type, X, Y, Z>
* Type: list, real, real, real
* Options: Fixed / Player
* Small Step: -/+ 0.01
* Large Step: -/+ 1
* Subitems
* Populate Command
* Effect: Blue Line Representing Facing from Default Position
* Varied: Vector Offset if Player Type, FacingDirection if Fixed
### Lower Bound <X, Y, Z>
* Type: real, real, real
* Small Step: -/+ 0.01
* Large Step: -/+ 1
* Subitems
* Populate Command
* Effect: Box based on lower/upper bounds
### Upper Bound <X, Y, Z>
* Type: real, real, real
* Small Step: -/+ 0.01
* Large Step: -/+ 1
* Subitems
* Populate Command
* Effect: Box based on lower/upper bounds
### Distance <Min, Max>
* Type: real, real
* Small Step: -/+ 0.01
* Large Step: -/+ 1
* Subitems
* Effect: Radius Ring from player set position
### Use Custom Script <Toggle>
## **Profiles (label)**
### Profiles <Number: Toggle> 
* Type: int, toggle
* Small Step: prev/next
* Large Step: Toggle All/Toggle
### Randomize Profile Order <Toggle, min, max>
* Type: toggle, real, real
* Range: 0s - 600s
* Small Step: toggle, -/+ 0.01
* Large Step: toggle, -/+ 1
* Subitems

# Configure Profile (submenu)
## **Movement Profile (label)**
### Select Movement Profile
  * Type: int
  * Range: 0 - 11
  * Small Step: -/+ 1
  * Large Step: -/+ 1
### Override from Slot (Hold for 1 Sec)
  * Type: int
  * Range: 0 - 11
  * Small Step: -/+ 1
  * Large Step: -/+ 1
## **Horizontal Movement (submenu)**
### **Left / Right Movement (label) **
#### Mirror Left and Right Settings <toggle, inital direction>
  * Type: toggle, List
  * Options: Left, Right, Random
#### Left Strafe Time <min, max>
  * Type: real, real
  * Range 0s - 600s
  * Small Step: -/+ 0.01
  * Large Step: -/+ 1
  * Subitems
#### Right Strafe Time <min, max>
  * Type: real, real
  * Range: 0s - 600s
  * Small Step: -/+ 0.01
  * Large Step: -/+ 1
  * Subitems
  * Visibility: mirror left / right = off
#### Swap Left / Right Strafe Time <toggle, min, max>
  * Type: toggle, real, real
  * Range: 0 - 600s
  * Small Step: -/+ 0.01
  * Large Step: -/+ 1
  * Subitems
  * Visibility: mirror left / right = off
#### Left Strafe Speed <Type, min, max>
  * Type: list, int, int
  * Options: static, linear ramp, randomized on strafe swap, increase per kill, min becomes base speed%, max becomes increment %
  * Range: 0 - 1000%
  * Small Step: -/+ 1
  * Large Step: prev/next, -/+ 10
  * Subitems
#### Right Strafe Speed <Type, min, max>
  * Type: list, int, int
  * Options: static, linear ramp, randomized on strafe swap
  * Range: 0 - 1000%
  * Small Step: -/+ 1
  * Large Step: prev/next, -/+ 10
  * Subitems
  * Visibility: mirror left / right = off
#### Swap Left / Right Strafe Speed <toggle, min, max>
  * Type: toggle, real, real
  * Range: 0 - 600s
  * Small Step: -/+ 0.01
  * Large Step: -/+ 1
  * Subitems
  * Visibility: mirror left / right = off

### **Forward / Backward Movement (label) **
#### Mirror Forward and Backward Settings <toggle, inital direction>
  * Type: toggle, List
  * Options: Left, Right, Random
#### Forward Strafe Time <min, max>
  * Type: real, real
  * Range 0s - 600s
  * Small Step: -/+ 0.01
  * Large Step: -/+ 1
  * Subitems
#### Backward Strafe Time <min, max>
  * Type: real, real
  * Range: 0s - 600s
  * Small Step: -/+ 0.01
  * Large Step: -/+ 1
  * Subitems
  * Visibility: mirror forward / backward = off
#### Swap Forward / Backward Strafe Time <toggle, min, max>
  * Type: toggle, real, real
  * Range: 0 - 600s
  * Small Step: -/+ 0.01
  * Large Step: -/+ 1
  * Subitems
  * Visibility: mirror forward / backward = off
#### Forward Strafe Speed <Type, min, max>
  * Type: list, int, int
  * Options: static, linear ramp, randomized on strafe swap
  * Range: 0 - 1000%
  * Small Step: -/+ 1
  * Large Step: prev/next, -/+ 10
  * Subitems
#### Backward Strafe Speed <Type, min, max>
  * Type: list, int, int
  * Options: static, linear ramp, randomized on strafe swap
  * Range: 0 - 1000%
  * Small Step: -/+ 1
  * Large Step: prev/next, -/+ 10
  * Subitems
  * Visibility: mirror forward / backward = off
#### Swap Forward / Backward Strafe Speed <toggle, min, max>
  * Type: toggle, real, real
  * Range: 0 - 600s
  * Small Step: -/+ 0.01
  * Large Step: -/+ 1
  * Subitems
  * Visibility: mirror forward / backward = off

### **Idle Movement(label)**
#### Idle Type
  * Type: List
  * Options: All Movement, Separate LR and FB
  * Small Step: toggle
  * Large Step: toggle
#### Left / Right Idle Chance <interval, chance, min, max>
  * Type: real, int, real, real
  * Range: 0s - 600s, 0-100%, 0s - 600s, 0s - 600s
  * Small Step: -/+ 0.01
  * Large Step: -/+ 1
  * Subitems
#### Forward / Backward Idle Chance <interval, chance, min, max>
  * Type: real, int, real, real
  * Range: 0s - 600s, 0-100%, 0s - 600s, 0s - 600s
  * Small Step: -/+ 0.01
  * Large Step: -/+ 1
  * Subitems
## **Vertical Movement (label)**
### Jump Frequency <type, min, max, impulse>
  * Type: list, real, real, int
  * Options: jump/impulse
  * Range: 0s - 600s, 0s - 600s, 0 - 100
  * Small Step: -/+ 0.01, -/+ 1
  * Large Step: -/+ 1, -/+ 10
  * Subitems
### Crouch Frequency <type, min, max, impulse>
  * Type: list, real, real, int
  * Options: crouch/impulse
  * Range: 0s - 600s, 0s - 600s, 0 - 100
  * Small Step: -/+ 0.01, -/+ 1
  * Large Step: -/+ 1, -/+ 10
  * Subitems
### Uncrouch Frequency <min, max>
  * Type: real, real
  * Range: 0s - 600s
  * Small Step: -/+ 0.01
  * Large Step: -/+ 1
  * Subitems
## **Reaction Settings (label)**
### Bot Reactions to Collisions <toggle, threshold, min, max>
  * Type: toggle, int, real, real
  * Range: 0% - 100%, 0s - 1s, 0s - 1s
  * Small Step: -/+ 1%, -/+ 0.01
  * Large Step: -/+ 10%, -/+ 1
  * Subitems
### Swap Strafe Damage <swap left / right, swap forward / backward, chance, cooldown>
  * Type: toggle, toggle, int, real
  * Range, 0% - 100%, 0 - 10s
  * Small Step: -/+ 1%, -/+ 0.01
  * Large Step: -/+ 10%, -/+ 1
  * Subitems
### Swap Strafe Timer <min, max>
  * Type: real, real
  * Range: 0s - 600s
  * Small Step: -/+ 0.01
  * Large Step: -/+ 1
  * Subitems

# **Configure Scenario (submenu)**
## **Scoring (label)**
### Score Type <toggle, time/kills>
  * Type: toggle, real/int
  * Range: 0s - 600s / 100 kills
  * Small Step: -/+ 0.01s / 1 kill
  * Large Step: -/+ 1 / 10 kills
  * Subitems
### Points <Kills, Bodyshot, Headshot>
  * Type: int, int, int
  * Range: 0 - 1000, 0 - 1000, 0 - 1000
  * Small Step: -/+ 1
  * Large Step: -/+ 10
  * Subitems
### Strafe Score <score per sec, min, max>
  * Type: int, real, real
  * Range: 0 - 1000, 0 - 10s, 0 - 10s
  * Small Step: -/+ 1, -/+ 0.01
  * Large Step: -/+ 10, -/+ 1
  * Subitems

## Configure Player (label)
### Starting Position <X, Y, Z> (large: 1, small: 0.01, subitem, vector, effect: red orb)
  * Type: real, real, real
  * Range: 0 - 1000
  * Small Step: -/+ 0.01
  * Large Step: -/+ 1
  * Subitems
  * Effect: red orb w/ text
### Player Speed <speed>
  * Type: int
  * Range: 0% - 1000%
  * Small Step: -/+ 1
  * Large Step: -/+ 10
  * Subitems
### Player Gravity <0% to 500%> (large: 10%, small: 1%)
  * Type: int
  * Range: 0% - 1000%
  * Small Step: -/+ 1
  * Large Step: -/+ 10
  * Subitems
### Use Custom Script <Toggle>
# Play
## Test Bot in Slot <0-11>
  * Type: int
  * Range: 0 - 11
  * Small Step: -/+ 1
  * Large Step: -/+ 1
## Test Scenario
  * Type Selection