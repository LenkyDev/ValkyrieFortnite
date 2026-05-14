# Module import path: /Fortnite.com/VerseInternalTesting/NexusFramework
NexusFramework<public> := module:
    using {/UnrealEngine.com/Temporary/Diagnostics}
    using {/Verse.org/SceneGraph}
    using {/Verse.org/Simulation}
    using {/Fortnite.com/Devices}
    using {/UnrealEngine.com/Temporary/Testing}
    nexus_failure_category<epic_internal> := enum:
        Feature
        Initialization
        Lifecycle
        State
        (/Fortnite.com/VerseInternalTesting/NexusFramework/nexus_failure_category:)Concurrency
        (/Fortnite.com/VerseInternalTesting/NexusFramework/nexus_failure_category:)Persistence
        Integration
        Timeout

    FailureCategoryToString<epic_internal>(Category:nexus_failure_category):string = external {}

    nexus_test_case<epic_internal> := struct:
        Name<public>:string

        Func<public>:type {_()<suspends>:void}

        TimeoutOverride<public>:?float = external {}

    nexus_test_reporter<epic_internal> := class:
        AddResult<epic_internal>(TestName:string, TestResult:test_result, ContextString:string, TestSuiteName:string):void = external {}

        AddResultWithCategory<epic_internal>(TestName:string, TestResult:test_result, ContextString:string, TestSuiteName:string, FailureCategory:nexus_failure_category):void = external {}

    nexus_test_runner<epic_internal> := class(creative_device):
        OnEnd<override>():void = external {}

    nexus_test_device<epic_internal> := class(creative_device):
        @editable
        var TestRunner<public>:nexus_test_runner = external {}

        AddResults<epic_internal>(TestName:string, Passed:logic, ContextString:string):void = external {}

        AddPass<epic_internal>(TestName:string, ContextString:string):void = external {}

        AddFail<epic_internal>(TestName:string, ContextString:string):void = external {}

        AddPassWithCategory<epic_internal>(TestName:string, ContextString:string, Category:nexus_failure_category):void = external {}

        AddFailWithCategory<epic_internal>(TestName:string, ContextString:string, Category:nexus_failure_category):void = external {}

        AddCheck<epic_internal>(IsPassed:logic, TestName:string, ContextString:string):void = external {}

        AddCheckWithCategory<epic_internal>(IsPassed:logic, TestName:string, ContextString:string, Category:nexus_failure_category):void = external {}

        AddSkip<epic_internal>(IsPassed:logic, TestName:string, ContextString:string):void = external {}

        NexusExpect<epic_internal>(Condition:logic, TestName:string, Context:string):void = external {}

        NexusGuard<epic_internal>(Condition:logic, TestName:string):void = external {}

        ResetGuard<epic_internal>():void = external {}

        OnBegin<override>()<suspends>:void = external {}

        OnEnd<override>():void = external {}

        TestCases<public>():[]nexus_test_case = external {}

        BeforeAll<public>()<suspends>:void = external {}

        AfterAll<public>()<suspends>:void = external {}

        BeforeEach<public>()<suspends>:void = external {}

        AfterEach<public>()<suspends>:void = external {}

        StartPhase<public>(PhaseName:string, ?Category:?nexus_failure_category = external {}):void = external {}

        EndPhase<public>(PhaseName:string):void = external {}

        RunHeartbeat<public>(IntervalSeconds:float)<suspends>:void = external {}

        RunTestCases<public>()<suspends>:void = external {}

    example_nexus_device<epic_internal> := class(nexus_test_device):
        OnBegin<override>()<suspends>:void = external {}

        OnEnd<override>():void = external {}

    nexus_test_component<epic_internal> := class<final_super>(component):
        @editable
        TestSuiteName<public>:string = external {}

        var NexusRunner<protected>:?nexus_test_runner_component = external {}

        OnSimulate<override>()<suspends>:void = external {}

        InitializeNexusReporting<protected>():void = external {}

        AddPass<public>(TestName:string, Context:string):void = external {}

        AddFail<public>(TestName:string, Context:string):void = external {}

        AddPassWithCategory<public>(TestName:string, Context:string, Category:nexus_failure_category):void = external {}

        AddFailWithCategory<public>(TestName:string, Context:string, Category:nexus_failure_category):void = external {}

        AddCheck<public>(Passed:logic, TestName:string, Context:string):void = external {}

        AddCheckWithCategory<public>(Passed:logic, TestName:string, Context:string, Category:nexus_failure_category):void = external {}

        AddSkip<public>(TestName:string, Context:string):void = external {}

        NexusExpect<public>(Condition:logic, TestName:string, Context:string):void = external {}

        NexusGuard<public>(Condition:logic, TestName:string):void = external {}

        ResetGuard<public>():void = external {}

        StartPhase<public>(PhaseName:string, ?Category:?nexus_failure_category = external {}):void = external {}

        EndPhase<public>(PhaseName:string):void = external {}

        RunHeartbeat<public>(IntervalSeconds:float)<suspends>:void = external {}

        TestCases<public>():[]nexus_test_case = external {}

        BeforeAll<public>()<suspends>:void = external {}

        AfterAll<public>()<suspends>:void = external {}

        BeforeEach<public>()<suspends>:void = external {}

        AfterEach<public>()<suspends>:void = external {}

    nexus_test_runner_component<epic_internal> := class<final_super>(component):
        @editable
        TestReportName<public>:string = external {}

        @editable
        SummaryLogLevel<public>:log_level = external {}

        TestReporter<public>:test_reporter = external {}

        var CurrentPhase<public>:string = external {}

        var PassCount<public>:int = external {}

        var FailCount<public>:int = external {}

        var SkipCount<public>:int = external {}

        var FailuresByCategory<public>:[nexus_failure_category]int = external {}

        var PassesByCategory<public>:[nexus_failure_category]int = external {}

        RegisterComponent<public>(Component:nexus_test_component):void = external {}

        AddResult<public>(SuiteName:string, TestName:string, Passed:logic, Context:string):void = external {}

        AddSkip<public>(SuiteName:string, TestName:string, Context:string):void = external {}

        AddResultWithCategory<public>(SuiteName:string, TestName:string, Passed:logic, Context:string, Category:nexus_failure_category):void = external {}

        GetFailureCount<public>(Category:nexus_failure_category):int = external {}

        GetPassCount<public>(Category:nexus_failure_category):int = external {}

        StartPhase<public>(PhaseName:string):void = external {}

        EndPhase<public>(PhaseName:string):void = external {}

        Heartbeat<public>(ComponentName:string):void = external {}

        OnEndSimulation<override>():void = external {}

        DisplayResults<public>():void = external {}

        RunStructuredTests<public>()<suspends>:void = external {}

        GetRegisteredComponentCount<public>():int = external {}

