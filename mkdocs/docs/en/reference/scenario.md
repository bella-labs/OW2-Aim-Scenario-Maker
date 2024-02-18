# Scenario Settings

## Player

### Spawn Position

**Description**

The position the player spawns at when the scenario starts.

**Subitems**

| Name                       | Type                 | Minimum    | Maximum    |
| -------------------------- | -------------------- | ---------- | ---------- |
| X                          | Real                 | -1000      | 1000       |
| Y                          | Real                 | -1000      | 1000       |
| Z                          | Real                 | -1000      | 1000       |

**Usage**

1. Use a combination of the set player to vector custom action and manually assigning the value of each X, Y, and Z component.

### Spawn Facing

**Description**

The direction the player faces when the scenario starts. The vector is normalized when applied to the player.

**Subitems**

| Name                       | Type                 | Minimum    | Maximum    |
| -------------------------- | -------------------- | ---------- | ---------- |
| X                          | Real                 | -1000      | 1000       |
| Y                          | Real                 | -1000      | 1000       |
| Z                          | Real                 | -1000      | 1000       |


**Usage**

1. Use a combination of the set player to vector custom action and manually assigning the value of each X, Y, and Z component.

### Speed

**Description**

The Player's movement speed. Set to 0 to prevent the player from moving away from the spawn position.

**Subitems**

| Name                       | Type                 | Minimum    | Maximum    |
| -------------------------- | -------------------- | ---------- | ---------- |
| Name                       | Integer              | 0%         | 1000%      |


**Usage**

1. Set the players speed to the desired multiplier.

### Gravity

**Description**

The gravity applied to the player. Set to 0% to have the player float.

**Subitems**

| Name                       | Type                 | Minimum    | Maximum    |
| -------------------------- | -------------------- | ---------- | ---------- |
| Name                       | Integer              | 0%         | 1000%      |


**Usage**

1. Do thing

## Scoring

### Scenario Type

**Description**

Set the type of scenario as well as the end condition for the scenario.

**Subitems**

| Name                       | Type                 | Minimum    | Maximum     |
| -------------------------- | -------------------- | ---------- | ----------- |
| Scenario Type              | Choice               | N/A        | N/A         |
| Time (If type is timed)     | Real                 | 0 seconds  | 600 seconds |
| Points (If type is scored) | Integer              | 0 points   | 1000 points |

**Option Descriptions**

| Name                        | Description                                    |
| --------------------------- | ---------------------------------------------- |
| Timed                       | The scenario will end once the time set runs out.    |
| Player                      | The scenario will end once the player reaches the set score.  |

**Usage**

1. Set the scenario type.
2. Set the limit for the scenario.

### Bot Respawn

**Description**

Set respawn type and wait time between bot spawns.

**Subitems**

| Name                       | Type                 | Minimum    | Maximum     |
| -------------------------- | -------------------- | ---------- | ----------- |
| Respawn Type               | Choice               | N/A        | N/A         |
| Minimum Time               | Real                 | 0 seconds  | 600 seconds (Does not account for game respawn timer) |
| Maximum Time               | Real                 | 0 points   | 600 seconds (Does not account for game respawn timer) |

**Option Descriptions**

| Name                        | Description                                    |
| --------------------------- | ---------------------------------------------- |
| Simultaneous                | The bots will all be spawned at the same time. |
| In-Order                    | Only one bot will be visible at a time, in the order of the bot slot. |
**Usage**

1. Set the scenario type
2. Set the minimum and maximum respawn time.


### Points

**Description**

Assign the points the player earns for bodyshots, headshots, and eliminations.

**Subitems**

| Name                       | Type                 | Minimum    | Maximum    |
| -------------------------- | -------------------- | ---------- | ---------- |
| Bodyshots                  | Integer              | 0          | 1000       |
| Headshots                  | Integer              | 0          | 1000       |
| Elims                      | Integer              | 0          | 1000       |

**Usage**

1. Assign the points.

### Strafe Points

**Description**

Assign the points the player receives for strafing, if the player swaps strafe direction the timer is reset. The player does not earn points if they are strafing in the same direction for less than the minimum time or longer than the maximum time.

**Subitems**

| Name                       | Type                 | Minimum    | Maximum     |
| -------------------------- | -------------------- | ---------- | ----------- |
| Points Per Second          | Integer              | 0          | 1000        |
| Minimum Time               | Real                 | 0 seconds  | 600 seconds |
| Maximum Time               | Real                 | 0 points   | 600 seconds |


**Usage**

1. Set the points earned per second.
2. Set the minimum and maximum time for a strafe to receive points.

### Custom Script

**Description**

Causes the player to perform a custom script. The scenario designer must use workshop actions to define what this script does. The default script applies an upwards impulse to the player.

**Subitems**

| Name                       | Type                 | Minimum    | Maximum    |
| -------------------------- | -------------------- | ---------- | ---------- |
| Use Custom Script          | Toggle               | False      | True       |


**Usage**

1. Toggle weather to apply a custom script to the player.