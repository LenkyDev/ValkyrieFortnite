using {/Verse.org/StateMachine}
using {/Verse.org/Native}
using {/Fortnite.com/Marketplace}
using {/Verse.org/SceneGraph}
using {/Verse.org/Progression}
@experimental
composite_quest_objective<native><epic_internal> := class<epic_internal>(quest_objective):
    GetProgress<override><native><native_callable>()<reads>:message

    IsComplete<override><native><native_callable>()<reads><decides>:void

    OnActivate<override><native><native_callable>():void

    OnDeactivate<override><native><native_callable>():void

    OnJoin<override><native><native_callable>(QuestParticipant:quest_participant):void

    OnAbandon<override><native><native_callable>(QuestParticipant:quest_participant):void

    var Objectives<native><epic_internal>:[]quest_objective = external {}

    var<private> RequiredCount<native><epic_internal>:int = external {}

@experimental
conditional_quest_objective<native><epic_internal> := class<epic_internal>(progress_quest_objective, has_gameplay_conditionals):
    OnActivate<override>():void = external {}

    OnJoin<override>(QuestParticipant:quest_participant):void = external {}

    OnAbandon<override>(QuestParticipant:quest_participant):void = external {}

    OnDeactivate<override>():void = external {}

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

    Events<epic_internal>:[]tuple(gameplay_conditional, []gameplay_reaction)

    var Caches<epic_internal>:[]contextual_reactions_cache = external {}

ecosystem_entitlement<native><epic_internal> := class(entitlement):
    PaidRandomItem<override><final>:logic = external {}

    PaidArea<override><final>:logic = external {}

@experimental
# Grants an entitlement to each eligible participant.
entitlement_quest_reward<native><public> := class(quest_reward):
    @available {MinUploadedAtFNVersion := 4000}
    # The entitlement type to grant.
    var Entitlement<native><public>:concrete_subtype(entitlement)

    # Quantity per participant.
    var Quantity<native><public>:int = external {}

    @available {MinUploadedAtFNVersion := 4000}
    # Iterates EligibleParticipants, resolves each participant's agent as a player,
    # and grants the entitlement via the platform entitlement service.
    GrantReward<override><native><final>(EligibleParticipants:[]quest_participant)<transacts>:result(void, []grant_quest_reward_error)

gameplay_conditional_verbs<epic_internal> := class(gameplay_conditional):
    OnInitialization<override>(ContextAnchor:entity):void = external {}

    OnInvalidation<override>():void = external {}

    OnParticipantAdded<override>(Participant:entity):void = external {}

    OnParticipantRemoved<override>(Participant:entity):void = external {}

    OnVerbMessageReceived<protected>(Author:entity, SceneEvent:scene_event):void = external {}

    OnVerbMessageReceivedWithDelta<protected>(Author:entity, SceneEvent:scene_event, Delta:float):void = external {}

    VerbFilterTypes<epic_internal>:[]subtype(verb_filter)

    VerbMessageTypes<epic_internal>:[]subtype(scene_event)

locker_entitlement<native><epic_internal> := class(ecosystem_entitlement):
    Consumable<override><final>:logic = external {}

    MaxCount<override><final>:int = external {}

@experimental
# Tracks numeric progress toward a required count.
# Complete when Progress >= RequiredCount.
progress_quest_objective<native><public> := class(quest_objective):
    # Returns progress in "X / Y" format.
    GetProgress<override><native><final>()<reads>:message

    # Succeeds if Progress >= RequiredCount.
    IsComplete<override><native><final>()<reads><decides>:void

    AddProgress<native><final><epic_internal>(Amount:float)<transacts>:void

    # Sets current progress. Clamped to [0, RequiredCount].
    SetProgress<native><final><public>(Amount:float)<transacts>:void

    # Sets the target count. Clamped to [1, MaxFloat].
    SetRequiredCount<native><final><public>(Amount:float)<transacts>:void

    # Current progress toward RequiredCount.
    var<private> Progress<native><public>:float = external {}

    # Target count for completion.
    var<private> RequiredCount<native><public>:float

@experimental
quest_objective_state<native><epic_internal> := class<final_super><epic_internal>(state):
    var Objective<native><epic_internal>:quest_objective

    OnEnter<override><native><native_callable>():void

    OnExit<override><native><native_callable>():void

claim_reward_error<native><epic_internal> := class<epic_internal>:


not_ready_to_claim_error<native><epic_internal> := class<epic_internal>(claim_reward_error):


already_claimed_error<native><epic_internal> := class<epic_internal>(claim_reward_error):


@experimental
reward_claim_quest_extension<native><epic_internal> := class<epic_internal>(quest_extension):
    CanGrantRewards<override><native><native_callable>()<reads><decides>:void

    @available {MinUploadedAtFNVersion := 4000}
    ClaimRewards<native><native_callable><epic_internal>()<transacts>:result(void, []claim_reward_error)

    IsReadyToClaim<native><native_callable><epic_internal>()<reads><decides>:void

    var<private> PendingClaim<native><epic_internal>:logic = external {}

    var<private> Claimed<native><epic_internal>:logic = external {}

    RewardsReadyEvent<native><final><epic_internal>:listenable(reward_claim_quest_extension) = external {}

    RewardsClaimedEvent<native><final><epic_internal>:listenable(reward_claim_quest_extension) = external {}

@experimental
sequential_quest_objective<native><epic_internal> := class<epic_internal>(quest_objective):
    GetProgress<override><native><native_callable>()<reads>:message

    IsComplete<override><native><native_callable>()<reads><decides>:void

    OnActivate<override><native><native_callable>():void

    OnDeactivate<override><native><native_callable>():void

    OnJoin<override><native><native_callable>(QuestParticipant:quest_participant):void

    OnAbandon<override><native><native_callable>(QuestParticipant:quest_participant):void

    var Objectives<native><epic_internal>:[]quest_objective

    var<private> CurrentStageIndex<native><epic_internal>:int = external {}

@experimental
state_machine_quest_objective<native><epic_internal> := class<epic_internal>(quest_objective):
    GetProgress<override><native><native_callable>()<reads>:message

    IsComplete<override><native><native_callable>()<reads><decides>:void

    OnJoin<override><native><native_callable>(QuestParticipant:quest_participant):void

    OnAbandon<override><native><native_callable>(QuestParticipant:quest_participant):void

    var (/UnrealEngine.com/Progression/state_machine_quest_objective:)StateMachine<native><epic_internal>:state_machine

    var CompletionStates<native><epic_internal>:[]state

    var<private> CurrentState<native><epic_internal>:?quest_objective_state = external {}

    UpdateCurrentState<native><final><epic_internal>():void

@experimental
timed_quest_objective<native><epic_internal> := class<epic_internal>(quest_objective):
    GetProgress<override><native><native_callable>()<reads>:message

    IsComplete<override><native><native_callable>()<reads><decides>:void

    OnJoin<override><native><native_callable>(QuestParticipant:quest_participant):void

    OnAbandon<override><native><native_callable>(QuestParticipant:quest_participant):void

    UpdateTimeRemaining<native><final><epic_internal>(DeltaSeconds:float)<transacts>:void

    var Objective<native><epic_internal>:quest_objective

    var TimeLimit<native><epic_internal>:float

    var<private> TimeRemaining<native><epic_internal>:float

    TimeExpiredEvent<native><final><epic_internal>:listenable(timed_quest_objective) = external {}

xp_entitlement<native><epic_internal> := class(ecosystem_entitlement):
    Consumable<override><final>:logic = external {}