
# Bot Settings

## Bot Parameters

### Select Bot Slot

**Description**: The current bot to modify data for.

**Characteristics**

| Type    | Minimum | Maximum |
| ------- | ------- | ------- |
| Integer | 0       | 11      |

**Menu Inputs**

| Input                    | Effect             |
| ------------------------ | ------------------ |
| Small Step Left          | -1                 |
| Small Step Right         | +1                 |
| Large Step Left (Hold)   | -1                 |
| Large Step Right         | +1                 |
| Cycle Subitem            | N/A                |
| Assign Vector            | N/A                |     

### Override from Slot

**Description**: Overrides the slot currently select slot with the data from the designated slot.

**Characteristics**
| Type    | Minimum | Maximum |
| ------- | ------- | ------- |
| Integer | 0       | 11      |

**Menu Inputs**

| Input                    | Effect                    |
| ------------------------ | -------------------------x |
| Small Step Left          | -1                        |
| Small Step Right         | +1                        |
| Large Step Left (Hold)   | Clear the Selected Slot   |
| Large Step Right (Hold)  | Override From Target Slot |
| Cycle Subitem            | N/A                       |
| Assign Vector            | N/A                       |

### Bot Hero Pool

**Description**: The list of heroes the bot has a chance of spawning as. The hero pool is sorted by release order to maintain backwards compatibility when new heroes are released.

**Characteristics**
| Type    | Minimum     | Maximum    |
| ------- | ----------- | ---------- |
| Integer | 0 (Tracer)  | 44? (Mauga) |


**Menu Inputs**

| Input                    | Effect                           |
| ------------------------ | -------------------------------- |
| Small Step Left          | Previous Hero                    |
| Small Step Right         | Next Hero                        |
| Large Step Left          | Disable / Enable All Heroes      |
| Large Step Right         | Disable / Enable Selected Heroes |
| Cycle Subitem            | N/A                              |
| Assign Vector            | N/A                              |

**Color**

Red: Current Bot Disabled

Green: Current Bot Enabled

### Health

#### Health %

**Description**: The Health of the Bot. Set to 0% to make the bot unkillable.

**Characteristics**
| Type    | Minimum             | Maximum |
| ------- | -------             | ------- |
| Integer | 0% (Unkillable)     | 1000%   |

**Menu Inputs**

| Input                    | Effect              |
| ------------------------ | ------------------- | 
| Small Step Left          | -1%                 |
| Small Step Right         | +1%                 |
| Large Step Left          | -10%                |
| Large Step Right         | +10%                |
| Cycle Subitem            | Select Next Subitem |
| Assign Vector            | N/A                 |  

#### HPS

**Description**: The amount of health the bot will recover every second. Set to 0 to disable.

**Characteristics**
| Type    | Minimum      | Maximum |
| ------- | ------------ | ------- |
| Integer | 0 (Disabled) | 1000    |

**Menu Inputs**

| Input                    | Effect              |
| ------------------------ | ------------------- | 
| Small Step Left          | -1                  |
| Small Step Right         | +1                  |
| Large Step Left          | -10                 |
| Large Step Right         | +10                 |
| Cycle Subitem            | Select Next Subitem |
| Assign Action            | N/A                 | 

#### Time Until Heal

**Description**: The amount of time to wait until the bot starts to heal. Set to 0 for continuous healing.

**Characteristics**

**Characteristics**
| Type    | Minimum         | Maximum |
| ------- | --------------- | ------- |
| Integer | 0s (Continuous) | 600s    |

**Menu Inputs**

| Input                    | Effect              |
| ------------------------ | ------------------- | 
| Small Step Left          | -1                  |
| Small Step Right         | +1                  |
| Large Step Left          | -10                 |
| Large Step Right         | +10                 |
| Cycle Subitem            | Select Next Subitem |
| Assign Action            | N/A                 | 

### Bot Scale

**Description**: Modify the size of the bot. 

#### Type

