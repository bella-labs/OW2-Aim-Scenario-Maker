def import_settings():
    @Name "----->  Paste Export Data Here / 여기에 플레이어 변수를 붙여넣으세요 / 將您的玩家變數貼到此處  <-----"

    smallMessage(null, "paste here! / 여기에 붙여넣으세요! / 貼在這裡！")


rule "Custom Scoring Example":
    @Event eachPlayer
    @Team 1


rule "Custom Player Movement Example":
    @Event eachPlayer
    @Team 1


rule "Custom Bot Script Example":
    @Event eachPlayer
    @Team 2

    