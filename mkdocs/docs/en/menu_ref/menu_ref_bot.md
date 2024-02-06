
# Bot Settings

### Select Bot Slot

**Description**

Select the bot you would like to modify, and enable/disable them in the scenario. You may have up to 12 bots in a scenario. The options below this setting are all be relative to the bot slot selected.

**Characteristics**

| Name                       | Type                 | Minimum    | Maximum    |
| -------------------------- | -------------------- | ---------- | ---------- |
| Slot                       | Integer              | 0          | 11         |
| Status                     | Boolean              | false      | true       |

**Usage**

1. Step left and right to select the bot you would configure.
2. Enable / disable the bot slot(s).

    a. Jump left to enable all bots.

    b. Jump right to enable the bot currently selected.

### Copy Current Bot to Slot

**Description**

Overrides the slot selected with data from this slot. After entering a Jump input enter the special action input to confirm.

**Characteristics**

| Name                       | Type                 | Minimum    | Maximum    |
| -------------------------- | -------------------- | ---------- | ---------- |
| Slot                       | Integer              | 0          | 11         |

**Usage**

1. Step left and right to select the bot you would configure.
2. Override the slot

    a. Jump left to override all slots with the currently selected data.

    b. Jump right to override the selected slots with the currently selected data.

## Spawn and Boundaries

### Spawn

**Description**

Sets the spawn type and spawn position for the bot in the current slot.

**Characteristics**

| Name                       | Type                 | Minimum    | Maximum    |
| -------------------------- | -------------------- | ---------- | ---------- |
| Spawn Type                 | Choice               | N/A        | N/A        |
| X                          | Real                 | -1000      | 1000       |
| Y                          | Real                 | -1000      | 1000       |
| Z                          | Real                 | -1000      | 1000       |

**Option Descriptions**

| Name                        | Description                                    |
| --------------------------- | ---------------------------------------------- |
| Fixed Position              | The bot will always spawn at the set position  |
| Random in Boundary          | The bot will spawn in a random position within the boundary box  |
| Random Walkable in Boundary | The bot will spawn on the ground in a random position within the boundary box |

**Usage**

1. Select the spawn type. If you are not using the fixed position spawn type there is no need to configure the spawn position.
2. If you are using the fixed position type you may set the position in one of two ways:

    a. Use the special action "Set Vector to Current" to populate the facing vector with the players current position.

    b. Manually enter each X, Y, and Z coordinate of the spawn vector.

### Facing

**Description**

Sets the facing type and facing direction of the bot. The facing direction is normalized when setting up the bot.

**Characteristics**

| Name                       | Type                 | Minimum    | Maximum    |
| -------------------------- | -------------------- | ---------- | ---------- |
| Facing Type                | Choice               | N/A        | N/A        |
| X                          | Real                 | -1000      | 1000       |
| Y                          | Real                 | -1000      | 1000       |
| Z                          | Real                 | -1000      | 1000       |

**Option Descriptions**

| Name                        | Description                                    |
| --------------------------- | ---------------------------------------------- |
| Fixed                       | The bot will at the direction set in the facing vector    |
| Player                      | The bot will always look at the player it is assigned to  |

**Usage**

1. Select the facing type. If you are not using the fixed facing type there is no need to configure the facing direction.
2. If you are using the fixed facing position you may set the facing vector in one of two ways:

    a. Use the special action "Set Vector to Current" to populate the facing vector with the players facing direction.

    b. Manually enter each X, Y, and Z coordinate of the facing direction. The facing direction will be normalized when when applied to the bot.

### Boundary

**Description**

Configure the boundary type and boundary position that the bot will not be allowed to move past. Boundary constraints take priority over distance constraints.

**Characteristics**

| Name                       | Type                 | Minimum    | Maximum    |
| -------------------------- | -------------------- | ---------- | ---------- |
| Collision Type             | Choice               | N/A        | N/A        |
| X                          | Real                 | -1000      | 1000       |
| Y                          | Real                 | -1000      | 1000       |
| Z                          | Real                 | -1000      | 1000       |

**Option Descriptions**

| Name                       | Description                                    |
| -------------------------- | ---------------------------------------------- |
| Reverse                    | The bot will move in a direction opposite of the boundary when a collision occurs |
| Stop                       | The bot will stop moving when a collision occurs |
| Teleport                   | The bot will teleport to a random location inside the boundary when a collision occurs |

