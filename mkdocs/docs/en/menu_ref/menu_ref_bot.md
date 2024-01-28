
# Bot Settings

## Bot Slot

### Select Bot Slot

**Description**

Select the bot you would like to modify, and enable/disable them in the scenario. You may have up to 12 bots in a scenario. The options below this setting are all be relative to the bot slot selected.

**Characteristics**

| Name                       | Type                 | Minimum    | Maximum    |
| -------------------------- | -------------------- | ---------- | ---------- |
| Slot                       | Integer              | 0          | 11         |
| Status                     | Boolean              | false      | true       |

**Menu Inputs**

| Input              | Effect                                                 |
| ------------------ | ------------------------------------------------------ |
| Step Left          | -1                                                     |
| Step Right         | +1                                                     |
| Jump Left          | Toggle All                                             |
| Jump Right         | Toggle Selected                                        |
| Previous Subitem   | N/A                                                    |
| Next Subitem       | N/A                                                    |
| Special Action     | N/A                                                    |
| Cycle Override     | Maximum Cycle Speed                                    |

**Usage** 

1. Step left and right to select the bot you would configure.
2. Enable / disable the bot slot(s).

    a. Jump left to enable all bots. 
    
    b. Jump right to enable the bot currently selected.

### Override from Slot

**Description**

Overrides the slot selected with data from this slot. After entering a Jump input enter the special action input to confirm.

**Characteristics**

| Name                       | Type                 | Minimum    | Maximum    |
| -------------------------- | -------------------- | ---------- | ---------- |
| Slot                       | Integer              | 0          | 11         |

**Menu Inputs**

| Input              | Effect                                                 |
| ------------------ | ------------------------------------------------------ |
| Step Left          | Previous Slot                                          |
| Step Right         | Next Slot                                              |
| Jump Left          | Override all slots with data from the current slot     |
| Jump Right         | Override the selected with data from the current slot  |
| Previous Subitem   | N/A                                                    |
| Next Subitem       | N/A                                                    |
| Special Action     | Confirm Override                                       |
| Cycle Override     | Maximum Cycle Speed                                    |

**Usage** 

1. Step left and right to select the bot you would configure.
2. Override the slot

    a. Jump left to override all slots with the currently selected data. 
    
    b. Jump right to override the selected slots with the currently selected data. 

## Bot Spawn and Boundaries

## Bot Parameters






















##### TEMPLATE

**Description**

Description

**Characteristics**

| Name                       | Type                 | Minimum    | Maximum    |
| -------------------------- | -------------------- | ---------- | ---------- |
| Name                       | Integer              | 0          | 11         |

**Menu Inputs**

| Input              | Effect                                                 |
| ------------------ | ------------------------------------------------------ |
| Step Left          | -1                                                     |
| Step Right         | +1                                                     |
| Jump Left          | Toggle All                                             |
| Jump Right         | Toggle Selected                                        |
| Previous Subitem   | N/A                                                    |
| Next Subitem       | N/A                                                    |
| Special Action     | N/A                                                    |
| Cycle Override     | Maximum Cycle Speed                                    |

**Usage** 

1. Do thing