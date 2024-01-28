
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

1. Select the facing type. If you are not using the fixed facing type there is no need to configure the facing direction.
2. If you are using the fixed facing position you may set the facing vector in one of two ways:

    a. Use the special action "Set Vector to Current" to populate the facing vector with the players facing direction.

    b. Manually enter each X, Y, and Z coordinate of the facing direction. The facing direction will be normalized when when applied to the bot.
    
### Speed

### Scale

### Gravity

## Movement Profiles

### Profile Status

### Profile Order

### Script



















##### TEMPLATE

**Description**

Description

**Characteristics**

| Name                       | Type                 | Minimum    | Maximum    |
| -------------------------- | -------------------- | ---------- | ---------- |
| Name                       | Integer              | 0          | 11         |


**Usage** 

1. Do thing