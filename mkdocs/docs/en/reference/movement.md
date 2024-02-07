# Movement Settings

## Slot

### Select Profile Slot

**Description**

Select the profile slot to modify. All menu items below this option will be relative to the selected profile slot.

**Subitems**

| Name                       | Type                 | Minimum    | Maximum    |
| -------------------------- | -------------------- | ---------- | ---------- |
| Profile Slot               | Integer              | 0          | 11         |


**Usage**

1. Select the profile slot to modify

### Copy Current Profile to Slot

**Description**

Use the profile slot selected in select profile slot to override the selected profile slots(s)

**Subitems**

| Name                       | Type                 | Minimum    | Maximum    |
| -------------------------- | -------------------- | ---------- | ---------- |
| Profile Slot               | Integer              | 0          | 11         |


**Usage**

1. Cycle to the profile slot you would like to override.

    a. If you would like to override all profile slots with the current profile data use the jump right input

    b. If you would like to override the selected profile slot with the current profile data use jump right

2. Enter the special action button to confirm the override.

## Horizontal Movement

### Horizontal Type

**Description**

Configure the Subitems of the horizontal movement. Movement impulse and interval only apply when you are using the impulse movement type.

**Subitems**

| Name                       | Type                 | Minimum    | Maximum    |
| -------------------------- | -------------------- | ---------- | ---------- |
| Horizontal Type            | Choice               | N/A        | N/A        |

**Option Descriptions**

| Name                        | Description                                    |
| --------------------------- | ---------------------------------------------- |
| Input                       | The bot will input the direction via throttle when a direction is triggered. |
| Impulse                     | An impulse will be applied to the bot in the magnitude set over the entered interval |

**Usage**

Input:

1. Select the input horizontal type.

Impulse:

1. Select the impulse horizontal type.
2. Set the magnitude of the impulse
3. Set the interval of the impulse. The interval is how often the impulse will be applied to a bot.

**Notes**
* A low magnitude impulse applied over a short interval will result in a smoother movements.
* Impulse movement is more likely to break the boundary limits, especially with a longer interval since the bot has less often to counteract exceeding the boundaries.

### Left

**Description**

Sets the probability and timing of the bots left direction movement. Diagonal directions are calculated as the average of the two directions unless of the directions are disabled in which case the diagonal is disabled.

**Subitems**

| Name                       | Type                 | Minimum      | Maximum     |
| -------------------------- | -------------------- | ------------ | ----------- |
| Weight                     | Integer              | 0 (Disabled) | 1000        |
| Minimum Time               | Real                 | 0 seconds    | 600 seconds |
| Maximum Time               | Real                 | 0 points     | 600 seconds |


**Usage**

1. Set the weight. A weight of zero sets the direction as well as the diagonals containing that direction to disabled.
2. Set the minimum and maximum strafe time.

### Right

**Description**

Sets the probability and timing of the bots right direction movement. Diagonal directions are calculated as the average of the two directions unless of the directions are disabled in which case the diagonal is disabled.

**Subitems**

| Name                       | Type                 | Minimum      | Maximum     |
| -------------------------- | -------------------- | ------------ | ----------- |
| Weight                     | Integer              | 0 (Disabled) | 1000        |
| Minimum Time               | Real                 | 0 seconds    | 600 seconds |
| Maximum Time               | Real                 | 0 points     | 600 seconds |


**Usage**

1. Set the weight. A weight of zero sets the direction as well as the diagonals containing that direction to disabled.
2. Set the minimum and maximum strafe time.

### Forward

**Description**

Sets the probability and timing of the bots forward direction movement. Diagonal directions are calculated as the average of the two directions unless of the directions are disabled in which case the diagonal is disabled.

**Subitems**

| Name                       | Type                 | Minimum      | Maximum     |
| -------------------------- | -------------------- | ------------ | ----------- |
| Weight                     | Integer              | 0 (Disabled) | 1000        |
| Minimum Time               | Real                 | 0 seconds    | 600 seconds |
| Maximum Time               | Real                 | 0 points     | 600 seconds |


**Usage**

1. Set the weight. A weight of zero sets the direction as well as the diagonals containing that direction to disabled.
2. Set the minimum and maximum strafe time.

### Backward

**Description**

Sets the probability and timing of the bots backward direction movement. Diagonal directions are calculated as the average of the two directions unless of the directions are disabled in which case the diagonal is disabled.

**Subitems**

| Name                       | Type                 | Minimum      | Maximum     |
| -------------------------- | -------------------- | ------------ | ----------- |
| Weight                     | Integer              | 0 (Disabled) | 1000        |
| Minimum Time               | Real                 | 0 seconds    | 600 seconds |
| Maximum Time               | Real                 | 0 points     | 600 seconds |


