
# Main Menu

## Configure

### Scenario
**Description**

Opens the Scenario Settings submenu.

**Usage**

1. Enter an input option to open the scenario settings submenu.

### Bots
**Description**

Opens the Bots Settings submenu.

**Usage**

1. Enter an input option to open the bot settings submenu.

### Profiles
**Description**

Opens the Profile Settings submenu.

**Usage**

1. Enter an input option to open the movement profile settings submenu.

## Test

### Change Hero

**Description**

Returns the player to the hero select screen.

**Usage**

1. Enter an input to open the hero select screen.

### Show Boundary UI

**Description**

Keeps the spawn and boundary effects visible even when the menu is closed.

**Usage**

1. Toggle to enable/disable the spawn and boundary effects.

### Test Bot in Slot

**Description**

Toggles spawning and destroying bot(s).

**Characteristics**

| Name                       | Type                 | Minimum    | Maximum    |
| -------------------------- | -------------------- | ---------- | ---------- |
| Slot                       | Integer              | 0          | 11         |

**Usage**

1a. Enter toggle left to enable/disable all bots with that have their slots enabled in the bot settings.
1b.  Enter toggle right to enable/disable the bot in the selected slot if it is enabled in the bot settings.

### Start Scenario

**Description**

Toggles starting and stopping the scenario.

**Characteristics**

| Name                       | Type                 | Minimum    | Maximum    |
| -------------------------- | -------------------- | ---------- | ---------- |
| Start/Stop Scenario        | Toggle               | Disabled   | Enabled    |

**Usage**

1. Toggle to start/stop the scenario.

## Export Instructions

### Toggle Export Instructions

**Description**

Toggles showing the instructions to save the scenario on the left side of the hud.

**Characteristics**

| Name                       | Type                 | Minimum    | Maximum    |
| -------------------------- | -------------------- | ---------- | ---------- |
| Export Instructions        | Toggle               | Disabled   | Enabled    |

**Usage**

1. Enter an input display/hide the export instructions.

### Toggle Import Instructions

**Description**

Toggles showing the instructions to import the scenario on the left side of the hud.

**Characteristics**

| Name                       | Type                 | Minimum    | Maximum    |
| -------------------------- | -------------------- | ---------- | ---------- |
| Import Instructions        | Toggle               | Disabled   | Enabled    |

**Usage**

1. Enter an input to display/hide the import instructions.