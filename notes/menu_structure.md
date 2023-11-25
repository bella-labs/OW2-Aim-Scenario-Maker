* Configure Bots (submenu)
  * Bot Slot <0-11>
  * Override from Slot <0-11>
  * Bot Parameters (label)
    * Bot Hero Pool <> (Cycle Bar)
    * Bot Health <0% to 500%> (large: 10%, small: 1%)
    * Bot Scale <1% to 500%> (large: 10%, small :1%)
    * Bot Speed <1% to 500%> (large: 10%, small: 1%)
    * Bot Gravity <1% to 500%> (large: 10%, small: 1%)
  * Bot Spawn and Boundaries (label)
    * Position <X, Y, Z> (large: 1, small: 0.01, subitem, vector)
    * Facing Type <fixed / player>
    * Facing <X, Y, Z> (large: 1, small: 0.01, subitem, vector, vis: Facing Type = Fixed, effect: blue line)
    * Facing Offset <X, Y, Z> (1 large, 0.01 small, subitem, vector, vis: Facing Type = Player, effect: blue line)
    * Boundary Type <coordinates / distance / both>
      * Lower Bound <X, Y, Z> (large: 1, small: 0.01, subitem, vector, vis: Facing Type = Coordinates/Both, effect: boundary box)
      * Upper Bound <X, Y, Z> (large: 1, small: 0.01, subitem, vector, vis: Facing Type = Coordinates/Both, effect: boundary box))
      * Distance <Min, Max> (large: 1, small: 0.01, subitem, vector, vis: Facing Type = Distance/Both, effect: radius)
    * Spawn Type <Default / Randomized>
  * Bot Profile (label)
    * Profiles <Profile X: On/Off> (large: toggle/toggle all, small next/prev)
    * Randomize Profile Order <On/Off>
* Configure Profiles
  * Profile Settings (submenu)
    * Select Movement Profile <1-12>
    * Save Movement Profile
    * Clear Movement Profile
    * Override Movement Settings from Slot <1-12>
  * Movement Settings (Submenu)
    * Horizontal Movement (label)
      * AD Strafes <Off / On>
      * AD Strafe Time <Min, Max>
      * AD Strafe Speed <A Speed, B Speed>
      * Randomly Swap AD Strafe Speeds <Off / On, Min, Max> *************** Check what aim train option of this does **************** 
      * WS Strafes <Off / On>
      * WS Strafe Time <Min, Max>
      * WS Strafe Speed <A Speed, B Speed>
      * Randomly Swap WS Strafe Speeds <Off / On, Min, Max> *************** Check what aim train option of this does **************** 
    * Vertical Movement (label)
      * Jump Frequency <0-10s>
      * Gravity <0%-500%>
      * Crouch Frequency <0-10s>
      * Uncrouch Time <Min, Max>
    * Advanced Movement (label)
      * Bot Impulse Profile <off / on>
      * (Unsure) Maximize Player Crosshair Movement (additional Wait time if strafe away from crosshair) <off / on, min, max> 
  * Reaction Settings (Submenu)
    *  Collisions (label)
      * Bot Reactions to Collisions <Off / On>
      * Threshold <%1-100%>
      * Reaction Time <Min/Max>
    * Damage (label)
      * Swap AD Strafe Directions (On / Off)
      * Swap AD Wait Timern *************** Check what aim train option of this does **************** 
      * Swap WS Strafe Directions (On / Off)
      * Swap WS Wait Timer *************** Check what aim train option of this does **************** 
* Configure Scenario
  * Score Type <Timer / Kills>
  * Time <1s to 600s> (large: 10, small: 1, coord_set, vis: Score Type = Timer)
  * Kills <1 to 500> (large:10, small: 1, vis: Score Type = Kills)
  * Points per Kill <0 to 1000> (large:10, small: 1)
  * Points per Bodyshot <0 to 1000> (large:10, small: 1)
  * Points per Headshot <0 to 1000> (large:10, small: 1)
  * Max Points Per Strafe <0 to 1000> (large: 10, small: 1)
  * Time Til Max Score <0-10> (large:1s, small 0.01s)
* Configure Player
  * Starting Position <X, Y, Z> (large: 1, small: 0.01, subitem, vector, effect: red orb)
  * Player Speed <1% to 500%> (large: 10%, small: 1%)
  * Player Gravity <1% to 500%> (large: 10%, small: 1%)
  * Player Impulse Profile <off / on>
* Play
  * Test Bot in Slot <0-11>
  * Test Scenario