using {/Verse.org/Native}
@available {MinUploadedAtFNVersion := 4110}
# Module import path: /UnrealEngine.com/Progression
(/UnrealEngine.com:)Progression<public> := module:
    using {/Verse.org/Presentation}
    using {/Verse.org/Assets}
    using {/Verse.org}
    @experimental
    # Standard quest that follows the "do x, get y" paradigm.
    # Auto-completion: when Objective.IsComplete() succeeds, calls Complete() automatically.
    # Auto-rewarding: on completion, rewards are granted to eligible participants
    # via GetRecipients() then GrantReward().
    basic_quest<native><public> := class<abstract>((/Verse.org:)Progression.quest, has_icon, has_description):
        # Replaces the progression model on a live quest. Auto-completes if the new objective is
        # already completed.
        SetObjective<native><final><public>(InObjective:quest_objective)<transacts>:void

        # Progression model for the quest.
        var<private> Objective<native><public>:quest_objective

        # Rewards granted to eligible participants on completion.
        var Rewards<native><public>:[]quest_reward = external {}

    @experimental
    # Abstract base class for all quest objectives.
    quest_objective<native><public> := class<abstract>(has_icon, has_description):
        # Returns a progress message (e.g. "3 / 10").
        GetProgress<native><native_callable><public>()<reads>:message

        # Determines which participants can contribute to this objective.
        # Override to customize contributor selection.
        # Default: all participants where Info.Contributes = true.
        GetContributors<native><native_callable><public>(Memberships:[](/Verse.org:)Progression.quest_membership)<reads>:[](/Verse.org:)Progression.quest_participant

        # Succeeds if this objective is currently complete.
        IsComplete<native><native_callable><public>()<reads><decides>:void

        # Signals ProgressEvent. Call from a subclass to notify progress subscribers.
        SignalProgressEvent<native><final><protected>()<transacts>:void

        # Signaled when this objective is considered complete.
        CompleteEvent<native><final><public>:listenable(quest_objective) = external {}

        # Signaled when this objective's progress changes. Payload: this objective.
        ProgressEvent<native><final><public>:listenable(quest_objective) = external {}

    @experimental
    # Returned when a reward cannot be granted.
    grant_quest_reward_error<native><public> := class:


    @experimental
    # Abstract base class for all quest rewards.
    quest_reward<native><public> := class<abstract>(has_icon, has_description):
        # Determines which participants should receive this reward.
        # Override to customize recipient selection.
        # Default: all participants where Info.Receives = true.
        GetRecipients<native><native_callable><public>(Memberships:[](/Verse.org:)Progression.quest_membership)<reads>:[](/Verse.org:)Progression.quest_participant

        # Grants this reward to the eligible participants.
        GrantReward<native><native_callable><public>(EligibleParticipants:[](/Verse.org:)Progression.quest_participant)<transacts>:result(void, []grant_quest_reward_error)

        # Signaled after this reward has been granted to recipients.
        GrantEvent<native><final><public>:listenable(tuple(quest_reward, [](/Verse.org:)Progression.quest_participant)) = external {}