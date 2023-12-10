# Configure Bots (submenu)

## **Slot (label)**
### Bot Slot 
  * Type: int
  * Range: 0 - 11
  * Small Step: -/+ 1
  * Large Step: -/+ 1
### Override from Slot <0-11>
  * Type: int
  * Range: 0 - 11
  * Small Step: -/+ 1
  * Large Step: -/+ 1
## **Bot Parameters (label)**
### Bot Hero Pool
  * Type: List 
  * Options: Heroes ordered by hero release order for backwards compatibility
  * Color: Green/Red based on status
  * Small Step: prev/prev hero
  * Large Step: toggle All/toggle selected
### Bot Health
  * Type: int
  * Range: 0% - 500%
  * Small Step: -/+ 1%
  * Large Step: -/+ 10%
### Bot Scale <1% to 500%> 
  * Type: int
  * Range: 0% - 500%
  * Small Step: -/+ 1%
  * Large Step: -/+ 10%

## **Bot Spawn and Boundaries (label)**
### Spawn Type 
* Type: List
* Options: Default / Randomized in Boundaries
* Small Step: prev/next
* Large Step: prev/next
### Position <X, Y, Z>
* Type: real, real, real
* Range: -/+ 1000
* Small Step: -/+ 0.01
* Large Step: -/+ 1
* Subitems
* Populate Command
### Facing Type
* Type: List
* Options: Fixed / Player
### Facing Vector <X, Y, Z>
* Type: real, real, real
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

## **Profiles (label)**
### Profiles <Number: Toggle> 
* Type: int, list
* Options: off/on
* Small Step: prev/next
* Large Step: Toggle All/Toggle
### Randomize Profile Order
* Type: List
* Options: off/on
* Small Step: toggle
* Large Step: toggle

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
## **Horizontal Movement (label)**
### Left Strafe Time <Min, Max>
  * Type: real, real
  * Range 0s - 100s
  * Small Step: -/+ 0.01
  * Large Step: -/+ 1
  * Subitems
### Right Strafe Time <Min, Max>
  * Type: real, real
  * Range 0s - 100s
  * Small Step: -/+ 0.01
  * Large Step: -/+ 1
  * Subitems
### Left Strafe Speed <Min, Max, Type> (Type: Linear Ramp, Randomized on Counterstrafe)
### Right Strafe Speed <Min, Max, Type>
### Swap Left/Right Strafe Time <Off / On, Min, Max>
### Forward/Backward Strafes
  * Type: List
  * Options: off/on
  * Small Step: toggle
  * Large Step: toggle
### Forward/ Backward Strafe Time <Min, Max>
### Forward Strafe Speed <Min, Max, Type>
### Backward Strafe Speed <Min, Max, Type>
### Randomly Swap Forward/Backward Strafe Speeds <Off / On, Min, Max>
### Vertical Movement (label)
### Jump Frequency <0-10s>
### Gravity <0%-500%>
### Crouch Frequency <0-10s>
### Uncrouch Time <Min, Max>
### Advanced Movement (label)
### Bot Impulse Profile <off / on>
### (Unsure) Maximize Player Crosshair Movement (additional Wait time if strafe away from crosshair) <off / on, min, max> 

## **Reaction Settings (label)**
##  Collisions (label)
## Bot Reactions to Collisions <Off / On>
## Threshold <%1-100%>
## Reaction Time <Min/Max>
## Damage (label)
## Swap AD Strafe Directions (On / Off)
## Swap AD Wait Timer
## Swap WS Strafe Directions (On / Off)
## Swap WS Wait Timer
# Configure Scenario
## Score Type <Timer / Kills>
## Time <1s to 600s> (large: 10, small: 1, coord_set, vis: Score Type = Timer)
## Kills <1 to 500> (large:10, small: 1, vis: Score Type = Kills)
## Points per Kill <0 to 1000> (large:10, small: 1)
## Points per Bodyshot <0 to 1000> (large:10, small: 1)
## Points per Headshot <0 to 1000> (large:10, small: 1)
## Max Points Per Strafe <0 to 1000> (large: 10, small: 1)
## Time Til Max Score <0-10> (large:1s, small 0.01s)
# Configure Player
## Starting Position <X, Y, Z> (large: 1, small: 0.01, subitem, vector, effect: red orb)
## Player Speed <1% to 500%> (large: 10%, small: 1%)
## Player Gravity <1% to 500%> (large: 10%, small: 1%)
## Player Impulse Profile <off / on>
# Play
## Test Bot in Slot <0-11>
## Test Scenario