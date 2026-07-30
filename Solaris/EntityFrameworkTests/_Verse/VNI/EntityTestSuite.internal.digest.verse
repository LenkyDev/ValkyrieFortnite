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
    test_not_replicated_component<native><epic_internal> := class<final_super>(component):


    @hide_in_editor
    test_stable_entity<native><epic_internal> := class<concrete><unique><transacts>(entity):


    @hide_in_editor
    test_base_replicated_component<native><epic_internal> := class<final_super>(component):


    @hide_in_editor
    test_dynamic_component<native><epic_internal> := class<final_super>(test_base_replicated_component):


    @hide_in_editor
    test_stable_component<native><epic_internal> := class<final_super>(test_base_replicated_component):


    @hide_in_editor
    test_netculldistance<native><epic_internal> := class<final_super>(component):
        OnSimulate<override>()<suspends>:void = external {}

    @hide_in_editor
    test_component_never_replicate_condition<native><epic_internal> := class<final_super>(component):


    @hide_in_editor
    test_component_netgroup_condition<native><epic_internal> := class<final_super>(component):


    @hide_in_editor
    test_entity_creationorder<native><epic_internal> := class<final_super>(entity):


    @hide_in_editor
    test_stable_subobject<native><epic_internal> := class:


    @hide_in_editor
    test_subobject_with_subobject<native><epic_internal> := class:


    @hide_in_editor
    test_component_creationorder_first<native><epic_internal> := class<final_super>(component):


    @hide_in_editor
    test_component_creationorder_second<native><epic_internal> := class<final_super>(component):


    @hide_in_editor
    test_component_creationorder_third<native><epic_internal> := class<final_super>(component):


    @hide_in_editor
    test_component_creationorder_embedded<native><epic_internal> := class<final_super>(component):


    @hide_in_editor
    test_entity_with_variables<native><epic_internal> := class<final_super>(entity):


    @hide_in_editor
    test_component<native><epic_internal> := class<final_super>(component):


    @hide_in_editor
    test_component_2<native><epic_internal> := class<final_super>(component):


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
    property_component<native><epic_internal> := class<final_super>(component):
        @editable
        Integer<native><public>:int = external {}

        @editable
        String<native><public>:string = external {}

    @hide_in_editor
    derived_entity<epic_internal> := class<concrete>(entity):


    @hide_in_editor
    test_entity<native><epic_internal> := class<concrete>(entity):


    @hide_in_editor
    derived_test_entity<native><epic_internal> := class<concrete>(test_entity):


    @hide_in_editor
    overridden_test_entity<native><epic_internal> := class<concrete>(test_entity):


    test_rootobject_component<native><epic_internal> := class<final_super>(component):
        @editable {}
        @display_name("StableRootObject")
        @replicated("")
        var<public> TestRootObject<native><epic_internal>:?test_rootobject = external {}

    test_rootobject<native><epic_internal> := class:


    @hide_in_editor
    test_rootobject_holder_component<native><epic_internal> := class<final_super>(component):
        @replicated("")
        var HeldRootObject<native><epic_internal>:?test_rootobject = external {}

    @hide_in_editor
    test_material_component<native><epic_internal> := class<final_super>(component):
        OnBeginSimulation<override>():void = external {}

    @hide_in_editor
    test_material<native><epic_internal> := class(material):
        ___PropertyInterface_On_BaseColor_Changed<epic_internal>():void = external {}

    @hide_in_editor
    test_different_material_component<native><epic_internal> := class<final_super>(component):


    # Module import path: /UnrealEngine.com/EntityTestSuite/TestPhysicsHook
    TestPhysicsHook<epic_internal> := module:
        using {/Verse.org/Assets}
        using {/Verse.org/SpatialMath}
        using {/Verse.org/Simulation}
        using {/Verse.org/SceneGraph}
        using {/Verse.org/Native}
        @available {MinUploadedAtFNVersion := 4100}
        physics_test<epic_internal> := enum<open>:
            Test_SetDynamic
            Test_ApplyLinearImpulse
            Test_LUF
            Test_CollisionEvents
            Test_OverlapEnteredEventFires
            Test_OverlapExitedEventFires
            Test_OverlapPerMeshPartScoping
            Test_OverlapHitPayload
            Test_FindOverlapHits_MeshParts
            Test_FindSweepHits_MeshParts
            Test_Gravity
            Test_MaxAngularVelocity
            Test_SleepType
            Test_Collision_Material
            Test_UE_Collision_Material
            Test_UE_Collision_Material_PublicAPI_Interaction
            Test_AssociationNOOP

        @available {MinUploadedAtFNVersion := 4100}
        @experimental
        physics_test_visualizer_component<epic_internal> := class<final_super><epic_internal>(component):
            @editable
            var TestToRun<epic_internal>:physics_test = external {}

            @editable
            var AutoRun<public>:logic = external {}

            @editable
            var PIE_Cleanup<public>:logic = external {}

            @editable
            var OffsetLocation<public>:(/Verse.org/SpatialMath:)vector3 = external {}

            Run<epic_internal>()<suspends>:test_physics_result = external {}

            OnSimulate<override>()<suspends>:void = external {}

        test_physics_result<native><epic_internal> := class<final><epic_internal>:
            var Success<native><epic_internal>:logic

            var What<native><epic_internal>:string = external {}

        @available {MinUploadedAtFNVersion := 4100}
        @hide_in_editor
        @experimental
        test_physics_cube_part<native><epic_internal> := class<epic_internal>(mesh_part, has_collision):


        @available {MinUploadedAtFNVersion := 4100}
        @hide_in_editor
        @experimental
        test_physics_cube_mesh_component<native><epic_internal> := class<final_super><epic_internal>(mesh_component):
            Mesh<override>:mesh = external {}

            @experimental
            Body<native><epic_internal>:test_physics_cube_part = external {}

        @available {MinUploadedAtFNVersion := 4100}
        @hide_in_editor
        @experimental
        test_physics_sphere_part<native><epic_internal> := class<epic_internal>(mesh_part, has_dynamics, has_collision, has_ue_physics_properties):


        @available {MinUploadedAtFNVersion := 4100}
        @hide_in_editor
        @experimental
        test_physics_sphere_mesh_component<native><epic_internal> := class<final_super><epic_internal>(mesh_component):
            Mesh<override>:mesh = external {}

            @experimental
            Body<native><epic_internal>:test_physics_sphere_part = external {}

        @available {MinUploadedAtFNVersion := 4100}
        @hide_in_editor
        @experimental
        left_cube_mesh_part<epic_internal> := class<epic_internal>(mesh_part, has_collision):


        @available {MinUploadedAtFNVersion := 4100}
        @hide_in_editor
        @experimental
        right_cube_mesh_part<epic_internal> := class<epic_internal>(mesh_part, has_collision):


        @available {MinUploadedAtFNVersion := 4100}
        @hide_in_editor
        @experimental
        left_right_cube_mesh_component<epic_internal> := class<final_super><epic_internal>(mesh_component):
            Mesh<override>:mesh = external {}

            @experimental
            Left<epic_internal>:left_cube_mesh_part = external {}

            @experimental
            Right<epic_internal>:right_cube_mesh_part = external {}

        @available {MinUploadedAtFNVersion := 4100}
        @hide_in_editor
        @experimental
        association_noop_cube_bodies_mesh_part<epic_internal> := class<epic_internal>(mesh_part, has_dynamics, has_collision):


        @available {MinUploadedAtFNVersion := 4100}
        @hide_in_editor
        @experimental
        association_noop_cube_shapes_mesh_part<epic_internal> := class<epic_internal>(mesh_part, has_dynamics, has_collision):


        @available {MinUploadedAtFNVersion := 4100}
        @hide_in_editor
        @experimental
        association_noop_cube_mesh_component<epic_internal> := class<final_super><epic_internal>(mesh_component):
            Mesh<override>:mesh = external {}

            @experimental
            Bodies<epic_internal>:association_noop_cube_bodies_mesh_part = external {}

            @experimental
            Shapes<epic_internal>:association_noop_cube_shapes_mesh_part = external {}

        @available {MinUploadedAtFNVersion := 4100}
        @hide_in_editor
        test_physics_component<native><epic_internal> := class<final_super><epic_internal>(component):
            var TestEntities<epic_internal>:[]entity = external {}

            var TestEventListeners<epic_internal>:[]cancelable = external {}

            @experimental
            Init_Sphere<native_callable><epic_internal>(Sim:entity, Translation:(/Verse.org/SpatialMath:)vector3, ?Scale:(/Verse.org/SpatialMath:)vector3 = external {}):test_physics_sphere_mesh_component = external {}

            @experimental
            Init_Ground<native_callable><epic_internal>(Sim:entity, ?Translation:(/Verse.org/SpatialMath:)vector3 = external {}, ?Scale:(/Verse.org/SpatialMath:)vector3 = external {}):test_physics_cube_mesh_component = external {}

            @experimental
            Init_LeftRightCube<epic_internal>(Sim:entity, ?Translation:(/Verse.org/SpatialMath:)vector3 = external {}, ?Scale:(/Verse.org/SpatialMath:)vector3 = external {}):left_right_cube_mesh_component = external {}

            @experimental
            Test_AssociationNOOP<native_callable><epic_internal>()<suspends>:test_physics_result = external {}

            @experimental
            Test_SetDynamic<native_callable><epic_internal>()<suspends>:test_physics_result = external {}

            @experimental
            Test_ApplyLinearImpulse<native_callable><epic_internal>()<suspends>:test_physics_result = external {}

            @experimental
            Test_LUF<native_callable><epic_internal>()<suspends>:test_physics_result = external {}

            @experimental
            Test_CollisionEvents<native_callable><epic_internal>()<suspends>:test_physics_result = external {}

            @experimental
            SpawnRestitutionTest<epic_internal>():?tuple(test_physics_sphere_mesh_component, test_physics_sphere_mesh_component, test_physics_cube_mesh_component) = external {}

            @experimental
            RestitutionTestRecordMaxHeights<epic_internal>(Sphere1:test_physics_sphere_mesh_component, Sphere2:test_physics_sphere_mesh_component)<suspends>:tuple(float, float) = external {}

            @experimental
            Test_Collision_Material<native_callable><epic_internal>()<suspends>:test_physics_result = external {}

            @experimental
            Test_OverlapEnteredEventFires<native_callable><epic_internal>()<suspends>:test_physics_result = external {}

            @experimental
            Test_OverlapExitedEventFires<native_callable><epic_internal>()<suspends>:test_physics_result = external {}

            @experimental
            Test_OverlapPerMeshPartScoping<native_callable><epic_internal>()<suspends>:test_physics_result = external {}

            @experimental
            Test_OverlapHitPayload<native_callable><epic_internal>()<suspends>:test_physics_result = external {}

            @experimental
            Test_FindOverlapHits_MeshParts<native_callable><epic_internal>()<suspends>:test_physics_result = external {}

            @experimental
            Test_FindSweepHits_MeshParts<native_callable><epic_internal>()<suspends>:test_physics_result = external {}

            @experimental
            Test_Gravity<native_callable><epic_internal>()<suspends>:test_physics_result = external {}

            @experimental
            Test_GravityGroupIndex<native_callable><epic_internal>()<suspends>:test_physics_result = external {}

            SetupTestPredicts<native_callable><epic_internal>(Sim:entity):test_physics_predicts_component = external {}

            @experimental
            Test_MaxAngularVelocity<native_callable><epic_internal>()<suspends>:test_physics_result = external {}

            @experimental
            Test_SleepType<native_callable><epic_internal>()<suspends>:test_physics_result = external {}

            @experimental
            Test_UE_Collision_Material<native_callable><epic_internal>()<suspends>:test_physics_result = external {}

            @experimental
            Test_UE_Collision_Material_PublicAPI_Interaction<native_callable><epic_internal>()<suspends>:test_physics_result = external {}

        @hide_in_editor
        test_physics_predicts_component<native><epic_internal> := class<final_super><epic_internal>(component):
            InvokedPredictsFunc<native><epic_internal>()<predicts>:void

            PredictsEvent<native><predicts><epic_internal>:listenable(tuple()) = external {}

            Test_PredictsSetup<native_callable><epic_internal>():void = external {}

    @hide_in_editor
    test_task_entity<native><epic_internal> := class<concrete><unique><transacts>(entity):


    @hide_in_editor
    test_sim_entity<native><epic_internal> := class<concrete><unique><transacts>(simulation_entity):
