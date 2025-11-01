using {/Verse.org/Simulation}
# # Leaderboard that supports a `GetTop` implementation that only returns the data needed to display the leaderboard.
# # Leaderboard that supports a `GetTop` implementation that only returns the data needed to display the leaderboard.
player_leaderboard<native><epic_internal> := class<computes><final>:
    WriteStat<native><public>(Player:player, Value:float):void

    GetTop<native><public>(Limit:int):[]tuple(int, message, float)

    VersePath<native><epic_internal>:string = external {}