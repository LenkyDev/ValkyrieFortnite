using {/Verse.org/StateMachine}
using {/Verse.org/SceneGraph}
using {/Verse.org/Progression}
using {/Verse.org/Simulation}
using {/UnrealEngine.com/Progression}
@hide_in_editor
test_ecosystem_entitlement<native><epic_internal> := class(ecosystem_entitlement):


@hide_in_editor
progression_test_quest<native><epic_internal> := class(basic_quest):


@hide_in_editor
progression_test_participant<native><epic_internal> := class(quest_participant):


@hide_in_editor
test_conditional<native><epic_internal> := class<epic_internal>(gameplay_conditional):
    OnInitialization<override>(ContextAnchor:entity):void = external {}

    OnInvalidation<override>():void = external {}

    OnParticipantAdded<override>(Participant:entity):void = external {}

    OnParticipantRemoved<override>(Participant:entity):void = external {}

@hide_in_editor
test_progression_verb_filter<epic_internal> := class(verb_filter):
    Evaluate<override>(SceneEvent:scene_event)<decides>:void = external {}

    GetDelta<override>(SceneEvent:scene_event):float = external {}

@hide_in_editor
test_progression_scene_event<native><epic_internal> := class(scene_event):


@hide_in_editor
conforming_quest_objective_state<native><epic_internal> := class(quest_objective_state):
    var OnEnterCalledFlag<native><epic_internal>:logic = external {}

    var OnExitCalledFlag<native><epic_internal>:logic = external {}

    OnEnter<override><native>():void

    OnExit<override><native>():void

