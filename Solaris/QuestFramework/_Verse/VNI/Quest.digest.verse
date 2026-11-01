# Verse path: /Verse.org
using {/Verse.org/Native}
@available {MinUploadedAtFNVersion := 4300}
# Module import path: /Verse.org/Progression
Progression<public> := module:
    using {/Verse.org/Simulation}
    using {/Verse.org/AgentGroup}
    # Describes how a participant relates to a quest.
    quest_participant_info<native><public> := class<castable>(member_info_interface):
        # Sets `Contribute`, enrolling or withdrawing this participant's contribution on the quest that holds this info.
        SetContribute<final><native><public>(InContribute:logic)<transacts>:void

        # Sets `Observe`, enrolling or withdrawing this participant as an observer of the quest that holds this info.
        SetObserve<final><native><public>(InObserve:logic)<transacts>:void

        # Sets `Receive`, enrolling or withdrawing this participant as a reward recipient of the quest that holds this info.
        SetReceive<final><public>(InReceive:logic)<transacts>:void = external {}

        # Whether this participant may make progress on the quest; `true` by default.
        # Write it with `SetContribute`.
        var<private> Contribute<native><public>:logic = external {}

        # Whether this participant may observe quest state; `true` by default.
        # Write it with `SetObserve`.
        var<private> Observe<native><public>:logic = external {}

        # Whether this participant may receive rewards; `true` by default.
        # Write it with `SetReceive`.
        var<private> Receive<native><public>:logic = external {}

    # Record binding a quest to a participant with participation info.
    quest_membership<native><public> := class<final><epic_internal>:
        # The quest this membership belongs to.
        Quest<native><public>:quest

        # The participant in this membership.
        Participant<native><public>:quest_participant

        # This membership's live participation info.
        Info<native><public>:quest_participant_info

    # Returned when a quest membership call cannot be honored.
    quest_error<native><public> := class<abstract><computes><castable>:


    # A completable goal with dynamic participation and terminal completion state. Participants join and abandon over time, each with its own `Contribute`, `Observe` and `Receive` info, and the quest completes once.
    #   * A mission system where every player in the game works toward one shared goal.
    #   * A tutorial quest line that guides a player through the mechanics of your game, one quest after another.
    #   * An achievement system where each player owns a quest and progresses toward it alone.
    quest<native><public> := class<abstract>(objective):
        # Adds `Participant` with `Info` to this quest and returns the new membership; a refusal returns an error, and a `CanJoin` veto returns that guard's own errors.
        (/Verse.org/Progression/quest:)Join<native><final><public>(Participant:quest_participant, Info:quest_participant_info)<transacts>:result(quest_membership, []quest_error)

        # Removes `Participant` from this quest; a refusal returns an error, and a `CanAbandon` veto returns that guard's own errors.
        Abandon<native><final><public>(Participant:quest_participant)<transacts>:result(void, []quest_error)

        # Moves this quest and its memberships into `InCollection`; no `JoinEvent` or `AbandonEvent` fires.
        SetCollection<native><final><public>(InCollection:quest_collection)<transacts>:void

        # Succeeds if `Participant` may join this quest under `Info`; the default succeeds.
        # Veto by returning errors.
        CanJoin<native><native_callable><public>(Participant:quest_participant, Info:quest_participant_info)<reads>:result(void, []quest_error)

        # Succeeds if `Participant` may abandon this quest; `Info` is the participation the dropped membership held, and the default succeeds.
        # Veto by returning errors.
        CanAbandon<native><native_callable><public>(Participant:quest_participant, Info:quest_participant_info)<reads>:result(void, []quest_error)

        # Called when a participant joins this quest.
        OnJoin<native><native_callable><protected>(Participant:quest_participant, Info:quest_participant_info)<transacts>:void

        # Called when a participant abandons this quest.
        OnAbandon<native><native_callable><protected>(Participant:quest_participant, Info:quest_participant_info)<transacts>:void

        # Called when this quest completes.
        OnComplete<override><native><native_callable>(Reason:complete_objective_reason)<transacts>:void

        # The collection this quest belongs to; an archetype must name one.
        # Write it with `SetCollection`.
        var<private> Collection<native><public>:quest_collection

        # Signaled when a participant joins this quest; sends the new `quest_membership`.
        JoinEvent<native><final><public>:listenable(quest_membership) = external {}

        # Signaled when a participant abandons this quest; sends the removed `quest_membership`.
        AbandonEvent<native><final><public>:listenable(quest_membership) = external {}

    # Delivered by `quest_collection.CompleteEvent`.
    quest_complete_event_data<native><public> := struct<epic_internal>:
        # The quest that completed.
        Quest<native><public>:quest

        # Why it completed.
        Reason<native><public>:complete_objective_reason

    # The source of truth for quest participation. Home quests in one collection per scope: per player, per team or shared by the whole session.
    #   * Per player: each player's own quest log and achievements.
    #   * Per team: a team's missions, joined by a team participant.
    #   * Shared: one collection every participant joins for a server-wide goal.
    quest_collection<native><public> := class<unique>:
        # Called when a participant joins a quest in this collection.
        # Not called when `SetCollection` moves a quest in.
        OnJoin<native><native_callable><protected>(Membership:quest_membership)<transacts>:void

        # Called when a participant abandons a quest in this collection.
        # Not called when `SetCollection` moves a quest out.
        OnAbandon<native><native_callable><protected>(Membership:quest_membership)<transacts>:void

        # Called once when a quest in this collection completes.
        OnComplete<native><native_callable><protected>(Quest:quest, Reason:complete_objective_reason)<transacts>:void

        # Signaled when a participant joins any quest in this collection; sends the new `quest_membership`.
        JoinEvent<native><final><public>:listenable(quest_membership) = external {}

        # Signaled when a participant abandons any quest in this collection; sends the removed `quest_membership`.
        AbandonEvent<native><final><public>:listenable(quest_membership) = external {}

        # Signaled once when a quest in this collection completes.
        CompleteEvent<native><final><public>:listenable(quest_complete_event_data) = external {}

        # All memberships indexed by quest.
        var<private> Quests<native><public>:[quest][]quest_membership = external {}

        # All memberships indexed by participant.
        var<private> Participants<native><public>:[quest_participant][]quest_membership = external {}

    # Delivered by `quest_participant.CompleteEvent`.
    quest_membership_complete_event_data<native><public> := struct<epic_internal>:
        # This participant's membership in the quest that completed.
        Membership<native><public>:quest_membership

        # Why the quest completed.
        Reason<native><public>:complete_objective_reason

    # An identity that joins quests and holds memberships. `agent_quest_participant` is a single agent; subclass `quest_participant` for any other identity, such as a team, and enroll its agents from `OnJoin` and `OnAbandon`.
    #   * A player: one participant per player, each owning its own quests.
    #   * A team: one participant for the team, so its members share a single membership.
    #   * The match: one participant every player in the game contributes to.
    quest_participant<native><public> := class<abstract><unique><castable>:
        # Called after this participant has joined `Quest`.
        OnJoin<native><native_callable><protected>(Quest:quest, Info:quest_participant_info)<transacts>:void

        # Called as this participant abandons `Quest`, before the membership is removed; `Info` is the participation the dropped membership held.
        OnAbandon<native><native_callable><protected>(Quest:quest, Info:quest_participant_info)<transacts>:void

        # Called after a quest this participant is in has completed.
        OnComplete<native><native_callable><protected>(Quest:quest, Info:quest_participant_info, Reason:complete_objective_reason)<transacts>:void

        # Signaled when this participant joins a quest; sends the new `quest_membership`.
        JoinEvent<native><final><public>:listenable(quest_membership) = external {}

        # Signaled when this participant abandons a quest; sends the removed `quest_membership`.
        AbandonEvent<native><final><public>:listenable(quest_membership) = external {}

        # Signaled when a quest this participant is in completes.
        CompleteEvent<native><final><public>:listenable(quest_membership_complete_event_data) = external {}

    # A quest participant backed by an agent.
    agent_quest_participant<native><public> := class(quest_participant):
        # The agent this participant represents.
        Agent<native><public>:agent