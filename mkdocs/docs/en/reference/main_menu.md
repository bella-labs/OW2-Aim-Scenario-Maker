
# Main Menu

## Configure

The three options under the configure label will open submenus that are used to design your scenario.

### Scenario

**Description**

This submenu contains settings that allow you to adjust the player's initial spawn, the scenario scoring, the end condition of the scenario as well as other settings.

**Usage**

1. Enter any input option to open the scenario settings submenu.
2. To return from this submenu select the "Main Menu" menu item in the scenario settings submenu.

### Bot

**Description**

This submenu contains settings that allow you to adjust modifiers to 12 separate bots, and how the bot uses the movement profiles set in the movement submenu. Modifiers include the spawn point and boundaries of the bot, the hero pool of the bot, the speed, scale, and gravity applied to the bot.

**Usage**

1. Enter an input option to open the bot settings submenu.
2. To return from this submenu select the "Main Menu" menu item in the bot settings submenu.

### Movement

**Description**

This submenu allows you to customized up to 12 separate movement profiles. Movement parameters include timing and weights of horizontal movement, chance of crouches and jumps, horizontal idling chance, and special option to replace both horizontal and vertical movement with movement done through impulses which allow for movement not possible using just player inputs.

**Usage**

1. Enter an input option to open the movement profile settings submenu.
2. To return from this submenu select the "Main Menu" menu item in the movement settings submenu.

## Test

### Open Hero Select

**Description**

Returns the player to the hero select screen.

**Usage**

1. Enter an input to open the hero select screen.

### Display Boundaries

**Description**

Keeps the spawn and boundary effects visible even when the menu is closed. I mainly used this for debugging boundary logic, but having the "walls" be visible is nice.

**Usage**

1. Toggle on to always display the boundary effect regardless of where the menu cursor is placed.
2. Toggle off to turn of the persistent effects. The effects will still be visible when the menu cursor is placed on fields that modify the spawn and boundaries.

### Test Bot in Slot

**Description**

Allows you to manually toggle on and off each bot at each individual bot slot. Useful to testing your movement profile and bot configurations. Only bots which have their bot slot set to enabled in the bot settings menu can be toggled using this option.

**Subitems**

| Name                       | Type                 | Minimum    | Maximum    |
| -------------------------- | -------------------- | ---------- | ---------- |
| Slot                       | Integer              | 0          | 11         |

**Usage**

1. Cycle to the bot you would like to test.

2.

a. Enter toggle left to enable/disable all bots that have their slots enabled in the bot settings.

b. Enter toggle right to enable/disable the bot in the selected slot if it is enabled in the bot settings.

### Test Scenario

**Description**

Starts and stops the scenario.

**Subitems**

| Name                       | Type                 | Minimum    | Maximum    |
| -------------------------- | -------------------- | ---------- | ---------- |
| Start/Stop Scenario        | Toggle               | Disabled   | Enabled    |

**Usage**

1. Toggle to start/stop the scenario.

## Export and Share

### Export to Index

**Description**

Export to index is how data from your scenario is exported for use in the aim scenario player. First you can select the index you would like to export your scenario data to.

**Usage**

### Display Export Instructions

**Description**

Toggles showing the instructions to save the scenario on the left side of the hud.

**Subitems**

| Name                       | Type                 | Minimum    | Maximum    |
| -------------------------- | -------------------- | ---------- | ---------- |
| Export Instructions        | Toggle               | Disabled   | Enabled    |

**Usage**

1. Enter an input display/hide the export instructions.

### Display Import Instructions

**Description**

Toggles showing the instructions to import the scenario on the left side of the hud.

**Subitems**

| Name                       | Type                 | Minimum    | Maximum    |
| -------------------------- | -------------------- | ---------- | ---------- |
| Import Instructions        | Toggle               | Disabled   | Enabled    |

**Usage**

1. Enter an input to display/hide the import instructions.