**Usage**

1. Select the collision type.
2. Set the position of the boundary box.

    a. Use the special action "Set Vector to Current" to populate the boundary position with the player's current position.

    b. Manually enter each X, Y, and Z coordinate of the boundary position.

### Dimensions

**Description**

Configure the angle and size of the boundary box. Boundary constraints take priority over distance constraints.

**Characteristics**

| Name                       | Type                 | Minimum    | Maximum    |
| -------------------------- | -------------------- | ---------- | ---------- |
| Angle                      | Integer              | 0          | 180        |
| Length                     | Real                 | 0          | 1000       |
| Height                     | Real                 | 0          | 1000       |
| Width                      | Real                 | 0          | 1000       |

**Usage**

1. Set the angle of the boundary box.
2. Set the dimensions of the boundary box.

**Notes**
* The boundary detection has a 0.5m buffer where it will trigger to help counteract the latency between crossing the boundary, detecting the crossing of the boundary and reacting to the crossed boundary.
### Distance

**Description**

Configure the minimum and maximum distance the bot can be position relative to its player. Boundary constraints take priority over distance constraints.

**Characteristics**

| Name                       | Type                 | Minimum    | Maximum    |
| -------------------------- | -------------------- | ---------- | ---------- |
| Minimum Distance           | Real                 | 0          | 100        |
| Maximum Distance           | Real                 | 0          | 100        |

**Usage**

1. Set the minimum and maximum distance the bot can be positioned relative to player. If the minimum is greater than the maximum the maximum will be set to the minimum and vice versa.

## Bot Parameters

### Hero Pool

**Description**

Toggle which heroes are included in the bots hero pool. The hero pool is organized by release order to maintain backwards compatibility with future hero releases. The heroes are chosen at random. To have a set hero rotation I recommend using the in-order spawn option configurable in the scenario settings menu.

**Characteristics**

| Name                       | Type                 | Minimum    | Maximum    |
| -------------------------- | -------------------- | ---------- | ---------- |
| Hero                       | Hero (Integer)       | Tracer (0) | Mauga (39) |

**Usage**

1. Cycle to the hero you want to enable / disable.
2. Enable / disable the hero.

    a. To enable all heroes use the jump left input.

    b. To enable the currently selected hero use the jump right input.

### Health

**Description**

Sets health, hps and hps wait of the bot. A negative hps will cause a damage over time effect on the bot.

**Characteristics**

| Name                       | Type                 | Minimum    | Maximum    |
| -------------------------- | -------------------- | ---------- | ---------- |
| Health                     | Integer              | 0% (Infinite) | 1000%   |
| HPS                        | Real                 | -1000      | 1000       |
| HPS Wait                   | Real                 | 0 seconds  | 600 seconds |

**Option Descriptions**

| Name                        | Description                                    |
| --------------------------- | ---------------------------------------------- |
| Fixed                       | The bot will at the direction set in the facing vector    |
| Player                      | The bot will always look at the player it is assigned to  |

**Usage**

1. Set the bots health. A health of 0% will make the bot unkillable.
2. Set the hps. A positive hps will heal the bot, a negative hps will apply damage over time.
3. Set the hps wait. The hps wait is the time to wait between the bot taking damage from a player and the heal over time / damage over time being applied to the bot.

### Speed

**Description**

Sets the bot's movement speed.

**Characteristics**

| Name                       | Type                 | Minimum    | Maximum    |
| -------------------------- | -------------------- | ---------- | ---------- |
| Speed Type                 | Choice               | N/A        | N/A        |
| Minimum Speed              | Integer              | 0%         | 1000%      |
| Maximum Speed              | Integer              | 0%         | 1000%      |
| Speed Target               | Real                 | 0          | 1000       |

**Option Descriptions**

| Name                        | Description                                    |
| --------------------------- | ---------------------------------------------- |
| Random                      | The speed will randomly be set to a value in-between the minimum and maximum when the bot spawns. |
| Health                      | The bot's speed will be set to the minimum while it is at full health, as the bots health approaches 0 the speed will increase to the maximum.  |
| Elims (Target)              | The bot will start at the minimum speed, every elimination, the speed will increase by the value set in speed target up to the maximum speed.  |
| Looping (Target)            | The bots speed will loop between the minimum and maximum speed in the shape of a sin wave. The speed target sets the period of this wave.  |

