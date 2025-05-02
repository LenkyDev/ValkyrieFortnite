using {/Verse.org/Temporary/EpicGamesRestricted/Network}
using {/Verse.org/Simulation}
using {/Verse.org/SceneGraph}
# Module import path: /UnrealEngine.com/EntityTestSuite
EntityTestSuite<public> := module:
    @hide_in_editor
    @experimental
    test_contentscope_events_component<native><epic_internal> := class<final_super>(component):
        KeyframeReachedEvent<native><public>:listenable(tuple()) = external {}

        OnBeginSimulation<override>():void = external {}

    @hide_in_editor
    @experimental
    test_contentscope_execution_component<native><epic_internal> := class<final_super>(component):
        OnBeginSimulation<override>():void = external {}

    @hide_in_editor
    @experimental
    test_replication_component<native><epic_internal> := class<final_super>(component):
        @replicated("")
        var<private> TestReplicatedSubObject<native><epic_internal>:?test_replication_object = external {}

    @hide_in_editor
    @experimental
    test_replication_object<native><epic_internal> := class:


    @hide_in_editor
    @experimental
    test_component<native><epic_internal> := class<final_super>(component):


    @hide_in_editor
    @experimental
    derived_test_component<native><epic_internal> := class(test_component):


    @hide_in_editor
    @experimental
    second_derived_test_component<native><epic_internal> := class(test_component):


    @hide_in_editor
    @experimental
    lambda_test_component<native><epic_internal> := class<final_super>(component):
        OnInitializedInternal<native><override>():void

        OnAddedToSceneInternal<native><override>():void

        OnBeginSimulationInternal<native><override>():void

        OnEndSimulationInternal<native><override>():void

        OnRemovingFromSceneInternal<native><override>():void

        OnUninitializingInternal<native><override>():void

        OnSimulate<override>()<suspends>:void = external {}

    @hide_in_editor
    @experimental
    lambda_test_component_2<native><epic_internal> := class<final_super>(component):
        OnInitializedInternal<native><override>():void

        OnAddedToSceneInternal<native><override>():void

        OnBeginSimulationInternal<native><override>():void

        OnEndSimulationInternal<native><override>():void

        OnRemovingFromSceneInternal<native><override>():void

        OnUninitializingInternal<native><override>():void

        OnSimulate<override>()<suspends>:void = external {}