globalvar hitscan_mode
globalvar hitscan_fire_rate
globalvar hitscan_damage
globalvar hitscan_max_ammo
globalvar hitscan_reload_time
globalvar hitscan_reload_type

playervar hitscan_player
playervar hitscan_ammo
playervar hitscan_timer

rule "Hitscan Mode Settings (Not very useful since latency dependant hitreg)":
    @Event global

    hitscan_mode = createWorkshopSetting(bool, "True Hitscan Mode", "True Hitscan Mode", false, 0)
    hitscan_fire_rate = createWorkshopSetting(float[0:300], "True Hitscan Mode", "Fire Rate", 0, 1)
    hitscan_damage = createWorkshopSetting(float[0:1000], "True Hitscan Mode", "Damage", 0, 1)
    hitscan_max_ammo = createWorkshopSetting(int[0:1000], "True Hitscan Mode", "Maximum Ammo (0 = Infinite)", 0, 2)
    hitscan_reload_time = createWorkshopSetting(float[0:300], "True Hitscan Mode", "Reload Wait", 0, 3)
    hitscan_reload_type = createWorkshopSetting(enum["Normal", "Instant Reload on Hit"], "True Hitscan Mode", "Reload Type", 0, 4)


rule "hitscan mode override":
    @Event global

    wait(5)
    hitscan_mode = true
    hitscan_fire_rate = 0.5
    hitscan_damage = 50
    hitscan_max_ammo = 5
    hitscan_reload_time = 2
    hitscan_reload_type = 0


rule "Hitscan Mode Ammo HUD":
    @Event global
    @Condition hitscan_mode
    @Condition hitscan_max_ammo > 0

    progressBarHud([i for i in localPlayer],
        localPlayer.hitscan_timer / hitscan_reload_time * 100,
        "Ammo: {0} / {1}".format(localPlayer.hitscan_ammo, hitscan_max_ammo),
        HudPosition.RIGHT,
        -9999,
        Color.BLACK,
        Color.BLACK,
        ProgressHudReeval.
        VISIBILITY_VALUES_AND_COLOR,
        SpecVisibility.DEFAULT)


rule "Disable Primary Fire":
    @Event eachPlayer
    @Team 1
    @Condition hitscan_mode
    @Condition eventPlayer.hasSpawned()

    eventPlayer.disallowButton(Button.PRIMARY_FIRE)
    if hitscan_max_ammo > 0:
        eventPlayer.hitscan_ammo = hitscan_max_ammo


rule "Record Hitscan Hit":
    @Event eachPlayer
    @Team 1
    @Condition hitscan_mode

    waitUntil(eventPlayer.isHoldingButton(Button.PRIMARY_FIRE), 9999)
    eventPlayer.hitscan_player = raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 100, getAllPlayers(), eventPlayer, false).getPlayerHit()
    if eventPlayer.hitscan_player != null:
        playEffect(eventPlayer, DynamicEffect.BUFF_EXPLOSION_SOUND, Color.TEAM_1, eventPlayer, 100)
        if hitscan_damage > 0:
            damage(eventPlayer.hitscan_player, eventPlayer, hitscan_damage)
        if scenario_status:
            eventPlayer.player_score += databot.sce_bs_points
        if hitscan_reload_type == 1:
            eventPlayer.hitscan_ammo = hitscan_max_ammo
        else:
            eventPlayer.hitscan_ammo -= 1
    else:
        playEffect(eventPlayer, DynamicEffect.DEBUFF_IMPACT_SOUND, Color.TEAM_1, eventPlayer, 100)
        eventPlayer.hitscan_ammo -= 1

    if eventPlayer.hitscan_ammo == 0:
        smallMessage(eventPlayer, "    Reloading!")
        eventPlayer.hitscan_timer = hitscan_reload_time
        chase(eventPlayer.hitscan_timer, 0, rate=1, ChaseReeval.DESTINATION_AND_RATE)
        wait(hitscan_reload_time)
        eventPlayer.hitscan_ammo = hitscan_max_ammo

    wait(hitscan_fire_rate)

    if RULE_CONDITION:
        goto RULE_START
