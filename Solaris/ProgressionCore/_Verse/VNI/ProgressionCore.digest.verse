# Verse path: /UnrealEngine.com
using {/Verse.org/Native}
@available {MinUploadedAtFNVersion := 4300}
# Module import path: /UnrealEngine.com/Progression
(/UnrealEngine.com:)Progression<public> := module:
    using {/Verse.org}
    using {/UnrealEngine.com/Marketplace}
    # Grants an entitlement to each eligible participant.
    entitlement_quest_reward<native><public> := class(quest_reward):
        # The entitlement type to grant.
        Entitlement<native><public>:concrete_subtype(entitlement)

        # Quantity per participant; `1` by default, not clamped or validated.
        Quantity<native><public>:int = external {}

        # Skips memberships whose participant is not a player agent.
        OnGrant<override><native><final>(Memberships:[](/Verse.org:)Progression.quest_membership)<transacts>:void

    # Tracks numeric progress toward a required threshold; complete when `Progress >= RequiredProgress`.
    # A commanded `Complete()` succeeds at any progress and does not advance it.
    progress_objective<native><public> := class((/Verse.org:)Progression.objective):
        # Returns progress in `"X / Y"` format.
        GetProgress<override><native><final>()<reads>:message

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