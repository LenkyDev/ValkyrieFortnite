# Verse path: /UnrealEngine.com
# Module import path: /UnrealEngine.com/EntityTestSuite
EntityTestSuite<public> := module:
    using {/Verse.org/Native}
    using {/Verse.org/Temporary/EpicGamesRestricted/Network}
    using {/Verse.org/Simulation}
    using {/Verse.org/Assets}
    using {/Verse.org/SceneGraph}
    @hide_in_editor
    test_preload_sphere_mesh_component<epic_internal> := class<final_super>(mesh_component):
        Mesh<override>:mesh = external {}

    @hide_in_editor
    test_preload_cube_mesh_component1<epic_internal> := class<final_super>(mesh_component):
        Mesh<override>:mesh = external {}

    @hide_in_editor
    test_preload_cube_mesh_component2<epic_internal> := class<final_super>(mesh_component):
        Mesh<override>:mesh = external {}

    @hide_in_editor
    test_preload_material_component<epic_internal> := class<final_super>(component):


    @hide_in_editor
    test_preload_bad_mesh_component<epic_internal> := class<final_super>(mesh_component):
        Mesh<override>:mesh = external {}

    @hide_in_editor
    test_preload_component<native><epic_internal> := class<final_super>(component):
        Initialize<native_callable><epic_internal>():void = external {}

        ManualInitialize<native_callable><epic_internal>(Child1:entity, Child2:entity):void = external {}

        ClientInitialize<native_callable><epic_internal>():void = external {}

        BadInitialize<native_callable><epic_internal>():void = external {}

        PreloadEntity<native_callable><epic_internal>()<suspends>:logic = external {}

        PreloadChild1<native_callable><epic_internal>()<suspends>:logic = external {}

        PreloadChild2<native_callable><epic_internal>()<suspends>:logic = external {}

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
    test_scene_counter_component<native><epic_internal> := class<final_super>(component):


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
    test_subobject_value<native><epic_internal> := class:


    @hide_in_editor
    test_subobject_value_derived<native><epic_internal> := class<final_super>(test_subobject_value):


    @hide_in_editor
    test_subobject_base_component<native><epic_internal> := class<final_super>(component):
        @replicated("")
        var<public> SubObjectInternal<native><epic_internal>:?test_subobject_value = external {}

        AssignSubObject<native><epic_internal>(NewValue:test_subobject_value):void

    @hide_in_editor
    test_subobject_base_component_derived<native><epic_internal> := class<final_super>(test_subobject_base_component):


    @hide_in_editor
    test_subobject_override_component<native><epic_internal> := class<final_super>(test_subobject_base_component):
        var SubObjectInternal<override>:?test_subobject_value = external {}

    @hide_in_editor
    test_subobject_runtime_component<native><epic_internal> := class<final_super>(test_subobject_base_component):
        OnBeginSimulation<override>():void = external {}

    @hide_in_editor
    test_subobject_infunction_component<native><epic_internal> := class<final_super>(test_subobject_base_component):
        OnBeginSimulation<override>():void = external {}

    @hide_in_editor
    test_reentrant_follower<native><epic_internal> := class<final_super>(component):


    @hide_in_editor
    test_component_asset_anim<native><epic_internal> := class<final_super>(component):


    @hide_in_editor
    test_reentrant_creator<native><epic_internal> := class<final_super>(component):
        @replicated("")
        var DelayedRef<native><epic_internal>:?entity = external {}

    @hide_in_editor
    test_reentrant_entity<native><epic_internal> := class<concrete>(entity):


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
    test_prefab_component<native><epic_internal> := class<final_super>(component):
        @editable
        TestInt<native><public>:int = external {}

    @hide_in_editor
    test_prefab_entity<native><epic_internal> := class<final_super>(entity):
        @editable
        TestInt<native><public>:int = external {}

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


    @hide_in_editor
    field_access_test_entity<native><epic_internal> := class<concrete>(entity):
        @field_attribute {FieldName := "Components"; Access := "internal"}
        InternalComponent<native><public>:property_component = external {}

    @hide_in_editor
    @transient
    transient_test_type<native><epic_internal> := class:
        var TestValue<public>:int = external {}

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
        MaterialPath<override>:string = external {}

    @hide_in_editor
    test_different_material_component<native><epic_internal> := class<final_super>(component):


    @hide_in_editor
    test_grouped_material<native><epic_internal> := class(material):
        MaterialPath<override>:string = external {}

    @hide_in_editor
    test_grouped_material_component<native><epic_internal> := class<final_super>(component):
        OnBeginSimulation<override>():void = external {}

    # Module import path: /UnrealEngine.com/EntityTestSuite/TestPhysicsHook
    TestPhysicsHook<epic_internal> := module:
        using {/Verse.org/Assets}
        using {/Verse.org/SpatialMath}
        using {/Verse.org/Simulation}
        using {/Verse.org/SceneGraph}
        using {/Verse.org/Native}
        BeginCVD<native><epic_internal>(TestcaseName:string, Timeout:float):logic

        EndCVD<native><epic_internal>(TestcaseName:string, bPassed:logic):void

        @available {MinUploadedAtFNVersion := 4100}
        physics_test<native><epic_internal> := enum<open>:
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
            Test_CollisionEventNOOP
            Test_CollisionEventMeshPartFiltering
            Test_SourceMeshPart_UnsetForComponentQuery
            Test_SourceMeshPart_SetForMeshPartOverlapEvent
            Test_SourceMeshPart_SetForMeshPartCollisionEvent
            Test_SourceMeshPart_UnsetForMeshComponentCollisionEvent
            Test_TargetMeshPart_UnsetForOverlapQuery
            Test_TargetMeshParts_MultipleHits
            Test_TargetMeshPart_CollisionExitIsPerPart
            Test_CanAffectNavigation
            Test_CanAffectNavigationIsIndependentOfCollidable
            Test_SetDynamicDoesntDropTransform_Instantiation
            Test_SetDynamicDoesntDropTransform_Teleportation
            Test_CollisionEventsFreeFall
            Test_SameFrameMoveVisibleToOverlapQuery
            Test_SameFrameMoveVisibleToSweepQuery
            Test_StationaryListenerIgnoresSameFrameAddedAndMovedMover
            Test_OverlapListenerIgnoresSameFrameAddedAndMovedMover
            Test_MoverSeesOwnSameFrameAddedExit
            Test_StationaryListenerSeesPlacedMoverExit
            Test_LateListenerSeesPlacedMoverExit

        @available {MinUploadedAtFNVersion := 4300}
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

        @available {MinUploadedAtFNVersion := 4300}
        @hide_in_editor
        test_physics_component<native><epic_internal> := class<final_super><epic_internal>(component):
            var TestEntities<epic_internal>:[]entity = external {}

            var TestEventListeners<epic_internal>:[]cancelable = external {}

            var LocationOffset<epic_internal>:(/Verse.org/SpatialMath:)vector3 = external {}

            @experimental
            RunTest<native_callable><epic_internal>(TestToRun:physics_test, bDoCleanup:logic, ?Offset:(/Verse.org/SpatialMath:)vector3 = external {})<suspends>:test_physics_result = external {}

            @experimental
            Init_Sphere<native_callable><epic_internal>(Sim:entity, Translation:(/Verse.org/SpatialMath:)vector3, ?Scale:(/Verse.org/SpatialMath:)vector3 = external {}):test_physics_sphere_mesh_component = external {}

            @experimental
            Init_Ground<native_callable><epic_internal>(Sim:entity, ?Translation:(/Verse.org/SpatialMath:)vector3 = external {}, ?Scale:(/Verse.org/SpatialMath:)vector3 = external {}):test_physics_cube_mesh_component = external {}

            @experimental
            Init_LeftRightCube<epic_internal>(Sim:entity, ?Translation:(/Verse.org/SpatialMath:)vector3 = external {}, ?Scale:(/Verse.org/SpatialMath:)vector3 = external {}):left_right_cube_mesh_component = external {}

            @experimental
            Test_AssociationNOOP<epic_internal>()<suspends>:test_physics_result = external {}

            @experimental
            Test_SetDynamic<epic_internal>()<suspends>:test_physics_result = external {}

            @experimental
            Test_ApplyLinearImpulse<epic_internal>()<suspends>:test_physics_result = external {}

            @experimental
            Test_LUF<epic_internal>()<suspends>:test_physics_result = external {}

            @experimental
            Test_SetDynamicDoesntDropTransform_Instantiation<epic_internal>()<suspends>:test_physics_result = external {}

            @experimental
            Test_SetDynamicDoesntDropTransform_Teleportation<epic_internal>()<suspends>:test_physics_result = external {}

            @experimental
            Test_SameFrameMoveVisibleToOverlapQuery<epic_internal>()<suspends>:test_physics_result = external {}

            @experimental
            Test_SameFrameMoveVisibleToSweepQuery<epic_internal>()<suspends>:test_physics_result = external {}

            @experimental
            Test_StationaryListenerIgnoresSameFrameAddedAndMovedMover<epic_internal>()<suspends>:test_physics_result = external {}

            @experimental
            Test_OverlapListenerIgnoresSameFrameAddedAndMovedMover<epic_internal>()<suspends>:test_physics_result = external {}

            @experimental
            Test_MoverSeesOwnSameFrameAddedExit<epic_internal>()<suspends>:test_physics_result = external {}

            @experimental
            Test_StationaryListenerSeesPlacedMoverExit<epic_internal>()<suspends>:test_physics_result = external {}

            @experimental
            Test_LateListenerSeesPlacedMoverExit<epic_internal>()<suspends>:test_physics_result = external {}

            @experimental
            GatherTest_CollisionEvents_HitsHistoryDebugInfo<epic_internal>():string = external {}

            @experimental
            CollisionEventsTestImpl<epic_internal>()<suspends>:test_physics_result = external {}

            @experimental
            Test_CollisionEvents<epic_internal>()<suspends>:test_physics_result = external {}

            @experimental
            Test_CollisionEventsFreeFall<epic_internal>()<suspends>:test_physics_result = external {}

            @experimental
            Test_CollisionEventMeshPartFiltering<epic_internal>()<suspends>:test_physics_result = external {}

            @experimental
            Test_CollisionEventNOOP<epic_internal>()<suspends>:test_physics_result = external {}

            @experimental
            SpawnRestitutionTest<epic_internal>():?tuple(test_physics_sphere_mesh_component, test_physics_sphere_mesh_component, test_physics_cube_mesh_component) = external {}

            @experimental
            RestitutionTestRecordMaxHeights<epic_internal>(Sphere1:test_physics_sphere_mesh_component, Sphere2:test_physics_sphere_mesh_component)<suspends>:tuple(float, float) = external {}

            @experimental
            Test_Collision_Material<epic_internal>()<suspends>:test_physics_result = external {}

            @experimental
            Test_OverlapEnteredEventFires<epic_internal>()<suspends>:test_physics_result = external {}

            @experimental
            Test_OverlapExitedEventFires<epic_internal>()<suspends>:test_physics_result = external {}

            @experimental
            Test_OverlapPerMeshPartScoping<epic_internal>()<suspends>:test_physics_result = external {}

            @experimental
            Test_OverlapHitPayload<epic_internal>()<suspends>:test_physics_result = external {}

            @available {MinUploadedAtFNVersion := 4300}
            @experimental
            Test_FindOverlapHits_MeshParts<epic_internal>()<suspends>:test_physics_result = external {}

            @experimental
            Test_FindSweepHits_MeshParts<epic_internal>()<suspends>:test_physics_result = external {}

            @available {MinUploadedAtFNVersion := 4300}
            @experimental
            Test_SourceMeshPart_UnsetForComponentQuery<native_callable><epic_internal>()<suspends>:test_physics_result = external {}

            @available {MinUploadedAtFNVersion := 4300}
            @experimental
            Test_SourceMeshPart_SetForMeshPartOverlapEvent<native_callable><epic_internal>()<suspends>:test_physics_result = external {}

            @available {MinUploadedAtFNVersion := 4300}
            @experimental
            Test_SourceMeshPart_SetForMeshPartCollisionEvent<native_callable><epic_internal>()<suspends>:test_physics_result = external {}

            @available {MinUploadedAtFNVersion := 4300}
            @experimental
            Test_SourceMeshPart_UnsetForMeshComponentCollisionEvent<native_callable><epic_internal>()<suspends>:test_physics_result = external {}

            @available {MinUploadedAtFNVersion := 4300}
            @experimental
            Test_TargetMeshPart_CollisionExitIsPerPart<native_callable><epic_internal>()<suspends>:test_physics_result = external {}

            @available {MinUploadedAtFNVersion := 4300}
            @experimental
            Test_TargetMeshPart_UnsetForOverlapQuery<native_callable><epic_internal>()<suspends>:test_physics_result = external {}

            @available {MinUploadedAtFNVersion := 4300}
            @experimental
            Test_TargetMeshParts_MultipleHits<native_callable><epic_internal>()<suspends>:test_physics_result = external {}

            @experimental
            Test_Gravity<epic_internal>()<suspends>:test_physics_result = external {}

            @experimental
            Test_GravityGroupIndex<native_callable><epic_internal>()<suspends>:test_physics_result = external {}

            @available {MinUploadedAtFNVersion := 4300}
            Test_Handles_EntityHandle<native_callable><epic_internal>()<suspends>:test_physics_result = external {}

            @available {MinUploadedAtFNVersion := 4300}
            Test_Handles_ComponentHandle<native_callable><epic_internal>()<suspends>:test_physics_result = external {}

            @available {MinUploadedAtFNVersion := 4300}
            @experimental
            Test_Handles_MeshPartHandle<native_callable><epic_internal>()<suspends>:test_physics_result = external {}

            @available {MinUploadedAtFNVersion := 4300}
            @experimental
            Test_Handles_MakeMeshPartHandle<native_callable><epic_internal>()<suspends>:test_physics_result = external {}

            @available {MinUploadedAtFNVersion := 4300}
            @experimental
            Test_Handles_DummyMeshPartHandle<native_callable><epic_internal>()<suspends>:test_physics_result = external {}

            @available {MinUploadedAtFNVersion := 4300}
            @experimental
            Test_Handles_FromSweepQuery<native_callable><epic_internal>()<suspends>:test_physics_result = external {}

            SetupTestPredicts<native_callable><epic_internal>(Sim:entity):test_physics_predicts_component = external {}

            @experimental
            Test_MaxAngularVelocity<epic_internal>()<suspends>:test_physics_result = external {}

            @experimental
            Test_SleepType<epic_internal>()<suspends>:test_physics_result = external {}

            @experimental
            Test_UE_Collision_Material<epic_internal>()<suspends>:test_physics_result = external {}

            @experimental
            Test_UE_Collision_Material_PublicAPI_Interaction<epic_internal>()<suspends>:test_physics_result = external {}

            @experimental
            Test_CanAffectNavigation<native_callable><epic_internal>()<suspends>:test_physics_result = external {}

            @experimental
            Test_CanAffectNavigationIsIndependentOfCollidable<native_callable><epic_internal>()<suspends>:test_physics_result = external {}

        @hide_in_editor
        test_physics_predicts_component<native><epic_internal> := class<final_super><epic_internal>(component):
            InvokedPredictsFunc<native><epic_internal>()<predicts>:void

            PredictsEvent<native><predicts><epic_internal>:listenable(tuple()) = external {}

            Test_PredictsSetup<native_callable><epic_internal>():void = external {}

    @available {MinUploadedAtFNVersion := 4200}
    @experimental
    @hide_in_editor
    test_skeletal_mesh_component<native><epic_internal> := class<final><epic_internal>(mesh_component, has_skeletal_animation):
        Mesh<override>:mesh = external {}

        SkeletalAnimation<override>:modifier_stack(skeleton) = external {}

    @available {MinUploadedAtFNVersion := 4200}
    @experimental
    @hide_in_editor
    test_skeletal_animation<native><epic_internal> := class<concrete><epic_internal>(skeletal_animation):
        InternalAsset<override>:animation_asset = external {}

        AutoPlay<override>:logic = external {}

        @replicated("")
        IsLooping<native><epic_internal>:logic = external {}

        EndTime<override><native><final>:float = external {}

        GetDuration<override>()<decides><reads>:float = external {}

        GetIsLooping<override>()<reads>:logic = external {}

    @available {MinUploadedAtFNVersion := 4200}
    @experimental
    @hide_in_editor
    test_skeletal_animation_looping<native><epic_internal> := class<final><concrete><epic_internal>(test_skeletal_animation):
        IsLooping<override>:logic = external {}

    @available {MinUploadedAtFNVersion := 4200}
    @experimental
    @hide_in_editor
    skeletal_animation_test_event_sink<native><epic_internal> := class<final><concrete><epic_internal>:
        OnSignal<native><epic_internal>()<transacts>:void

        SubscribeTo<native_callable><epic_internal>(Event:listenable(tuple()))<transacts>:void = external {}

    @hide_in_editor
    test_task_entity<native><epic_internal> := class<concrete><unique><transacts>(entity):


    @hide_in_editor
    test_sim_entity<native><epic_internal> := class<concrete><unique><transacts>(simulation_entity):
