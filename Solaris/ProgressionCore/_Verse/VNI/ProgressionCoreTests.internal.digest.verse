using {/Verse.org/StateMachine}
using {/Verse.org/SceneGraph}
using {/Verse.org/Progression}
using {/Verse.org/Simulation}
using {/UnrealEngine.com/Progression}
@experimental
@hide_in_editor
test_ecosystem_entitlement<native><epic_internal> := class(ecosystem_entitlement):


@experimental
@hide_in_editor
progression_test_quest<native><epic_internal> := class(basic_quest):


@experimental
@hide_in_editor
progression_test_participant<native><epic_internal> := class(quest_participant):


@experimental
@hide_in_editor
test_conditional<native><epic_internal> := class<epic_internal>(gameplay_conditional):
    OnInitialization<override>(ContextAnchor:entity):void = external {}

    OnInvalidation<override>():void = external {}

    OnParticipantAdded<override>(Participant:entity):void = external {}

    OnParticipantRemoved<override>(Participant:entity):void = external {}

@experimental
@hide_in_editor
test_progression_verb_filter<epic_internal> := class(verb_filter):
    Evaluate<override>(SceneEvent:scene_event)<decides>:void = external {}

    GetDelta<override>(SceneEvent:scene_event):float = external {}

@experimental
@hide_in_editor
test_progression_scene_event<native><epic_internal> := class(scene_event):


@experimental
@hide_in_editor
conforming_quest_objective_state<native><epic_internal> := class(quest_objective_state):
    var OnEnterCalledFlag<native><epic_internal>:logic = external {}

    var OnExitCalledFlag<native><epic_internal>:logic = external {}

    OnEnter<override><native>():void

    OnExit<override><native>():void

@experimental
@hide_in_editor
gated_progress_objective<epic_internal> := class(progress_quest_objective):
    var ProgressAllowed<epic_internal>:logic = external {}

    CanProgress<override>()<reads><decides>:void = external {}

    SetProgressAllowed<epic_internal>(InAllowed:logic)<transacts>:void = external {}

@experimental
@hide_in_editor
nested_lifecycle_recorder<native><epic_internal> := class(quest_objective):
    var CompletedFlag<native><epic_internal>:logic = external {}

    var OnActivateCalledFlag<native><epic_internal>:logic = external {}

    var OnDeactivateCalledFlag<native><epic_internal>:logic = external {}

    var OnJoinCallCount<native><epic_internal>:int = external {}

    var OnAbandonCallCount<native><epic_internal>:int = external {}

    GetProgress<override><native>()<reads>:message

    IsComplete<override><native>()<reads><decides>:void

    MarkComplete<native><epic_internal>():void

    OnActivate<override><native>():void

    OnDeactivate<override><native>():void

    OnJoin<override><native>(QuestParticipant:quest_participant):void

    OnAbandon<override><native>(QuestParticipant:quest_participant):void

ProgressViewTestDisplayName<localizes><epic_internal>:message = external {}

ProgressViewTestDescription<localizes><epic_internal>:message = external {}

ProgressViewTestShortDescription<localizes><epic_internal>:message = external {}

