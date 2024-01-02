def act_main_open_hero_sel():
    @Name "SUB: act_main_open_hero_sel"

    eventPlayer.setAllowedHeroes(eventPlayer.getAllowedHeroes().exclude(eventPlayer.getCurrentHero()))
    eventPlayer.resetHeroAvailability()


def act_main_toggle_import():
    @Name "SUB: act_main_toggle_import"

    display_help[0] = not display_help[0]

    action_var = display_help[0]
    action_var_2 = menu_index
    action_var_3 = OPTIONS_TYPE.TOGGLE
    act_general_toggle_var_1()

    
def act_main_toggle_export():
    @Name "SUB: act_main_toggle_export"

    display_help[1] = not display_help[1]

    action_var = display_help[0]
    action_var_2 = menu_index
    action_var_3 = OPTIONS_TYPE.TOGGLE
    act_general_toggle_var_1()

    