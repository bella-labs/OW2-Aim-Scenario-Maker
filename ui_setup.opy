def create_menu():

    menu_defaults()
    create_submenu_0()
    create_submenu_1()
    create_submenu_2()
    create_submenu_3()
    create_submenu_4()


def create_submenu_0():
    @Name "SUB: create_submenu_0"

    increment_for_menu_label()
    menu_label[menu_label_size] = "Configure"
    new_menu_label_header()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Bot ▶"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_off_opt_color[menu_opt_size] = menu_color_submenu
    new_menu_item_selection()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Movement ▶"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_off_opt_color[menu_opt_size] = menu_color_submenu
    new_menu_item_selection()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Scenario ▶"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_off_opt_color[menu_opt_size] = menu_color_submenu
    new_menu_item_selection()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Player ▶"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_off_opt_color[menu_opt_size] = menu_color_submenu
    new_menu_item_selection()

    increment_for_menu_label()
    menu_label[menu_label_size] = "Play"
    new_menu_label_header()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Test Bot in Slot"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()
    
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Test Scenario"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_selection()


def create_submenu_1():
    @Name "SUB: create_submenu_1"

    increment_for_submenu_item()

    increment_for_menu_label()
    menu_label[menu_label_size] = "Bot Settings"
    new_menu_label_header()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "◀ Main Menu"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_off_opt_color[menu_opt_size] = menu_color_submenu
    new_menu_item_selection()

    increment_for_menu_label()
    menu_label[menu_label_size] = "Slot"
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Current Bot Slot"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Copy From Bot Slot"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

    increment_for_menu_label()
    menu_label[menu_label_size] = "Parameters"
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Bot Hero Pool"
    menu_on_opt_title[menu_opt_size] = "Ana"
    menu_opt_var_1[menu_opt_size] = "Disabled"
    menu_opt_var_2[menu_opt_size] = ""
    menu_opt_var_3[menu_opt_size] = heroIcon(Hero.ANA)
    bar_color[menu_opt_size] = Color.RED
    new_menu_item_cycle_bar()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Bot health"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Bot Scale"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()
    
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Bot Speed"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Bot Gravity"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

    increment_for_menu_label()
    menu_label[menu_label_size] = "Spawn and Boundaries"
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Spawn Type"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "Default"
    new_menu_item_toggle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Position"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "X: 0"
    menu_opt_var_2[menu_opt_size] = "Y: 0"
    menu_opt_var_3[menu_opt_size] = "Z: 0"
    new_menu_item_cycle_3var()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Facing Type"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "Player"
    new_menu_item_toggle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Facing Offset"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "X: 0"
    menu_opt_var_2[menu_opt_size] = "Y: 0"
    menu_opt_var_3[menu_opt_size] = "Z: 0"
    new_menu_item_cycle_3var()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Lower Bound"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "X: 0"
    menu_opt_var_2[menu_opt_size] = "Y: 0"
    menu_opt_var_3[menu_opt_size] = "Z: 0"
    new_menu_item_cycle_3var()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Upper Bound"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "X: 0"
    menu_opt_var_2[menu_opt_size] = "Y: 0"
    menu_opt_var_3[menu_opt_size] = "Z: 0"
    new_menu_item_cycle_3var()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Distance"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "Min: 0"
    menu_opt_var_2[menu_opt_size] = "Max: 0"
    new_menu_item_cycle_2var()

    increment_for_menu_label()
    menu_label[menu_label_size] = "Movement Profile"
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Toggle Profiles"
    menu_on_opt_title[menu_opt_size] = "Profile"
    menu_opt_var_1[menu_opt_size] = "0: Off"
    new_menu_item_cycle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Randomize Profile Order"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "Off"
    new_menu_item_toggle()


