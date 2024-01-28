def sce_start_scenario():
    @Name "SUB: sce_start_scenario"

    scenario_status = true

    elims = 0
    timer = databot.sce_game_limit
    chase(timer, 0, rate=1, ChaseReeval.DESTINATION_AND_RATE)


def sce_stop_scenario():
    @Name "SUB: sce_stop_scenario"

    stopChasingVariable(timer)
    elims = 0
    timer = 0
    scenario_status = false


rule "increment elims":
    @Event playerDealtFinalBlow
    @Team 1
    @Condition scenario_status 

    elims += 1


rule "set scenario in progress":
    @Event global
    #@Condition timer > 0

    scenario_in_progress = true
    waitUntil(timer == 0, 9999)
    scenario_in_progress = false