**Description**: Select the behavior of the bot scaling.

**Characteristics**

| Option | Description                                                                     |
| ------ | ------------------------------------------------------------------------------- |
| Static | The size of the bot remains the same throughout the scenario.                   |
| Loop   | Loop between the minimum and maximum values set over a given time.              |
| Random | Change the bot's size randomly over a set time.                                 |
| Health | Set the size of the bot based off the percentage of the bot's health remaining. |

**Menu Inputs**

| Input                    | Effect              |
| ------------------------ | ------------------  |
| Small Step Left          | Previous Option     |
| Small Step Right         | Next Option         |
| Large Step Left (Hold)   | Previous Option     |
| Large Step Right         | Next Option         |
| Cycle Subitem            | Select Next Subitem |
| Assign Action            | N/A                 |   

#### Min

**Description**: The minimum scale the bot can be.

**Characteristics**

| Type    | Minimum | Maximum |
| ------- | ------- | ------- |
| Integer | 1%      | 1000%   |

**Menu Inputs**

| Input                    | Effect              |
| ------------------------ | ------------------  |
| Small Step Left          | -1%                 |
| Small Step Right         | +1%                 |
| Large Step Left (Hold)   | -10%                |
| Large Step Right         | +10%                |
| Cycle Subitem            | Select Next Subitem |
| Assign Action            | N/A                 | 

#### Max

**Description**: The maximum scale the bot can be.

**Characteristics**

| Type    | Minimum | Maximum |
| ------- | ------- | ------- |
| Integer | 1%      | 1000%   |

**Menu Inputs**

| Input                    | Effect              |
| ------------------------ | ------------------  |
| Small Step Left          | -1%                 |
| Small Step Right         | +1%                 |
| Large Step Left (Hold)   | -10%                |
| Large Step Right         | +10%                |
| Cycle Subitem            | Select Next Subitem |
| Assign Action            | N/A                 | 

#### Time

**Description**: How long to wait between intervals.

**Characteristics**

| Type    | Minimum | Maximum |
| ------- | ------- | ------- |
| Real    | 0s      | 600s    |

**Menu Inputs**

| Input                    | Effect              |
| ------------------------ | ------------------  |
| Small Step Left          | -1s                  |
| Small Step Right         | +1s                  |
| Large Step Left (Hold)   | -10s                |
| Large Step Right         | +10s                |
| Cycle Subitem            | Select Next Subitem |
| Assign Action            | N/A                 | 

### Gravity

**Description**: How strong the gravity is on the bot.

**Characteristics**

| Type    | Minimum | Maximum |
| ------- | ------- | ------- |
| Integer | 0%      | 1000%   |

**Menu Inputs**

| Input                    | Effect              |
| ------------------------ | ------------------  |
| Small Step Left          | -1%                 |
| Small Step Right         | +1%                 |
| Large Step Left (Hold)   | -10%                |
| Large Step Right         | +10%                |
| Cycle Subitem            | N/A                 |
| Assign Action            | N/A                 | 

## Spawn and Boundaries

### Spawn Type

#### Type

**Description**: Select the type of spawning for bots.

**Characteristics**

| Option                   | Description                                            |
| ------------------------ | ------------------------------------------------------ |
| Position                 | Bot will spawn at the position set in the coordinates. |
| Random within Boundaries | Bot will spawns anywhere within the boundary box.      |

**Menu Inputs**

| Input                    | Effect                                                       |
| ------------------------ | ------------------------------------------------------------ |
| Small Step Left          | Previous Option                                              |
| Small Step Right         | Next Option                                                  |
| Large Step Left (Hold)   | Previous Option                                              |
| Large Step Right         | Next Option                                                  |
| Cycle Subitem            | Select Next Subitem                                          |
| Assign Action            | Populate the X, Y, and Z with the coordinates of the player. | 

#### Shape

**Description**: The shape of the boundary.

