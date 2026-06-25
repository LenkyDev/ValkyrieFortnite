using {/Verse.org/Simulation}
using {/Verse.org/SceneGraph}
using {/Verse.org/Presentation}
using {/Verse.org/Assets}
using {/Verse.org/Native}
using {/Verse.org/AgentGroup}
@experimental
epic_quest_participant_component<native><epic_internal> := class<epic_internal>(quest_participant_component):
    OnBeginSimulation<override>():void = external {}

    TrackQuest<native><final><epic_internal>(Quest:quest)<transacts><decides>:void

    UntrackQuest<native><final><epic_internal>(Quest:quest)<transacts>:void

    ClearTrackedQuests<native><final><epic_internal>()<transacts>:void

    var<private> ObservedQuests<native><epic_internal>:[]quest = external {}

    var<private> TrackedQuests<native><epic_internal>:[]quest = external {}

@available {MinUploadedAtFNVersion := 4000}
@experimental
# Describes how a participant relates to a quest.
quest_participant_info<native><public> := class(member_info_interface):
    # Can this participant make progress on the quest.
    var Contributes<native><public>:logic = external {}

    # Can this participant observe quest state.
    var Observes<native><public>:logic = external {}

    # Can this participant receive rewards on quest completion.
    var Receives<native><public>:logic = external {}

@experimental
# Record binding a quest to a participant with participation info.
quest_membership<native><public> := class:
    # The quest this membership belongs to.
    Quest<native><public>:quest

    # The participant in this membership.
    Participant<native><public>:quest_participant

    @available {MinUploadedAtFNVersion := 4000}
    # The participation info describing this participant's role.
    Info<native><public>:quest_participant_info

@experimental
# Returned when a participant cannot join a quest.
join_quest_error<native><public> := class:


@experimental
join_quest_invalid_state_error<native><epic_internal> := class<epic_internal>(join_quest_error):


@experimental
join_quest_already_joined_error<native><epic_internal> := class<epic_internal>(join_quest_error):


@experimental
join_quest_vetoed_error<native><epic_internal> := class<epic_internal>(join_quest_error):


@experimental
# Returned when a participant cannot abandon a quest.
abandon_quest_error<native><public> := class:


@experimental
abandon_quest_not_joined_error<native><epic_internal> := class<epic_internal>(abandon_quest_error):


@experimental
abandon_quest_vetoed_error<native><epic_internal> := class<epic_internal>(abandon_quest_error):


@experimental
add_quest_error<native><epic_internal> := class<epic_internal>:


@experimental
add_quest_vetoed_error<native><epic_internal> := class<epic_internal>(add_quest_error):


@experimental
remove_quest_error<native><epic_internal> := class<epic_internal>:


@experimental
remove_quest_vetoed_error<native><epic_internal> := class<epic_internal>(remove_quest_error):


@experimental
quest_state<native><epic_internal> := enum<open><persistable>:
    Inactive
    Active
    Completed

