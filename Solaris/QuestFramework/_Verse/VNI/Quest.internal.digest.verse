using {/Verse.org/Simulation}
using {/Verse.org/SceneGraph}
using {/Verse.org/Presentation}
using {/Verse.org/Assets}
using {/Verse.org/Native}
epic_quest_participant_component<native><epic_internal> := class<epic_internal>(quest_participant_component):
    OnBeginSimulation<override>():void = external {}

    TrackQuest<native><final><epic_internal>(Quest:quest)<transacts><decides>:void

    UntrackQuest<native><final><epic_internal>(Quest:quest)<transacts>:void

    ClearTrackedQuests<native><final><epic_internal>()<transacts>:void

    var<private> ObservedQuests<native><epic_internal>:[]quest = external {}

    var<private> TrackedQuests<native><epic_internal>:[]quest = external {}

quest_participant_info<native><epic_internal> := class<epic_internal>:
    var Contributes<native><epic_internal>:logic = external {}

    var Observes<native><epic_internal>:logic = external {}

    var Receives<native><epic_internal>:logic = external {}

quest_membership<native><epic_internal> := class<epic_internal>:
    Quest<native><epic_internal>:quest

    Participant<native><epic_internal>:quest_participant

    Info<native><epic_internal>:quest_participant_info

join_quest_error<native><epic_internal> := class<epic_internal>:


join_quest_invalid_state_error<native><epic_internal> := class<epic_internal>(join_quest_error):


join_quest_already_joined_error<native><epic_internal> := class<epic_internal>(join_quest_error):


join_quest_vetoed_error<native><epic_internal> := class<epic_internal>(join_quest_error):


abandon_quest_error<native><epic_internal> := class<epic_internal>:


abandon_quest_not_joined_error<native><epic_internal> := class<epic_internal>(abandon_quest_error):


abandon_quest_vetoed_error<native><epic_internal> := class<epic_internal>(abandon_quest_error):


add_quest_error<native><epic_internal> := class<epic_internal>:


add_quest_vetoed_error<native><epic_internal> := class<epic_internal>(add_quest_error):


remove_quest_error<native><epic_internal> := class<epic_internal>:


remove_quest_vetoed_error<native><epic_internal> := class<epic_internal>(remove_quest_error):


grant_quest_reward_error<native><epic_internal> := class<epic_internal>:


quest_state<native><epic_internal> := enum<open><persistable>:
    Inactive
    Active
    Completed

quest<native><epic_internal> := class<abstract><castable><unique><epic_internal>:
    Complete<native><final><epic_internal>()<transacts>:void

    Activate<native><final><epic_internal>()<transacts>:void

    Deactivate<native><final><epic_internal>()<transacts>:void

    Fail<native><final><epic_internal>()<transacts>:void

    OnActivate<native><epic_internal>():void

    OnDeactivate<native><epic_internal>():void

    @available {MinUploadedAtFNVersion := 4000}
    CanJoin<native><epic_internal>(QuestParticipant:quest_participant)<reads>:result(void, []join_quest_error)

    @available {MinUploadedAtFNVersion := 4000}
    CanAbandon<native><epic_internal>(QuestParticipant:quest_participant)<reads>:result(void, []abandon_quest_error)

    OnComplete<native><epic_internal>():void

    OnJoin<native><epic_internal>(QuestParticipant:quest_participant):void

    OnAbandon<native><epic_internal>(QuestParticipant:quest_participant):void

    CanAdd<native><epic_internal>(Manager:quest_manager_component)<reads><decides>:void

    CanRemove<native><epic_internal>(Manager:quest_manager_component)<reads><decides>:void

    OnAdd<native><epic_internal>(Manager:quest_manager_component):void

    OnRemove<native><epic_internal>(Manager:quest_manager_component):void

    GetState<native><final><epic_internal>()<reads>:quest_state

    IsComplete<native><final><epic_internal>()<reads><decides>:void

    IsActive<native><final><epic_internal>()<reads><decides>:void

    GetCompletionContext<native><final><epic_internal>()<reads>:?quest_completion_context

    var<private> OwningCollection<native><epic_internal>:?quest_collection = external {}

    var<private> OwningManager<native><epic_internal>:?quest_manager_component = external {}

    JoinEvent<native><final><epic_internal>:listenable(quest_membership) = external {}

    AbandonEvent<native><final><epic_internal>:listenable(quest_membership) = external {}

    CompleteEvent<native><final><epic_internal>:listenable(quest) = external {}

    StateChangedEvent<native><final><epic_internal>:listenable(tuple(quest, quest_state, quest_state)) = external {}

@available {MinUploadedAtFNVersion := 4000}
MakeJoinQuestSuccessResult<native_callable><epic_internal>():result(comparable, []join_quest_error) = external {}

@available {MinUploadedAtFNVersion := 4000}
MakeJoinQuestErrorResult<native_callable><epic_internal>():result(void, []join_quest_error) = external {}

@available {MinUploadedAtFNVersion := 4000}
MakeAbandonQuestSuccessResult<native_callable><epic_internal>():result(comparable, []abandon_quest_error) = external {}

@available {MinUploadedAtFNVersion := 4000}
MakeAbandonQuestErrorResult<native_callable><epic_internal>():result(void, []abandon_quest_error) = external {}

@available {MinUploadedAtFNVersion := 4000}
MakeRevokeQuestSuccessResult<native_callable><epic_internal>():result(comparable, []remove_quest_error) = external {}