**Usage**

1. Set the speed type.
2. Set the minimum speed for the bot to travel.
3. Set the maximum speed for the bot to travel.
4. If using Elims or Looping speed type:

    a. Elims: Set the speed target to the percentage the speed should increase by every elimination.
    b. Looping: Set the speed target to the period the speed looping should occur under.


### Scale

**Description**

Sets the bot's scale.

**Characteristics**

| Name                       | Type                 | Minimum    | Maximum    |
| -------------------------- | -------------------- | ---------- | ---------- |
| Scale Type                 | Choice               | N/A        | N/A        |
| Minimum Speed              | Integer              | 0%         | 1000%      |
| Maximum Speed              | Integer              | 0%         | 1000%      |
| Speed Target               | Real                 | 0          | 1000       |

**Option Descriptions**

| Name                        | Description                                    |
| --------------------------- | ---------------------------------------------- |
| Random                      | The scale will randomly be set to a value in-between the minimum and maximum when the bot spawns. |
| Health                      | The bot's scale will be set to the maximum while it is at full health, as the bots health approaches 0 the scale will increase to the minimum.  |
| Elims (Target)              | The bot will start at the maximum scale, every elimination, the scale will decrease by the value set in speed target up to the minimum scale.  |
| Looping (Target)            | The bots scale will loop between the minimum and maximum scale in the shape of a sin wave. The scale target sets the period of this wave.  |

**Usage**

1. Set the scale type.
2. Set the minimum scale for the bot to travel.
3. Set the maximum scale for the bot to travel.
4. If using Elims or Looping scale type:

    a. Elims: Set the scale target to the percentage the scale should decrease by every elimination.
    b. Looping: Set the scale target to the period the scale looping should occur under.

### Gravity

**Description**

The gravity of the bot.

**Characteristics**

| Name                       | Type                 | Minimum    | Maximum    |
| -------------------------- | -------------------- | ---------- | ---------- |
| Gravity                    | Integer              | 0%         | 1000%      |

**Usage**

1. Set the gravity to the desired about of gravity. To get floating bots set the gravity to 0.

## Movement Profiles

### Profile Status

**Description**

Assign the weight of each movement profile on the bot slot. A weight of 0 disables the profile for the current bot slot.

**Characteristics**

| Name                       | Type                 | Minimum      | Maximum    |
| -------------------------- | -------------------- | ------------ | ---------- |
| Profile                    | Integer              | 0            | 11         |
| Weight                     | Integer              | 0 (Disabled) | 100        |


**Usage**

1. For each movement profile you would like to apply to the bot:

   a. Cycle to the movement profile you would like to toggle.

   b. Set the weight of the movement profile.

### Profile Order

**Description**

Description

**Characteristics**

| Name                       | Type                 | Minimum    | Maximum     |
| -------------------------- | -------------------- | ---------- | ----------- |
| Profile Type               | Choice               | N/A        | N/A         |
| Minimum Time               | Real                 | 0 seconds  | 600 seconds |
| Maximum Time               | Real                 | 0 seconds  | 600 seconds |

**Option Descriptions**

| Name                        | Description                                    |
| --------------------------- | ---------------------------------------------- |
| In Order                    | The bot will switch to next movement profiles after a randomized wait |
| Randomized                  | The bot will randomly cycle to a new profile after a randomized wait  |

**Usage**

1. Select the profile cycle type for this bot to use
2. Set the minimum time between profile cycles
3. Set the maximum time between profile cycles

### Script

**Description**

A toggle for custom script. Does nothing on its own. Requires workshop scripting to implement functionality. You can set the custom script for different bots, if there are only some bots you want to execute the custom script.

**Characteristics**

| Name                       | Type                 | Minimum    | Maximum    |
| -------------------------- | -------------------- | ---------- | ---------- |
| Custom Script Toggle       | Toggle               | false      | true       |


**Usage**

1. Set the custom script toggle to true if you want to write a custom script to be applied to this bot. Otherwise leave set to false.
