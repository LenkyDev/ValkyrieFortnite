# Verse path: /Verse.org
using {/Verse.org/Native}
@available {MinUploadedAtFNVersion := 4300}
# Module import path: /Verse.org/QuestFrameworkTests
QuestFrameworkTests<public> := module:
    using {/Verse.org/SceneGraph}
    using {/Verse.org/Simulation}
    using {/Verse.org/Presentation}
    using {/Verse.org/Assets}
    using {/UnrealEngine.com}
    using {/Verse.org}
    test_quest_error<epic_internal> := class<epic_internal>((/Verse.org:)Progression.quest_error):


    test_objective_error<epic_internal> := class<epic_internal>((/Verse.org:)Progression.objective_error):


    test_reward_error<epic_internal> := class<epic_internal>((/UnrealEngine.com:)Progression.quest_reward_error):


    quest_level_test_objective_error<epic_internal> := class<epic_internal>((/Verse.org:)Progression.objective_error):


    MakeTestQuestErrorResult<native_callable><epic_internal>():result(void, [](/Verse.org:)Progression.quest_error) = external {}

    MakeTestObjectiveErrorResult<native_callable><epic_internal>():result(void, [](/Verse.org:)Progression.objective_error) = external {}

    @hide_in_editor
    test_quest<native><epic_internal> := class((/UnrealEngine.com:)Progression.basic_quest, has_icon, has_description):
        ReHome<epic_internal>(InCollection:(/Verse.org:)Progression.quest_collection)<transacts>:void = external {}

        WireObjective<epic_internal>(InObjective:(/Verse.org:)Progression.objective)<transacts>:void = external {}

        WireRewards<epic_internal>(InRewards:[](/UnrealEngine.com:)Progression.quest_reward)<transacts>:void = external {}

    @hide_in_editor
    test_quest_no_display<native><epic_internal> := class((/UnrealEngine.com:)Progression.basic_quest, has_icon, has_description):


    @hide_in_editor
    test_quest_presentation<native><epic_internal> := class((/UnrealEngine.com:)Progression.basic_quest, (/UnrealEngine.com:)Progression.has_quest_presentation):
        var ShowNotification<override>:logic = external {}

        var AllowFavorite<override>:logic = external {}

        var Categories<override>:[](/UnrealEngine.com:)Progression.quest_category = external {}

    @hide_in_editor
    test_quest_category<native><epic_internal> := class((/UnrealEngine.com:)Progression.quest_category):


    @hide_in_editor
    test_objective_basic<native><epic_internal> := class((/Verse.org:)Progression.objective, (/Verse.org:)Progression.has_objective_contributors, has_icon, has_description):
        var CompletedFlag<native><epic_internal>:logic = external {}

        GetProgress<override><native>()<reads>:message

        MarkComplete<native><epic_internal>():void

    @hide_in_editor
    test_reward<native><epic_internal> := class((/UnrealEngine.com:)Progression.quest_reward):
        var WasGranted<native><epic_internal>:logic = external {}

        var GrantCallCount<native><epic_internal>:int = external {}

        var LastRecipients<native><epic_internal>:[](/Verse.org:)Progression.quest_participant = external {}

        OnGrant<override><native>(EligibleMemberships:[](/Verse.org:)Progression.quest_membership)<transacts>:void

    @hide_in_editor
    computes_test_reward_error<epic_internal> := class<computes>((/UnrealEngine.com:)Progression.quest_reward_error):


    @hide_in_editor
    test_reward_failing_inline<epic_internal> := class(test_reward):
        CanGrant<override>()<reads>:result(void, [](/UnrealEngine.com:)Progression.quest_reward_error) = external {}

    @hide_in_editor
    test_reward_failing<epic_internal> := class(test_reward):
        VetoErrors<epic_internal>:[](/UnrealEngine.com:)Progression.quest_reward_error = external {}

        CanGrant<override>()<reads>:result(void, [](/UnrealEngine.com:)Progression.quest_reward_error) = external {}

    @hide_in_editor
    test_reward_refusing_one<epic_internal> := class(test_reward):
        VetoErrors<epic_internal>:[](/UnrealEngine.com:)Progression.quest_reward_error = external {}

        var Refused<epic_internal>:?(/Verse.org:)Progression.quest_participant = external {}

        CanReceive<override>(Membership:(/Verse.org:)Progression.quest_membership)<reads>:result(void, [](/UnrealEngine.com:)Progression.quest_reward_error) = external {}

    @hide_in_editor
    test_reward_refusing_receive<epic_internal> := class(test_reward):
        VetoErrors<epic_internal>:[](/UnrealEngine.com:)Progression.quest_reward_error = external {}

        CanReceive<override>(Membership:(/Verse.org:)Progression.quest_membership)<reads>:result(void, [](/UnrealEngine.com:)Progression.quest_reward_error) = external {}

    @hide_in_editor
    test_participant<native><epic_internal> := class((/Verse.org:)Progression.quest_participant):


    @hide_in_editor
    test_participant_info<epic_internal> := class((/Verse.org:)Progression.quest_participant_info):
        Tag<epic_internal>:int = external {}

    FilterRewardsByType<epic_internal>(Items:[](/UnrealEngine.com:)Progression.quest_reward, reward_type:castable_subtype((/UnrealEngine.com:)Progression.quest_reward))<transacts>:[]reward_type = external {}

    FilterInfosByType<epic_internal>(Items:[](/Verse.org:)Progression.quest_participant_info, info_type:castable_subtype((/Verse.org:)Progression.quest_participant_info))<transacts>:[]info_type = external {}

    FilterParticipantsByType<epic_internal>(Items:[](/Verse.org:)Progression.quest_participant, participant_type:castable_subtype((/Verse.org:)Progression.quest_participant))<transacts>:[]participant_type = external {}

    @hide_in_editor
    direct_test_quest<native><epic_internal> := class((/Verse.org:)Progression.quest, has_icon, has_description):
        var OnCompleteCallCount<native><epic_internal>:int = external {}

        GetProgress<override><native>()<reads>:message

        OnActivate<override><native>()<transacts>:void

        OnDeactivate<override><native>()<transacts>:void

        OnComplete<override><native>(Reason:(/Verse.org:)Progression.complete_objective_reason)<transacts>:void

    @hide_in_editor
    tracking_test_collection<native><epic_internal> := class((/Verse.org:)Progression.quest_collection):
        var OnCompleteCallCount<native><epic_internal>:int = external {}

        OnComplete<override><native>(Quest:(/Verse.org:)Progression.quest, Reason:(/Verse.org:)Progression.complete_objective_reason)<transacts>:void

    @hide_in_editor
    tracking_test_quest<native><epic_internal> := class((/UnrealEngine.com:)Progression.basic_quest, has_icon, has_description):
        var OnCompleteCalledFlag<native><epic_internal>:logic = external {}

        var OnAddCalledFlag<native><epic_internal>:logic = external {}

        var OnRemoveCalledFlag<native><epic_internal>:logic = external {}

        OnComplete<override><native>(Reason:(/Verse.org:)Progression.complete_objective_reason)<transacts>:void

        OnAdd<override><native>(Manager:(/Verse.org:)Progression.quest_manager_component):void

        OnRemove<override><native>(Manager:(/Verse.org:)Progression.quest_manager_component):void

    @hide_in_editor
    ordered_tracking_modular_quest<native><epic_internal> := class((/UnrealEngine.com:)Progression.modular_quest, has_icon, has_description):
        var OnActivateOrder<native><epic_internal>:int = external {}

        var OnDeactivateOrder<native><epic_internal>:int = external {}

        var OnJoinOrder<native><epic_internal>:int = external {}

        var OnAbandonOrder<native><epic_internal>:int = external {}

        OnActivate<override><native>()<transacts>:void

        OnDeactivate<override><native>()<transacts>:void

        OnJoin<override><native>(Participant:(/Verse.org:)Progression.quest_participant, Info:(/Verse.org:)Progression.quest_participant_info)<transacts>:void

        OnAbandon<override><native>(Participant:(/Verse.org:)Progression.quest_participant, Info:(/Verse.org:)Progression.quest_participant_info)<transacts>:void

    @hide_in_editor
    veto_test_quest<native><epic_internal> := class((/UnrealEngine.com:)Progression.basic_quest, has_icon, has_description):
        var ShouldVeto<native><epic_internal>:logic = external {}

        CanJoin<override><native>(Participant:(/Verse.org:)Progression.quest_participant, Info:(/Verse.org:)Progression.quest_participant_info)<reads>:result(void, [](/Verse.org:)Progression.quest_error)

    @hide_in_editor
    veto_test_participant<native><epic_internal> := class((/Verse.org:)Progression.quest_participant):
        var ShouldVeto<native><epic_internal>:logic = external {}

        CanJoin<override><native>(Quest:(/Verse.org:)Progression.quest)<reads>:result(void, [](/Verse.org:)Progression.quest_error)

    @hide_in_editor
    tracking_test_participant<native><epic_internal> := class((/Verse.org:)Progression.quest_participant):
        var OnJoinCalledFlag<native><epic_internal>:logic = external {}

        var OnAbandonCalledFlag<native><epic_internal>:logic = external {}

        var OnActivateCalledFlag<native><epic_internal>:logic = external {}

        var OnDeactivateCalledFlag<native><epic_internal>:logic = external {}

        var OnCompleteCalledFlag<native><epic_internal>:logic = external {}

        var LastCompleteInfo<native><epic_internal>:?(/Verse.org:)Progression.quest_participant_info = external {}

        OnJoin<override><native>(Quest:(/Verse.org:)Progression.quest, Info:(/Verse.org:)Progression.quest_participant_info)<transacts>:void

        OnAbandon<override><native>(Quest:(/Verse.org:)Progression.quest, Info:(/Verse.org:)Progression.quest_participant_info)<transacts>:void

        OnActivate<override><native>(Quest:(/Verse.org:)Progression.quest):void

        OnDeactivate<override><native>(Quest:(/Verse.org:)Progression.quest):void

        OnComplete<override><native>(Quest:(/Verse.org:)Progression.quest, Info:(/Verse.org:)Progression.quest_participant_info, Reason:(/Verse.org:)Progression.complete_objective_reason)<transacts>:void

    @hide_in_editor
    tracking_test_objective<native><epic_internal> := class(test_objective_basic, (/Verse.org:)Progression.has_objective_anchor):
        var OnActivateCalledFlag<native><epic_internal>:logic = external {}

        var OnDeactivateCalledFlag<native><epic_internal>:logic = external {}

        var AddContributorCallCount<native><epic_internal>:int = external {}

        var RemoveContributorCallCount<native><epic_internal>:int = external {}

        var OnActivateCallCount<native><epic_internal>:int = external {}

        var OnDeactivateCallCount<native><epic_internal>:int = external {}

        var LastActivationContextWasSet<native><epic_internal>:logic = external {}

        var LastActivationContext<native><epic_internal>:?entity = external {}

        var LastActivationAgentWasSet<native><epic_internal>:logic = external {}

        var LastActivationAgent<native><epic_internal>:?agent = external {}

        var OnActivateOrder<native><epic_internal>:int = external {}

        var OnDeactivateOrder<native><epic_internal>:int = external {}

        var AddContributorOrder<native><epic_internal>:int = external {}

        var RemoveContributorOrder<native><epic_internal>:int = external {}

        var AddedContributors<native><epic_internal>:[]agent = external {}

        var RemovedContributors<native><epic_internal>:[]agent = external {}

        var OnCompleteCallCount<native><epic_internal>:int = external {}

        var OnCompleteOrder<native><epic_internal>:int = external {}

        var ActivateAllowed<native><epic_internal>:logic = external {}

        var DeactivateAllowed<native><epic_internal>:logic = external {}

        var CompleteAllowed<native><epic_internal>:logic = external {}

        CanActivate<override><native>()<reads>:result(void, [](/Verse.org:)Progression.objective_error)

        CanDeactivate<override><native>()<reads>:result(void, [](/Verse.org:)Progression.objective_error)

        CanComplete<override><native>(Reason:(/Verse.org:)Progression.complete_objective_reason)<reads>:result(void, [](/Verse.org:)Progression.objective_error)

        SetActivateAllowed<epic_internal>(InAllowed:logic)<transacts>:void = external {}

        SetDeactivateAllowed<epic_internal>(InAllowed:logic)<transacts>:void = external {}

        SetCompleteAllowed<epic_internal>(InAllowed:logic)<transacts>:void = external {}

        OnActivate<override><native>()<transacts>:void

        OnComplete<override><native>(Reason:(/Verse.org:)Progression.complete_objective_reason)<transacts>:void

        OnDeactivate<override><native>()<transacts>:void

        AddContributor<override>(Agent:agent)<transacts>:void = external {}

        RemoveContributor<override>(Agent:agent)<transacts>:void = external {}

        SetAnchor<override><final>(InAnchor:entity)<transacts>:void = external {}

    @hide_in_editor
    pure_verse_test_objective<epic_internal> := class(test_objective_basic):
        OnActivate<override>()<transacts>:void = external {}

        IsOnActivateCalledInVerse<epic_internal>()<reads>:logic = external {}

    @hide_in_editor
    verse_only_objective_holder<epic_internal> := class((/Verse.org:)Progression.has_objective):


    @hide_in_editor
    verse_only_has_objective_quest<epic_internal> := class((/Verse.org:)Progression.quest, (/Verse.org:)Progression.has_objective):


    @hide_in_editor
    verse_only_contributor_objective<epic_internal> := class((/Verse.org:)Progression.objective, (/Verse.org:)Progression.has_objective_contributors):
        var Added<epic_internal>:[]agent = external {}

        var Removed<epic_internal>:[]agent = external {}

        AddContributor<override>(Agent:agent)<transacts>:void = external {}

        RemoveContributor<override>(Agent:agent)<transacts>:void = external {}

    @hide_in_editor
    reentrant_withdraw_objective<epic_internal> := class((/Verse.org:)Progression.objective, (/Verse.org:)Progression.has_objective_contributors):
        var Target<epic_internal>:?(/UnrealEngine.com:)Progression.basic_quest = external {}

        var Replacement<epic_internal>:?(/Verse.org:)Progression.objective = external {}

        var Fired<epic_internal>:logic = external {}

        Wire<epic_internal>(InQuest:(/UnrealEngine.com:)Progression.basic_quest, InReplacement:(/Verse.org:)Progression.objective)<transacts>:void = external {}

        AddContributor<override>(Agent:agent)<transacts>:void = external {}

        RemoveContributor<override>(Agent:agent)<transacts>:void = external {}

    @hide_in_editor
    reentrant_seed_objective<epic_internal> := class((/Verse.org:)Progression.objective, (/Verse.org:)Progression.has_objective_contributors):
        var Target<epic_internal>:?(/UnrealEngine.com:)Progression.basic_quest = external {}

        var Replacement<epic_internal>:?(/Verse.org:)Progression.objective = external {}

        var Fired<epic_internal>:logic = external {}

        Wire<epic_internal>(InQuest:(/UnrealEngine.com:)Progression.basic_quest, InReplacement:(/Verse.org:)Progression.objective)<transacts>:void = external {}

        AddContributor<override>(Agent:agent)<transacts>:void = external {}

        RemoveContributor<override>(Agent:agent)<transacts>:void = external {}

    @hide_in_editor
    verse_only_plain_objective<epic_internal> := class((/Verse.org:)Progression.objective):


    @hide_in_editor
    verse_only_rewards_holder<epic_internal> := class((/UnrealEngine.com:)Progression.has_quest_rewards):


    @hide_in_editor
    permissive_rewards_holder<epic_internal> := class((/UnrealEngine.com:)Progression.has_quest_rewards):
        CanReceive<override>(Membership:(/Verse.org:)Progression.quest_membership, Reward:(/UnrealEngine.com:)Progression.quest_reward)<reads>:result(void, [](/UnrealEngine.com:)Progression.quest_reward_error) = external {}

    @hide_in_editor
    refusing_rewards_holder<epic_internal> := class((/UnrealEngine.com:)Progression.has_quest_rewards):
        VetoErrors<epic_internal>:[](/UnrealEngine.com:)Progression.quest_reward_error = external {}

        CanReceive<override>(Membership:(/Verse.org:)Progression.quest_membership, Reward:(/UnrealEngine.com:)Progression.quest_reward)<reads>:result(void, [](/UnrealEngine.com:)Progression.quest_reward_error) = external {}

    @hide_in_editor
    anchor_override_test_objective<epic_internal> := class(test_objective_basic, (/Verse.org:)Progression.has_objective_anchor):
        var SetAnchorCount<epic_internal>:int = external {}

        var AnchorSeenByOverride<epic_internal>:?entity = external {}

        SetAnchor<override>(InAnchor:entity)<transacts>:void = external {}

    @hide_in_editor
    throwing_guard_test_objective<epic_internal> := class(test_objective_basic):
        Agentless<epic_internal>:(/Verse.org:)Progression.agent_quest_participant

        var Throws<epic_internal>:logic = external {}

        CanActivate<override>()<reads>:result(void, [](/Verse.org:)Progression.objective_error) = external {}

    ObserveAgent<epic_internal>(Agent:agent)<reads>:void = external {}

    @hide_in_editor
    always_completable_test_quest<epic_internal> := class(test_quest):
        CanComplete<override>(Reason:(/Verse.org:)Progression.complete_objective_reason)<reads>:result(void, [](/Verse.org:)Progression.objective_error) = external {}

    @hide_in_editor
    accessor_reading_guard_quest<epic_internal> := class((/UnrealEngine.com:)Progression.basic_quest, has_icon, has_description):
        ExpectedHome<epic_internal>:(/Verse.org:)Progression.quest_collection

        VetoErrors<epic_internal>:[](/Verse.org:)Progression.quest_error = external {}

        CanJoin<override>(Participant:(/Verse.org:)Progression.quest_participant, Info:(/Verse.org:)Progression.quest_participant_info)<reads>:result(void, [](/Verse.org:)Progression.quest_error) = external {}

    @hide_in_editor
    context_reading_guard_quest<epic_internal> := class((/UnrealEngine.com:)Progression.basic_quest, has_icon, has_description):
        VetoErrors<epic_internal>:[](/Verse.org:)Progression.objective_error = external {}

        CanComplete<override>(Reason:(/Verse.org:)Progression.complete_objective_reason)<reads>:result(void, [](/Verse.org:)Progression.objective_error) = external {}

    @hide_in_editor
    completing_on_contributor_test_objective<native><epic_internal> := class(test_objective_basic):
        var ActivatedFlag<native><epic_internal>:logic = external {}

        var ContributorAddCount<native><epic_internal>:int = external {}

        OnActivate<override><native>()<transacts>:void

        AddContributor<override>(Agent:agent)<transacts>:void = external {}

    @hide_in_editor
    completing_on_contributor_removal_test_objective<native><epic_internal> := class(test_objective_basic):
        var ContributorRemoveCount<native><epic_internal>:int = external {}

        RemoveContributor<override>(Agent:agent)<transacts>:void = external {}

    @hide_in_editor
    veto_test_quest_abandon<native><epic_internal> := class((/UnrealEngine.com:)Progression.basic_quest, has_icon, has_description):
        var ShouldVeto<native><epic_internal>:logic = external {}

        CanAbandon<override><native>(Participant:(/Verse.org:)Progression.quest_participant, Info:(/Verse.org:)Progression.quest_participant_info)<reads>:result(void, [](/Verse.org:)Progression.quest_error)

    @hide_in_editor
    veto_test_participant_abandon<native><epic_internal> := class((/Verse.org:)Progression.quest_participant):
        var ShouldVeto<native><epic_internal>:logic = external {}

        CanAbandon<override><native>(Quest:(/Verse.org:)Progression.quest)<reads>:result(void, [](/Verse.org:)Progression.quest_error)

    @hide_in_editor
    veto_test_quest_add<native><epic_internal> := class((/UnrealEngine.com:)Progression.basic_quest, has_icon, has_description):
        CanAdd<override><native>(Manager:(/Verse.org:)Progression.quest_manager_component)<decides><reads>:void

    @hide_in_editor
    veto_test_quest_remove<epic_internal> := class((/UnrealEngine.com:)Progression.basic_quest, has_icon, has_description):
        CanRemove<override>(Manager:(/Verse.org:)Progression.quest_manager_component)<decides><reads>:void = external {}

    @hide_in_editor
    reentrant_complete_test_quest<native><epic_internal> := class((/UnrealEngine.com:)Progression.basic_quest, has_icon, has_description):
        OnComplete<override><native>(Reason:(/Verse.org:)Progression.complete_objective_reason)<transacts>:void

        WireRewards<epic_internal>(InRewards:[](/UnrealEngine.com:)Progression.quest_reward)<transacts>:void = external {}

    @hide_in_editor
    veto_deactivate_test_quest<native><epic_internal> := class((/UnrealEngine.com:)Progression.basic_quest, has_icon, has_description):
        var DeactivateAllowed<native><epic_internal>:logic = external {}

        CanDeactivate<override><native>()<reads>:result(void, [](/Verse.org:)Progression.objective_error)

    @hide_in_editor
    recording_test_quest<native><epic_internal> := class((/UnrealEngine.com:)Progression.basic_quest, has_icon, has_description):
        var OnActivateCallCount<native><epic_internal>:int = external {}

        OnActivate<override><native>()<transacts>:void

        WireRewards<epic_internal>(InRewards:[](/UnrealEngine.com:)Progression.quest_reward)<transacts>:void = external {}

    @hide_in_editor
    rewards_probe_test_quest<native><epic_internal> := class((/UnrealEngine.com:)Progression.basic_quest, has_icon, has_description):
        RewardsSeenAtPostInit<native><epic_internal>()<transacts>:int

        RewardsStampedAtPostInit<native><epic_internal>()<transacts>:int

    @hide_in_editor
    tagged_test_reward<epic_internal> := class(test_reward):
        Tag<epic_internal>:int = external {}

    @hide_in_editor
    chaining_can_grant_test_reward<epic_internal> := class(test_reward):
        CanGrant<override>()<reads>:result(void, [](/UnrealEngine.com:)Progression.quest_reward_error) = external {}

    @hide_in_editor
    non_chaining_can_grant_test_reward<epic_internal> := class(test_reward):
        AlwaysGrants<epic_internal>:logic = external {}

        VetoErrors<epic_internal>:[](/UnrealEngine.com:)Progression.quest_reward_error = external {}

        CanGrant<override>()<reads>:result(void, [](/UnrealEngine.com:)Progression.quest_reward_error) = external {}

    @hide_in_editor
    composing_guard_test_quest<epic_internal> := class((/UnrealEngine.com:)Progression.basic_quest, has_icon, has_description):
        Own<epic_internal>:[](/Verse.org:)Progression.objective_error = external {}

        CanActivate<override>()<reads>:result(void, [](/Verse.org:)Progression.objective_error) = external {}

    @hide_in_editor
    veto_grant_rewards_test_quest<epic_internal> := class((/UnrealEngine.com:)Progression.basic_quest, has_icon, has_description):
        VetoErrors<epic_internal>:[](/UnrealEngine.com:)Progression.quest_reward_error = external {}

        CanGrantRewards<override>(Memberships:[](/Verse.org:)Progression.quest_membership)<reads>:result(void, [](/UnrealEngine.com:)Progression.quest_reward_error) = external {}

    @hide_in_editor
    probe_reentrant_abandon_quest<native><epic_internal> := class((/UnrealEngine.com:)Progression.basic_quest, has_icon, has_description):
        ArmReentrantAbandon<native><epic_internal>(Participant:(/Verse.org:)Progression.quest_participant)<transacts>:void

        ProbeOnAbandonCount<native><epic_internal>()<transacts>:int

        ReentryAttemptCount<native><epic_internal>()<transacts>:int

        ReentryWasRefused<native><epic_internal>()<transacts>:logic

        OnAbandon<override><native>(Participant:(/Verse.org:)Progression.quest_participant, Info:(/Verse.org:)Progression.quest_participant_info)<transacts>:void

    @hide_in_editor
    probe_abandon_on_join_quest<native><epic_internal> := class((/UnrealEngine.com:)Progression.basic_quest, has_icon, has_description):
        ArmAbandonJoinerOnJoin<native><epic_internal>()<transacts>:void

        ProbeOnJoinCount<native><epic_internal>()<transacts>:int

        AbandonAttemptCount<native><epic_internal>()<transacts>:int

        AbandonSucceeded<native><epic_internal>()<transacts>:logic

        OnJoin<override><native>(Participant:(/Verse.org:)Progression.quest_participant, Info:(/Verse.org:)Progression.quest_participant_info)<transacts>:void

    @hide_in_editor
    probe_join_from_oncomplete_quest<native><epic_internal> := class((/UnrealEngine.com:)Progression.basic_quest, has_icon, has_description):
        ArmJoinFromOnComplete<native><epic_internal>(Participant:(/Verse.org:)Progression.quest_participant, Info:(/Verse.org:)Progression.quest_participant_info)<transacts>:void

        JoinAttemptCount<native><epic_internal>()<transacts>:int

        JoinWasRefused<native><epic_internal>()<transacts>:logic

        StateSeenByHookIsActive<native><epic_internal>()<transacts>:logic

        OnComplete<override><native>(Reason:(/Verse.org:)Progression.complete_objective_reason)<transacts>:void

        WireRewards<epic_internal>(InRewards:[](/UnrealEngine.com:)Progression.quest_reward)<transacts>:void = external {}

    @hide_in_editor
    probe_counting_participant<native><epic_internal> := class((/Verse.org:)Progression.quest_participant):
        ProbeOnJoinCount<native><epic_internal>()<transacts>:int

        ProbeOnAbandonCount<native><epic_internal>()<transacts>:int

        ProbeOnCompleteCount<native><epic_internal>()<transacts>:int

        SawAbandonBeforeComplete<native><epic_internal>()<transacts>:logic

        ArmAbandonPeerOnComplete<native><epic_internal>(Peer:(/Verse.org:)Progression.quest_participant)<transacts>:void

        PeerAbandonAttemptCount<native><epic_internal>()<transacts>:int

        PeerAbandonSucceeded<native><epic_internal>()<transacts>:logic

        OnJoin<override><native>(Quest:(/Verse.org:)Progression.quest, Info:(/Verse.org:)Progression.quest_participant_info)<transacts>:void

        OnAbandon<override><native>(Quest:(/Verse.org:)Progression.quest, Info:(/Verse.org:)Progression.quest_participant_info)<transacts>:void

        OnComplete<override><native>(Quest:(/Verse.org:)Progression.quest, Info:(/Verse.org:)Progression.quest_participant_info, Reason:(/Verse.org:)Progression.complete_objective_reason)<transacts>:void

    @hide_in_editor
    probe_collection<native><epic_internal> := class((/Verse.org:)Progression.quest_collection):
        ProbeOnJoinCount<native><epic_internal>()<transacts>:int

        ProbeOnAbandonCount<native><epic_internal>()<transacts>:int

        ProbeOnCompleteCount<native><epic_internal>()<transacts>:int

        OnJoin<override><native>(Membership:(/Verse.org:)Progression.quest_membership)<transacts>:void

        OnAbandon<override><native>(Membership:(/Verse.org:)Progression.quest_membership)<transacts>:void

        OnComplete<override><native>(Quest:(/Verse.org:)Progression.quest, Reason:(/Verse.org:)Progression.complete_objective_reason)<transacts>:void

        OnQuestAbandonEvent<native><epic_internal>(Membership:(/Verse.org:)Progression.quest_membership)<transacts>:void

        OnParticipantAbandonEvent<native><epic_internal>(Membership:(/Verse.org:)Progression.quest_membership)<transacts>:void

        OnCollectionAbandonEvent<native><epic_internal>(Membership:(/Verse.org:)Progression.quest_membership)<transacts>:void

        OnQuestJoinEvent<native><epic_internal>(Membership:(/Verse.org:)Progression.quest_membership)<transacts>:void

        OnParticipantJoinEvent<native><epic_internal>(Membership:(/Verse.org:)Progression.quest_membership)<transacts>:void

        OnCollectionJoinEvent<native><epic_internal>(Membership:(/Verse.org:)Progression.quest_membership)<transacts>:void

        OnParticipantCompleteEvent<epic_internal>(Data:(/Verse.org:)Progression.quest_membership_complete_event_data)<transacts>:void = external {}

        RecordParticipantCompleteEvent<native><epic_internal>()<transacts>:void

        QuestAbandonEventCount<native><epic_internal>()<transacts>:int

        ParticipantAbandonEventCount<native><epic_internal>()<transacts>:int

        CollectionAbandonEventCount<native><epic_internal>()<transacts>:int

        QuestJoinEventCount<native><epic_internal>()<transacts>:int

        ParticipantJoinEventCount<native><epic_internal>()<transacts>:int

        CollectionJoinEventCount<native><epic_internal>()<transacts>:int

        ParticipantCompleteEventCount<native><epic_internal>()<transacts>:int

        LastParticipantAbandonEventOrder<native><epic_internal>()<transacts>:int

        LastParticipantCompleteEventOrder<native><epic_internal>()<transacts>:int

        ArmJoinFromCompleteEvent<native><epic_internal>(Quest:(/Verse.org:)Progression.quest, Participant:(/Verse.org:)Progression.quest_participant)<transacts>:void

        OnQuestCompleteEventJoins<epic_internal>(Data:(/Verse.org:)Progression.objective_complete_event_data)<transacts>:void = external {}

        RunArmedJoinFromCompleteEvent<native><epic_internal>()<transacts>:void

        HandlerRanCount<native><epic_internal>()<transacts>:int

        HandlerJoinAttemptCount<native><epic_internal>()<transacts>:int

        HandlerJoinWasRefused<native><epic_internal>()<transacts>:logic

        HandlerSawQuestActive<native><epic_internal>()<transacts>:logic

    @hide_in_editor
    probe_rehome_on_abandon_quest<native><epic_internal> := class((/UnrealEngine.com:)Progression.basic_quest, has_icon, has_description):
        ArmReHomeOnAbandon<native><epic_internal>(Target:(/Verse.org:)Progression.quest_collection)<transacts>:void

        ProbeOnAbandonCount<native><epic_internal>()<transacts>:int

        ReHomeAttemptCount<native><epic_internal>()<transacts>:int

        OnAbandon<override><native>(Participant:(/Verse.org:)Progression.quest_participant, Info:(/Verse.org:)Progression.quest_participant_info)<transacts>:void

    @hide_in_editor
    probe_activate_from_oncomplete_quest<native><epic_internal> := class((/UnrealEngine.com:)Progression.basic_quest, has_icon, has_description):
        ArmActivateFromOnComplete<native><epic_internal>()<transacts>:void

        ProbeOnCompleteCount<native><epic_internal>()<transacts>:int

        ActivateAttemptCount<native><epic_internal>()<transacts>:int

        ActivateWasRefused<native><epic_internal>()<transacts>:logic

        OnComplete<override><native>(Reason:(/Verse.org:)Progression.complete_objective_reason)<transacts>:void

        WireRewards<epic_internal>(InRewards:[](/UnrealEngine.com:)Progression.quest_reward)<transacts>:void = external {}

    @hide_in_editor
    probe_data_complete_objective<native><epic_internal> := class(test_objective_basic):
        ArmDataComplete<native><epic_internal>()<transacts>:void

    @hide_in_editor
    probe_order_participant<native><epic_internal> := class((/Verse.org:)Progression.quest_participant):
        ProbeOnCompleteCount<native><epic_internal>()<transacts>:int

        ProbeCompleteOrder<native><epic_internal>()<transacts>:int

        OnComplete<override><native>(Quest:(/Verse.org:)Progression.quest, Info:(/Verse.org:)Progression.quest_participant_info, Reason:(/Verse.org:)Progression.complete_objective_reason)<transacts>:void

    @hide_in_editor
    probe_join_order_participant<native><epic_internal> := class((/Verse.org:)Progression.quest_participant):
        ProbeOnJoinCount<native><epic_internal>()<transacts>:int

        ProbeOnAbandonCount<native><epic_internal>()<transacts>:int

        SawAbandonBeforeJoin<native><epic_internal>()<transacts>:logic

        MembershipsSeenInJoinHook<native><epic_internal>()<transacts>:int

        OnJoin<override><native>(Quest:(/Verse.org:)Progression.quest, Info:(/Verse.org:)Progression.quest_participant_info)<transacts>:void

        OnAbandon<override><native>(Quest:(/Verse.org:)Progression.quest, Info:(/Verse.org:)Progression.quest_participant_info)<transacts>:void

    @hide_in_editor
    test_granter_component<native><epic_internal> := class<final_super>((/Verse.org:)Progression.quest_granter_component):
        var OnGrantCallCount<native><epic_internal>:int = external {}

        OnGrant<override><native>(Manager:(/Verse.org:)Progression.quest_manager_component, Quest:(/Verse.org:)Progression.quest):void

    @hide_in_editor
    veto_granter_component<native><epic_internal> := class<final_super>((/Verse.org:)Progression.quest_granter_component):
        CanGrant<override><native>(Manager:(/Verse.org:)Progression.quest_manager_component)<decides><reads>:void

    @hide_in_editor
    tracking_test_extension<native><epic_internal> := class<epic_internal>((/UnrealEngine.com:)Progression.quest_extension):
        var OnActivateCalledFlag<native><epic_internal>:logic = external {}

        var OnDeactivateCalledFlag<native><epic_internal>:logic = external {}

        var OnJoinCalledFlag<native><epic_internal>:logic = external {}

        var OnAbandonCalledFlag<native><epic_internal>:logic = external {}

        var OnCompleteCalledFlag<native><epic_internal>:logic = external {}

        OnActivate<override><native>():void

        OnDeactivate<override><native>():void

        OnJoin<override><native>(QuestParticipant:(/Verse.org:)Progression.quest_participant):void

        OnAbandon<override><native>(QuestParticipant:(/Verse.org:)Progression.quest_participant):void

        OnComplete<override><native>(Reason:(/Verse.org:)Progression.complete_objective_reason):void

    @hide_in_editor
    ordered_tracking_extension<native><epic_internal> := class<epic_internal>((/UnrealEngine.com:)Progression.quest_extension):
        var OnActivateOrder<native><epic_internal>:int = external {}

        var OnDeactivateOrder<native><epic_internal>:int = external {}

        var OnJoinOrder<native><epic_internal>:int = external {}

        var OnAbandonOrder<native><epic_internal>:int = external {}

        OnActivate<override><native>():void

        OnDeactivate<override><native>():void

        OnJoin<override><native>(QuestParticipant:(/Verse.org:)Progression.quest_participant):void

        OnAbandon<override><native>(QuestParticipant:(/Verse.org:)Progression.quest_participant):void

    @hide_in_editor
    test_veto_join_extension<native><epic_internal> := class<epic_internal>((/UnrealEngine.com:)Progression.quest_extension):
        var ShouldVeto<native><epic_internal>:logic = external {}

        CanJoin<override><native>(QuestParticipant:(/Verse.org:)Progression.quest_participant)<reads>:result(void, [](/Verse.org:)Progression.join_quest_error)

    @hide_in_editor
    test_veto_abandon_extension<native><epic_internal> := class<epic_internal>((/UnrealEngine.com:)Progression.quest_extension):
        var ShouldVeto<native><epic_internal>:logic = external {}

        CanAbandon<override><native>(QuestParticipant:(/Verse.org:)Progression.quest_participant)<reads>:result(void, [](/Verse.org:)Progression.abandon_quest_error)

    ObjectiveDisplayDataTestName<localizes><epic_internal>:message = external {}

    RewardDisplayDataTestName<localizes><epic_internal>:message = external {}

    QuestDisplayDataTestName<localizes><epic_internal>:message = external {}

    QuestDisplayDataTestDescription<localizes><epic_internal>:message = external {}

    QuestDisplayDataTestShortDescription<localizes><epic_internal>:message = external {}

    test_boilerplate_objects<epic_internal> := struct:
        Collection:(/Verse.org:)Progression.quest_collection

        Quest:test_quest

        Info:(/Verse.org:)Progression.quest_participant_info

        Participant:test_participant

    @hide_in_editor
    quest_test_component<native><epic_internal> := class<final_super>(component):
        var<private> EventFiredFlag<native><epic_internal>:logic = external {}

        var<private> StateChangedEventCount<native><epic_internal>:int = external {}

        var<private> SawInactiveToActive<native><epic_internal>:logic = external {}

        var<private> SawActiveToInactive<native><epic_internal>:logic = external {}

        var<private> TestManagerComponent<native><epic_internal>:?(/Verse.org:)Progression.quest_manager_component = external {}

        var ThrowingProbeHolder<native><epic_internal>:?test_quest = external {}

        var ThrowingProbeSharer<native><epic_internal>:?test_quest = external {}

        var AccessorBackedFlag<public>:logic = external {}

        GetAccessorBackedFlag<native><epic_internal>(__dupe___unnamed_parameter_0:accessor)<transacts>:logic

        SetAccessorBackedFlag<native><epic_internal>(__dupe___unnamed_parameter_0:accessor, NewValue:logic)<transacts>:void

        OnQuestEventFired<epic_internal>(Q:(/Verse.org:)Progression.quest)<transacts>:void = external {}

        var<private> LastObjectiveCompleteData<epic_internal>:?(/Verse.org:)Progression.objective_complete_event_data = external {}

        OnObjectiveEventFired<epic_internal>(Data:(/Verse.org:)Progression.objective_complete_event_data)<transacts>:void = external {}

        OnMembershipEventFired<epic_internal>(M:(/Verse.org:)Progression.quest_membership)<transacts>:void = external {}

        var<private> LastMembershipCompleteData<epic_internal>:?(/Verse.org:)Progression.quest_membership_complete_event_data = external {}

        OnMembershipCompleteEventFired<epic_internal>(Data:(/Verse.org:)Progression.quest_membership_complete_event_data)<transacts>:void = external {}

        OnStateChangedEventFired<epic_internal>(Args:tuple((/Verse.org:)Progression.quest, (/Verse.org:)Progression.quest_state, (/Verse.org:)Progression.quest_state))<transacts>:void = external {}

        NextEventOrder<native><epic_internal>()<transacts>:int

        ResetEventOrder<native><epic_internal>()<transacts>:void

        var<private> ProgressEventCount<native><epic_internal>:int = external {}

        var<private> LastProgressEventOrder<native><epic_internal>:int = external {}

        var<private> CompleteEventCount<native><epic_internal>:int = external {}

        var<private> LastCompleteEventOrder<native><epic_internal>:int = external {}

        var<private> ActivateEventCount<native><epic_internal>:int = external {}

        var<private> DeactivateEventCount<native><epic_internal>:int = external {}

        ResetObjectiveEventRecorders<epic_internal>()<transacts>:void = external {}

        OnObjectiveProgressEventFired<epic_internal>(Obj:(/Verse.org:)Progression.objective)<transacts>:void = external {}

        OnObjectiveCompleteEventFired<epic_internal>(Data:(/Verse.org:)Progression.objective_complete_event_data)<transacts>:void = external {}

        OnObjectiveActivateEventFired<epic_internal>(Obj:(/Verse.org:)Progression.objective)<transacts>:void = external {}

        OnObjectiveDeactivateEventFired<epic_internal>(Obj:(/Verse.org:)Progression.objective)<transacts>:void = external {}

        LastActivationContextIsOwningEntity<native><epic_internal>(Objective:tracking_test_objective)<transacts>:logic

        AnchorObjective<epic_internal>(Objective:(/Verse.org:)Progression.objective, AnchorEntity:entity)<transacts>:void = external {}

        var<private> CollectionCompleteEventCount<native><epic_internal>:int = external {}

        var<private> GrantEventCount<native><epic_internal>:int = external {}

        var<private> LastCollectionCompleteData<epic_internal>:?(/Verse.org:)Progression.quest_complete_event_data = external {}

        OnCollectionCompleteEventCounted<epic_internal>(Data:(/Verse.org:)Progression.quest_complete_event_data)<transacts>:void = external {}

        OnRewardGrantEventCounted<epic_internal>(Data:(/UnrealEngine.com:)Progression.quest_reward_grant_event_data)<transacts>:void = external {}

        MakeBasicTestObjective<epic_internal>()<transacts>:test_objective_basic = external {}

        MakeTestQuestIn<epic_internal>(InCollection:(/Verse.org:)Progression.quest_collection)<transacts>:test_quest = external {}

        MakeBasicTestQuest<epic_internal>()<transacts>:test_quest = external {}

        RewardAudienceFor<epic_internal>(InQuest:(/UnrealEngine.com:)Progression.basic_quest, Reward:(/UnrealEngine.com:)Progression.quest_reward, Memberships:[](/Verse.org:)Progression.quest_membership)<reads>:[](/Verse.org:)Progression.quest_participant = external {}

        MakeBoilerplateObjects<epic_internal>()<transacts>:test_boilerplate_objects = external {}

        MakeAgentParticipant<native><epic_internal>()<transacts>:(/Verse.org:)Progression.agent_quest_participant

        MakeSecondAgentParticipant<native><epic_internal>()<transacts>:(/Verse.org:)Progression.agent_quest_participant

        HasTwoDistinctAgents<native><epic_internal>()<transacts>:logic

        HasTestAgent<native><epic_internal>()<transacts>:logic

        MakeAgentlessParticipant<native><epic_internal>()<transacts>:(/Verse.org:)Progression.agent_quest_participant

        TEST_AccessorBackedVar_RoutesThroughNativeAccessors<native_callable><epic_internal>()<transacts>:logic = external {}

        TEST_ParticipantInfoFlags_ReceivesFlipAfterJoinIsHonored<native_callable><epic_internal>():logic = external {}

        TEST_HasObjective_SetObjectiveWritesField<native_callable><epic_internal>():logic = external {}

        TEST_HasQuestRewards_SetRewardsWritesField<native_callable><epic_internal>():logic = external {}

        TEST_HasQuestRewards_DoorsFilterOnReceives<native_callable><epic_internal>():logic = external {}

        TEST_HasObjectiveContributors_DoorsRecordTheAgent<native_callable><epic_internal>():logic = external {}

        TEST_HasObjectiveAnchor_OverrideOwnsTheRecordWrite<native_callable><epic_internal>():logic = external {}

        TEST_Quest_Complete_SetsComplete<native_callable><epic_internal>():logic = external {}

        TEST_Quest_Complete_IsIdempotent<native_callable><epic_internal>():logic = external {}

        TEST_Quest_Activate_SetsActive<native_callable><epic_internal>():logic = external {}

        TEST_Quest_Deactivate_SetsInactive<native_callable><epic_internal>():logic = external {}

        TEST_Quest_Fail_SetsFailed<native_callable><epic_internal>():logic = external {}

        TEST_Quest_Complete_FiresCompleteEvent<native_callable><epic_internal>():logic = external {}

        TEST_Quest_GetState_DefaultIsInactive<native_callable><epic_internal>():logic = external {}

        TEST_Quest_GetState_ActiveAfterActivate<native_callable><epic_internal>():logic = external {}

        TEST_Quest_GetState_CompletedAfterComplete<native_callable><epic_internal>():logic = external {}

        TEST_Quest_Complete_NoOpWhenFailed<native_callable><epic_internal>():logic = external {}

        TEST_Quest_Fail_NoOpWhenCompleted<native_callable><epic_internal>():logic = external {}

        TEST_Manager_JoinQuest_RejectsQuestHomedElsewhere<native_callable><epic_internal>():logic = external {}

        TEST_Collection_JoinQuest_CreatesMembership<native_callable><epic_internal>():logic = external {}

        TEST_Collection_JoinQuest_DuplicateJoinFails<native_callable><epic_internal>():logic = external {}

        TEST_Collection_JoinQuest_SecondParticipantSameAgentRejected<native_callable><epic_internal>():logic = external {}

        TEST_Collection_AbandonQuest_RemovesMembership<native_callable><epic_internal>():logic = external {}

        TEST_Collection_AbandonQuest_NotJoinedFails<native_callable><epic_internal>():logic = external {}

        TEST_Collection_Participants_ReturnsCorrect<native_callable><epic_internal>():logic = external {}

        TEST_Collection_Quests_ReturnsAllQuests<native_callable><epic_internal>():logic = external {}

        TEST_Collection_JoinEvent_Fires<native_callable><epic_internal>():logic = external {}

        TEST_Collection_AbandonEvent_Fires<native_callable><epic_internal>():logic = external {}

        var<private> ReentryTargets<native><epic_internal>:[](/Verse.org:)Progression.quest_collection = external {}

        OnJoinReHomesQuest<epic_internal>(M:(/Verse.org:)Progression.quest_membership)<transacts>:void = external {}

        TEST_Quest_CtorArchetypeQuestHomesBothWays<native_callable><epic_internal>():logic = external {}

        TEST_SetCollection_ReHomeMigratesMembershipsVerbatim<native_callable><epic_internal>():logic = external {}

        TEST_Manager_AddQuest_ReHome_Preconditions<native_callable><epic_internal>():logic = external {}

        TEST_Manager_AddQuest_ReHome_LeavesOriginCollection<native_callable><epic_internal>():logic = external {}

        TEST_Manager_AddQuest_ReHome_CarriesMemberships<native_callable><epic_internal>():logic = external {}

        TEST_Manager_AddQuest_ReHome_FiresNoMembershipEvents<native_callable><epic_internal>():logic = external {}

        TEST_SetCollection_ReentrantFromEventHandler<native_callable><epic_internal>():logic = external {}

        TEST_BasicQuest_AutoCompletes_WhenObjectiveDone<native_callable><epic_internal>():logic = external {}

        TEST_BasicQuest_SetObjective_ChangesObjective<native_callable><epic_internal>():logic = external {}

        TEST_BasicQuest_AutoGrantsRewardOnComplete<native_callable><epic_internal>():logic = external {}

        TEST_BasicQuest_DirectComplete_GrantsReward<native_callable><epic_internal>():logic = external {}

        TEST_BasicQuest_AutoCompletes_WithJoin<native_callable><epic_internal>():logic = external {}

        TEST_BasicQuest_SetObjective_CyclesContributorsOnActiveSwap<native_callable><epic_internal>():logic = external {}

        TEST_BasicQuest_SetObjective_SameObjectIsNoOp<native_callable><epic_internal>():logic = external {}

        TEST_BasicQuest_SetObjective_InactiveQuestNoLifecycle<native_callable><epic_internal>():logic = external {}

        TEST_BasicQuest_SetObjective_CompletedObjectiveAutoCompletes<native_callable><epic_internal>():logic = external {}

        TEST_BasicQuest_SetObjective_CompletedQuestStoresButBindsNothing<native_callable><epic_internal>():logic = external {}

        TEST_BasicQuest_SetObjective_CompletionDuringSeed_DoesNotActivate<native_callable><epic_internal>():logic = external {}

        TEST_BasicQuest_SetObjective_CompletionDuringWithdrawal_DoesNotCompleteQuest<native_callable><epic_internal>():logic = external {}

        TEST_Objective_ContributorBinding_FiltersByContributes<native_callable><epic_internal>():logic = external {}

        TEST_Objective_Activate_ContributorReachesObjective<native_callable><epic_internal>():logic = external {}

        TEST_Objective_ActivationAnchor_ReachesHook<native_callable><epic_internal>():logic = external {}

        TEST_Objective_AddContributor_PassesThroughWithoutDedup<native_callable><epic_internal>():logic = external {}

        TEST_Objective_DeactivateThenReactivate_PreservesContributors<native_callable><epic_internal>():logic = external {}

        TEST_Objective_CompleteEvent_PrecedesOnComplete<native_callable><epic_internal>():logic = external {}

        TEST_Objective_Activate_SignalsActivateEventAndHook<native_callable><epic_internal>():logic = external {}

        TEST_Objective_CanActivate_BlocksActivateWhenDenied<native_callable><epic_internal>():logic = external {}

        TEST_Objective_CanActivate_AllowsActivateAfterReEnable<native_callable><epic_internal>():logic = external {}

        TEST_Objective_Deactivate_SignalsDeactivateEventAndHook<native_callable><epic_internal>():logic = external {}

        TEST_Objective_CanDeactivate_BlocksDeactivateWhenDenied<native_callable><epic_internal>():logic = external {}

        TEST_Objective_CanDeactivateVeto_DoesNotBlockQuestCompletionRelease<native_callable><epic_internal>():logic = external {}

        TEST_Objective_Complete_ReportsCompletionOnCommand<native_callable><epic_internal>():logic = external {}

        TEST_Objective_CanComplete_BlocksCompleteWhenDenied<native_callable><epic_internal>():logic = external {}

        TEST_BasicQuest_OnActivate_DispatchesPureVerseOverride<native_callable><epic_internal>():logic = external {}

        TEST_ParticipantInfo_DefaultsAndCustomValues<native_callable><epic_internal>():logic = external {}

        TEST_Bundle_CountProgressAndCompletion<native_callable><epic_internal>():logic = external {}

        TEST_Participant_Memberships_TrackJoinAndAbandon<native_callable><epic_internal>():logic = external {}

        TEST_Collection_JoinQuest_QuestCanVeto<native_callable><epic_internal>():logic = external {}

        TEST_Collection_JoinQuest_ParticipantCanVeto<native_callable><epic_internal>():logic = external {}

        TEST_Manager_GrantQuest_ActivatesQuest<native_callable><epic_internal>():logic = external {}

        TEST_Manager_GrantEvent_Fires<native_callable><epic_internal>():logic = external {}

        TEST_Manager_RevokeQuest_DeactivatesQuest<native_callable><epic_internal>():logic = external {}

        TEST_Manager_GrantQuest_NoRollbackWhenQuestCompletesDuringActivate<native_callable><epic_internal>():logic = external {}

        TEST_Manager_AddQuest_DuplicateAndAlreadyManagedRejected<native_callable><epic_internal>():logic = external {}

        TEST_Quest_OnComplete_CalledOnComplete<native_callable><epic_internal>():logic = external {}

        TEST_Participant_OnJoin_Fires<native_callable><epic_internal>():logic = external {}

        TEST_Participant_OnAbandon_Fires<native_callable><epic_internal>():logic = external {}

        TEST_Participant_OnActivate_Fires<native_callable><epic_internal>():logic = external {}

        TEST_Participant_OnDeactivate_Fires<native_callable><epic_internal>():logic = external {}

        TEST_Participant_OnComplete_Fires<native_callable><epic_internal>():logic = external {}

        TEST_Participant_JoinEvent_Fires<native_callable><epic_internal>():logic = external {}

        TEST_Participant_AbandonEvent_Fires<native_callable><epic_internal>():logic = external {}

        TEST_Participant_CompleteEvent_Fires<native_callable><epic_internal>():logic = external {}

        TEST_Quest_JoinEvent_Fires<native_callable><epic_internal>():logic = external {}

        TEST_Quest_AbandonEvent_Fires<native_callable><epic_internal>():logic = external {}

        TEST_Collection_AbandonQuest_QuestCanVeto<native_callable><epic_internal>():logic = external {}

        TEST_Collection_AbandonQuest_ParticipantCanVeto<native_callable><epic_internal>():logic = external {}

        TEST_Manager_RevokeQuest_SucceedsDespiteAbandonVeto<native_callable><epic_internal>():logic = external {}

        TEST_Quest_CanAdd_Veto<native_callable><epic_internal>():logic = external {}

        TEST_Collection_JoinQuest_VetoError_PayloadCarriesGuardError<native_callable><epic_internal>():logic = external {}

        TEST_Collection_AbandonQuest_VetoError_PayloadCarriesGuardError<native_callable><epic_internal>():logic = external {}

        TEST_Manager_GrantQuest_VetoError_PayloadNamesTheSubtype<native_callable><epic_internal>():logic = external {}

        TEST_Manager_RevokeQuest_VetoError_PayloadNamesTheSubtype<native_callable><epic_internal>():logic = external {}

        TEST_Collection_JoinQuest_FactoryError_PayloadBinds<native_callable><epic_internal>():logic = external {}

        TEST_Reward_FailingReward_ReturnsError<native_callable><epic_internal>():logic = external {}

        TEST_Manager_RemoveQuest_RemovesFromTracked<native_callable><epic_internal>():logic = external {}

        TEST_Manager_AbandonQuest_DelegatesToCollection<native_callable><epic_internal>():logic = external {}

        TEST_Manager_OnAdd_OnRemove_Hooks<native_callable><epic_internal>():logic = external {}

        TEST_Quest_StateChangedEvent_FiresOnActivateAndDeactivate<native_callable><epic_internal>():logic = external {}

        TEST_Granter_GrantQuests_CreatesAndWiresQuests<native_callable><epic_internal>():logic = external {}

        TEST_Granter_CanGrant_Veto<native_callable><epic_internal>():logic = external {}

        TEST_Granter_OnGrant_Fires<native_callable><epic_internal>():logic = external {}

        TEST_Granter_GrantQuests_EmptyWhenNoTypes<native_callable><epic_internal>():logic = external {}

        TEST_Extension_OnActivate_Fires<native_callable><epic_internal>():logic = external {}

        TEST_Extension_OnDeactivate_Fires<native_callable><epic_internal>():logic = external {}

        TEST_Extension_OnJoin_Fires<native_callable><epic_internal>():logic = external {}

        TEST_Extension_OnAbandon_Fires<native_callable><epic_internal>():logic = external {}

        TEST_Extension_OnComplete_Fires<native_callable><epic_internal>():logic = external {}

        TEST_Extension_CanJoin_Veto<native_callable><epic_internal>():logic = external {}

        TEST_Extension_CanAbandon_Veto<native_callable><epic_internal>():logic = external {}

        TEST_Extension_GetOwningQuest_ReturnsQuest<native_callable><epic_internal>():logic = external {}

        TEST_Extension_NoOwner_GetOwningQuestFailsGracefully<native_callable><epic_internal>():logic = external {}

        TEST_ModularQuest_MultipleExtensions_ActivateDeactivateOrdering<native_callable><epic_internal>():logic = external {}

        TEST_ModularQuest_MultipleExtensions_JoinAbandonOrdering<native_callable><epic_internal>():logic = external {}

        TEST_Quest_CompletionContext_UnsetThenDefaultThenFailed<native_callable><epic_internal>():logic = external {}

        TEST_Bridge_AssertObjectiveViewUID<native><epic_internal>(Objective:(/Verse.org:)Progression.objective, ExpectedUID:string):logic

        TEST_Objective_Construct_BasePopulatesUID<native_callable><epic_internal>():logic = external {}

        TEST_Bridge_AssertBasicQuestViewType<native><epic_internal>(Quest:(/UnrealEngine.com:)Progression.basic_quest, ExpectedUID:string):logic

        TEST_Bridge_AssertBasicQuestNoObjectiveDropsObjective<native><epic_internal>(Quest:(/UnrealEngine.com:)Progression.basic_quest):logic

        TEST_BasicQuest_Construct_ReturnsBasicQuestView<native_callable><epic_internal>():logic = external {}

        TEST_BasicQuest_Construct_NoObjective_EmptyObjectiveStates<native_callable><epic_internal>():logic = external {}

        TEST_Bridge_AssertObjectiveApplyDisplayDataHappyAndGraceful<native><epic_internal>(Objective:(/Verse.org:)Progression.objective):logic

        TEST_Bridge_AssertRewardApplyDisplayDataHappyAndGraceful<native><epic_internal>(Reward:(/UnrealEngine.com:)Progression.quest_reward):logic

        TEST_Objective_ApplyDisplay_HappyAndFailurePaths<native_callable><epic_internal>():logic = external {}

        TEST_Reward_ApplyDisplay_HappyAndFailurePaths<native_callable><epic_internal>():logic = external {}

        TEST_Bridge_AssertBasicQuestApplyDisplayDataHappyAndGraceful<native><epic_internal>(Quest:(/UnrealEngine.com:)Progression.basic_quest):logic

        TEST_BasicQuest_ApplyDisplay_HappyAndFailurePaths<native_callable><epic_internal>():logic = external {}

        TEST_Bridge_AssertIBasicQuestPopulatesObjectiveStates<native><epic_internal>(Quest:(/UnrealEngine.com:)Progression.basic_quest):logic

        TEST_Bridge_AssertIModularQuestPopulatesObjectivesAndExtensions<native><epic_internal>(Quest:(/UnrealEngine.com:)Progression.modular_quest, ExpectedExtensionCount:int):logic

        TEST_Interface_IBasicQuest_ConstructView_VerseImpl_PopulatesObjectiveStates<native_callable><epic_internal>():logic = external {}

        TEST_Interface_IModularQuest_ConstructView_VerseImpl_PopulatesObjectivesAndExtensions<native_callable><epic_internal>():logic = external {}

        TEST_Public_Membership_FieldsCorrect<native_callable><epic_internal>():logic = external {}

        TEST_Public_ParticipantInfo_ReceivesFalse_ExcludedFromRecipients<native_callable><epic_internal>():logic = external {}

        TEST_Public_Quest_State_ReadsCompleteAfterCompletion<native_callable><epic_internal>():logic = external {}

        TEST_Quest_TerminalLock_HoldsOnDirectQuestSubclass<native_callable><epic_internal>():logic = external {}

        TEST_Reward_Grant_OpenBeforeCompletion<native_callable><epic_internal>():logic = external {}

        TEST_Reward_Grant_RepeatsWithoutLatch<native_callable><epic_internal>():logic = external {}

        TEST_Reward_CanGrant_DefaultAcceptsAndOverrideRefuses<native_callable><epic_internal>():logic = external {}

        TEST_Reward_ClaimDoorAfterFrameworkLoop_GrantsAgain<native_callable><epic_internal>():logic = external {}

        TEST_Reward_Grant_DerivesRecipientsFromMemberships<native_callable><epic_internal>():logic = external {}

        TEST_BasicQuest_Activate_CarriesObjectiveGuardError<native_callable><epic_internal>():logic = external {}

        TEST_BasicQuest_CanActivate_ComposesQuestAndObjectiveErrors<native_callable><epic_internal>():logic = external {}

        TEST_HasQuestRewards_PreviewRewards_SkipsRewardWhoseCanGrantRefuses<native_callable><epic_internal>():logic = external {}

        TEST_QuestReward_Preview_MatchesGrantRecipients<native_callable><epic_internal>():logic = external {}

        TEST_QuestReward_Preview_EmptyWhenCanGrantRefuses<native_callable><epic_internal>():logic = external {}

        TEST_HasQuestRewards_PreviewRewards_ComposesPerRewardPreview<native_callable><epic_internal>():logic = external {}

        TEST_HasQuestRewards_PreviewRewards_WorldRewardKeyedWithEmptyList<native_callable><epic_internal>():logic = external {}

        TEST_HasQuestRewards_GrantRewards_WorldRewardWithNoParticipantsIsGranted<native_callable><epic_internal>():logic = external {}

        TEST_HasQuestRewards_GrantRewards_EmptyMapIsSuccess<native_callable><epic_internal>():logic = external {}

        TEST_HasQuestRewards_GrantRewards_ReturnsWhatWasGranted<native_callable><epic_internal>():logic = external {}

        TEST_HasQuestRewards_DoorsDropReceivesFalseUnderPermissiveOverride<native_callable><epic_internal>():logic = external {}

        TEST_HasQuestRewards_GrantRewards_RepeatCallPaysAgain<native_callable><epic_internal>():logic = external {}

        TEST_HasQuestRewards_GrantRewards_SameInstanceTwiceIsGrantedTwice<native_callable><epic_internal>():logic = external {}

        TEST_QuestReward_CanGrant_ConstructsErrorInsideReadsGuard<native_callable><epic_internal>():logic = external {}

        ArmThrowingGuardProbe<native_callable><epic_internal>()<transacts>:logic = external {}

        TEST_BasicQuest_CompletionLatch_SurvivesAnOverridingGuard<native_callable><epic_internal>():logic = external {}

        TEST_HasQuestRewards_GrantRewards_VetoBecomesTheError<native_callable><epic_internal>():logic = external {}

        TEST_BasicQuest_RewardVetoAtCompletion_DoesNotFailCompletion<native_callable><epic_internal>():logic = external {}

        TEST_Presentation_SetFunctionsMarkViewDirtyOnChangeOnly<native_callable><epic_internal>(Target:test_quest_presentation, Category:(/UnrealEngine.com:)Progression.quest_category)<transacts>:logic = external {}

        TEST_ParticipantInfo_DetachedSetsArePlainStores<native_callable><epic_internal>():logic = external {}

        TEST_ParticipantInfo_ContributesFlip_MovesOneContributorRecord<native_callable><epic_internal>():logic = external {}

        TEST_BasicQuest_VerseOnlyContributorObjective_ReceivesContributorPushes<native_callable><epic_internal>():logic = external {}

        TEST_BasicQuest_SetObjective_WithdrawReentry_NestedCallOwnsTheBinding<native_callable><epic_internal>():logic = external {}

        TEST_BasicQuest_SetObjective_SeedReentry_NestedCallOwnsTheBinding<native_callable><epic_internal>():logic = external {}

        TEST_Quest_HasObjectiveQuestFlipReachesVerseOnlyObjective<native_callable><epic_internal>():logic = external {}

        var VerseOnlyContributorReadQuest<native><epic_internal>:?(/UnrealEngine.com:)Progression.basic_quest = external {}

        var VerseOnlyPlainReadQuest<native><epic_internal>:?(/UnrealEngine.com:)Progression.basic_quest = external {}

        BuildVerseOnlyContributorReadQuests<native_callable><epic_internal>()<transacts>:[](/UnrealEngine.com:)Progression.basic_quest = external {}

        VerseContributorsOf<native_callable><epic_internal>(InQuest:(/UnrealEngine.com:)Progression.basic_quest)<reads>:[]agent = external {}

        TEST_ParticipantInfo_OneInfoTwoJoins_NoCrossTalk<native_callable><epic_internal>():logic = external {}

        TEST_ParticipantInfo_JoinPreservesInfoSubclass<native_callable><epic_internal>():logic = external {}

        TEST_ParticipantInfo_MembershipInfoFiltersBySubtype<native_callable><epic_internal>():logic = external {}

        TEST_ParticipantInfo_LiveInfoAsTemplate_CopiesValuesNotMembership<native_callable><epic_internal>():logic = external {}

        TEST_Collection_CompleteEvent_FiresOncePerQuest<native_callable><epic_internal>():logic = external {}

        TEST_Collection_ZeroMembershipCompletion_FiresOnce<native_callable><epic_internal>():logic = external {}

        TEST_Participant_OnComplete_CarriesMembershipInfo<native_callable><epic_internal>():logic = external {}

        TEST_Quest_Join_RefusedAfterCompletion<native_callable><epic_internal>():logic = external {}

        TEST_Guard_AccessorBackedFieldsReadableFromResultGuard<native_callable><epic_internal>():logic = external {}

        FlipObservesThenReport<epic_internal>(Membership:(/Verse.org:)Progression.quest_membership, NewObserves:logic, ShouldSucceed:logic)<transacts><decides>:void = external {}

        AnchorIsOwningEntity<native><epic_internal>(Objective:(/Verse.org:)Progression.objective)<transacts>:logic

        AnchorEntityOf<native_callable><epic_internal>(Objective:(/Verse.org:)Progression.objective)<transacts>:?entity = external {}

        var ReplicationProbeQuest<native><epic_internal>:?(/Verse.org:)Progression.quest = external {}

        var ReplicationProbeParticipant<native><epic_internal>:?(/Verse.org:)Progression.agent_quest_participant = external {}

        var ProbeRewardsSeenAtPostInit<native><epic_internal>:int = external {}

        var ProbeRewardsStampedAtPostInit<native><epic_internal>:int = external {}

        TEST_Replication_JoinObserverCommitted<native_callable><epic_internal>():logic = external {}

        TEST_Replication_FlipRecordedObserves<native_callable><epic_internal>(NewObserves:logic, ShouldSucceed:logic):logic = external {}

        TEST_BasicQuest_SetRewardsResubscribes<native_callable><epic_internal>(Target:test_quest):[](/UnrealEngine.com:)Progression.quest_reward = external {}

        TEST_Objective_SecondActivate_NonChainingGuardDoesNotReactivate<native_callable><epic_internal>():logic = external {}

        TEST_Collection_AbandonWithFreshParticipantOverSameAgent_Succeeds<native_callable><epic_internal>():logic = external {}

        TEST_Quest_ReentrantCompleteFromOnComplete_CompletesOnce<native_callable><epic_internal>():logic = external {}

        TEST_BasicQuest_SetObjectiveSelf_StoredButNotBound<native_callable><epic_internal>():logic = external {}

        TEST_Manager_RevokeQuest_DeactivatesDespiteCanDeactivateVeto<native_callable><epic_internal>():logic = external {}

        TEST_Reward_FailedQuestPaysNothingButDoorStillOpens<native_callable><epic_internal>():logic = external {}

        TEST_BasicQuest_RewardsIndex_Row<native_callable><epic_internal>(RewardCount:int, Index:int, ExpectedTag:int):logic = external {}

        TEST_BasicQuest_SharedObjective_AbandonNonContributingMembership_KeepsOtherQuestRecord<native_callable><epic_internal>():logic = external {}

        TEST_BasicQuest_SharedObjective_SecondActivateRefused_BothCompleteOnObjectiveComplete<native_callable><epic_internal>():logic = external {}

        TEST_BasicQuest_ArchetypeRewards_LandedBeforePostInit<native_callable><epic_internal>():logic = external {}

        TEST_BasicQuest_ArchetypeRewards_SharedRewardAcceptedOncePerQuest<native_callable><epic_internal>():logic = external {}

        TEST_Castable_QuestReward_FilterNamesOnlyTheSubtype<native_callable><epic_internal>():logic = external {}

        TEST_Castable_QuestParticipantInfo_FilterNamesOnlyTheSubtype<native_callable><epic_internal>()<transacts>:logic = external {}

        TEST_Castable_QuestParticipant_FilterNamesOnlyTheSubtype<native_callable><epic_internal>():logic = external {}

        var ProbeFailedLeg<epic_internal>:int = external {}

        ResetFailedLeg<epic_internal>()<transacts>:void = external {}

        MarkFailedLeg<epic_internal>(Leg:int)<transacts>:void = external {}

        ProbeFailedLegValue<native_callable><epic_internal>():int = external {}

        ProbeMembershipTags<epic_internal>(InCollection:(/Verse.org:)Progression.quest_collection, InQuest:(/Verse.org:)Progression.quest)<transacts>:[]int = external {}

        TEST_Quest_ReentrantAbandonSamePairFromOnAbandon_OuterSucceedsHooksRunOnce<native_callable><epic_internal>():logic = external {}

        TEST_BasicQuest_SharedObjective_ReentrantAbandon_WithdrawsContributorOnce<native_callable><epic_internal>():logic = external {}

        TEST_Quest_JoinFromOnCompleteBeforeChain_IsRefused<native_callable><epic_internal>():logic = external {}

        TEST_Quest_JoinFromCompleteEventSubscriber_IsRefused<native_callable><epic_internal>():logic = external {}

        TEST_Quest_CompleteEvent_DeliveredInlineBeforeStateWrite_PIN<native_callable><epic_internal>():logic = external {}

        TEST_Quest_OnJoinHookAbandonsJoiner_JoinSucceedsAndAbandonFollows_PIN<native_callable><epic_internal>():logic = external {}

        TEST_Quest_CompletionNotify_MemberAbandonedMidLoop_NotifiedButNotPaid_PIN<native_callable><epic_internal>():logic = external {}

        TEST_Quest_ReHomeFromOnAbandonHook_AbandonCompletesOnce<native_callable><epic_internal>():logic = external {}

        TEST_Quest_Activate_RefusedDuringInFlightCompletion<native_callable><epic_internal>():logic = external {}

        TEST_Collection_ReHome_PreservesMembershipOrderInMapAndCompletionCascade<native_callable><epic_internal>():logic = external {}

        TEST_Quest_OnJoinHookAbandonsJoiner_RemainingJoinHooksSkipped<native_callable><epic_internal>():logic = external {}