# Module import path: /Fortnite.com/VerseInternalTesting/VerseFramework
VerseFramework<public> := module:
    using {/Fortnite.com/Characters}
    using {/Verse.org/SpatialMath}
    using {/Verse.org/Colors}
    using {/UnrealEngine.com/Temporary/SpatialMath}
    using {/UnrealEngine.com/Temporary/Diagnostics}
    using {/UnrealEngine.com/Temporary/Testing}
    using {/UnrealEngine.com/Itemization}
    using {/Verse.org/Native}
    using {/Fortnite.com/AI}
    using {/Fortnite.com/Marketplace}
    using {/Verse.org/SceneGraph}
    using {/Fortnite.com/Vehicles}
    using {/Fortnite.com/Game}
    using {/Verse.org/Simulation}
    using {/Fortnite.com/Devices}
    test_device<epic_internal> := class(creative_device):
        var TestRunner<public>:test_runner = external {}

        @editable
        SuiteName<public>:string = external {}

        TestCases<public>():[]test_case = external {}

        BeforeAll<public>()<suspends>:void = external {}

        AfterAll<public>()<suspends>:void = external {}

        BeforeEach<public>()<suspends>:void = external {}

        AfterEach<public>()<suspends>:void = external {}

        OnBegin<override>():void = external {}

        RegisterTests<public>():void = external {}

    test_device_event_handler_mock<public> := class<concrete>:
        var ControlChangeSubscription<protected>:?cancelable = external {}

        ResetCallCount<public>():void = external {}

        GetCallCount<public>():int = external {}

        ReportCall<protected>()<transacts>:void = external {}

        Cancel<public>()<transacts>:void = external {}

        Await<public>()<suspends>:void = external {}

    device_event_void_handler_mock<public> := class(test_device_event_handler_mock):
        Subscribe<public>(Event:listenable(tuple())):void = external {}

    device_event_damage_result_handler_mock<public> := class(test_device_event_handler_mock):
        var ArgSource<public>:?game_action_causer = external {}

        var ArgInstigator<public>:?game_action_instigator = external {}

        var ArgAmount<public>:float = external {}

        Subscribe<public>(Event:listenable(damage_result)):void = external {}

    device_event_agent_handler_mock<public> := class(test_device_event_handler_mock):
        var ArgAgent<public>:?agent = external {}

        Subscribe<public>(Event:listenable(agent)):void = external {}

    device_event_agent_optional_agent_handler_mock<public> := class(test_device_event_handler_mock):
        var ArgAgent<public>:?agent = external {}

        var ArgOptionalAgent<public>:?agent = external {}

        Subscribe<public>(Event:listenable(tuple(agent, ?agent))):void = external {}

    device_event_optional_agent_agent_array_handler_mock<public> := class(test_device_event_handler_mock):
        var ArgOptionalAgent<public>:?agent = external {}

        var ArgAgentArray<public>:[]agent = external {}

        Subscribe<public>(Event:listenable(tuple(?agent, []agent))):void = external {}

    device_event_optional_agent_handler_mock<public> := class(test_device_event_handler_mock):
        var ArgAgent<public>:?agent = external {}

        Subscribe<public>(Event:listenable(?agent)):void = external {}

    device_event_agent_int_handler_mock<public> := class(test_device_event_handler_mock):
        var ArgAgent<public>:?agent = external {}

        var ArgInt<public>:int = external {}

        Subscribe<public>(Event:listenable(tuple(agent, int))):void = external {}

    device_event_agent_float_handler_mock<public> := class(test_device_event_handler_mock):
        var ArgAgent<public>:?agent = external {}

        var ArgFloat<public>:float = external {}

        Subscribe<public>(Event:listenable(tuple(agent, float))):void = external {}

    device_event_optional_agent_int_handler_mock<public> := class(test_device_event_handler_mock):
        var ArgAgent<public>:?agent = external {}

        var ArgInt<public>:int = external {}

        Subscribe<public>(Event:listenable(tuple(?agent, int))):void = external {}

    device_event_ai_interaction_handler_mock<public> := class(test_device_event_handler_mock):
        var ArgSource<public>:?agent = external {}

        var ArgTarget<public>:?agent = external {}

        Subscribe<public>(Event:listenable(device_ai_interaction_result)):void = external {}

    device_event_fort_vehicle_handler_mock<public> := class(test_device_event_handler_mock):
        var ArgVehicle<public>:?fort_vehicle = external {}

        Subscribe<public>(Event:listenable(fort_vehicle)):void = external {}

    device_event_healing_result_handler_mock<public> := class(test_device_event_handler_mock):
        var ArgSource<public>:?game_action_causer = external {}

        var ArgInstigator<public>:?game_action_instigator = external {}

        var ArgAmount<public>:float = external {}

        Subscribe<public>(Event:listenable(healing_result)):void = external {}

    device_event_player_handler_mock<public> := class(test_device_event_handler_mock):
        var ArgPlayer<public>:?player = external {}

        Subscribe<public>(Event:listenable(player)):void = external {}

    test_event_entity_handler_mock<public> := class(test_device_event_handler_mock):
        var ArgEntity<public>:?entity = external {}

        Subscribe<public>(Event:listenable(entity)):void = external {}

    test_event_float_handler_mock<public> := class(test_device_event_handler_mock):
        var ArgFloat<public>:?float = external {}

        Subscribe<public>(Event:listenable(float)):void = external {}

    test_event_tuple_handler_mock<public> := class(test_device_event_handler_mock):
        var ArgTuple<public>:?tuple() = external {}

        Subscribe<public>(Event:listenable(tuple())):void = external {}

    test_event_tuple_int_logic_handler_mock<public> := class(test_device_event_handler_mock):
        var ArgTuple<public>:?tuple(int, logic) = external {}

        Subscribe<public>(Event:listenable(tuple(int, logic))):void = external {}

    test_event_creative_prop_handler_mock<public> := class(test_device_event_handler_mock):
        var ArgProp<public>:?creative_prop = external {}

        Subscribe<public>(Event:listenable(creative_prop)):void = external {}

    test_event_int_handler_mock<public> := class(test_device_event_handler_mock):
        var ArgInt<public>:int = external {}

        Subscribe<public>(Event:listenable(int)):void = external {}

    test_event_tuple_agent_vehicle_int_handler_mock<public> := class(test_device_event_handler_mock):
        var ArgTuple<public>:?tuple(?agent, fort_vehicle, int) = external {}

        Subscribe<public>(Event:listenable(tuple(?agent, fort_vehicle, int))):void = external {}

    test_event_tuple_player_entitlement_change_handler_mock<public> := class(test_device_event_handler_mock):
        var ArgTuple<public>:?tuple(player, []entitlement_change(entitlement)) = external {}

        Subscribe<public>(Event:listenable(tuple(player, []entitlement_change(entitlement)))):void = external {}

        HandleEvent<public>(InResult:tuple(player, []entitlement_change(entitlement))):void = external {}

    @available {MinUploadedAtFNVersion := 3900}
    test_event_npc_target_info_handler_mock<public> := class(test_device_event_handler_mock):
        var ArgNPCTarget<public>:?npc_target_info = external {}

        Subscribe<public>(Event:listenable(npc_target_info)):void = external {}

        Cancel<override>()<transacts>:void = external {}

        AwaitEvent<public>()<suspends>:npc_target_info = external {}

    @available {MinUploadedAtFNVersion := 3900}
    test_event_guard_alert_level_handler_mock<public> := class(test_device_event_handler_mock):
        var ArgGuardAlert<public>:?guard_alert_level = external {}

        Subscribe<public>(Event:listenable(guard_alert_level)):void = external {}

        Cancel<override>()<transacts>:void = external {}

        (/Fortnite.com/VerseInternalTesting/VerseFramework/test_event_guard_alert_level_handler_mock:)Await<public>(GuardAlertLevel:guard_alert_level)<suspends>:void = external {}

    @experimental
    test_event_add_item_result_handler_mock<public> := class(test_device_event_handler_mock):
        var ArgAddResult<public>:?add_item_result = external {}

        var ArgAddedItems<public>:?[]entity = external {}

        var ArgModifiedItems<public>:?[]tuple(entity, int) = external {}

        Subscribe<public>(Event:listenable(add_item_result)):void = external {}

    @experimental
    test_event_remove_item_result_handler_mock<public> := class(test_device_event_handler_mock):
        var ArgRemoveResult<public>:?remove_item_result = external {}

        var ArgInventory<public>:?inventory_component = external {}

        var ArgRemovedAmount<public>:int = external {}

        var ArgRemovedItems<public>:?[]entity = external {}

        var ArgModifiedItem<public>:?tuple(entity, int) = external {}

        Subscribe<public>(Event:listenable(remove_item_result)):void = external {}

    @experimental
    test_event_equip_item_result_handler_mock<public> := class(test_device_event_handler_mock):
        var ArgEquipResult<public>:?equip_item_result = external {}

        var ArgItem<public>:?entity = external {}

        Subscribe<public>(Event:listenable(equip_item_result)):void = external {}

    @experimental
    test_event_unequip_item_result_handler_mock<public> := class(test_device_event_handler_mock):
        var ArgUnEquipResult<public>:?unequip_item_result = external {}

        var ArgItem<public>:?entity = external {}

        Subscribe<public>(Event:listenable(unequip_item_result)):void = external {}

    @experimental
    test_event_change_inventory_result_handler_mock<public> := class(test_device_event_handler_mock):
        var ArgChangeInvResult<public>:?change_inventory_result = external {}

        var ArgItemComponent<public>:?item_component = external {}

        var ArgPreviousInventory<public>:?inventory_component = external {}

        var ArgCurrentInventory<public>:?inventory_component = external {}

        Subscribe<public>(Event:listenable(change_inventory_result)):void = external {}

    @experimental
    test_event_change_equipped_result_handler_mock<public> := class(test_device_event_handler_mock):
        var ArgChangeEquipResult<public>:?change_equipped_result = external {}

        var ArgItemComponent<public>:?item_component = external {}

        var ArgIsItemEquipped<public>:logic = external {}

        Subscribe<public>(Event:listenable(change_equipped_result)):void = external {}

    @available {MinUploadedAtFNVersion := 4000}
    @experimental
    test_event_change_stack_size_result_handler_mock<public> := class(test_device_event_handler_mock):
        var ArgChangeStackResult<public>:?change_stack_size_result = external {}

        var ArgStackableComponent<public>:?stackable_component = external {}

        var ArgPreviousStackSize<public>:int = external {}

        var ArgCurrentStackSize<public>:int = external {}

        Subscribe<public>(Event:listenable(change_stack_size_result)):void = external {}

    @available {MinUploadedAtFNVersion := 4000}
    @experimental
    test_event_change_max_stack_size_result_handler_mock<public> := class(test_device_event_handler_mock):
        var ArgChangeMaxStackResult<public>:?change_max_stack_size_result = external {}

        var ArgStackableComponent<public>:?stackable_component = external {}

        var ArgPreviousStackSize<public>:?int = external {}

        var ArgCurrentStackSize<public>:?int = external {}

        Subscribe<public>(Event:listenable(change_max_stack_size_result)):void = external {}

    node_status<epic_internal> := enum<open>:
        Pending
        Available
        Passed
        Failed
        Skipped
        Blocked

    node<epic_internal> := class:


    test_suite_node<epic_internal> := class(node):
        TestSuite<epic_internal>:test_suite

    test_case_node<epic_internal> := class(node):
        TestCase<epic_internal>:test_case

    dependency_tree<epic_internal> := class:
        AddNode<public>(InNode:node):void = external {}

        GetNode<public>(Name:string)<transacts><decides>:node = external {}

        AddDependency<public>(NodeName:string, PreReqName:string):void = external {}

        GetAvailableNodes<public>():[]node = external {}

        SetNodeStatusByName<epic_internal>(Name:string, Status:node_status):void = external {}

        SetNodeStatus<epic_internal>(Node:node, Status:node_status):void = external {}

    test_case<public> := struct:
        Name<public>:string

        Func<public>:type {_()<suspends>:void}

        Category<public>:[]string

        TimeoutOverride<public>:?float = external {}

        Dependencies<public>:[]string = external {}

    test_suite<public> := struct:
        Name<public>:string

        Cases<public>:[]test_case

        BeforeAllFunc<public>:type {_()<suspends>:void}

        AfterAllFunc<public>:type {_()<suspends>:void}

        BeforeEachFunc<public>:type {_()<suspends>:void}

        AfterEachFunc<public>:type {_()<suspends>:void}

        Dependencies<public>:[]string = external {}

    test_case_plan<epic_internal> := class:
        TestCase<epic_internal>:test_case

        Dependencies<epic_internal>:[]string

        var Status<epic_internal>:node_status = external {}

        var Duration<epic_internal>:float = external {}

        var StartTime<epic_internal>:float = external {}

    test_suite_plan<epic_internal> := class:
        TestSuite<epic_internal>:test_suite

        Dependencies<epic_internal>:[]string

        TestCasePlan<epic_internal>:[]test_case_plan = external {}

        var Status<epic_internal>:node_status = external {}

    test_plan<epic_internal> := class:


    test_runner<epic_internal> := class:
        var TestReporter<public>:test_reporter = external {}

        var CurrentTestSuite<public>:string = external {}

        var CurrentTestCasePlan<public>:?test_case_plan = external {}

        var TargetTestSuite<public>:string = external {}

        var EnableFlakinessEvaluation<public>:logic = external {}

        var FlakinessRunCount<public>:int = external {}

        var EnableVerboseOutput<public>:logic = external {}

        var EnableDebugOutput<public>:logic = external {}

        var EnableLogOutput<public>:logic = external {}

        var EnableTimeTracking<public>:logic = external {}

        var ShouldBuildRunPlanFromFile<public>:logic = external {}

        var RandomizeTestCaseOrder<public>:logic = external {}

        DefaultSetupFunctionTimeoutInSeconds<public>:float = external {}

        var SetupFunctionTimeoutInSeconds<public>:float = external {}

        DefaultTestTimeoutInSeconds<public>:float = external {}

        var TestTimeoutInSeconds<public>:float = external {}

        var LogOutput<public>:[]string = external {}

        ClearLogOutput<public>():void = external {}

        PrintLogOutput<public>()<transacts>:void = external {}

        (/Fortnite.com/VerseInternalTesting/VerseFramework/test_runner:)Log<public>(Level:log_level, Message:string)<transacts>:void = external {}

        RecordFlakinessTestResult<public>(TestName:string, Succeeded:logic)<transacts>:void = external {}

        ClearTests<public>()<transacts>:void = external {}

        RegisterTests<public>(TestSuite:test_suite)<transacts>:void = external {}

        ResetIncludeFilters<public>()<transacts>:void = external {}

        AddIncludeFilter<public>(Filter:string)<transacts>:void = external {}

        ResetExcludeFilters<public>()<transacts>:void = external {}

        AddExcludeFilter<public>(Filter:string)<transacts>:void = external {}

        IsTestCaseIncluded<public>(TestCase:test_case)<transacts><decides>:void = external {}

        BuildRunPlan<public>():void = external {}

        BuildSuiteRunPlan<public>(TestSuite:test_suite):[]test_case_plan = external {}

        Run<public>()<suspends>:void = external {}

        RaiseFunctionFailure<public>(FuncName:string)<transacts>:void = external {}

        CheckEqual<public>(Expected:string, Actual:string, Message:any):void = external {}

        CheckEqual<public>(Expected:int, Actual:int, Message:any):void = external {}

        CheckEqual<public>(Expected:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, Actual:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, Message:any, ?Tolerance:float = external {}):void = external {}

        CheckEqual<public>(Expected:vector2, Actual:vector2, Message:any, ?Tolerance:float = external {}):void = external {}

        CheckEqual<public>(Expected:vector2i, Actual:vector2i, Message:any):void = external {}

        CheckEqual<public>(Expected:color, Actual:color, Message:any, ?Tolerance:float = external {}):void = external {}

        CheckEqual<public>(Expected:(/UnrealEngine.com/Temporary/SpatialMath:)rotation, Actual:(/UnrealEngine.com/Temporary/SpatialMath:)rotation, Message:any, ?Tolerance:float = external {}):void = external {}

        CheckEqualIntArray<public>(Expected:[]int, Actual:[]int, Message:any):void = external {}

        CheckEqualFloatArray<public>(Expected:[]float, Actual:[]float, Message:any):void = external {}

        CheckEqual<public>(Expected:float, Actual:float, Message:any, ?Tolerance:float = external {}):void = external {}

        CheckEqual<public>(Expected:(/Verse.org/SpatialMath:)transform, Actual:(/Verse.org/SpatialMath:)transform, Message:any, ?Tolerance:float = external {}):void = external {}

        CheckEqual<public>(Expected:(/UnrealEngine.com/Temporary/SpatialMath:)transform, Actual:(/UnrealEngine.com/Temporary/SpatialMath:)transform, Message:any, ?Tolerance:float = external {}):void = external {}

        CheckEqual<public>(Actual:creative_object, Expected:(/Verse.org/SpatialMath:)transform, Message:any, ?Tolerance:float = external {}, ?Timeout:float = external {})<suspends>:void = external {}

        CheckEqual<public>(Actual:creative_object, Expected:(/UnrealEngine.com/Temporary/SpatialMath:)transform, Message:any, ?Tolerance:float = external {}, ?Timeout:float = external {})<suspends>:void = external {}

        CheckEqual<public>(ActualFortCharacter:fort_character, ExpectedTranslation:(/Verse.org/SpatialMath:)vector3, Message:any, ?Tolerance:float = external {}, ?Timeout:float = external {}, ?CompareX:logic = external {}, ?CompareY:logic = external {}, ?CompareZ:logic = external {})<suspends>:void = external {}

        CheckEqual<public>(ActualFortCharacter:fort_character, ExpectedTranslation:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, Message:any, ?Tolerance:float = external {}, ?Timeout:float = external {}, ?CompareX:logic = external {}, ?CompareY:logic = external {}, ?CompareZ:logic = external {})<suspends>:void = external {}

        CheckEqual<public>(Expected:diagnostic, Actual:diagnostic, Message:any):void = external {}

        CheckEqual<public>(Expected:agent, Actual:agent, Message:any):void = external {}

        CheckTrue<public>(Actual:logic, Message:any):void = external {}

        CheckFalse<public>(Actual:logic, Message:any):void = external {}

        CheckNotEqual<public>(Actual:creative_object, Expected:(/Verse.org/SpatialMath:)transform, Message:any, ?Tolerance:float = external {}, ?Timeout:float = external {})<suspends>:void = external {}

        CheckNotEqual<public>(Actual:creative_object, Expected:(/UnrealEngine.com/Temporary/SpatialMath:)transform, Message:any, ?Tolerance:float = external {}, ?Timeout:float = external {})<suspends>:void = external {}

        CheckNotEqual<public>(Expected:string, Actual:string, Message:any):void = external {}

        CheckNotEqual<public>(Expected:int, Actual:int, Message:any):void = external {}

        CheckNotEqual<public>(Expected:float, Actual:float, Message:any):void = external {}

        CheckNotEqual<public>(Expected:(/Verse.org/SpatialMath:)transform, Actual:(/Verse.org/SpatialMath:)transform, Message:any, ?Tolerance:float = external {}):void = external {}

        CheckNotEqual<public>(Expected:(/UnrealEngine.com/Temporary/SpatialMath:)transform, Actual:(/UnrealEngine.com/Temporary/SpatialMath:)transform, Message:any, ?Tolerance:float = external {}):void = external {}

        CheckNotEqual<public>(Expected:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, Actual:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, Message:any, ?Tolerance:float = external {}):void = external {}

        CheckNotEqual<public>(Expected:(/Verse.org/SpatialMath:)vector3, Actual:(/Verse.org/SpatialMath:)vector3, Message:any, ?Tolerance:float = external {}):void = external {}

        CheckNotEqual<public>(Expected:(/Verse.org/SpatialMath:)rotation, Actual:(/Verse.org/SpatialMath:)rotation, Message:any, ?Tolerance:float = external {}):void = external {}

        CheckNotEqual<public>(Expected:(/UnrealEngine.com/Temporary/SpatialMath:)rotation, Actual:(/UnrealEngine.com/Temporary/SpatialMath:)rotation, Message:any, ?Tolerance:float = external {}):void = external {}

        CheckNotEqual<public>(Expected:agent, Actual:agent, Message:any):void = external {}

        CheckNotTrue<public>(Actual:logic, Message:any):void = external {}

        CheckArrayContains<public>(ActualArray:[]string, Expected:string, Message:any):void = external {}

        CheckArrayDoesNotContain<public>(ActualArray:[]string, Expected:string, Message:any):void = external {}

        CheckFailure<public>(TestFuncEval:?any, FuncName:string)<decides>:void = external {}

        Require<public>(OptionalAgent:?agent, Message:any)<transacts><decides>:agent = external {}

        var LastTestErrors<public>:[]string = external {}

        ClearLastTestResult<public>():void = external {}

        GetDisplayTime<public>(DurationInSec:float):string = external {}

        RunTestSuites<public>()<suspends>:void = external {}

        RaiseTestFailure<public>(Error:string)<transacts>:void = external {}

    test_runner_status<public> := enum:
        Pending
        Setup
        (/Fortnite.com/VerseInternalTesting/VerseFramework/test_runner_status:)Running
        Complete

    test_runner_device<epic_internal> := class(creative_device):
        @editable
        TestReportName<public>:string = external {}

        @editable
        TestReportVerbosity<public>:log_level = external {}

        TestRunner<public>:test_runner = external {}

        var Status<public>:test_runner_status = external {}

        OnBegin<override>()<suspends>:void = external {}