@available {MinUploadedAtFNVersion := 4000}
MakeRevokeQuestErrorResult<native_callable><epic_internal>():result(void, []remove_quest_error) = external {}

quest_bundle<native><epic_internal> := class<unique><epic_internal>(has_icon, has_description):
    GetCompletedCount<native><final><epic_internal>()<reads>:int

    GetProgress<native><final><epic_internal>()<reads>:message

    IsComplete<native><final><epic_internal>()<reads><decides>:void

    var Quests<native><epic_internal>:[]quest

quest_collection<native><epic_internal> := class<unique><epic_internal>:
    @available {MinUploadedAtFNVersion := 4000}
    JoinQuest<native><final><epic_internal>(Quest:quest, Participant:quest_participant, Info:quest_participant_info)<transacts>:result(void, []join_quest_error)

    @available {MinUploadedAtFNVersion := 4000}
    AbandonQuest<native><final><epic_internal>(Quest:quest, Participant:quest_participant)<transacts>:result(void, []abandon_quest_error)

    OnComplete<epic_internal>(Quest:quest):void = external {}

    JoinEvent<native><final><epic_internal>:listenable(quest_membership) = external {}

    AbandonEvent<native><final><epic_internal>:listenable(quest_membership) = external {}

    CompleteEvent<native><final><epic_internal>:listenable(quest) = external {}

    ActivateEvent<native><final><epic_internal>:listenable(quest) = external {}

    DeactivateEvent<native><final><epic_internal>:listenable(quest) = external {}

    var<private> Quests<native><epic_internal>:[quest][]quest_membership = external {}

    var<private> Participants<native><epic_internal>:[quest_participant][]quest_membership = external {}

quest_completion_context<native><epic_internal> := class:


failed_quest_completion<native><epic_internal> := class(quest_completion_context):


quest_granter_component<native><epic_internal> := class<final_super><epic_internal>(component):
    CanGrant<native><epic_internal>(Manager:quest_manager_component)<reads><decides>:void

    OnGrant<native><epic_internal>(Manager:quest_manager_component, Quest:quest):void

    GrantQuests<native><final><epic_internal>(Manager:quest_manager_component)<transacts>:[]quest

    QuestsToGrant<native><epic_internal>:[]subtype(quest)

    GrantEvent<native><final><epic_internal>:listenable(quest) = external {}

quest_manager_component<native><epic_internal> := class<final_super><epic_internal>(component):
    @available {MinUploadedAtFNVersion := 4000}
    GrantQuest<native><epic_internal>(quest_type:subtype(quest))<transacts>:result(quest_type, []add_quest_error)

    @available {MinUploadedAtFNVersion := 4000}
    RevokeQuest<native><epic_internal>(Quest:quest)<transacts>:result(void, []remove_quest_error)

    @available {MinUploadedAtFNVersion := 4000}
    JoinQuest<native><epic_internal>(Quest:quest, Participant:quest_participant, Info:quest_participant_info)<transacts>:result(void, []join_quest_error)

    @available {MinUploadedAtFNVersion := 4000}
    AbandonQuest<native><epic_internal>(Quest:quest, Participant:quest_participant)<transacts>:result(void, []abandon_quest_error)

    AddQuest<native><epic_internal>(Quest:quest):void

    RemoveQuest<native><epic_internal>(Quest:quest):void

    CanAdd<native><epic_internal>(Quest:quest)<reads><decides>:void

    CanRemove<native><epic_internal>(Quest:quest)<reads><decides>:void

    OnAdd<native><epic_internal>(Quest:quest):void

    OnRemove<native><epic_internal>(Quest:quest):void

    Collection<native><epic_internal>:quest_collection

    var<private> Quests<native><epic_internal>:[]quest = external {}

    GrantEvent<native><final><epic_internal>:listenable(quest) = external {}

    RevokeEvent<native><final><epic_internal>:listenable(quest) = external {}

quest_participant<native><epic_internal> := class<abstract><unique><epic_internal>:
    @available {MinUploadedAtFNVersion := 4000}
    CanJoin<native><epic_internal>(Quest:quest)<reads>:result(void, []join_quest_error)

    @available {MinUploadedAtFNVersion := 4000}
    CanAbandon<native><epic_internal>(Quest:quest)<reads>:result(void, []abandon_quest_error)

    OnJoin<native><epic_internal>(Quest:quest):void

    OnAbandon<native><epic_internal>(Quest:quest):void

    OnActivate<native><epic_internal>(Quest:quest):void

    OnDeactivate<native><epic_internal>(Quest:quest):void

    OnComplete<native><epic_internal>(Quest:quest):void

    GetParticipatingQuests<native><final><epic_internal>()<reads>:[]quest

    var<private> Memberships<native><epic_internal>:[]quest_membership = external {}

    JoinEvent<native><final><epic_internal>:listenable(quest_membership) = external {}

    AbandonEvent<native><final><epic_internal>:listenable(quest_membership) = external {}

    CompleteEvent<native><final><epic_internal>:listenable(quest_membership) = external {}

agent_quest_participant<native><epic_internal> := class<final>(quest_participant):
    Agent<native><epic_internal>:agent

quest_participant_component<native><epic_internal> := class<final_super><epic_internal>(component):
    Participant<native><epic_internal>:agent_quest_participant