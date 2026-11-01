# Verse path: /UnrealEngine.com
using {/Verse.org/Native}
@available {MinUploadedAtFNVersion := 4300}
# Module import path: /UnrealEngine.com/ProgressionCoreTests
ProgressionCoreTests<public> := module:
    using {/Verse.org/StateMachine}
    using {/Verse.org/SceneGraph}
    using {/Verse.org/Simulation}
    using {/Verse.org/Presentation}
    using {/Verse.org/Assets}
    using {/Verse.org}
    using {/UnrealEngine.com}
    @hide_in_editor
    manager_less_probe_objective<native><epic_internal> := class((/UnrealEngine.com:)Progression.progress_objective, (/Verse.org:)Progression.has_objective_contributors, (/Verse.org:)Progression.has_objective_anchor, has_icon, has_description):
        var OnActivateCallCount<native><epic_internal>:int = external {}

        var LastActivationContextWasSet<native><epic_internal>:logic = external {}

        var ContributorsAdded<native><epic_internal>:[]agent = external {}

        var ContributorsRemoved<native><epic_internal>:[]agent = external {}

        var OnCompleteCallCount<native><epic_internal>:int = external {}

        OnActivate<override><native>()<transacts>:void

        AddContributor<override>(Agent:agent)<transacts>:void = external {}

        RemoveContributor<override>(Agent:agent)<transacts>:void = external {}

        OnComplete<override><native>(Reason:(/Verse.org:)Progression.complete_objective_reason)<transacts>:void

    @hide_in_editor
    manager_less_e2e_component<native><epic_internal> := class<final_super>(component):
        var<private> Fixtures<native><epic_internal>:?progression_core_test_component = external {}

        var ProbeObjective<native><epic_internal>:?manager_less_probe_objective = external {}

        var TestReward<native><epic_internal>:?recording_reward = external {}

        var AgentA<native><epic_internal>:?agent = external {}

        var MembershipCountAtJoin<native><epic_internal>:int = external {}

        var GrantEventCount<native><epic_internal>:int = external {}

        var LastGrantEventReward<native><epic_internal>:?(/UnrealEngine.com:)Progression.quest_reward = external {}

        var LastGrantEventParticipants<native><epic_internal>:[](/Verse.org:)Progression.quest_participant = external {}

        var LastGrantEventOrder<native><epic_internal>:int = external {}

        var ObjectiveProgressEventCount<native><epic_internal>:int = external {}

        var ObjectiveCompleteEventCount<native><epic_internal>:int = external {}

        var ParticipantCompleteEventCount<native><epic_internal>:int = external {}

        var QuestCompleteAfterFirstProgress<native><epic_internal>:logic = external {}

        var QuestCompleteAtEnd<native><epic_internal>:logic = external {}

        var NoContextHandleCount<native><epic_internal>:int = external {}

        var NoContextProgress<native><epic_internal>:float = external {}

        var DeactivatedHandleCount<native><epic_internal>:int = external {}

        var ReactivatedHandleCount<native><epic_internal>:int = external {}

        var ReactivatedProgress<native><epic_internal>:float = external {}

        var AbandonedHandleCount<native><epic_internal>:int = external {}

        var AbandonedProgress<native><epic_internal>:float = external {}

        var NoContextQuestActive<native><epic_internal>:logic = external {}

        var CompletionCheckRan<native><epic_internal>:logic = external {}

        MakeProbeObjective<epic_internal>(RequiredProgress:float)<transacts>:manager_less_probe_objective = external {}

        MakeQuestWithReward<epic_internal>(Objective:(/Verse.org:)Progression.objective, Reward:(/UnrealEngine.com:)Progression.quest_reward)<transacts>:progression_test_quest = external {}

        TEST_E2E_ManagerLess_InternalFlow_ProgressToGrant<native_callable><epic_internal>():logic = external {}

        TEST_E2E_ManagerLess_NoContext_ConditionalRegistersOnJoinedContributor<native_callable><epic_internal>():logic = external {}

        OnRewardGrantEventFired<epic_internal>(Data:(/UnrealEngine.com:)Progression.quest_reward_grant_event_data)<transacts>:void = external {}

        OnObjectiveProgressed<epic_internal>(Objective:(/Verse.org:)Progression.objective)<transacts>:void = external {}

        OnObjectiveCompleted<epic_internal>(Data:(/Verse.org:)Progression.objective_complete_event_data)<transacts>:void = external {}

        OnParticipantCompleted<epic_internal>(Data:(/Verse.org:)Progression.quest_membership_complete_event_data)<transacts>:void = external {}

    @hide_in_editor
    test_ecosystem_entitlement<native><epic_internal> := class((/UnrealEngine.com:)Progression.ecosystem_entitlement):


    @hide_in_editor
    progression_test_quest<native><epic_internal> := class((/UnrealEngine.com:)Progression.basic_quest, has_icon, has_description):
        ReHome<epic_internal>(InCollection:(/Verse.org:)Progression.quest_collection)<transacts>:void = external {}

        WireRewards<epic_internal>(InRewards:[](/UnrealEngine.com:)Progression.quest_reward)<transacts>:void = external {}

        WireObjective<epic_internal>(InObjective:(/Verse.org:)Progression.objective)<transacts>:void = external {}

    @hide_in_editor
    progression_bare_quest<native><epic_internal> := class((/Verse.org:)Progression.quest):


    @hide_in_editor
    progression_test_participant<native><epic_internal> := class((/Verse.org:)Progression.quest_participant):


    @hide_in_editor
    test_conditional<native><epic_internal> := class<concrete><epic_internal>((/UnrealEngine.com:)Progression.gameplay_conditional):
        OnInitialization<override>(ContextAnchor:entity):void = external {}

        OnInvalidation<override>():void = external {}

        OnParticipantAdded<override>(Participant:entity):void = external {}

        OnParticipantRemoved<override>(Participant:entity):void = external {}

    @hide_in_editor
    test_progression_verb_filter<epic_internal> := class((/UnrealEngine.com:)Progression.verb_filter):
        Evaluate<override>(SceneEvent:scene_event)<decides>:void = external {}

        GetDelta<override>(SceneEvent:scene_event):float = external {}

    @hide_in_editor
    test_progression_scene_event<native><epic_internal> := class(scene_event):


    @hide_in_editor
    conforming_objective_state<native><epic_internal> := class((/UnrealEngine.com:)Progression.objective_machine_state):
        var OnEnterCalledFlag<native><epic_internal>:logic = external {}

        var OnExitCalledFlag<native><epic_internal>:logic = external {}

        OnEnter<override><native>():void

        OnExit<override><native>():void

    @hide_in_editor
    gated_progress_objective<epic_internal> := class((/UnrealEngine.com:)Progression.progress_objective, has_icon, has_description):
        var ProgressAllowed<epic_internal>:logic = external {}

        CanProgress<override>()<decides><reads>:void = external {}

        SetProgressAllowed<epic_internal>(InAllowed:logic)<transacts>:void = external {}

    @hide_in_editor
    nested_lifecycle_recorder<native><epic_internal> := class((/Verse.org:)Progression.objective, (/Verse.org:)Progression.has_objective_contributors, (/Verse.org:)Progression.has_objective_anchor, has_icon, has_description):
        var CompletedFlag<native><epic_internal>:logic = external {}

        var OnActivateCalledFlag<native><epic_internal>:logic = external {}

        var OnDeactivateCalledFlag<native><epic_internal>:logic = external {}

        var AddContributorCallCount<native><epic_internal>:int = external {}

        var RemoveContributorCallCount<native><epic_internal>:int = external {}

        var OnActivateCallCount<native><epic_internal>:int = external {}

        var OnDeactivateCallCount<native><epic_internal>:int = external {}

        var LastActivationContextWasSet<native><epic_internal>:logic = external {}

        var LastActivationContext<native><epic_internal>:?entity = external {}

        GetProgress<override><native>()<reads>:message

        MarkComplete<native><epic_internal>()<transacts>:void

        OnActivate<override><native>()<transacts>:void

        OnDeactivate<override><native>()<transacts>:void

        AddContributor<override>(Agent:agent)<transacts>:void = external {}

        RemoveContributor<override>(Agent:agent)<transacts>:void = external {}

    @hide_in_editor
    context_recording_progress_objective<native><epic_internal> := class((/UnrealEngine.com:)Progression.progress_objective, (/Verse.org:)Progression.has_objective_contributors, (/Verse.org:)Progression.has_objective_anchor, has_icon, has_description):
        var OnActivateCallCount<native><epic_internal>:int = external {}

        var LastActivationContextWasSet<native><epic_internal>:logic = external {}

        var LastActivationContext<native><epic_internal>:?entity = external {}

        var OnCompleteCallCount<native><epic_internal>:int = external {}

        var AddContributorCallCount<native><epic_internal>:int = external {}

        var RemoveContributorCallCount<native><epic_internal>:int = external {}

        OnActivate<override><native>()<transacts>:void

        OnComplete<override><native>(Reason:(/Verse.org:)Progression.complete_objective_reason)<transacts>:void

        AddContributor<override>(Agent:agent)<transacts>:void = external {}

        RemoveContributor<override>(Agent:agent)<transacts>:void = external {}

    @hide_in_editor
    recording_reward<native><epic_internal> := class((/UnrealEngine.com:)Progression.quest_reward):
        var GrantedParticipants<native><epic_internal>:[](/Verse.org:)Progression.quest_participant = external {}

        var GrantRewardCallCount<native><epic_internal>:int = external {}

        var GrantRewardOrder<native><epic_internal>:int = external {}

        OnGrant<override><native>(EligibleMemberships:[](/Verse.org:)Progression.quest_membership)<transacts>:void

    @hide_in_editor
    contributor_counting_conditional_objective<native><epic_internal> := class((/UnrealEngine.com:)Progression.conditional_objective, has_icon, has_description):
        var OnContributorAddedCallCount<native><epic_internal>:int = external {}

        var OnContributorRemovedCallCount<native><epic_internal>:int = external {}

        AddContributor<override>(Agent:agent)<transacts>:void = external {}

        RemoveContributor<override>(Agent:agent)<transacts>:void = external {}

    @hide_in_editor
    (/UnrealEngine.com/ProgressionCoreTests:)pure_verse_test_objective<epic_internal> := class((/Verse.org:)Progression.objective):
        GetProgress<override>()<reads>:message = external {}

    @hide_in_editor
    (/UnrealEngine.com/ProgressionCoreTests:)verse_only_contributor_objective<epic_internal> := class((/UnrealEngine.com:)Progression.progress_objective, (/Verse.org:)Progression.has_objective_contributors):


    @hide_in_editor
    claim_test_modular_quest<epic_internal> := class((/UnrealEngine.com:)Progression.modular_quest):
        WireRewards<epic_internal>(InRewards:[](/UnrealEngine.com:)Progression.quest_reward)<transacts>:void = external {}

    @hide_in_editor
    test_veto_objective_error<epic_internal> := class((/Verse.org:)Progression.objective_error):


    MakeTestVetoObjectiveErrorResult<native_callable><epic_internal>():result(void, [](/Verse.org:)Progression.objective_error) = external {}

    @hide_in_editor
    veto_guards_restore_test_quest<native><epic_internal> := class((/UnrealEngine.com:)Progression.basic_quest, has_icon, has_description):
        var Allow<native><epic_internal>:logic = external {}

        var OnActivateCallCount<native><epic_internal>:int = external {}

        var OnCompleteCallCount<native><epic_internal>:int = external {}

        SetAllow<epic_internal>(InAllow:logic)<transacts>:void = external {}

        CanActivate<override><native>()<reads>:result(void, [](/Verse.org:)Progression.objective_error)

        CanComplete<override><native>(Reason:(/Verse.org:)Progression.complete_objective_reason)<reads>:result(void, [](/Verse.org:)Progression.objective_error)

        OnActivate<override><native>()<transacts>:void

        OnComplete<override><native>(Reason:(/Verse.org:)Progression.complete_objective_reason)<transacts>:void

        WireRewards<epic_internal>(InRewards:[](/UnrealEngine.com:)Progression.quest_reward)<transacts>:void = external {}

    @hide_in_editor
    rewarded_restore_test_quest<native><epic_internal> := class((/UnrealEngine.com:)Progression.basic_quest, has_icon, has_description):
        ReHome<epic_internal>(InCollection:(/Verse.org:)Progression.quest_collection)<transacts>:void = external {}

    @hide_in_editor
    gated_activate_objective<epic_internal> := class((/UnrealEngine.com:)Progression.progress_objective):
        var ActivateAllowed<epic_internal>:logic = external {}

        VetoErrors<epic_internal>:[](/Verse.org:)Progression.objective_error = external {}

        CanActivate<override>()<reads>:result(void, [](/Verse.org:)Progression.objective_error) = external {}

        SetActivateAllowed<epic_internal>(InAllowed:logic)<transacts>:void = external {}

    @hide_in_editor
    gated_activate_lifecycle_recorder<epic_internal> := class(nested_lifecycle_recorder):
        var ActivateAllowed<epic_internal>:logic = external {}

        VetoErrors<epic_internal>:[](/Verse.org:)Progression.objective_error = external {}

        CanActivate<override>()<reads>:result(void, [](/Verse.org:)Progression.objective_error) = external {}

    @hide_in_editor
    nonchaining_guard_test_quest<epic_internal> := class(progression_test_quest):
        CanActivate<override>()<reads>:result(void, [](/Verse.org:)Progression.objective_error) = external {}

    @hide_in_editor
    empty_veto_objective<epic_internal> := class((/UnrealEngine.com:)Progression.progress_objective):
        EmptyVetoErrors<epic_internal>:[](/Verse.org:)Progression.objective_error = external {}

        CanActivate<override>()<reads>:result(void, [](/Verse.org:)Progression.objective_error) = external {}

    @hide_in_editor
    rebinding_objective<epic_internal> := class((/UnrealEngine.com:)Progression.progress_objective):
        var RebindQuest<epic_internal>:?progression_test_quest = external {}

        var RebindTarget<epic_internal>:?(/Verse.org:)Progression.objective = external {}

        Arm<epic_internal>(InQuest:progression_test_quest, InTarget:(/Verse.org:)Progression.objective)<transacts>:void = external {}

        OnDeactivate<override>()<transacts>:void = external {}

    @hide_in_editor
    test_reward_veto_error<epic_internal> := class((/UnrealEngine.com:)Progression.quest_reward_error):


    @hide_in_editor
    refusing_grant_reward<epic_internal> := class(recording_reward):
        VetoErrors<epic_internal>:[](/UnrealEngine.com:)Progression.quest_reward_error = external {}

        CanGrant<override>()<reads>:result(void, [](/UnrealEngine.com:)Progression.quest_reward_error) = external {}

    ProgressViewTestDisplayName<localizes><epic_internal>:message = external {}

    ProgressViewTestDescription<localizes><epic_internal>:message = external {}

    ProgressViewTestShortDescription<localizes><epic_internal>:message = external {}

    PureVerseObjectiveProgressText<localizes><epic_internal>:message = external {}

    FilterClaimErrorsByType<epic_internal>(Items:[](/UnrealEngine.com:)Progression.claim_reward_error, error_type:castable_subtype((/UnrealEngine.com:)Progression.claim_reward_error))<transacts>:[]error_type = external {}

    @hide_in_editor
    progression_core_test_component<native><epic_internal> := class<final_super>(component):
        var<private> TestManagerComponent<native><epic_internal>:?(/Verse.org:)Progression.quest_manager_component = external {}

        MakeProgressObjective<epic_internal>(Progress:float, RequiredProgress:float)<transacts>:(/UnrealEngine.com:)Progression.progress_objective = external {}

        MakeCompositeObjective<epic_internal>(Objectives:[](/Verse.org:)Progression.objective, RequiredCount:int)<transacts>:(/UnrealEngine.com:)Progression.composite_objective = external {}

        MakeSequentialObjective<epic_internal>(Objectives:[](/Verse.org:)Progression.objective)<transacts>:(/UnrealEngine.com:)Progression.sequential_objective = external {}

        MakeTimedObjective<epic_internal>(Objective:(/Verse.org:)Progression.objective, TimeLimit:float)<transacts>:(/UnrealEngine.com:)Progression.timed_objective = external {}

        MakeConditionalObjective<epic_internal>(Progress:float, RequiredProgress:float, Conditionals:[]concrete_subtype((/UnrealEngine.com:)Progression.gameplay_conditional))<transacts>:(/UnrealEngine.com:)Progression.conditional_objective = external {}

        MakeContributorCountingConditionalObjective<epic_internal>(Progress:float, RequiredProgress:float, Conditionals:[]concrete_subtype((/UnrealEngine.com:)Progression.gameplay_conditional))<transacts>:contributor_counting_conditional_objective = external {}

        MakeNestedLifecycleRecorder<epic_internal>()<transacts>:nested_lifecycle_recorder = external {}

        MakeContextRecordingProgressObjective<epic_internal>(Progress:float, RequiredProgress:float)<transacts>:context_recording_progress_objective = external {}

        MakeVerseOnlyContributorObjective<epic_internal>()<transacts>:(/UnrealEngine.com/ProgressionCoreTests:)verse_only_contributor_objective = external {}

        MakeRecordingReward<epic_internal>()<transacts>:recording_reward = external {}

        MakeTestQuest<epic_internal>(Objective:(/Verse.org:)Progression.objective)<transacts>:progression_test_quest = external {}

        AnchorObjective<epic_internal>(Objective:(/Verse.org:)Progression.objective, AnchorEntity:entity)<transacts>:void = external {}

        MakeAgentParticipant<native><epic_internal>()<transacts>:(/Verse.org:)Progression.agent_quest_participant

        MakeSecondAgentParticipant<native><epic_internal>()<transacts>:(/Verse.org:)Progression.agent_quest_participant

        HasTwoDistinctAgents<native><epic_internal>()<transacts>:logic

        var<private> GrantEventCount<native><epic_internal>:int = external {}

        var<private> LastGrantEventReward<native><epic_internal>:?(/UnrealEngine.com:)Progression.quest_reward = external {}

        var<private> LastGrantEventParticipants<native><epic_internal>:[](/Verse.org:)Progression.quest_participant = external {}

        var<private> LastGrantEventOrder<native><epic_internal>:int = external {}

        ResetGrantEventRecorders<epic_internal>()<transacts>:void = external {}

        NextEventOrder<native><epic_internal>()<transacts>:int

        ResetEventOrder<native><epic_internal>()<transacts>:void

        OnRewardGrantEventFired<epic_internal>(Data:(/UnrealEngine.com:)Progression.quest_reward_grant_event_data)<transacts>:void = external {}

        MakeStateMachineObjective<epic_internal>((local:)StateMachine:state_machine, CompletionStates:[](/UnrealEngine.com:)Progression.objective_machine_state)<transacts>:(/UnrealEngine.com:)Progression.state_machine_objective = external {}

        TEST_ContextualReactions_Cleanup<native_callable><epic_internal>():logic = external {}

        TEST_ConditionalVerbs_ContributorLifecycle<native_callable><epic_internal>():logic = external {}

        TEST_ConditionalVerbs_OnInvalidationCleanup<native_callable><epic_internal>():logic = external {}

        TEST_ConditionalVerbs_RegistrationPathsFireExpectedCounts<native_callable><epic_internal>():logic = external {}

        TEST_ReactionsCache_InvalidateUnregistersHandle<native_callable><epic_internal>():logic = external {}

        TEST_ReactionsCache_EmptyReactionsNoOp<native_callable><epic_internal>():logic = external {}

        TEST_ConditionalVerbs_MultipleBroadcastsMultipleCallbacks<native_callable><epic_internal>():logic = external {}

        TEST_ConditionalVerbs_NoBroadcastAfterInvalidation<native_callable><epic_internal>():logic = external {}

        TEST_StateMachineObjective_IsComplete_InCompletionState<native_callable><epic_internal>():logic = external {}

        TEST_StateMachineObjective_IsComplete_NotInCompletionState<native_callable><epic_internal>():logic = external {}

        TEST_ObjectiveMachineState_SetObjectiveWritesTheField<native_callable><epic_internal>():logic = external {}

        TEST_ClaimRewardError_SubtypeCastNamesTheConcreteError<native_callable><epic_internal>()<transacts>:logic = external {}

        TEST_ClaimRewards_VetoRecloses_LaterGrantRewardsPaysNothing<native_callable><epic_internal>():logic = external {}

        TEST_ClaimRewards_NotReadyError_PayloadNamesTheSubtype<native_callable><epic_internal>()<transacts>:logic = external {}

        TEST_StateMachineObjective_GetProgress_DelegatesToCurrentState<native_callable><epic_internal>():logic = external {}

        TEST_StateMachineObjective_CompletionEvent_Fires<native_callable><epic_internal>():logic = external {}

        TEST_ObjectiveState_ConformingSuperCallsPass<native_callable><epic_internal>():logic = external {}

        TEST_StateMachine_CompletionStates_SatisfyOnMatch<native_callable><epic_internal>():logic = external {}

        TEST_StateMachineObjective_UpdateCurrentState_Syncs<native_callable><epic_internal>():logic = external {}

        TEST_StateMachineObjective_StateChange_MovesContributorsToNewState<native_callable><epic_internal>():logic = external {}

        TEST_StateMachineObjective_StateChange_NoLeafStateWithdrawsContributors<native_callable><epic_internal>():logic = external {}

        TEST_ConditionalObjective_OnActivate_RegistersConditionals<native_callable><epic_internal>():logic = external {}

        TEST_ConditionalObjective_OnConditionalExecuted_AddsProgress<native_callable><epic_internal>():logic = external {}

        TEST_ConditionalObjective_OnDeactivate_UnregistersHandles<native_callable><epic_internal>():logic = external {}

        TEST_ConditionalObjective_QuestComplete_UnregistersHandles<native_callable><epic_internal>():logic = external {}

        TEST_ConditionalObjective_DoubleAdd_UnenrollsOnLastRemove<native_callable><epic_internal>():logic = external {}

        TEST_Progress_AddProgress_ClampsToZeroAndRequiredCount<native_callable><epic_internal>():logic = external {}

        TEST_Progress_SetProgress_ClampsToZeroAndRequiredCount<native_callable><epic_internal>():logic = external {}

        TEST_Progress_SetRequiredCount_AcceptsZeroAndClampsNegative<native_callable><epic_internal>():logic = external {}

        TEST_Progress_IsComplete_WhenProgressReachesRequiredCount<native_callable><epic_internal>():logic = external {}

        TEST_Progress_BoundaryCrossing_FiresProgressAndCompleteEvents<native_callable><epic_internal>():logic = external {}

        TEST_Objective_CompleteEvent_RepeatsOnReCompletion<native_callable><epic_internal>():logic = external {}

        TEST_Objective_State_IsCompleteInsideCompleteEventHandler<native_callable><epic_internal>():logic = external {}

        TEST_Progress_ProgressEvent_FiresOnAddProgress<native_callable><epic_internal>():logic = external {}

        TEST_Progress_ProgressEvent_NoFireOnNoOpAdds<native_callable><epic_internal>():logic = external {}

        TEST_Progress_ProgressEvent_SetProgressFiresOnChangeOnly<native_callable><epic_internal>():logic = external {}

        TEST_Progress_ProgressEvent_SetRequiredCountFiresOnReclampOnly<native_callable><epic_internal>():logic = external {}

        TEST_Progress_ProgressEvent_ListenerMutates_HandlerSelfTerminatesWithoutCrash<native_callable><epic_internal>():logic = external {}

        TEST_Progress_ProgressEvent_ListenerCompletes_BothEventsFireAndQuestCompletes<native_callable><epic_internal>():logic = external {}

        TEST_Progress_CanProgress_BlocksSetProgressWhenDenied<native_callable><epic_internal>():logic = external {}

        TEST_Progress_CanProgress_AllowsAddProgressAfterReEnable<native_callable><epic_internal>():logic = external {}

        TEST_Composite_RequiredCountZero_MeansAll<native_callable><epic_internal>():logic = external {}

        TEST_Composite_RequiredCountN_CompleteWhenNChildrenComplete<native_callable><epic_internal>():logic = external {}

        TEST_Composite_SubObjectiveCompletion_Propagates<native_callable><epic_internal>():logic = external {}

        TEST_Composite_Nested_Composite_Satisfies<native_callable><epic_internal>():logic = external {}

        TEST_Composite_AlreadyCompleteChildren_ActivationDoesNotResubscribe<native_callable><epic_internal>():logic = external {}

        TEST_Composite_ChildCompletesDuringActivation_LaterChildNotSubscribed<native_callable><epic_internal>():logic = external {}

        TEST_Composite_RequiredCountZero_SurvivesActivationAndRoundTrip<native_callable><epic_internal>():logic = external {}

        TEST_Sequential_OrderEnforced<native_callable><epic_internal>():logic = external {}

        TEST_Sequential_AdvancesPastPreCompletedChildren<native_callable><epic_internal>():logic = external {}

        TEST_Sequential_CurrentStageIndex_StaysAtLast<native_callable><epic_internal>():logic = external {}

        TEST_Sequential_OnActivate_InitializesAutoMonitoring<native_callable><epic_internal>():logic = external {}

        TEST_Sequential_CompleteEventAdvances<native_callable><epic_internal>():logic = external {}

        TEST_Sequential_CompletedRoundTrip_StaysComplete<native_callable><epic_internal>():logic = external {}

        TEST_Sequential_EmptyRoundTrip<native_callable><epic_internal>():logic = external {}

        TEST_Composite_NestedCompletedSequentialRoundTrip_StaysComplete<native_callable><epic_internal>():logic = external {}

        TEST_Timed_UpdateTimeRemaining_Decrements<native_callable><epic_internal>():logic = external {}

        TEST_Timed_TimeExpiredEvent_FiresOnce<native_callable><epic_internal>():logic = external {}

        TEST_Timed_CompletionLatch_OnInnerCompleteBeforeExpiry<native_callable><epic_internal>():logic = external {}

        TEST_Timed_Deactivation_KeepsLatch<native_callable><epic_internal>():logic = external {}

        TEST_Timed_TimeLimitSeedsBudget_ExpiryBlocksLateCompletion<native_callable><epic_internal>():logic = external {}

        var<private> CommitProbeTimed<native><epic_internal>:?(/UnrealEngine.com:)Progression.timed_objective = external {}

        var TimeExpiredCommitProbeCount<native><epic_internal>:int = external {}

        var TimeExpiredCommitProbeOrder<native><epic_internal>:int = external {}

        var TimeExpiredCountInsideTransaction<native><epic_internal>:int = external {}

        var TimeExpiredInsideTransactionOrder<native><epic_internal>:int = external {}

        var TimeExpiredCommitPathTaken<native><epic_internal>:logic = external {}

        var<private> CommitProbeAlwaysTrue<native><epic_internal>:logic = external {}

        SetUpTimeExpiredCommitProbe<native_callable><epic_internal>():logic = external {}

        PumpTimedPastExpiryInsideTransaction<native_callable><epic_internal>():logic = external {}

        PumpAndRecordInsideTransaction<epic_internal>()<transacts><decides>:void = external {}

        OnTimeExpiredCommitProbe<epic_internal>(Obj:(/UnrealEngine.com:)Progression.timed_objective)<transacts>:void = external {}

        TEST_Composite_LifecyclePropagatesToAllChildren_Once<native_callable><epic_internal>():logic = external {}

        TEST_Composite_ContributorReachesVerseOnlyChild<native_callable><epic_internal>():logic = external {}

        TEST_Sequential_LifecyclePropagatesToCurrentChildOnly<native_callable><epic_internal>():logic = external {}

        TEST_Sequential_DeactivateWhileJoined_NoAbandon<native_callable><epic_internal>():logic = external {}

        TEST_Sequential_Advance_CyclesContributors<native_callable><epic_internal>():logic = external {}

        TEST_Sequential_InitAdvance_HandsOffContributors<native_callable><epic_internal>():logic = external {}

        TEST_Sequential_JoinBeforeActivate_NoPreComplete_NoSpuriousCycle<native_callable><epic_internal>():logic = external {}

        TEST_Composite_DeactivateWhileJoined_NoAbandon<native_callable><epic_internal>():logic = external {}

        TEST_Composite_JoinBeforeActivate_NoDoubleJoin<native_callable><epic_internal>():logic = external {}

        TEST_Timed_LifecyclePropagatesToInner_Once<native_callable><epic_internal>():logic = external {}

        TEST_Timed_DeactivateWhileJoined_NoAbandon<native_callable><epic_internal>():logic = external {}

        TEST_Timed_JoinBeforeActivate_NoDoubleJoin<native_callable><epic_internal>():logic = external {}

        TEST_Timed_NestedConditional_EnrolsPushedContributorPerAgent<native_callable><epic_internal>():logic = external {}

        TEST_BasicQuest_NonContributorObjective_RoutesNothingAndDoesNotError<native_callable><epic_internal>():logic = external {}

        TEST_Composite_NestedQuestChild_ReceivesNoContributors<native_callable><epic_internal>():logic = external {}

        TEST_Objective_DefaultGuards_RefuseDoubleActivateAndInactiveDeactivate<native_callable><epic_internal>():logic = external {}

        TEST_Sequential_DoubleActivate_PropagatesOnce<native_callable><epic_internal>():logic = external {}

        TEST_Conditional_SetAnchor_GuardsAgainstEarlyAndDoubleRegistration<native_callable><epic_internal>():logic = external {}

        TEST_Conditional_DoubleActivate_RegistersOnce<native_callable><epic_internal>():logic = external {}

        TEST_Timed_DoubleActivate_InnerOnceAndTimerNotRestarted<native_callable><epic_internal>():logic = external {}

        TEST_Sequential_NestedComposite_CompletionBubbles<native_callable><epic_internal>():logic = external {}

        var ConditionalVerbsCallbackCount<epic_internal>:int = external {}

        var EventFiredFlag<epic_internal>:logic = external {}

        OnObjectiveEventFired<epic_internal>(Data:(/Verse.org:)Progression.objective_complete_event_data)<transacts>:void = external {}

        var ObjectiveCompleteEventCount<epic_internal>:int = external {}

        OnObjectiveCompleteCounted<epic_internal>(Data:(/Verse.org:)Progression.objective_complete_event_data)<transacts>:void = external {}

        var StateSeenInCompleteEvent<epic_internal>:(/Verse.org:)Progression.objective_state = external {}

        OnCompleteStateCaptured<epic_internal>(Data:(/Verse.org:)Progression.objective_complete_event_data)<transacts>:void = external {}

        var ProgressEventFiredFlag<epic_internal>:logic = external {}

        var CapturedProgressValue<epic_internal>:float = external {}

        var CapturedProgressObjective<epic_internal>:?(/Verse.org:)Progression.objective = external {}

        var CompleteEventOrderIndex<epic_internal>:int = external {}

        var OrderCounter<epic_internal>:int = external {}

        OnProgressEventCaptured<epic_internal>(Objective:(/Verse.org:)Progression.objective)<transacts>:void = external {}

        OnCompleteEventOrderCaptured<epic_internal>(Data:(/Verse.org:)Progression.objective_complete_event_data)<transacts>:void = external {}

        var ReentrantProgressObj<epic_internal>:?(/UnrealEngine.com:)Progression.progress_objective = external {}

        var ReentrantFireCount<epic_internal>:int = external {}

        ReentrancyMaxDepth<epic_internal>:int = external {}

        OnProgressEventTriggersMoreProgress<epic_internal>(Objective:(/Verse.org:)Progression.objective)<transacts>:void = external {}

        var ReentrantOwningQuest<epic_internal>:?(/Verse.org:)Progression.quest = external {}

        var ReentrantProgressEventFiredFlag<epic_internal>:logic = external {}

        var ReentrantQuestCompleteEventFiredFlag<epic_internal>:logic = external {}

        OnProgressEventCompletesQuest<epic_internal>(Objective:(/Verse.org:)Progression.objective)<transacts>:void = external {}

        OnReentrantQuestCompleted<epic_internal>(Data:(/Verse.org:)Progression.objective_complete_event_data)<transacts>:void = external {}

        var TimeExpiredCount<epic_internal>:int = external {}

        OnTimeExpiredCounter<epic_internal>(Obj:(/UnrealEngine.com:)Progression.timed_objective)<transacts>:void = external {}

        TEST_E2E_VerbBroadcast_IncrementsObjectiveProgress<native_callable><epic_internal>():logic = external {}

        TEST_E2E_NVerbBroadcasts_AutoCompletesQuest<native_callable><epic_internal>():logic = external {}

        TEST_E2E_BroadcastBeforeParticipantJoins_NoProgress<native_callable><epic_internal>():logic = external {}

        TEST_E2E_QuestCompletedEvent_FiresOnVerbChainCompletion<native_callable><epic_internal>():logic = external {}

        var VerbBroadcastConditionalObj<epic_internal>:?(/UnrealEngine.com:)Progression.conditional_objective = external {}

        OnVerbFired<epic_internal>(Context:(/UnrealEngine.com:)Progression.gameplay_conditional_context):void = external {}

        var QuestCompletedEventCount<epic_internal>:int = external {}

        OnQuestCompletedCounter<epic_internal>(Data:(/Verse.org:)Progression.objective_complete_event_data)<transacts>:void = external {}

        TEST_Bridge_AssertConstructViewPopulatesAchievedAndRequired<native><epic_internal>(Objective:(/UnrealEngine.com:)Progression.progress_objective, ExpectedAchieved:float, ExpectedRequired:float):logic

        TEST_Bridge_AssertConstructViewAppliesDisplayData<native><epic_internal>(Objective:(/UnrealEngine.com:)Progression.progress_objective):logic

        TEST_Bridge_AssertConstructViewPropagatesBComplete<native><epic_internal>(Objective:(/UnrealEngine.com:)Progression.progress_objective, ExpectedComplete:logic):logic

        TEST_Bridge_AssertRequiredCountEquals<native><epic_internal>(Objective:(/UnrealEngine.com:)Progression.progress_objective, Expected:float):logic

        TEST_Progress_Construct_PopulatesAchievedAndRequired<native_callable><epic_internal>():logic = external {}

        TEST_Progress_Construct_AppliesDisplayDataDespiteBypass<native_callable><epic_internal>():logic = external {}

        TEST_Progress_Construct_PropagatesBComplete<native_callable><epic_internal>():logic = external {}

        TEST_Bridge_AssertBasicObjectiveStatesPolymorphic<native><epic_internal>(Quest:(/UnrealEngine.com:)Progression.basic_quest):logic

        TEST_BasicQuest_Construct_PopulatesObjectiveStatesFromVerse<native_callable><epic_internal>():logic = external {}

        TEST_Bridge_AssertViewBComplete<native><epic_internal>(Objective:(/Verse.org:)Progression.objective, ExpectedComplete:logic):logic

        RestoreMembershipBridge<native><epic_internal>(Collection:(/Verse.org:)Progression.quest_collection, Quest:(/Verse.org:)Progression.quest, Participant:(/Verse.org:)Progression.quest_participant, Info:(/Verse.org:)Progression.quest_participant_info)<transacts>:logic

        MakeInfoFromRecord<epic_internal>(Record:(/UnrealEngine.com:)Progression.quest_membership_data)<transacts>:(/Verse.org:)Progression.quest_participant_info = external {}

        TEST_PureVerseObjective_CompleteAgreesAcrossReaders<native_callable><epic_internal>():logic = external {}

        TEST_ConditionalObjective_GrantThenJoin_RegistersOnJoinedAgent<native_callable><epic_internal>():logic = external {}

        TEST_ConditionalObjective_InSequentialStage_RegistersOnJoinedAgent<native_callable><epic_internal>():logic = external {}

        TEST_ConditionalObjective_InMachineState_RegistersOnJoinedAgent<native_callable><epic_internal>():logic = external {}

        TEST_BasicQuest_BornCompleteProgressObjective_CompletesOnActivate<native_callable><epic_internal>():logic = external {}

        TEST_Timed_ClockStopsAtCompletion<native_callable><epic_internal>():logic = external {}

        TEST_Timed_CompletedRoundTrip_ReLatchesOnActivation<native_callable><epic_internal>():logic = external {}

        TEST_Persistence_CompletedTwoLoginRoundTrip_NoReplay<native_callable><epic_internal>():logic = external {}

        TEST_Persistence_FailedRoundTrip_RestoresFailedAndRefusesGrant<native_callable><epic_internal>():logic = external {}

        TEST_BasicQuest_RewardDoors_ReportRewardKeyedMap<native_callable><epic_internal>():logic = external {}

        TEST_Objective_GuardVeto_DoorReturnsTheGuardsError<native_callable><epic_internal>():logic = external {}

        TEST_Persistence_VetoingGuardsRestoreCompleted_NoHooks<native_callable><epic_internal>():logic = external {}

        TEST_Persistence_ActiveSnapshot_LandsInactive<native_callable><epic_internal>():logic = external {}

        TEST_Persistence_MembershipReceivesFlip_RoundTrips<native_callable><epic_internal>():logic = external {}

        TEST_QuestCollection_RestoreMembership_EnrolsContributor<native_callable><epic_internal>():logic = external {}

        TEST_Bridge_AssertCompositeConstructViewReturnsCompositeSubclass<native><epic_internal>(Objective:(/UnrealEngine.com:)Progression.composite_objective):logic

        TEST_Bridge_AssertCompositeViewExposesChildrenAsPolymorphic<native><epic_internal>(Objective:(/UnrealEngine.com:)Progression.composite_objective, ExpectedChildCount:int):logic

        TEST_Bridge_AssertCompositeViewScalars<native><epic_internal>(Objective:(/UnrealEngine.com:)Progression.composite_objective, ExpectedCompleted:int, ExpectedRequired:int):logic

        TEST_Composite_Construct_ReturnsCompositeSubclass<native_callable><epic_internal>():logic = external {}

        TEST_Composite_Construct_ViewExposesChildrenAsPolymorphic<native_callable><epic_internal>():logic = external {}

        TEST_Composite_Construct_PopulatesScalars<native_callable><epic_internal>():logic = external {}

        TEST_Bridge_AssertCompositeAppendDebugNodesEmitsCompositeNodeWithChildren<native><epic_internal>(Objective:(/UnrealEngine.com:)Progression.composite_objective, ExpectedChildCount:int):logic

        TEST_Composite_AppendDebugNodes_EmitsCompositeNodeWithChildren<native_callable><epic_internal>():logic = external {}

        TEST_Bridge_AssertCompositeCompleteCheatCompletesAll<native><epic_internal>(Objective:(/UnrealEngine.com:)Progression.composite_objective):logic

        TEST_Bridge_AssertCompositeCompleteNextCompletesOneChild<native><epic_internal>(Objective:(/UnrealEngine.com:)Progression.composite_objective):logic

        TEST_Bridge_AssertCompositeResetAdvertised<native><epic_internal>(Objective:(/UnrealEngine.com:)Progression.composite_objective):logic

        TEST_Composite_Cheat_CompleteCompletesAll<native_callable><epic_internal>():logic = external {}

        TEST_Composite_Cheat_CompleteNextCompletesOne<native_callable><epic_internal>():logic = external {}

        TEST_Composite_Cheat_ResetAdvertised<native_callable><epic_internal>():logic = external {}

        TEST_Bridge_AssertSequentialConstructViewReturnsSequentialSubclass<native><epic_internal>(Objective:(/UnrealEngine.com:)Progression.sequential_objective):logic

        TEST_Bridge_AssertSequentialViewExposesStagesAsPolymorphic<native><epic_internal>(Objective:(/UnrealEngine.com:)Progression.sequential_objective, ExpectedStageCount:int):logic

        TEST_Bridge_AssertSequentialViewScalars<native><epic_internal>(Objective:(/UnrealEngine.com:)Progression.sequential_objective, ExpectedCurrentStageIndex:int, ExpectedTotalStages:int):logic

        TEST_Sequential_Construct_ReturnsSequentialSubclass<native_callable><epic_internal>():logic = external {}

        TEST_Sequential_Construct_ViewExposesStagesAsPolymorphic<native_callable><epic_internal>():logic = external {}

        TEST_Sequential_Construct_PopulatesScalars<native_callable><epic_internal>():logic = external {}

        TEST_Bridge_AssertSequentialAppendDebugNodesEmitsSequentialNodeWithChildren<native><epic_internal>(Objective:(/UnrealEngine.com:)Progression.sequential_objective, ExpectedStageCount:int):logic

        TEST_Sequential_AppendDebugNodes_EmitsSequentialNodeWithChildren<native_callable><epic_internal>():logic = external {}

        TEST_Bridge_AssertSequentialCompleteCheatRunsToEnd<native><epic_internal>(Objective:(/UnrealEngine.com:)Progression.sequential_objective):logic

        TEST_Bridge_AssertSequentialAdvanceStageCheatAdvancesOne<native><epic_internal>(Objective:(/UnrealEngine.com:)Progression.sequential_objective):logic

        TEST_Bridge_AssertSequentialResetReturnsToZero<native><epic_internal>(Objective:(/UnrealEngine.com:)Progression.sequential_objective):logic

        TEST_Sequential_Cheat_CompleteRunsToEnd<native_callable><epic_internal>():logic = external {}

        TEST_Sequential_Cheat_AdvanceStageAdvancesOne<native_callable><epic_internal>():logic = external {}

        TEST_Sequential_Cheat_ResetReturnsToZero<native_callable><epic_internal>():logic = external {}

        TEST_Bridge_AssertStateMachineConstructViewReturnsStateMachineSubclass<native><epic_internal>(Objective:(/UnrealEngine.com:)Progression.state_machine_objective):logic

        TEST_Bridge_AssertStateMachineViewCurrentStateNamePopulated<native><epic_internal>(Objective:(/UnrealEngine.com:)Progression.state_machine_objective):logic

        TEST_Bridge_AssertStateMachineViewCurrentObjectivePolymorphic<native><epic_internal>(Objective:(/UnrealEngine.com:)Progression.state_machine_objective):logic

        TEST_Bridge_AssertStateMachineConstructViewPersistenceRestoreGuard<native><epic_internal>():logic

        TEST_Bridge_AssertStateMachineAppendDebugNodesEmitsStateMachineNode<native><epic_internal>(Objective:(/UnrealEngine.com:)Progression.state_machine_objective):logic

        TEST_Bridge_AssertStateMachineForceEnterCompletionAdvances<native><epic_internal>(Objective:(/UnrealEngine.com:)Progression.state_machine_objective):logic

        TEST_Bridge_AssertStateMachineGetDebugActionsReturnsOneEntry<native><epic_internal>(Objective:(/UnrealEngine.com:)Progression.state_machine_objective):logic

        TEST_StateMachine_Construct_ReturnsStateMachineSubclass<native_callable><epic_internal>():logic = external {}

        TEST_StateMachine_Construct_CurrentStateNamePopulated<native_callable><epic_internal>():logic = external {}

        TEST_StateMachine_Construct_CurrentObjectiveViewPolymorphic<native_callable><epic_internal>():logic = external {}

        TEST_StateMachine_Construct_PersistenceRestoreGuardReturnsEmptyView<native_callable><epic_internal>():logic = external {}

        TEST_StateMachine_AppendDebugNodes_EmitsStateMachineNode<native_callable><epic_internal>():logic = external {}

        TEST_StateMachine_Cheat_ForceEnterCompletionAdvancesToCompletion<native_callable><epic_internal>():logic = external {}

        TEST_StateMachine_Cheat_GetDebugActionsReturnsOneEntry<native_callable><epic_internal>():logic = external {}

        TEST_Bridge_AssertTimedConstructViewReturnsTimedSubclass<native><epic_internal>(Objective:(/UnrealEngine.com:)Progression.timed_objective):logic

        TEST_Bridge_AssertTimedViewScalars<native><epic_internal>(Objective:(/UnrealEngine.com:)Progression.timed_objective, ExpectedTimeRemaining:float, ExpectedTimeLimit:float):logic

        TEST_Bridge_AssertTimedViewInnerIsPolymorphic<native><epic_internal>(Objective:(/UnrealEngine.com:)Progression.timed_objective):logic

        TEST_Timed_Construct_ReturnsTimedSubclass<native_callable><epic_internal>():logic = external {}

        TEST_Timed_Construct_PopulatesScalars<native_callable><epic_internal>():logic = external {}

        TEST_Timed_Construct_InnerIsPolymorphic<native_callable><epic_internal>():logic = external {}

        TEST_Bridge_AssertTimedAppendDebugNodesEmitsTimedNodeWithInner<native><epic_internal>(Objective:(/UnrealEngine.com:)Progression.timed_objective):logic

        TEST_Timed_AppendDebugNodes_EmitsTimedNodeWithInner<native_callable><epic_internal>():logic = external {}

        TEST_Bridge_AssertTimedCompleteCheatDispatchesToInner<native><epic_internal>(Objective:(/UnrealEngine.com:)Progression.timed_objective):logic

        TEST_Bridge_AssertTimedSkip10sDecreasesTimeBy10<native><epic_internal>(Objective:(/UnrealEngine.com:)Progression.timed_objective):logic

        TEST_Bridge_AssertTimedExpireTimerDrivesToZero<native><epic_internal>(Objective:(/UnrealEngine.com:)Progression.timed_objective):logic

        TEST_Bridge_AssertTimedResetRestoresTimeRemaining<native><epic_internal>(Objective:(/UnrealEngine.com:)Progression.timed_objective):logic

        TEST_Timed_Cheat_CompleteDispatchesToInner<native_callable><epic_internal>():logic = external {}

        TEST_Timed_Cheat_Skip10sDecreasesTime<native_callable><epic_internal>():logic = external {}

        TEST_Timed_Cheat_ExpireTimerDrivesToZero<native_callable><epic_internal>():logic = external {}

        TEST_Timed_Cheat_ResetRestoresTimeRemaining<native_callable><epic_internal>():logic = external {}

        var ProbeFailedLeg<epic_internal>:int = external {}

        ResetFailedLeg<epic_internal>()<transacts>:void = external {}

        MarkFailedLeg<epic_internal>(Leg:int)<transacts>:void = external {}

        ProbeFailedLegValue<native_callable><epic_internal>():int = external {}

        var ProbeActivateCompletingQuest<epic_internal>:?(/Verse.org:)Progression.quest = external {}

        OnProbeActivateEventCompletesQuest<epic_internal>(Objective:(/Verse.org:)Progression.objective)<transacts>:void = external {}

        var ProbeAbandonQuest<epic_internal>:?(/Verse.org:)Progression.quest = external {}

        var ProbeAbandonParticipant<epic_internal>:?(/Verse.org:)Progression.quest_participant = external {}

        var ProbeCompleteEventCount<epic_internal>:int = external {}

        OnProbeCompleteEventAbandons<epic_internal>(Data:(/Verse.org:)Progression.objective_complete_event_data)<transacts>:void = external {}

        TEST_BasicQuest_SetObjectiveOntoFailedObjective_KeepsFailReason<native_callable><epic_internal>():logic = external {}

        TEST_BasicQuest_ActivateBornCompleteFailedObjective_KeepsFailReason<native_callable><epic_internal>():logic = external {}

        TEST_BasicQuest_SharedObjective_DeactivateByOneQuestLeavesOtherQuestActive<native_callable><epic_internal>():logic = external {}

        TEST_BasicQuest_SetCompleteObjective_NoDeactivateWithoutActivate<native_callable><epic_internal>():logic = external {}

        TEST_BasicQuest_RefusedActivateOnSwap_QuestDeactivatesWithNoPhantomTeardown<native_callable><epic_internal>():logic = external {}

        TEST_BasicQuest_CompleteFromActivateEvent_LeavesObjectiveIdle<native_callable><epic_internal>():logic = external {}

        TEST_Progress_ProgressText_LargeIntegralValuesReadable<native_callable><epic_internal>():logic = external {}

        TEST_BasicQuest_ZeroRequiredProgress_BindAndActivateRoutesAgree<native_callable><epic_internal>():logic = external {}

        TEST_BasicQuest_CompleteEvent_DeliveredInline<native_callable><epic_internal>():logic = external {}

        TEST_BasicQuest_AbandonFromCompleteEvent_AbandonedMemberForfeitsReward<native_callable><epic_internal>():logic = external {}

        var ProbeProgressResetTarget<epic_internal>:?(/UnrealEngine.com:)Progression.progress_objective = external {}

        var ProbeProgressResetCount<epic_internal>:int = external {}

        OnProbeCompleteEventResetsProgress<epic_internal>(Data:(/Verse.org:)Progression.objective_complete_event_data)<transacts>:void = external {}

        var ProbeObjectiveCompleteEventCount<epic_internal>:int = external {}

        OnProbeObjectiveCompleteEventCounts<epic_internal>(Data:(/Verse.org:)Progression.objective_complete_event_data)<transacts>:void = external {}

        var ProbeActivateDeactivateCount<epic_internal>:int = external {}

        var ProbeActivateDeactivateRefusedCount<epic_internal>:int = external {}

        OnProbeActivateEventDeactivatesObjective<epic_internal>(Objective:(/Verse.org:)Progression.objective)<transacts>:void = external {}

        TEST_BasicQuest_ActivateOverCommandedCompleteObjective_CompletesQuest<native_callable><epic_internal>():logic = external {}

        TEST_BasicQuest_ActivateOverCommandedFailAtFullProgress_DoesNotPay<native_callable><epic_internal>():logic = external {}

        TEST_BasicQuest_ProgressWriteFromCompleteEventSubscriber_KeepsFailReason<native_callable><epic_internal>():logic = external {}

        TEST_BasicQuest_EmptyErrorVeto_RefusesQuestActivateLikeObjectiveDoor<native_callable><epic_internal>():logic = external {}

        TEST_BasicQuest_RebindFromOutgoingOnDeactivate_StoredMatchesBound<native_callable><epic_internal>():logic = external {}

        TEST_BasicQuest_RebindFromCompletionRelease_LeavesNoObjectiveRunning<native_callable><epic_internal>():logic = external {}

        TEST_Objective_DeactivateFromActivateEventSubscriber_SkipsOnActivateHook<native_callable><epic_internal>():logic = external {}

        TEST_ClaimRewards_MixedOutcomeGrant_ErrorKeepsWhatWasPaid<native_callable><epic_internal>():logic = external {}

        TEST_PreviewRewards_SameInstanceTwice_MatchesPayout<native_callable><epic_internal>():logic = external {}

        TEST_Composite_ChildUncompletes_ParentRetiresCompletion<native_callable><epic_internal>():logic = external {}

        TEST_BasicQuest_SelfBindStore_WithdrawsContributorRecords<native_callable><epic_internal>():logic = external {}

        var<private> ProbeB16Subject<native><epic_internal>:?(/UnrealEngine.com:)Progression.progress_objective = external {}

        var<private> ProbeB16Control<native><epic_internal>:?(/UnrealEngine.com:)Progression.progress_objective = external {}

        var ProbeB16SubjectCompleteEventCount<native><epic_internal>:int = external {}

        var ProbeB16ControlCompleteEventCount<native><epic_internal>:int = external {}

        var ProbeB16CommitPathTaken<native><epic_internal>:logic = external {}

        var ProbeB16SubjectRetired<native><epic_internal>:logic = external {}

        var<private> ProbeB16AlwaysTrue<native><epic_internal>:logic = external {}

        OnProbeB16SubjectCompleteEvent<epic_internal>(Data:(/Verse.org:)Progression.objective_complete_event_data)<transacts>:void = external {}

        OnProbeB16ControlCompleteEvent<epic_internal>(Data:(/Verse.org:)Progression.objective_complete_event_data)<transacts>:void = external {}

        SetUpProbeB16DeferredCompleteEvent<native_callable><epic_internal>():logic = external {}

        ProbeB16CompleteThenUncomplete<epic_internal>()<transacts><decides>:void = external {}

        RunProbeB16CompleteThenUncomplete<native_callable><epic_internal>():logic = external {}