@experimental
# A completable goal.
# Call Complete() to mark the quest as done and fire CompleteEvent.
quest<native><public> := class<abstract><castable><unique>:
    # Marks this quest as completed. Fires CompleteEvent.
    # Idempotent — no-op if already completed.
    Complete<native><final><public>()<transacts>:void

    Activate<native><final><epic_internal>()<transacts>:void

    Deactivate<native><final><epic_internal>()<transacts>:void

    Fail<native><final><epic_internal>()<transacts>:void

    OnActivate<native><native_callable><epic_internal>():void

    OnDeactivate<native><native_callable><epic_internal>():void

    @available {MinUploadedAtFNVersion := 4000}
    CanJoin<native><native_callable><epic_internal>(QuestParticipant:quest_participant)<reads>:result(void, []join_quest_error)

    @available {MinUploadedAtFNVersion := 4000}
    CanAbandon<native><native_callable><epic_internal>(QuestParticipant:quest_participant)<reads>:result(void, []abandon_quest_error)

    OnComplete<native><native_callable><epic_internal>():void

    OnJoin<native><native_callable><epic_internal>(QuestParticipant:quest_participant):void

    OnAbandon<native><native_callable><epic_internal>(QuestParticipant:quest_participant):void

    CanAdd<native><native_callable><epic_internal>(Manager:quest_manager_component)<reads><decides>:void

    CanRemove<native><native_callable><epic_internal>(Manager:quest_manager_component)<reads><decides>:void

    OnAdd<native><native_callable><epic_internal>(Manager:quest_manager_component):void

    OnRemove<native><native_callable><epic_internal>(Manager:quest_manager_component):void

    GetState<native><final><epic_internal>()<reads>:quest_state

    # Succeeds if this quest is completed.
    IsComplete<native><final><public>()<reads><decides>:void

    IsActive<native><final><epic_internal>()<reads><decides>:void

    GetCompletionContext<native><final><epic_internal>()<reads>:?quest_completion_context

    var<private> OwningCollection<native><epic_internal>:?quest_collection = external {}

    var<private> OwningManager<native><epic_internal>:?quest_manager_component = external {}

    # Signaled when a participant joins this quest.
    JoinEvent<native><final><public>:listenable(quest_membership) = external {}

    # Signaled when a participant abandons this quest.
    AbandonEvent<native><final><public>:listenable(quest_membership) = external {}

    # Signaled when this quest completes.
    CompleteEvent<native><final><public>:listenable(quest) = external {}

    StateChangedEvent<native><final><epic_internal>:listenable(tuple(quest, quest_state, quest_state)) = external {}

@available {MinUploadedAtFNVersion := 4000}
@experimental
MakeJoinQuestSuccessResult<native_callable><epic_internal>():result(comparable, []join_quest_error) = external {}

@available {MinUploadedAtFNVersion := 4000}
@experimental
MakeJoinQuestErrorResult<native_callable><epic_internal>():result(void, []join_quest_error) = external {}

@available {MinUploadedAtFNVersion := 4000}
@experimental
MakeAbandonQuestSuccessResult<native_callable><epic_internal>():result(comparable, []abandon_quest_error) = external {}

@available {MinUploadedAtFNVersion := 4000}
@experimental
MakeAbandonQuestErrorResult<native_callable><epic_internal>():result(void, []abandon_quest_error) = external {}

@available {MinUploadedAtFNVersion := 4000}
@experimental
MakeRevokeQuestSuccessResult<native_callable><epic_internal>():result(comparable, []remove_quest_error) = external {}

@available {MinUploadedAtFNVersion := 4000}
@experimental
MakeRevokeQuestErrorResult<native_callable><epic_internal>():result(void, []remove_quest_error) = external {}

@experimental
quest_bundle<native><epic_internal> := class<unique><epic_internal>(has_icon, has_description):
    GetCompletedCount<native><final><epic_internal>()<reads>:int

    GetProgress<native><final><epic_internal>()<reads>:message

    IsComplete<native><final><epic_internal>()<reads><decides>:void

    var Quests<native><epic_internal>:[]quest

@experimental
# The source of truth for quest participation.
quest_collection<native><public> := class<unique>:
    @available {MinUploadedAtFNVersion := 4000}
    # Adds 'Participant' to 'Quest' with the given participation info.
    JoinQuest<native><final><public>(Quest:quest, Participant:quest_participant, Info:quest_participant_info)<transacts>:result(void, []join_quest_error)

    @available {MinUploadedAtFNVersion := 4000}
    # Removes 'Participant' from 'Quest'.
    AbandonQuest<native><final><public>(Quest:quest, Participant:quest_participant)<transacts>:result(void, []abandon_quest_error)

    OnComplete<native><native_callable><epic_internal>(Quest:quest):void

    # Signaled when a participant joins any quest in this collection.
    JoinEvent<native><final><public>:listenable(quest_membership) = external {}

    # Signaled when a participant abandons any quest in this collection.
    AbandonEvent<native><final><public>:listenable(quest_membership) = external {}

    # Signaled when any quest in this collection completes.
    CompleteEvent<native><final><public>:listenable(quest) = external {}

    ActivateEvent<native><final><epic_internal>:listenable(quest) = external {}

    DeactivateEvent<native><final><epic_internal>:listenable(quest) = external {}

    # All memberships indexed by quest.
    var<private> Quests<native><public>:[quest][]quest_membership = external {}

    # All memberships indexed by participant.
    var<private> Participants<native><public>:[quest_participant][]quest_membership = external {}

