using {/Verse.org/Simulation}
using {/UnrealEngine.com/Temporary/SceneGraph}
# Module import path: /UnrealEngine.com/EntityTestSuite
EntityTestSuite<public> := module:
    @hide_in_editor
    @experimental
    test_replication_component<native><epic_internal> := class<final_super>(component):


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