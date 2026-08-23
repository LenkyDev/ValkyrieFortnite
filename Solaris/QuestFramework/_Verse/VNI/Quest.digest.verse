# Verse path: /Verse.org
using {/Verse.org/Native}
@available {MinUploadedAtFNVersion := 4110}
# Module import path: /Verse.org/Progression
Progression<public> := module:
    using {/Verse.org/Simulation}
    using {/Verse.org/AgentGroup}
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

        # The participation info describing this participant's role.
        Info<native><public>:quest_participant_info

    @experimental
    # Returned when a participant cannot join a quest.
    join_quest_error<native><public> := class:


    @experimental
    # Returned when a participant cannot abandon a quest.
    abandon_quest_error<native><public> := class:


    @experimental
    # A completable goal.
    # Call Complete() to mark the quest as done and fire CompleteEvent.
    quest<native><public> := class<abstract><castable><unique>:
        # Marks this quest as completed. Fires CompleteEvent.
        # Idempotent — no-op if already completed.
        Complete<native><final><public>()<transacts>:void

        # Succeeds if this quest is completed.
        IsComplete<native><final><public>()<decides><reads>:void

        # Signaled when a participant joins this quest.
        JoinEvent<native><final><public>:listenable(quest_membership) = external {}

        # Signaled when a participant abandons this quest.
        AbandonEvent<native><final><public>:listenable(quest_membership) = external {}

        # Signaled when this quest completes.
        CompleteEvent<native><final><public>:listenable(quest) = external {}

    @experimental
    # The source of truth for quest participation.
    quest_collection<native><public> := class<unique>:
        # Adds 'Participant' to 'Quest' with the given participation info.
        JoinQuest<native><final><public>(Quest:quest, Participant:quest_participant, Info:quest_participant_info)<transacts>:result(void, []join_quest_error)

        # Removes 'Participant' from 'Quest'.
        AbandonQuest<native><final><public>(Quest:quest, Participant:quest_participant)<transacts>:result(void, []abandon_quest_error)

        # Signaled when a participant joins any quest in this collection.
        JoinEvent<native><final><public>:listenable(quest_membership) = external {}

        # Signaled when a participant abandons any quest in this collection.
        AbandonEvent<native><final><public>:listenable(quest_membership) = external {}

        # Signaled when any quest in this collection completes.
        CompleteEvent<native><final><public>:listenable(quest) = external {}

        # All memberships indexed by quest.
        var<private> Quests<native><public>:[quest][]quest_membership = external {}

        # All memberships indexed by participant.
        var<private> Participants<native><public>:[quest_participant][]quest_membership = external {}

    @experimental
    # Abstract base class for quest participants.
    quest_participant<native><public> := class<abstract><unique>:
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