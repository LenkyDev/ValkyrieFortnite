using {/Verse.org/Simulation}
using {/Fortnite.com/Game}
using {/Verse.org/SceneGraph}
# Module import path: /Fortnite.com/VerseFortniteTestSuite
VerseFortniteTestSuite<public> := module:
    @hide_in_editor
    @experimental
    fort_game_events_testing_component<native><epic_internal> := class<final_super>(component):
        var IsInGame<native><public>:logic = external {}

        var IsInRoundWarmup<native><public>:logic = external {}

        var IsInSimulation<native><public>:logic = external {}

        var IsRegistered<native><public>:logic = external {}

        var IsInRound<native><public>:logic = external {}

        var IsInRound2<native><public>:logic = external {}

        var GameEvents<native><public>:?fort_game_events_component = external {}

        OnAddedToScene<override>():void = external {}

        OnRemovingFromScene<override>():void = external {}

        OnBeginSimulation<override>():void = external {}

        OnEndSimulation<override>():void = external {}

        UnbindEvents<native_callable><protected>():void = external {}

    @hide_in_editor
    @experimental
    fort_round_manager_testing_component<native><epic_internal> := class<final_super>(component):
        var IsInSimulation<native><public>:logic = external {}

        var IsRegistered<native><public>:logic = external {}

        var IsInRound<native><public>:logic = external {}

        BeginRoundTaskEndTestEvent<native><public>:event(tuple()) = external {}

        OnAddedToScene<override>():void = external {}

        OnRemovingFromScene<override>():void = external {}

        OnBeginSimulation<override>():void = external {}

        OnEndSimulation<override>():void = external {}

        UnbindEvents<native_callable><protected>():void = external {}