| Option                   | Description                                              |
| ------------------------ | -------------------------------------------------------- |
| Sphere                   | The boundaries will be a sphere around the set position. |
| Cube                     | The boundaries will be a cube around the set position.   |

### Spawn Position

#### X

**Description**: The X of the boundary box.

**Characteristics**

| Type    | Minimum | Maximum |
| ------- | ------- | ------- |
| Real    | -1000   | 1000    |

**Menu Inputs**

| Input                    | Effect                                                       |
| ------------------------ | -----------------------------------------------------------  |
| Small Step Left          | -0.01                                                        |
| Small Step Right         | +0.01                                                        |
| Large Step Left (Hold)   | -1                                                           |
| Large Step Right         | +1                                                           |
| Cycle Subitem            | Select Next Subitem                                          |
| Assign Action            | Populate the X,Y,Z coordinate of the player.                     |

#### Y

**Description**: The Y of the boundary box.

**Characteristics**

| Type    | Minimum | Maximum |
| ------- | ------- | ------- |
| Real    | -1000   | 1000    |

**Menu Inputs**

| Input                    | Effect                                                       |
| ------------------------ | -----------------------------------------------------------  |
| Small Step Left          | -0.01                                                        |
| Small Step Right         | +0.01                                                        |
| Large Step Left (Hold)   | -1                                                           |
| Large Step Right         | +1                                                           |
| Cycle Subitem            | Select Next Subitem                                          |
| Assign Action            | Populate the Y coordinate of the player.                     |

#### X

**Description**: The Z of the boundary box.

**Characteristics**

| Type    | Minimum | Maximum |
| ------- | ------- | ------- |
| Real    | -1000   | 1000    |

**Menu Inputs**

| Input                    | Effect                                                       |
| ------------------------ | -----------------------------------------------------------  |
| Small Step Left          | -0.01                                                        |
| Small Step Right         | +0.01                                                        |
| Large Step Left (Hold)   | -1                                                           |
| Large Step Right         | +1                                                           |
| Cycle Subitem            | Select Next Subitem                                          |
| Assign Action            | Populate the Z coordinate of the player.                     |

### Boundary Dimensions

#### Width

**Description**: The width of the boundary box.

**Characteristics**

| Type    | Minimum | Maximum |
| ------- | ------- | ------- |
| Real    | -1000   | 1000    |

**Menu Inputs**

| Input                    | Effect                                                       |
| ------------------------ | -----------------------------------------------------------  |
| Small Step Left          | -0.01                                                        |
| Small Step Right         | +0.01                                                        |
| Large Step Left (Hold)   | -1                                                           |
| Large Step Right         | +1                                                           |
| Cycle Subitem            | Select Next Subitem                                          |
| Assign Action            | Populate the X coordinate of the player.                     |

#### Length

**Description**: The length of the boundary box.

**Characteristics**

| Type    | Minimum | Maximum |
| ------- | ------- | ------- |
| Real    | -1000   | 1000    |

**Menu Inputs**

| Input                    | Effect                                                       |
| ------------------------ | -----------------------------------------------------------  |
| Small Step Left          | -0.01                                                        |
| Small Step Right         | +0.01                                                        |
| Large Step Left (Hold)   | -1                                                           |
| Large Step Right         | +1                                                           |
| Cycle Subitem            | Select Next Subitem                                          |
| Assign Action            | Populate the Y coordinate of the player.                     |

#### Height

**Description**: The height width of the boundary box.

**Characteristics**

| Type    | Minimum | Maximum |
| ------- | ------- | ------- |
| Real    | -1000   | 1000    |

**Menu Inputs**

| Input                    | Effect                                                       |
| ------------------------ | -----------------------------------------------------------  |
| Small Step Left          | -0.01                                                        |
| Small Step Right         | +0.01                                                        |
| Large Step Left (Hold)   | -1                                                           |
| Large Step Right         | +1                                                           |
| Cycle Subitem            | Select Next Subitem                                          |
| Assign Action            | Populate the Z coordinate of the player.                     |