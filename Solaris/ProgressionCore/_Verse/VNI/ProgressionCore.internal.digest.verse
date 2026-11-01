# Verse path: /UnrealEngine.com
using {/Verse.org/Native}
@available {MinUploadedAtFNVersion := 4300}
# Module import path: /UnrealEngine.com/Progression
(/UnrealEngine.com:)Progression<public> := module:
    using {/Verse.org/StateMachine}
    using {/UnrealEngine.com/Marketplace}
    using {/Verse.org/SceneGraph}
    using {/Verse.org/Simulation}
    using {/Verse.org}
    # An objective composed of sub-objectives, complete when at least RequiredCount of them are; RequiredCount 0, the default, means all of them.
    # Completion is derived from the sub-objectives on every read, so subscribe to CompleteEvent rather than polling State.
    composite_objective<native><epic_internal> := class<epic_internal>((/Verse.org:)Progression.objective, (/Verse.org:)Progression.has_objective_contributors, (/Verse.org:)Progression.has_objective_anchor):
        GetProgress<override><native><native_callable>()<reads>:message

        OnActivate<override><native><native_callable>()<transacts>:void

        OnDeactivate<override><native><native_callable>()<transacts>:void

        AddContributor<override><final>(Agent:agent)<transacts>:void = external {}

        RemoveContributor<override><final>(Agent:agent)<transacts>:void = external {}

        RouteAddContributor<native_callable><epic_internal>(Child:(/Verse.org:)Progression.objective, Agent:agent)<transacts>:void = external {}

        RouteRemoveContributor<native_callable><epic_internal>(Child:(/Verse.org:)Progression.objective, Agent:agent)<transacts>:void = external {}

        SetAnchor<override><final>(InAnchor:entity)<transacts>:void = external {}

        RouteSetAnchor<native_callable><epic_internal>(Child:(/Verse.org:)Progression.objective, InAnchor:entity)<transacts>:void = external {}

        var Objectives<native><epic_internal>:[](/Verse.org:)Progression.objective = external {}

        var<private> RequiredCount<native><epic_internal>:int = external {}

    conditional_objective<native><epic_internal> := class<epic_internal>(progress_objective, (/Verse.org:)Progression.has_objective_contributors, (/Verse.org:)Progression.has_objective_anchor, has_gameplay_conditionals):
        OnActivate<override>()<transacts>:void = external {}

        SetAnchor<override>(InAnchor:entity)<transacts>:void = external {}

        OnDeactivate<override>()<transacts>:void = external {}

        AddContributor<override>(Agent:agent)<transacts>:void = external {}

        RemoveContributor<override>(Agent:agent)<transacts>:void = external {}

        OnConditionalExecuted<override>(Context:gameplay_conditional_context):void = external {}

        var RegisteredHandles<epic_internal>:[]gameplay_conditional_listener_handle = external {}

    contextual_reactions_cache<epic_internal> := class<unique><epic_internal>:
        OnGameplayConditionalTriggered<epic_internal>(Context:gameplay_conditional_context):void = external {}

        Invalidate<epic_internal>():void = external {}

        var Handle<epic_internal>:?gameplay_conditional_listener_handle = external {}

        Reactions<epic_internal>:[]gameplay_reaction

        OwningComponent<epic_internal>:contextual_reactions_component

    contextual_reactions_component<native><epic_internal> := class<final_super><epic_internal>(component):
        OnBeginSimulation<override>():void = external {}

        OnEndSimulation<override>():void = external {}

        Events<epic_internal>:[]tuple(concrete_subtype(gameplay_conditional), []gameplay_reaction)

        var Caches<epic_internal>:[]contextual_reactions_cache = external {}

    ecosystem_entitlement<native><epic_internal> := class(entitlement):
        PaidRandomItem<override><final>:logic = external {}

        PaidArea<override><final>:logic = external {}

    # Grants an entitlement to each eligible participant.
    entitlement_quest_reward<native><public> := class(quest_reward):
        # The entitlement type to grant.
        Entitlement<native><public>:concrete_subtype(entitlement)

        # Quantity per participant; `1` by default, not clamped or validated.
        Quantity<native><public>:int = external {}

        # Skips memberships whose participant is not a player agent.
        OnGrant<override><native><final>(Memberships:[](/Verse.org:)Progression.quest_membership)<transacts>:void

    gameplay_conditional_verbs<epic_internal> := class(gameplay_conditional):
        OnInitialization<override>(ContextAnchor:entity):void = external {}

        OnInvalidation<override>():void = external {}

        OnParticipantAdded<override>(Participant:entity):void = external {}

        OnParticipantRemoved<override>(Participant:entity):void = external {}

        OnVerbMessageReceived<protected>(Author:entity, SceneEvent:scene_event):void = external {}

        OnVerbMessageReceivedWithDelta<protected>(Author:entity, SceneEvent:scene_event, Delta:float):void = external {}

        VerbFilterTypes<epic_internal>:[]subtype(verb_filter) = external {}

        VerbMessageTypes<epic_internal>:[]subtype(scene_event) = external {}

    locker_entitlement<native><epic_internal> := class(ecosystem_entitlement):
        Consumable<override><final>:logic = external {}

        MaxCount<override><final>:int = external {}

    objective_machine_state<native><epic_internal> := class<final_super><epic_internal>(state, (/Verse.org:)Progression.has_objective):
        OnEnter<override><native><native_callable>():void

        OnExit<override><native><native_callable>():void

    # Tracks numeric progress toward a required threshold; complete when `Progress >= RequiredProgress`.
    # A commanded `Complete()` succeeds at any progress and does not advance it.
    progress_objective<native><public> := class((/Verse.org:)Progression.objective):
        # Returns progress in `"X / Y"` format.
        GetProgress<override><native><final>()<reads>:message

        AddProgress<native><final><epic_internal>(Amount:float)<transacts>:void

        # Sets current progress, clamped to `[0, RequiredProgress]`.
        SetProgress<native><final><public>(InProgress:float)<transacts>:void

        # Sets the target progress; a negative or NaN value becomes `0`.
        # Lowering it below `Progress` re-clamps `Progress` to the new target and fires `ProgressEvent`.
        SetRequiredProgress<native><final><public>(InRequiredProgress:float)<transacts>:void

        # Current progress toward `RequiredProgress`; an authored value is clamped to `[0, RequiredProgress]` at activation.
        # Write it with `SetProgress`.
        var<private> Progress<native><public>:float = external {}

        # Target progress for completion; an authored value is not clamped, and `0` reads complete from activation.
        # Write it with `SetRequiredProgress`.
        var<private> RequiredProgress<native><public>:float

    claim_reward_error<native><epic_internal> := class<abstract><castable><epic_internal>:


    not_ready_to_claim_error<native><epic_internal> := class<epic_internal>(claim_reward_error):


    already_claimed_error<native><epic_internal> := class<epic_internal>(claim_reward_error):


    reward_claim_quest_extension<native><epic_internal> := class<epic_internal>(quest_extension):
        CanGrantRewards<override><native><native_callable>(Memberships:[](/Verse.org:)Progression.quest_membership)<reads>:result(void, []quest_reward_error)

        # Pays the owning quest's live roster at claim time; members who abandoned (or were revoked) after completion are not paid, and the claim still latches.
        ClaimRewards<native><native_callable><epic_internal>()<transacts>:result(void, []claim_reward_error)

        IsReadyToClaim<native><native_callable><epic_internal>()<decides><reads>:void

        var<private> PendingClaim<native><epic_internal>:logic = external {}

        var<private> Claimed<native><epic_internal>:logic = external {}

        RewardsReadyEvent<native><final><epic_internal>:listenable(reward_claim_quest_extension) = external {}

        RewardsClaimedEvent<native><final><epic_internal>:listenable(reward_claim_quest_extension) = external {}

    MakeClaimRewardErrorResultFrom<native_callable><epic_internal>(Error:claim_reward_error):result(void, []claim_reward_error) = external {}

    MakeClaimRewardSuccessResult<native_callable><epic_internal>():result(void, []claim_reward_error) = external {}

    # An objective that requires completing a sequence of sub-objectives in order, advancing to the next sub-objective when the current one is complete.
    # The stage cursor advances only while the sequence is active; sub-objectives completed while it is inactive are skipped at the next Activate; a finished sequence reads Complete on restore without activation.
    sequential_objective<native><epic_internal> := class<epic_internal>((/Verse.org:)Progression.objective, (/Verse.org:)Progression.has_objective_contributors, (/Verse.org:)Progression.has_objective_anchor):
        GetProgress<override><native><native_callable>()<reads>:message

        OnActivate<override><native><native_callable>()<transacts>:void

        OnDeactivate<override><native><native_callable>()<transacts>:void

        AddContributor<override><final>(Agent:agent)<transacts>:void = external {}

        RemoveContributor<override><final>(Agent:agent)<transacts>:void = external {}

        RouteAddContributor<native_callable><epic_internal>(Child:(/Verse.org:)Progression.objective, Agent:agent)<transacts>:void = external {}

        RouteRemoveContributor<native_callable><epic_internal>(Child:(/Verse.org:)Progression.objective, Agent:agent)<transacts>:void = external {}

        SetAnchor<override><final>(InAnchor:entity)<transacts>:void = external {}

        RouteSetAnchor<native_callable><epic_internal>(Child:(/Verse.org:)Progression.objective, InAnchor:entity)<transacts>:void = external {}

        var Objectives<native><epic_internal>:[](/Verse.org:)Progression.objective

        var<private> CurrentStageIndex<native><epic_internal>:int = external {}

    # An objective driven by a state machine, where each state holds an objective and the machine transitions as those objectives complete; complete when a completion state is reached.
    # Complete derives from the live machine's active leaves; an unwired machine reads not-complete and the persisted state id is diagnostic only.
    state_machine_objective<native><epic_internal> := class<epic_internal>((/Verse.org:)Progression.objective, (/Verse.org:)Progression.has_objective_contributors, (/Verse.org:)Progression.has_objective_anchor):
        GetProgress<override><native><native_callable>()<reads>:message

        OnActivate<override><native><native_callable>()<transacts>:void

        AddContributor<override><final>(Agent:agent)<transacts>:void = external {}

        RemoveContributor<override><final>(Agent:agent)<transacts>:void = external {}

        RouteAddContributor<native_callable><epic_internal>(Child:(/Verse.org:)Progression.objective, Agent:agent)<transacts>:void = external {}

        RouteRemoveContributor<native_callable><epic_internal>(Child:(/Verse.org:)Progression.objective, Agent:agent)<transacts>:void = external {}

        SetAnchor<override><final>(InAnchor:entity)<transacts>:void = external {}

        RouteSetAnchor<native_callable><epic_internal>(Child:(/Verse.org:)Progression.objective, InAnchor:entity)<transacts>:void = external {}

        var (/UnrealEngine.com/Progression/state_machine_objective:)StateMachine<native><epic_internal>:state_machine

        var CompletionStates<native><epic_internal>:[]state

        var<private> CurrentState<native><epic_internal>:?objective_machine_state = external {}

        UpdateCurrentState<native><final><epic_internal>():void

    timed_objective<native><epic_internal> := class<epic_internal>((/Verse.org:)Progression.objective, (/Verse.org:)Progression.has_objective_contributors, (/Verse.org:)Progression.has_objective_anchor):
        GetProgress<override><native><native_callable>()<reads>:message

        AddContributor<override><final>(Agent:agent)<transacts>:void = external {}

        RemoveContributor<override><final>(Agent:agent)<transacts>:void = external {}

        RouteAddContributor<native_callable><epic_internal>(Child:(/Verse.org:)Progression.objective, Agent:agent)<transacts>:void = external {}

        RouteRemoveContributor<native_callable><epic_internal>(Child:(/Verse.org:)Progression.objective, Agent:agent)<transacts>:void = external {}

        SetAnchor<override><final>(InAnchor:entity)<transacts>:void = external {}

        RouteSetAnchor<native_callable><epic_internal>(Child:(/Verse.org:)Progression.objective, InAnchor:entity)<transacts>:void = external {}

        UpdateTimeRemaining<native><final><epic_internal>(DeltaSeconds:float)<transacts>:void

        var Objective<native><epic_internal>:(/Verse.org:)Progression.objective

        var TimeLimit<native><epic_internal>:float

        var<private> TimeRemaining<native><epic_internal>:float

        TimeExpiredEvent<native><final><epic_internal>:listenable(timed_objective) = external {}

    xp_entitlement<native><epic_internal> := class(ecosystem_entitlement):
        Consumable<override><final>:logic = external {}