@experimental
quest_completion_context<native><epic_internal> := class:


@experimental
failed_quest_completion<native><epic_internal> := class(quest_completion_context):


@experimental
quest_granter_component<native><epic_internal> := class<final_super><epic_internal>(component):
    CanGrant<native><native_callable><epic_internal>(Manager:quest_manager_component)<reads><decides>:void

    OnGrant<native><native_callable><epic_internal>(Manager:quest_manager_component, Quest:quest):void

    GrantQuests<native><final><epic_internal>(Manager:quest_manager_component)<transacts>:[]quest

    QuestsToGrant<native><epic_internal>:[]subtype(quest)

    GrantEvent<native><final><epic_internal>:listenable(quest) = external {}

@experimental
quest_manager_component<native><epic_internal> := class<final_super><epic_internal>(component):
    @available {MinUploadedAtFNVersion := 4000}
    GrantQuest<native><native_callable><epic_internal>(quest_type:subtype(quest))<transacts>:result(quest_type, []add_quest_error)

    @available {MinUploadedAtFNVersion := 4000}
    RevokeQuest<native><native_callable><epic_internal>(Quest:quest)<transacts>:result(void, []remove_quest_error)

    @available {MinUploadedAtFNVersion := 4000}
    JoinQuest<native><native_callable><epic_internal>(Quest:quest, Participant:quest_participant, Info:quest_participant_info)<transacts>:result(void, []join_quest_error)

    @available {MinUploadedAtFNVersion := 4000}
    AbandonQuest<native><native_callable><epic_internal>(Quest:quest, Participant:quest_participant)<transacts>:result(void, []abandon_quest_error)

    AddQuest<native><native_callable><epic_internal>(Quest:quest):void

    RemoveQuest<native><native_callable><epic_internal>(Quest:quest):void

    CanAdd<native><native_callable><epic_internal>(Quest:quest)<reads><decides>:void

    CanRemove<native><native_callable><epic_internal>(Quest:quest)<reads><decides>:void

    OnAdd<native><native_callable><epic_internal>(Quest:quest):void

    OnRemove<native><native_callable><epic_internal>(Quest:quest):void

    Collection<native><epic_internal>:quest_collection

    var<private> Quests<native><epic_internal>:[]quest = external {}

    GrantEvent<native><final><epic_internal>:listenable(quest) = external {}

    RevokeEvent<native><final><epic_internal>:listenable(quest) = external {}

@experimental
# Abstract base class for quest participants.
quest_participant<native><public> := class<abstract><unique>:
    @available {MinUploadedAtFNVersion := 4000}
    CanJoin<native><native_callable><epic_internal>(Quest:quest)<reads>:result(void, []join_quest_error)

    @available {MinUploadedAtFNVersion := 4000}
    CanAbandon<native><native_callable><epic_internal>(Quest:quest)<reads>:result(void, []abandon_quest_error)

    OnJoin<native><native_callable><epic_internal>(Quest:quest):void

    OnAbandon<native><native_callable><epic_internal>(Quest:quest):void

    OnActivate<native><native_callable><epic_internal>(Quest:quest):void

    OnDeactivate<native><native_callable><epic_internal>(Quest:quest):void

    OnComplete<native><native_callable><epic_internal>(Quest:quest):void

    GetParticipatingQuests<native><final><epic_internal>()<reads>:[]quest

    var<private> Memberships<native><epic_internal>:[]quest_membership = external {}

    # Signaled when this participant joins a quest.
    JoinEvent<native><final><public>:listenable(quest_membership) = external {}

    # Signaled when this participant abandons a quest.
    AbandonEvent<native><final><public>:listenable(quest_membership) = external {}

    # Signaled when a quest this participant is in completes.
    CompleteEvent<native><final><public>:listenable(quest_membership) = external {}

@experimental
# A quest participant backed by an agent (player, NPC, AI, etc.).
agent_quest_participant<native><public> := class<final>(quest_participant):
    # The agent this participant represents.
    Agent<native><public>:agent

@experimental
quest_participant_component<native><epic_internal> := class<final_super><epic_internal>(component):
    Participant<native><epic_internal>:agent_quest_participant