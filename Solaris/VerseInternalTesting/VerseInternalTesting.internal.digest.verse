# Module import path: /Fortnite.com/VerseInternalTesting/NexusFramework
NexusFramework<public> := module:
    using {/Verse.org/Simulation}
    using {/Fortnite.com/Devices}
    using {/UnrealEngine.com/Temporary/Testing}
    nexus_test_reporter<epic_internal> := class:
        AddResult<epic_internal>(TestName:string, TestResult:test_result, ContextString:string, TestSuiteName:string):void = external {}

    nexus_test_runner<epic_internal> := class(creative_device):
        OnEnd<override>():void = external {}

    nexus_test_device<epic_internal> := class(creative_device):
        @editable
        var TestRunner<public>:nexus_test_runner = external {}

        AddResults<epic_internal>(TestName:string, Passed:logic, ContextString:string):void = external {}

        AddPass<epic_internal>(TestName:string, ContextString:string):void = external {}

        AddFail<epic_internal>(TestName:string, ContextString:string):void = external {}

        AddCheck<epic_internal>(IsPassed:logic, TestName:string, ContextString:string):void = external {}

        AddSkip<epic_internal>(IsPassed:logic, TestName:string, ContextString:string):void = external {}

        OnBegin<override>()<suspends>:void = external {}

        OnEnd<override>():void = external {}

    example_nexus_device<epic_internal> := class(nexus_test_device):
        OnBegin<override>()<suspends>:void = external {}

        OnEnd<override>():void = external {}

# Module import path: /Fortnite.com/VerseInternalTesting/VerseFramework
VerseFramework<public> := module:
    using {/Fortnite.com/Characters}
    using {/Verse.org/Colors}
    using {/UnrealEngine.com/Temporary/SpatialMath}
    using {/UnrealEngine.com/Temporary/Diagnostics}
    using {/UnrealEngine.com/Temporary/Testing}
    using {/Verse.org/SceneGraph}
    using {/Fortnite.com/Vehicles}
    using {/Verse.org/Simulation}
    using {/Fortnite.com/Game}
    using {/Fortnite.com/Devices}
    test_device<epic_internal> := class(creative_device):
        var TestRunner<public>:test_runner = external {}

        SuiteName<public>:string = external {}

        TestCases<public>():[]test_case = external {}

        BeforeAll<public>()<suspends>:void = external {}

        AfterAll<public>()<suspends>:void = external {}

        BeforeEach<public>()<suspends>:void = external {}

        AfterEach<public>()<suspends>:void = external {}

        OnBegin<override>():void = external {}

        RegisterTests<public>():void = external {}

    test_device_event_handler_mock<public> := class<concrete>:
        ResetCallCount<public>():void = external {}

        GetCallCount<public>():int = external {}

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

    test_suite_plan<epic_internal> := class:
        TestSuite<epic_internal>:test_suite

        Dependencies<epic_internal>:[]string

        TestCasePlan<epic_internal>:[]test_case_plan = external {}

        var Status<epic_internal>:node_status = external {}

    test_plan<epic_internal> := class:


    test_runner<epic_internal> := class:
        var TestReporter<public>:test_reporter = external {}

        var CurrentTestSuite<public>:string = external {}

        var CurrentFunctionName<public>:string = external {}

        var TargetTestSuite<public>:string = external {}

        var EnableFlakinessEvaluation<public>:logic = external {}

        var FlakinessRunCount<public>:int = external {}

        var EnableVerboseOutput<public>:logic = external {}

        var EnableDebugOutput<public>:logic = external {}

        var EnableLogOutput<public>:logic = external {}

        var EnableTimeTracking<public>:logic = external {}

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

        CheckEqual<public>(Expected:string, Actual:string, Message:string):void = external {}

        CheckEqual<public>(Expected:int, Actual:int, Message:string):void = external {}

        CheckEqual<public>(Expected:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, Actual:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, Message:string, ?Tolerance:float = external {}):void = external {}

        CheckEqual<public>(Expected:vector2, Actual:vector2, Message:string, ?Tolerance:float = external {}):void = external {}

        CheckEqual<public>(Expected:vector2i, Actual:vector2i, Message:string):void = external {}

        CheckEqual<public>(Expected:color, Actual:color, Message:string, ?Tolerance:float = external {}):void = external {}

        CheckEqual<public>(Expected:(/UnrealEngine.com/Temporary/SpatialMath:)rotation, Actual:(/UnrealEngine.com/Temporary/SpatialMath:)rotation, Message:string, ?Tolerance:float = external {}):void = external {}

        CheckEqualIntArray<public>(Expected:[]int, Actual:[]int, Message:string):void = external {}

        CheckEqualFloatArray<public>(Expected:[]float, Actual:[]float, Message:string):void = external {}

        CheckEqual<public>(Expected:float, Actual:float, Message:string, ?Tolerance:float = external {}):void = external {}

        CheckEqual<public>(Expected:(/UnrealEngine.com/Temporary/SpatialMath:)transform, Actual:(/UnrealEngine.com/Temporary/SpatialMath:)transform, Message:string, ?Tolerance:float = external {}):void = external {}

        CheckEqual<public>(Actual:creative_object, Expected:(/UnrealEngine.com/Temporary/SpatialMath:)transform, Message:string, ?Tolerance:float = external {}, ?Timeout:float = external {})<suspends>:void = external {}

        CheckEqual<public>(ActualFortCharacter:fort_character, ExpectedTranslation:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, Message:string, ?Tolerance:float = external {}, ?Timeout:float = external {}, ?CompareX:logic = external {}, ?CompareY:logic = external {}, ?CompareZ:logic = external {})<suspends>:void = external {}

        CheckEqual<public>(Expected:agent, Actual:agent, Message:string):void = external {}

        CheckTrue<public>(Actual:logic, Message:string):void = external {}

        CheckNotEqual<public>(Actual:creative_object, Expected:(/UnrealEngine.com/Temporary/SpatialMath:)transform, Message:string, ?Tolerance:float = external {}, ?Timeout:float = external {})<suspends>:void = external {}

        CheckNotEqual<public>(Expected:string, Actual:string, Message:string):void = external {}

        CheckNotEqual<public>(Expected:int, Actual:int, Message:string):void = external {}

        CheckNotEqual<public>(Expected:float, Actual:float, Message:string):void = external {}

        CheckNotEqual<public>(Expected:(/UnrealEngine.com/Temporary/SpatialMath:)transform, Actual:(/UnrealEngine.com/Temporary/SpatialMath:)transform, Message:string, ?Tolerance:float = external {}):void = external {}

        CheckNotEqual<public>(Expected:agent, Actual:agent, Message:string):void = external {}

        CheckNotTrue<public>(Actual:logic, Message:string):void = external {}

        CheckArrayContains<public>(ActualArray:[]string, Expected:string, Message:string):void = external {}

        CheckArrayDoesNotContain<public>(ActualArray:[]string, Expected:string, Message:string):void = external {}

        CheckFailure<public>(TestFuncEval:?any, FuncName:string)<decides>:void = external {}

        Require<public>(OptionalAgent:?agent, Message:string)<transacts><decides>:agent = external {}

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

        TestReportVerbosity<public>:log_level = external {}

        TestRunner<public>:test_runner = external {}

        var Status<public>:test_runner_status = external {}

        OnBegin<override>()<suspends>:void = external {}