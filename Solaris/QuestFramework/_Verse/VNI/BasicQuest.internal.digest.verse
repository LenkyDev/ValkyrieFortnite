# Verse path: /UnrealEngine.com
using {/Verse.org/Native}
@available {MinUploadedAtFNVersion := 4300}
# Module import path: /UnrealEngine.com/Progression
(/UnrealEngine.com:)Progression<public> := module:
    using {/Verse.org/Presentation}
    using {/Verse.org/Assets}
    using {/Verse.org/Simulation}
    using {/Verse.org/SceneGraph}
    using {/Verse.org}
    # A quest that auto-completes when its `Objective` is or becomes `Complete`, and grants its `Rewards` once over the quest's live memberships on a succeeding completion.
    # Represents the "Do X, Get Y" paradigm for goal setting: for example, pick up 5 apples, where each apple picked up adds progress, and on completion a reward is distributed to the participants set to receive.
    basic_quest<native><public> := class<abstract>((/Verse.org:)Progression.quest, (/Verse.org:)Progression.has_objective, has_quest_rewards):
        # Succeeds if this quest may be activated: this quest's own errors concatenated with the inner `Objective`'s `CanActivate` errors.
        CanActivate<override><native><native_callable>()<reads>:result(void, [](/Verse.org:)Progression.objective_error)

        # Succeeds if this quest may be deactivated: this quest's own errors concatenated with the inner `Objective`'s `CanDeactivate` errors.
        CanDeactivate<override><native><native_callable>()<reads>:result(void, [](/Verse.org:)Progression.objective_error)

        # Succeeds if this quest may be completed: this quest's own errors concatenated with the inner `Objective`'s `CanComplete` errors.
        CanComplete<override><native><native_callable>(Reason:(/Verse.org:)Progression.complete_objective_reason)<reads>:result(void, [](/Verse.org:)Progression.objective_error)

        # Called when this quest activates; propagates the activation to the `Objective`.
        OnActivate<override><native><native_callable>()<transacts>:void

        # Called when this quest deactivates; propagates to the `Objective`.
        OnDeactivate<override><native><native_callable>()<transacts>:void

        # Called when this quest completes; grants `Rewards` only for a `succeed_objective_reason`.
        OnComplete<override><native><native_callable>(Reason:(/Verse.org:)Progression.complete_objective_reason)<transacts>:void

        # Called when a participant joins this quest; enrolls `agent_quest_participant` memberships as `Objective` contributors when `Info` has `Contribute` and that `Objective` tracks them.
        OnJoin<override><native><native_callable>(Participant:(/Verse.org:)Progression.quest_participant, Info:(/Verse.org:)Progression.quest_participant_info)<transacts>:void

        # Called when a participant abandons this quest; withdraws an `agent_quest_participant` membership's `Objective` contribution, mirroring `OnJoin`.
        OnAbandon<override><native><native_callable>(Participant:(/Verse.org:)Progression.quest_participant, Info:(/Verse.org:)Progression.quest_participant_info)<transacts>:void

        # Writes `Objective`, moves the contributing agents across and activates it if this quest is still running; completes this quest if the new objective is already complete.
        SetObjective<override><native><final>(InObjective:(/Verse.org:)Progression.objective)<transacts>:void

        # Writes `Rewards` and refreshes what this quest shows in the quest UI.
        SetRewards<override><native><final>(InRewards:[]quest_reward)<transacts>:void

        RouteSetAnchor<native_callable><epic_internal>(InObjective:(/Verse.org:)Progression.objective, InAnchor:entity)<transacts>:void = external {}

        RouteAddContributor<native_callable><epic_internal>(InObjective:(/Verse.org:)Progression.objective, Agent:agent)<transacts>:void = external {}

        RouteRemoveContributor<native_callable><epic_internal>(InObjective:(/Verse.org:)Progression.objective, Agent:agent)<transacts>:void = external {}

        RouteGetContributors<native_callable><epic_internal>(InObjective:(/Verse.org:)Progression.objective)<reads>:[]agent = external {}

    # Implemented by quests that carry a reward list.
    has_quest_rewards<native><public> := interface:
        # Grants every reward in `Rewards`, in array order, to the memberships whose `Info` has `Receive` and that `CanReceive` accepts for it, and returns the recipients of each reward whose `Grant` succeeded.
        # An error means not everything was granted: rewards whose `Grant` succeeded stay granted, and the errors are every failing `Grant`'s, concatenated.
        GrantRewards<final><native_callable><public>(Memberships:[](/Verse.org:)Progression.quest_membership)<transacts>:result([quest_reward][](/Verse.org:)Progression.quest_membership, []quest_reward_error) = external {}

        # Returns what `GrantRewards` would grant right now.
        # A reward whose `CanGrant` refuses is omitted, and an empty list is a reward that pays nobody.
        PreviewRewards<final><public>(Memberships:[](/Verse.org:)Progression.quest_membership)<reads>:[quest_reward][](/Verse.org:)Progression.quest_membership = external {}

        # Replaces the reward list; nothing is granted and no event fires.
        SetRewards<native_callable><public>(InRewards:[]quest_reward)<transacts>:void = external {}

        # Succeeds if `Membership` may receive `Reward` from this quest; the default accepts everyone.
        # A refusal drops that membership from that reward's list and is not an error.
        CanReceive<public>(Membership:(/Verse.org:)Progression.quest_membership, Reward:quest_reward)<reads>:result(void, []quest_reward_error) = external {}

        CanGrantRewards<epic_internal>(Memberships:[](/Verse.org:)Progression.quest_membership)<reads>:result(void, []quest_reward_error) = external {}

        ReceivingRoster<final><epic_internal>(Memberships:[](/Verse.org:)Progression.quest_membership)<reads>:[](/Verse.org:)Progression.quest_membership = external {}

        QuestAcceptedMemberships<final><epic_internal>(Reward:quest_reward, Memberships:[](/Verse.org:)Progression.quest_membership)<reads>:[](/Verse.org:)Progression.quest_membership = external {}

        # The rewards `GrantRewards` pays to eligible memberships.
        # Write it with `SetRewards`.
        var<protected> Rewards<native><public>:[]quest_reward = external {}

        # Native read of `Rewards` for the quest view; creators read the field directly.
        GetRewards<final><native_callable><epic_internal>()<reads>:[]quest_reward = external {}

    MergeRewardPayouts<epic_internal>(Entries:[]tuple(quest_reward, [](/Verse.org:)Progression.quest_membership))<reads>:[quest_reward][](/Verse.org:)Progression.quest_membership = external {}

    MakeRewardPayoutSuccessResult<epic_internal>(Payouts:[quest_reward][](/Verse.org:)Progression.quest_membership)<transacts>:result([quest_reward][](/Verse.org:)Progression.quest_membership, []quest_reward_error) = external {}

    MakeRewardPayoutErrorResult<epic_internal>(Errors:[]quest_reward_error)<transacts>:result([quest_reward][](/Verse.org:)Progression.quest_membership, []quest_reward_error) = external {}

    # Returned when a reward cannot be granted.
    quest_reward_error<native><public> := class<abstract><computes><castable>:


    grant_quest_reward_error<native><epic_internal> := class<epic_internal>(quest_reward_error):


    # Delivered by `quest_reward.GrantEvent`.
    quest_reward_grant_event_data<native><public> := struct<epic_internal>:
        # The reward that was granted.
        Reward<native><public>:quest_reward

        # The memberships the reward was issued to, which may be empty.
        Recipients<native><public>:[](/Verse.org:)Progression.quest_membership

    # A unit of payout a quest hands to its memberships. Subclass it to grant anything: an item, currency, experience or an unlock.
    #   * Grant 100 gold to every participant set to receive when the quest completes.
    #   * Unlock the next area for the whole server.
    #   * Grant a bonus reward to participants whose membership `Info` matches a condition.
    quest_reward<native><public> := class<abstract><unique><castable>(has_icon, has_description):
        # Grants this reward over `Memberships` and returns the ones it handed to `OnGrant`: asks `CanGrant`, keeps the memberships `CanReceive` accepts, collapses duplicates and hands that set to `OnGrant`.
        # A `CanGrant` refusal is the only error: nothing is delivered and the guard's own errors come back.
        Grant<native><final><public>(Memberships:[](/Verse.org:)Progression.quest_membership)<transacts>:result([](/Verse.org:)Progression.quest_membership, []quest_reward_error)

        # Returns the memberships `Grant` would pay right now; runs no payout and fires nothing.
        Preview<native><final><public>(Memberships:[](/Verse.org:)Progression.quest_membership)<reads>:[](/Verse.org:)Progression.quest_membership

        # Succeeds if this reward may be granted at all; the default succeeds, and a veto is an error return.
        CanGrant<native><native_callable><public>()<reads>:result(void, []quest_reward_error)

        # Succeeds if `Membership` may receive this reward; the default succeeds, and a refusal drops that membership from the grant and is not an error on `Grant`.
        CanReceive<native><native_callable><public>(Membership:(/Verse.org:)Progression.quest_membership)<reads>:result(void, []quest_reward_error)

        # Delivers this reward over `Memberships`, the ones `CanReceive` accepted.
        OnGrant<native_callable><protected>(Memberships:[](/Verse.org:)Progression.quest_membership)<transacts>:void

        # Signaled after `Grant` handed its recipients to `OnGrant`.
        GrantEvent<native><final><public>:listenable(quest_reward_grant_event_data) = external {}

    MakeGrantRewardSuccessResult<native_callable><epic_internal>():result(void, []quest_reward_error) = external {}

    MakeGrantRewardRecipientsSuccessResult<native_callable><epic_internal>(Memberships:[](/Verse.org:)Progression.quest_membership):result([](/Verse.org:)Progression.quest_membership, []quest_reward_error) = external {}

    MakeGrantRewardRecipientsErrorResult<native_callable><epic_internal>():result([](/Verse.org:)Progression.quest_membership, []quest_reward_error) = external {}

    MakeGrantRewardErrorResult<native_callable><epic_internal>():result(void, []quest_reward_error) = external {}