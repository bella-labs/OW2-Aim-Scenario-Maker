def stats_start_stat_tracking():
    @Name "SUB: stats_start_stat_tracking"

    stat_tracking_status = true

    elims = 0
    timer = databot.sce_game_limit
    chase(timer, 0, rate=1, ChaseReeval.DESTINATION_AND_RATE)


def stats_stop_stat_tracking():
    @Name "SUB: stats_stop_stat_tracking"

    stopChasingVariable(timer)
    elims = 0
    timer = 0
    stat_tracking_status = false


rule "increment elims":
    @Event playerDealtFinalBlow
    @Team 1
    @Condition stat_tracking_status == true

    elims += 1