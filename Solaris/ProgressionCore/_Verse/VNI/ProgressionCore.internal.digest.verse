using {/Verse.org/StateMachine}
using {/Verse.org/Native}
using {/Fortnite.com/Marketplace}
using {/Verse.org/SceneGraph}
using {/Verse.org/Progression}
composite_quest_objective<native><epic_internal> := class<epic_internal>(quest_objective):
    GetProgress<override><native>()<reads>:message

    IsComplete<override><native>()<reads><decides>:void

    OnActivate<override><native>():void

    var Objectives<native><epic_internal>:[]quest_objective = external {}

    var<private> RequiredCount<native><epic_internal>:int = external {}

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

ecosystem_entitlement<native><epic_internal> := class<abstract>(entitlement):
    PaidRandomItem<override><final>:logic = external {}

    PaidArea<override><final>:logic = external {}

entitlement_quest_reward<native><epic_internal> := class<epic_internal>(quest_reward):
    var Entitlement<native><epic_internal>:subtype(entitlement)

    var Quantity<native><epic_internal>:int = external {}

    @available {MinUploadedAtFNVersion := 4000}
    GrantReward<override><native>(EligibleParticipants:[]quest_participant)<transacts>:result(void, []grant_quest_reward_error)

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

progress_quest_objective<native><epic_internal> := class<epic_internal>(quest_objective):
    GetProgress<override><native>()<reads>:message

    IsComplete<override><native>()<reads><decides>:void

    GetProgressCount<native><final><epic_internal>():float

    AddProgress<native><final><epic_internal>(Amount:float)<transacts>:void

    SetProgress<native><final><epic_internal>(Amount:float)<transacts>:void

    SetRequiredCount<native><final><epic_internal>(Amount:float)<transacts>:void

    var<private> Progress<native><epic_internal>:float

    var<private> RequiredCount<native><epic_internal>:float

quest_objective_state<native><epic_internal> := class<final_super><epic_internal>(state):
    var Objective<native><epic_internal>:quest_objective

    OnEnter<override><native>():void

    OnExit<override><native>():void

sequential_quest_objective<native><epic_internal> := class<epic_internal>(quest_objective):
    GetProgress<override><native>()<reads>:message

    IsComplete<override><native>()<reads><decides>:void

    OnActivate<override><native>():void

    var Objectives<native><epic_internal>:[]quest_objective

    var<private> CurrentStageIndex<native><epic_internal>:int = external {}

state_machine_quest_objective<native><epic_internal> := class<epic_internal>(quest_objective):
    GetProgress<override><native>()<reads>:message

    IsComplete<override><native>()<reads><decides>:void

    var (/UnrealEngine.com/Progression/state_machine_quest_objective:)StateMachine<native><epic_internal>:state_machine

    var CompletionStates<native><epic_internal>:[]state

    var<private> CurrentState<native><epic_internal>:?quest_objective_state = external {}

    UpdateCurrentState<native><epic_internal>():void

timed_quest_objective<native><epic_internal> := class<epic_internal>(quest_objective):
    GetProgress<override><native>()<reads>:message

    IsComplete<override><native>()<reads><decides>:void

    UpdateTimeRemaining<native><epic_internal>(DeltaSeconds:float)<transacts>:void

    var Objective<native><epic_internal>:quest_objective

    var TimeLimit<native><epic_internal>:float

    var<private> TimeRemaining<native><epic_internal>:float

    TimeExpiredEvent<native><final><epic_internal>:listenable(timed_quest_objective) = external {}

xp_entitlement<native><epic_internal> := class(ecosystem_entitlement):
    Consumable<override><final>:logic = external {}