**Usage**

1. Set the weight. A weight of zero sets the direction as well as the diagonals containing that direction to disabled.
2. Set the minimum and maximum strafe time.

## Vertical Movement

**Description**

Configure the Subitems of the vertical movement. Movement impulse and interval only apply when you are using the impulse movement type.

**Subitems**

| Name                       | Type                 | Minimum    | Maximum    |
| -------------------------- | -------------------- | ---------- | ---------- |
| Vertical Type              | Choice               | N/A        | N/A        |

**Option Descriptions**

| Name                        | Description                                    |
| --------------------------- | ---------------------------------------------- |
| Input                       | The bot will input the direction via throttle when a direction is triggered. |
| Impulse                     | An impulse will be applied to the bot in the magnitude set over the entered interval |

**Usage**

Input:

1. Select the input vertical type.

Impulse:

1. Select the impulse vertical type.
2. Set the magnitude of the impulse
3. Set the interval of the impulse. The interval is how often the impulse will be applied to a bot.

**Notes**
* A low magnitude impulse applied over a short interval will result in a smoother movements.
* Impulse movement is more likely to break the boundary limits, especially with a longer interval since the bot has less often to counteract exceeding the boundaries.

### Jump

**Description**

Set the probability and timing of the bot jumping. If the impulse vertical type is used an upwards impulse is applied instead.

**Subitems**

| Name                       | Type                 | Minimum      | Maximum     |
| -------------------------- | -------------------- | ------------ | ----------- |
| Chance                     | Integer              | 0 %          | 100 %       |
| Minimum Time               | Real                 | 0 seconds    | 600 seconds |
| Maximum Time               | Real                 | 0 points     | 600 seconds |
| Interval                   | Real                 | 0 seconds    | 600 seconds |


**Usage**

1. Set the chance of the bot jumping / having an upwards impulse applied.
2. Set the how long the bot will input the jump button / Have the upwards impulse applied.
3. Set the interval. The interval is how often the check of the chance of jump / impulse is done.

**Notes**

* Holding jump doesn't cause multiple jumps to occur so having a large min/max time only increase the delay between intervals.

### Crouch

**Description**

Set the probability and timing of the bot crouching. If the impulse vertical type is used a downwards impulse is applied instead.

**Subitems**

| Name                       | Type                 | Minimum      | Maximum     |
| -------------------------- | -------------------- | ------------ | ----------- |
| Chance                     | Integer              | 0 %          | 100 %       |
| Minimum Time               | Real                 | 0 seconds    | 600 seconds |
| Maximum Time               | Real                 | 0 points     | 600 seconds |
| Interval                   | Real                 | 0 seconds    | 600 seconds |


**Usage**

1. Set the chance of the bot crouching / having an upwards impulse applied.
2. Set the how long the bot will input the crouch button / Have the downwards impulse applied.
3. Set the interval. The interval is how often the check of the chance of crouch / impulse is done.

## Idle Movement

### Left/Right Idle

**Description**

Set the probability and timing of the the bot not inputting / having an impulse applied in the left and right directions. Also disabled diagonal movements.

**Subitems**

| Name                       | Type                 | Minimum      | Maximum     |
| -------------------------- | -------------------- | ------------ | ----------- |
| Chance                     | Integer              | 0 %          | 100 %       |
| Minimum Time               | Real                 | 0 seconds    | 600 seconds |
| Maximum Time               | Real                 | 0 points     | 600 seconds |
| Interval                   | Real                 | 0 seconds    | 600 seconds |


**Usage**

1. Set the chance of the bot having it's left and right inputs disabled.
2. Set the how long the left and right inputs will be disabled for.
3. Set the interval. The interval is how often the disable left and right input check will occur.

### Forward/Backward Idle

**Description**

Set the probability and timing of the the bot not inputting / having an impulse applied in the forward and backwards directions. Also disabled diagonal directions.

**Subitems**

| Name                       | Type                 | Minimum      | Maximum     |
| -------------------------- | -------------------- | ------------ | ----------- |
| Chance                     | Integer              | 0 %          | 100 %       |
| Minimum Time               | Real                 | 0 seconds    | 600 seconds |
| Maximum Time               | Real                 | 0 points     | 600 seconds |
| Interval                   | Real                 | 0 seconds    | 600 seconds |


**Usage**

1. Set the chance of the bot having it's forward and backward inputs disabled.
2. Set the how long the left and right inputs will be disabled for.
3. Set the interval. The interval is how often the disable forward and backward input check will occur.