def create_submenu_2():
    @Name "SUB: create_submenu_2"

    increment_for_submenu_item()

    increment_for_menu_label()
    menu_label[menu_label_size] = "Movement Profiles"
    new_menu_label_header()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "◀ Main Menu"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_off_opt_color[menu_opt_size] = menu_color_submenu
    new_menu_item_selection()

    increment_for_menu_label()
    menu_label[menu_label_size] = "Profile Data"
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Current Profile"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Override Profile"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

    increment_for_menu_label()
    menu_label[menu_label_size] = "Horizontal Movement"
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "AD Strafes"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "Off"
    new_menu_item_toggle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "AD Strafe Time"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "AD Strafe Speed"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Randomly Swap AD Strafe Speeds"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "Off"
    new_menu_item_toggle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "WS Strafes"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "Off"
    new_menu_item_toggle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "WS Strafe Time"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "WS Strafe Speed"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Randomly Swap WS Strafe Speeds"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "Off"
    new_menu_item_toggle()

    increment_for_menu_label()
    menu_label[menu_label_size] = "Vertical Movement"
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Gravity"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Jump Frequency"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Crouch Frequency"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Uncrouch Time"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "Min: 0"
    menu_opt_var_2[menu_opt_size] = "Max: 0"
    new_menu_item_cycle_2var()

    increment_for_menu_label()
    menu_label[menu_label_size] = "Advanced Movement"
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Use Impulse Profile"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "Off"
    new_menu_item_toggle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Maximize Crosshair Movement"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "Off"
    new_menu_item_toggle()

    increment_for_menu_label()
    menu_label[menu_label_size] = "Collision Reactions"
    menu_label_color[menu_label_size] = menu_color_label_subtext
    new_menu_label_subtext()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "React to Collisions"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "Off"
    new_menu_item_toggle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Threshold"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Reaction Time"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "React to Damage"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "Off"
    new_menu_item_toggle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Swap AD Directions"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "Off"
    new_menu_item_toggle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Swap AD Wait Time"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Swap WS Directions"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "Off"
    new_menu_item_toggle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Swap WS Wait Time"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()
    



def create_submenu_3():
    @Name "SUB: create_submenu_3"

    increment_for_submenu_item()

    increment_for_menu_label()
    menu_label[menu_label_size] = "Scenario Settings"
    new_menu_label_header()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "◀ Main Menu"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_off_opt_color[menu_opt_size] = menu_color_submenu
    new_menu_item_selection()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Score Type"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "Timed"
    menu_opt_var_2[menu_opt_size] = "60s"
    new_menu_item_cycle_2var()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Points Per Elimination"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Points Per Normal Hit"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Points Per Critical Hit"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Points Per Second for Strafes"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()
    
    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Max Time Per Strafe"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()


def create_submenu_4():
    @Name "SUB: create_submenu_4"

    increment_for_submenu_item()

    increment_for_menu_label()
    menu_label[menu_label_size] = "Player Settings"
    new_menu_label_header()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "◀ Main Menu"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_off_opt_color[menu_opt_size] = menu_color_submenu
    new_menu_item_selection()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Spawn Position"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "X: 0"
    menu_opt_var_2[menu_opt_size] = "Y: 0"
    menu_opt_var_3[menu_opt_size] = "Z: 0"
    new_menu_item_cycle_3var()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Spawn Facing"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "X: 0"
    menu_opt_var_2[menu_opt_size] = "Y: 0"
    menu_opt_var_3[menu_opt_size] = "Z: 0"
    new_menu_item_cycle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Lower Bound"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "X: 0"
    menu_opt_var_2[menu_opt_size] = "Y: 0"
    menu_opt_var_3[menu_opt_size] = "Z: 0"
    new_menu_item_cycle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Upper Bound"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = "X: 0"
    menu_opt_var_2[menu_opt_size] = "Y: 0"
    menu_opt_var_3[menu_opt_size] = "Z: 0"
    new_menu_item_cycle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Player Speed"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Player Gravity"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    new_menu_item_cycle()

    increment_for_menu_item()
    menu_off_opt_title[menu_opt_size] = "Player Impulse Profile"
    menu_on_opt_title[menu_opt_size] = menu_off_opt_title[menu_opt_size]
    menu_opt_var_1[menu_opt_size] = ": off"
    new_menu_item_toggle()