@hide_in_editor
progression_core_test_component<native><epic_internal> := class<final_super>(component):
    var<private> TestManagerComponent<native><epic_internal>:?quest_manager_component = external {}

    MakeProgressObjective<epic_internal>(Progress:float, RequiredCount:float)<transacts>:progress_quest_objective = external {}

    MakeCompositeObjective<epic_internal>(Objectives:[]quest_objective, RequiredCount:int)<transacts>:composite_quest_objective = external {}

    MakeSequentialObjective<epic_internal>(Objectives:[]quest_objective)<transacts>:sequential_quest_objective = external {}

    MakeTimedObjective<epic_internal>(Objective:quest_objective, TimeLimit:float)<transacts>:timed_quest_objective = external {}

    MakeConditionalObjective<epic_internal>(Progress:float, RequiredCount:float, Conditionals:[]subtype(gameplay_conditional))<transacts>:conditional_quest_objective = external {}

    MakeTestQuest<epic_internal>(Objective:quest_objective)<transacts>:progression_test_quest = external {}

    MakeStateMachineObjective<epic_internal>((local:)StateMachine:state_machine, CompletionStates:[]quest_objective_state)<transacts>:state_machine_quest_objective = external {}

    MakeEntitlementReward<epic_internal>(Quantity:int)<transacts>:entitlement_quest_reward = external {}

    TEST_ContextualReactions_Cleanup<native_callable><epic_internal>():logic = external {}

    TEST_ConditionalVerbs_OnInitRegistersHandles<native_callable><epic_internal>():logic = external {}

    TEST_ConditionalVerbs_ParticipantLifecycle<native_callable><epic_internal>():logic = external {}

    TEST_ConditionalVerbs_OnInvalidationCleanup<native_callable><epic_internal>():logic = external {}

    TEST_ConditionalVerbs_VerbMessageExecuteChain<native_callable><epic_internal>():logic = external {}

    TEST_ReactionsCache_InvalidateUnregistersHandle<native_callable><epic_internal>():logic = external {}

    TEST_ReactionsCache_EmptyReactionsNoOp<native_callable><epic_internal>():logic = external {}

    TEST_ConditionalVerbs_VerbMessageTypesRegistration<native_callable><epic_internal>():logic = external {}

    TEST_ConditionalVerbs_BothFilterAndMessageTypes<native_callable><epic_internal>():logic = external {}

    TEST_ConditionalVerbs_MultipleBroadcastsMultipleCallbacks<native_callable><epic_internal>():logic = external {}

    TEST_ConditionalVerbs_NoBroadcastAfterInvalidation<native_callable><epic_internal>():logic = external {}

    TEST_ConditionalVerbs_EmptyTypesNoCallback<native_callable><epic_internal>():logic = external {}

    TEST_StateMachineObjective_IsComplete_InCompletionState<native_callable><epic_internal>():logic = external {}

    TEST_StateMachineObjective_IsComplete_NotInCompletionState<native_callable><epic_internal>():logic = external {}

    TEST_StateMachineObjective_GetProgress_DelegatesToCurrentState<native_callable><epic_internal>():logic = external {}

    TEST_StateMachineObjective_CompletionEvent_Fires<native_callable><epic_internal>():logic = external {}

    TEST_QuestObjectiveState_ConformingSuperCallsPass<native_callable><epic_internal>():logic = external {}

    TEST_StateMachine_CompletionStates_SatisfyOnMatch<native_callable><epic_internal>():logic = external {}

    TEST_StateMachineObjective_UpdateCurrentState_Syncs<native_callable><epic_internal>():logic = external {}

    TEST_EntitlementReward_FieldsSetCorrectly<native_callable><epic_internal>():logic = external {}

    TEST_EntitlementReward_GrantReward_NoOpOnEmptyParticipants<native_callable><epic_internal>():logic = external {}

    TEST_ConditionalObjective_OnActivate_RegistersConditionals<native_callable><epic_internal>():logic = external {}

    TEST_ConditionalObjective_OnConditionalExecuted_AddsProgress<native_callable><epic_internal>():logic = external {}

    TEST_ConditionalObjective_OnDeactivate_UnregistersHandles<native_callable><epic_internal>():logic = external {}

    TEST_ConditionalObjective_OnJoin_AddsParticipant<native_callable><epic_internal>():logic = external {}

    TEST_ConditionalObjective_ManagerEntity_AccessPatternIsCorrect<native_callable><epic_internal>():logic = external {}

    TEST_Progress_AddProgress_ClampsToZeroAndRequiredCount<native_callable><epic_internal>():logic = external {}

    TEST_Progress_SetProgress_ClampsToZeroAndRequiredCount<native_callable><epic_internal>():logic = external {}

    TEST_Progress_SetRequiredCount_ClampsToMinOne<native_callable><epic_internal>():logic = external {}

    TEST_Progress_IsComplete_WhenProgressReachesRequiredCount<native_callable><epic_internal>():logic = external {}

    TEST_Progress_CompleteEvent_FiresOnBoundary<native_callable><epic_internal>():logic = external {}

    TEST_Composite_RequiredCountZero_MeansAll<native_callable><epic_internal>():logic = external {}

    TEST_Composite_RequiredCountN_CompleteWhenNChildrenComplete<native_callable><epic_internal>():logic = external {}

    TEST_Composite_RequiredCountExceedsChildren_NeverSatisfies<native_callable><epic_internal>():logic = external {}

    TEST_Composite_SubObjectiveCompletion_Propagates<native_callable><epic_internal>():logic = external {}

    TEST_Composite_Nested_Composite_Satisfies<native_callable><epic_internal>():logic = external {}

    TEST_Sequential_OrderEnforced<native_callable><epic_internal>():logic = external {}

    TEST_Sequential_AdvancesPastPreCompletedChildren<native_callable><epic_internal>():logic = external {}

    TEST_Sequential_CurrentStageIndex_StaysAtLast<native_callable><epic_internal>():logic = external {}

    TEST_Sequential_OnActivate_InitializesAutoMonitoring<native_callable><epic_internal>():logic = external {}

    TEST_Sequential_CompleteEventAdvances<native_callable><epic_internal>():logic = external {}

    TEST_Timed_UpdateTimeRemaining_Decrements<native_callable><epic_internal>():logic = external {}

    TEST_Timed_TimeExpiredEvent_FiresOnce<native_callable><epic_internal>():logic = external {}

    TEST_Timed_CompletionLatch_OnInnerCompleteBeforeExpiry<native_callable><epic_internal>():logic = external {}

    TEST_Timed_Deactivation_ResetsLatch<native_callable><epic_internal>():logic = external {}

    var ConditionalVerbsCallbackCount<epic_internal>:int = external {}

    var EventFiredFlag<epic_internal>:logic = external {}

    OnObjectiveEventFired<epic_internal>(Obj:quest_objective)<transacts>:void = external {}

    var TimeExpiredCount<epic_internal>:int = external {}

    OnTimeExpiredCounter<epic_internal>(Obj:timed_quest_objective)<transacts>:void = external {}