@experimental
@hide_in_editor
progression_core_test_component<native><epic_internal> := class<final_super>(component):
    var<private> TestManagerComponent<native><epic_internal>:?quest_manager_component = external {}

    MakeProgressObjective<epic_internal>(Progress:float, RequiredCount:float)<transacts>:progress_quest_objective = external {}

    MakeCompositeObjective<epic_internal>(Objectives:[]quest_objective, RequiredCount:int)<transacts>:composite_quest_objective = external {}

    MakeSequentialObjective<epic_internal>(Objectives:[]quest_objective)<transacts>:sequential_quest_objective = external {}

    MakeTimedObjective<epic_internal>(Objective:quest_objective, TimeLimit:float)<transacts>:timed_quest_objective = external {}

    MakeConditionalObjective<epic_internal>(Progress:float, RequiredCount:float, Conditionals:[]subtype(gameplay_conditional))<transacts>:conditional_quest_objective = external {}

    MakeNestedLifecycleRecorder<epic_internal>()<transacts>:nested_lifecycle_recorder = external {}

    MakeTestQuest<epic_internal>(Objective:quest_objective)<transacts>:progression_test_quest = external {}

    MakeStateMachineObjective<epic_internal>((local:)StateMachine:state_machine, CompletionStates:[]quest_objective_state)<transacts>:state_machine_quest_objective = external {}

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

    TEST_Progress_ProgressEvent_FiresOnAddProgress<native_callable><epic_internal>():logic = external {}

    TEST_Progress_ProgressEvent_NoFireOnZeroAdd<native_callable><epic_internal>():logic = external {}

    TEST_Progress_ProgressEvent_NoFireOnClampedNoOp<native_callable><epic_internal>():logic = external {}

    TEST_Progress_ProgressEvent_FiresOnSetProgress<native_callable><epic_internal>():logic = external {}

    TEST_Progress_ProgressEvent_NoFireOnSetSameValue<native_callable><epic_internal>():logic = external {}

    TEST_Progress_ProgressEvent_FiresOnSetRequiredCountReclamp<native_callable><epic_internal>():logic = external {}

    TEST_Progress_ProgressEvent_NoFireOnSetRequiredCountNoMove<native_callable><epic_internal>():logic = external {}

    TEST_Progress_ProgressEvent_BothEventsFireOnCompletionBoundary<native_callable><epic_internal>():logic = external {}

    TEST_Progress_ProgressEvent_ListenerMutates_HandlerSelfTerminatesWithoutCrash<native_callable><epic_internal>():logic = external {}

    TEST_Progress_ProgressEvent_ListenerCompletes_BothEventsFireAndQuestCompletes<native_callable><epic_internal>():logic = external {}

    TEST_Progress_CanProgress_DefaultAllowsAddProgress<native_callable><epic_internal>():logic = external {}

    TEST_Progress_CanProgress_BlocksAddProgressWhenDenied<native_callable><epic_internal>():logic = external {}

    TEST_Progress_CanProgress_BlocksSetProgressWhenDenied<native_callable><epic_internal>():logic = external {}

    TEST_Progress_CanProgress_AllowsAddProgressAfterReEnable<native_callable><epic_internal>():logic = external {}

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

    TEST_Composite_LifecyclePropagatesToAllChildren_Once<native_callable><epic_internal>():logic = external {}

    TEST_Sequential_LifecyclePropagatesToCurrentChildOnly<native_callable><epic_internal>():logic = external {}

    TEST_Sequential_DeactivateWhileJoined_NoAbandon<native_callable><epic_internal>():logic = external {}

    TEST_Sequential_Advance_CyclesParticipants<native_callable><epic_internal>():logic = external {}

    TEST_Sequential_InitAdvance_HandsOffParticipants<native_callable><epic_internal>():logic = external {}

    TEST_Sequential_JoinBeforeActivate_NoPreComplete_NoSpuriousCycle<native_callable><epic_internal>():logic = external {}

    TEST_Composite_DeactivateWhileJoined_NoAbandon<native_callable><epic_internal>():logic = external {}

    TEST_Composite_JoinBeforeActivate_NoDoubleJoin<native_callable><epic_internal>():logic = external {}

    TEST_Timed_LifecyclePropagatesToInner_Once<native_callable><epic_internal>():logic = external {}

    TEST_Timed_DeactivateWhileJoined_NoAbandon<native_callable><epic_internal>():logic = external {}

    TEST_Timed_JoinBeforeActivate_NoDoubleJoin<native_callable><epic_internal>():logic = external {}

    TEST_Composite_ChildCompletionPropagatesUp<native_callable><epic_internal>():logic = external {}

    TEST_Sequential_NestedComposite_CompletionBubbles<native_callable><epic_internal>():logic = external {}

    var ConditionalVerbsCallbackCount<epic_internal>:int = external {}

    var EventFiredFlag<epic_internal>:logic = external {}

    OnObjectiveEventFired<epic_internal>(Obj:quest_objective)<transacts>:void = external {}

    var ProgressEventFiredFlag<epic_internal>:logic = external {}

    var CapturedProgressValue<epic_internal>:float = external {}

    var CapturedProgressObjective<epic_internal>:?quest_objective = external {}

    var CompleteEventOrderIndex<epic_internal>:int = external {}

    var OrderCounter<epic_internal>:int = external {}

    OnProgressEventCaptured<epic_internal>(Objective:quest_objective)<transacts>:void = external {}

    OnCompleteEventOrderCaptured<epic_internal>(Objective:quest_objective)<transacts>:void = external {}

    var ReentrantProgressObj<epic_internal>:?progress_quest_objective = external {}

    var ReentrantFireCount<epic_internal>:int = external {}

    ReentrancyMaxDepth<epic_internal>:int = external {}

    OnProgressEventTriggersMoreProgress<epic_internal>(Objective:quest_objective)<transacts>:void = external {}

    var ReentrantOwningQuest<epic_internal>:?quest = external {}

    var ReentrantProgressEventFiredFlag<epic_internal>:logic = external {}

    var ReentrantQuestCompleteEventFiredFlag<epic_internal>:logic = external {}

    OnProgressEventCompletesQuest<epic_internal>(Objective:quest_objective)<transacts>:void = external {}

    OnReentrantQuestCompleted<epic_internal>(CompletedQuest:quest)<transacts>:void = external {}

    var TimeExpiredCount<epic_internal>:int = external {}

    OnTimeExpiredCounter<epic_internal>(Obj:timed_quest_objective)<transacts>:void = external {}

    TEST_E2E_VerbBroadcast_IncrementsObjectiveProgress<native_callable><epic_internal>():logic = external {}

    TEST_E2E_NVerbBroadcasts_AutoCompletesQuest<native_callable><epic_internal>():logic = external {}

    TEST_E2E_UnregisteredAuthor_DoesNotIncrementProgress<native_callable><epic_internal>():logic = external {}

    TEST_E2E_BroadcastBeforeParticipantJoins_NoProgress<native_callable><epic_internal>():logic = external {}

    TEST_E2E_QuestCompletedEvent_FiresOnVerbChainCompletion<native_callable><epic_internal>():logic = external {}

    var VerbBroadcastConditionalObj<epic_internal>:?conditional_quest_objective = external {}

    OnVerbFired<epic_internal>(Context:gameplay_conditional_context):void = external {}

    var QuestCompletedEventCount<epic_internal>:int = external {}

    OnQuestCompletedCounter<epic_internal>(CompletedQuest:quest)<transacts>:void = external {}

    TEST_Bridge_AssertConstructViewReturnsProgressSubclass<native><epic_internal>(Objective:progress_quest_objective):logic

    TEST_Bridge_AssertConstructViewPopulatesAchievedAndRequired<native><epic_internal>(Objective:progress_quest_objective, ExpectedAchieved:float, ExpectedRequired:float):logic

    TEST_Bridge_AssertConstructViewAppliesDisplayData<native><epic_internal>(Objective:progress_quest_objective):logic

    TEST_Bridge_AssertConstructViewPropagatesBComplete<native><epic_internal>(Objective:progress_quest_objective, ExpectedComplete:logic):logic

    TEST_Bridge_AssertRequiredCountEquals<native><epic_internal>(Objective:progress_quest_objective, Expected:float):logic

    TEST_Progress_Construct_ReturnsProgressSubclass<native_callable><epic_internal>():logic = external {}

    TEST_Progress_Construct_PopulatesAchievedAndRequired<native_callable><epic_internal>():logic = external {}

    TEST_Progress_Construct_AppliesDisplayDataDespiteBypass<native_callable><epic_internal>():logic = external {}

    TEST_Progress_Construct_PropagatesBCompleteOnSatisfaction<native_callable><epic_internal>():logic = external {}

    TEST_Progress_Construct_PropagatesBCompleteFalseWhenIncomplete<native_callable><epic_internal>():logic = external {}

    TEST_Progress_ProgressEvent_FiresWithClampedValueOnOvershoot<native_callable><epic_internal>():logic = external {}

    TEST_Progress_SetRequiredCount_ClampsBelowOne_ObservableInView<native_callable><epic_internal>():logic = external {}

    TEST_Bridge_AssertBasicQuestObjectiveStatesPolymorphic<native><epic_internal>(Quest:basic_quest):logic

    TEST_BasicQuest_Construct_PopulatesObjectiveStatesFromVerse<native_callable><epic_internal>():logic = external {}