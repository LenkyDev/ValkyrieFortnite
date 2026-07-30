using {/Verse.org/Native}
@available {MinUploadedAtFNVersion := 4110}
# Module import path: /UnrealEngine.com/VerbFrameworkTests
VerbFrameworkTests<public> := module:
    using {/Verse.org/Simulation}
    using {/Verse.org/SceneGraph}
    using {/UnrealEngine.com}
    @hide_in_editor
    test_verb_filter<epic_internal> := class((/UnrealEngine.com:)Progression.verb_filter):
        var ShouldFailEvaluation<epic_internal>:logic = external {}

        Evaluate<override>(SceneEvent:scene_event)<decides>:void = external {}

        GetDelta<override>(SceneEvent:scene_event):float = external {}

    @hide_in_editor
    test_verb_filter_failing<epic_internal> := class(test_verb_filter):
        Evaluate<override>(SceneEvent:scene_event)<decides>:void = external {}

    @hide_in_editor
    test_scene_event<native><epic_internal> := class(scene_event):
        var Received<epic_internal>:logic = external {}

        var ReceivedCount<epic_internal>:int = external {}

    @hide_in_editor
    basic_scene_event<epic_internal> := class(scene_event):
        var Received<epic_internal>:logic = external {}

    @hide_in_editor
    verb_test_component<native><epic_internal> := class<final_super>(component):
        TestPlayer<native><epic_internal>:player

        NotifyInteropMessageReceived<native><epic_internal>():void

        SetupInteropVerbFilter<native_callable><epic_internal>():logic = external {}

        SetupInteropVerbMessage<native_callable><epic_internal>():logic = external {}

        OnInteropMessageReceived<epic_internal>(InEntity:entity, Event:scene_event, Delta:float):void = external {}

        OnTypedInteropMessageReceived<epic_internal>(InEntity:entity, Event:scene_event):void = external {}

        TEST_Shared_RegisterAndUnregister_VerbFilter<native_callable><epic_internal>():logic = external {}

        TEST_Shared_RegisterAndUnregister_Participant<native_callable><epic_internal>():logic = external {}

        TEST_Shared_BroadcastMessage_Participant<native_callable><epic_internal>():logic = external {}

        TEST_Shared_BroadcastMessage_Evaluation<native_callable><epic_internal>():logic = external {}

        TEST_Shared_BroadcastMessage_Interop<native_callable><epic_internal>():logic = external {}

        TEST_Static_RegisterAndUnregister_VerbFilter<native_callable><epic_internal>():logic = external {}

        TEST_Static_RegisterAndUnregister_Participant<native_callable><epic_internal>():logic = external {}

        TEST_Static_BroadcastMessage_Participant<native_callable><epic_internal>():logic = external {}

        TEST_Static_BroadcastMessage_Evaluation<native_callable><epic_internal>():logic = external {}

        TEST_Static_BroadcastMessage_Interop<native_callable><epic_internal>():logic = external {}

        TEST_Instanced_RegisterAndUnregister_VerbFilter<native_callable><epic_internal>():logic = external {}

        TEST_Instanced_RegisterAndUnregister_Participant<native_callable><epic_internal>():logic = external {}

        TEST_Instanced_BroadcastMessage_Participant<native_callable><epic_internal>():logic = external {}

        TEST_Instanced_BroadcastMessage_Evaluation<native_callable><epic_internal>():logic = external {}

        TEST_Instanced_BroadcastMessage_Interop<native_callable><epic_internal>():logic = external {}

        TEST_VerbMessageType_RegisterAndUnregister<native_callable><epic_internal>():logic = external {}

        TEST_VerbMessageType_Broadcast<native_callable><epic_internal>():logic = external {}

        TEST_VerbMessageType_Broadcast_Interop<native_callable><epic_internal>():logic = external {}