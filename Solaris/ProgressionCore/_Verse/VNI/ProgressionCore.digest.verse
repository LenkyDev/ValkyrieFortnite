using {/Verse.org/Progression}
using {/Verse.org/Native}
using {/Fortnite.com/Marketplace}
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

@experimental
# Tracks numeric progress toward a required count.
# Complete when Progress >= RequiredCount.
progress_quest_objective<native><public> := class(quest_objective):
    # Returns progress in "X / Y" format.
    GetProgress<override><native><final>()<reads>:message

    # Succeeds if Progress >= RequiredCount.
    IsComplete<override><native><final>()<reads><decides>:void

    # Sets current progress. Clamped to [0, RequiredCount].
    SetProgress<native><final><public>(Amount:float)<transacts>:void

    # Sets the target count. Clamped to [1, MaxFloat].
    SetRequiredCount<native><final><public>(Amount:float)<transacts>:void

    # Current progress toward RequiredCount.
    var<private> Progress<native><public>:float = external {}

    # Target count for completion.
    var<private> RequiredCount<native><public>:float