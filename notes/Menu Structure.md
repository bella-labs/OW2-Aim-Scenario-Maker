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
* Configure Movement Profiles
  * Profile Settings (label)
    * Select Movement Profile <1-12>
    * Save Movement Profile
    * Clear Movement Profile
    * Override Movement Profile from Slot <1-12>
    * Advanced Movement (submenu):
    * Bot Impulse Profile <off / on>
* Configure Scenario
  * Score Type <Timer / Kills>
  * Time <1s to 600> (large: 10, small: 1, coord_set, vis: Score Type = Timer)
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
  * Test Movement Profile <1-12>
  * Test Scenario