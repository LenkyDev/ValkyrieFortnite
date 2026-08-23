# Verse path: /UnrealEngine.com
using {/Verse.org/Native}
@available {MinUploadedAtFNVersion := 4110}
# Module import path: /UnrealEngine.com/GameplayConditionalFrameworkTests
GameplayConditionalFrameworkTests<public> := module:
    using {/Verse.org/Simulation}
    using {/Verse.org/SceneGraph}
    using {/UnrealEngine.com}
    @hide_in_editor
    test_gameplay_conditional_attribute<epic_internal> := class((/UnrealEngine.com:)Progression.gameplay_conditional_attribute):
        OnInitialization<override>(ContextAnchor:entity):void = external {}

        OnInvalidation<override>():void = external {}

        Evaluate<override>()<decides>:void = external {}

    @hide_in_editor
    test_gameplay_conditional<native><epic_internal> := class<concrete>((/UnrealEngine.com:)Progression.gameplay_conditional):
        Attributes<override>:[](/UnrealEngine.com:)Progression.gameplay_conditional_attribute = external {}

        OnInitialization<override>(ContextAnchor:entity):void = external {}

        OnInvalidation<override>():void = external {}

        OnParticipantAdded<override>(Participant:entity):void = external {}

        OnParticipantRemoved<override>(Participant:entity):void = external {}

    @hide_in_editor
    test_gameplay_conditional_context<epic_internal> := class((/UnrealEngine.com:)Progression.gameplay_conditional_context):


    @hide_in_editor
    gameplay_conditional_test_component<native><epic_internal> := class<final_super>(component):
        TestPlayer<native><epic_internal>:player

        NotifyInteropMessageReceived<native><epic_internal>():void

        SetupInteropGameplayConditional<native_callable><epic_internal>():logic = external {}

        TEST_Execute_Participant<native_callable><epic_internal>():logic = external {}