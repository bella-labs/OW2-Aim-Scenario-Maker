# Movement Settings

## Slot

### Select Profile Slot

**Description**

Select the profile slot to modify. All menu items below this option will be relative to the selected profile slot.

**Characteristics**

| Name                       | Type                 | Minimum    | Maximum    |
| -------------------------- | -------------------- | ---------- | ---------- |
| Profile Slot               | Integer              | 0          | 11         |


**Usage** 

1. Select the profile slot to modify

### Copy Current Profile to Slot

**Description**

Use the profile slot selected in select profile slot to override the selected profile slots(s)

**Characteristics**

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

Configure the characteristics of the horizontal movement. Movement impulse and interval only apply when you are using the impulse movement type.

**Characteristics**

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
* Impulse movement is more likely to break the boundary limitations, especially with a longer interval since the bot has less often to counteract exceeding the boundaries.

### Left

**Description**

Description

**Characteristics**

| Name                       | Type                 | Minimum    | Maximum    |
| -------------------------- | -------------------- | ---------- | ---------- |
| Name                       | Integer              | 0          | 11         |


**Usage** 

1. Do thing

### Right

**Description**

Description

**Characteristics**

| Name                       | Type                 | Minimum    | Maximum    |
| -------------------------- | -------------------- | ---------- | ---------- |
| Name                       | Integer              | 0          | 11         |


**Usage** 

1. Do thing

### Forward

**Description**

Description

**Characteristics**

| Name                       | Type                 | Minimum    | Maximum    |
| -------------------------- | -------------------- | ---------- | ---------- |
| Name                       | Integer              | 0          | 11         |


**Usage** 

1. Do thing

### Backward

**Description**

Description

**Characteristics**

| Name                       | Type                 | Minimum    | Maximum    |
| -------------------------- | -------------------- | ---------- | ---------- |
| Name                       | Integer              | 0          | 11         |


**Usage** 

1. Do thing

## Vertical Movement

### Vertical Type

**Description**

Description

**Characteristics**

| Name                       | Type                 | Minimum    | Maximum    |
| -------------------------- | -------------------- | ---------- | ---------- |
| Name                       | Integer              | 0          | 11         |


**Usage** 

1. Do thing

### Jump

**Description**

Description

**Characteristics**

| Name                       | Type                 | Minimum    | Maximum    |
| -------------------------- | -------------------- | ---------- | ---------- |
| Name                       | Integer              | 0          | 11         |


**Usage** 

1. Do thing

### Crouch

**Description**

Description

**Characteristics**

| Name                       | Type                 | Minimum    | Maximum    |
| -------------------------- | -------------------- | ---------- | ---------- |
| Name                       | Integer              | 0          | 11         |


**Usage** 

1. Do thing

## Idle Movement

### Left/Right Idle

**Description**

Description

**Characteristics**

| Name                       | Type                 | Minimum    | Maximum    |
| -------------------------- | -------------------- | ---------- | ---------- |
| Name                       | Integer              | 0          | 11         |


**Usage** 

1. Do thing

### Forward/Backward Idle

**Description**

Description

**Characteristics**

| Name                       | Type                 | Minimum    | Maximum    |
| -------------------------- | -------------------- | ---------- | ---------- |
| Name                       | Integer              | 0          | 11         |


**Usage** 

1. Do thing