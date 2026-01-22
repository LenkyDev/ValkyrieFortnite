# Module import path: /UnrealEngine.com/EntityTestSuite
EntityTestSuite<public> := module:
    using {/Verse.org/Assets}
    using {/Verse.org/Temporary/EpicGamesRestricted/Network}
    using {/Verse.org/Simulation}
    using {/Verse.org/SceneGraph}
    @hide_in_editor
    test_contentscope_events_component<native><epic_internal> := class<final_super>(component):
        KeyframeReachedEvent<native><public>:listenable(tuple()) = external {}

        OnBeginSimulation<override>():void = external {}

    @hide_in_editor
    test_contentscope_execution_component<native><epic_internal> := class<final_super>(component):
        OnBeginSimulation<override>():void = external {}

    @hide_in_editor
    test_replication_component<native><epic_internal> := class<final_super>(component):
        @replicated("")
        var<private> TestReplicatedSubObject<native><epic_internal>:?test_replication_object = external {}

    @hide_in_editor
    test_replication_object<native><epic_internal> := class:


    @hide_in_editor
    test_component_dependency_init<native><epic_internal> := class<final_super>(component):
        @replicated("")
        var AutoComponent<native><epic_internal>:?component = external {}

    @hide_in_editor
    test_component_dependency_auto<native><epic_internal> := class<final_super>(component):


    @hide_in_editor
    test_component_replication_settings<native><epic_internal> := class<final_super>(component):


    @hide_in_editor
    test_stable_entity<native><epic_internal> := class<concrete><unique><transacts>(entity):


    @hide_in_editor
    test_stable_component<native><epic_internal> := class<final_super>(component):


    @hide_in_editor
    test_netculldistance<native><epic_internal> := class<final_super>(component):
        OnSimulate<override>()<suspends>:void = external {}

    @hide_in_editor
    test_component_never_replicate_condition<native><epic_internal> := class<final_super>(component):


    @hide_in_editor
    test_component<native><epic_internal> := class<final_super>(component):


    @hide_in_editor
    derived_test_component<native><epic_internal> := class(test_component):


    @hide_in_editor
    second_derived_test_component<native><epic_internal> := class(test_component):


    @hide_in_editor
    lambda_test_component<native><epic_internal> := class<final_super>(component):
        OnInitializedInternal<native><override>():void

        OnAddedToSceneInternal<native><override>():void

        OnBeginSimulationInternal<native><override>():void

        OnEndSimulationInternal<native><override>():void

        OnRemovingFromSceneInternal<native><override>():void

        OnUninitializingInternal<native><override>():void

        OnSimulate<override>()<suspends>:void = external {}

    @hide_in_editor
    lambda_test_component_2<native><epic_internal> := class<final_super>(component):
        OnInitializedInternal<native><override>():void

        OnAddedToSceneInternal<native><override>():void

        OnBeginSimulationInternal<native><override>():void

        OnEndSimulationInternal<native><override>():void

        OnRemovingFromSceneInternal<native><override>():void

        OnUninitializingInternal<native><override>():void

        OnSimulate<override>()<suspends>:void = external {}

    @hide_in_editor
    test_material_component<native><epic_internal> := class<final_super>(component):
        OnBeginSimulation<override>():void = external {}

    @hide_in_editor
    test_material<native><epic_internal> := class(material):
        ___PropertyInterface_On_BaseColor_Changed<epic_internal>():void = external {}