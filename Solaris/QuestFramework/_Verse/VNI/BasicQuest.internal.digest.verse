using {/Verse.org/Native}
using {/Verse.org/Presentation}
using {/Verse.org/Assets}
basic_quest<native><epic_internal> := class<abstract><epic_internal>(quest, has_icon, has_description):
    SetObjective<native><final><epic_internal>(InObjective:quest_objective)<transacts>:void

    OnActivate<override><native>():void

    OnDeactivate<override><native>():void

    OnJoin<override><native>(QuestParticipant:quest_participant):void

    OnAbandon<override><native>(QuestParticipant:quest_participant):void

    var<private> Objective<native><epic_internal>:quest_objective

    var Rewards<native><epic_internal>:[]quest_reward = external {}

quest_objective<native><epic_internal> := class<abstract><epic_internal>(has_icon, has_description):
    GetProgress<native><epic_internal>()<reads>:message

    GetContributors<native><epic_internal>(Memberships:[]quest_membership)<reads>:[]quest_participant

    IsComplete<native><epic_internal>()<reads><decides>:void

    GetOwningQuest<native><final><epic_internal>()<reads>:quest

    OnActivate<native><native_callable><epic_internal>():void

    OnDeactivate<native><native_callable><epic_internal>():void

    OnJoin<native><native_callable><epic_internal>(QuestParticipant:quest_participant):void

    OnAbandon<native><native_callable><epic_internal>(QuestParticipant:quest_participant):void

    OnComplete<native><native_callable><epic_internal>():void

    CompleteEvent<native><final><epic_internal>:listenable(quest_objective) = external {}

quest_reward<native><epic_internal> := class<abstract><epic_internal>(has_icon, has_description):
    GetRecipients<native><epic_internal>(Memberships:[]quest_membership)<reads>:[]quest_participant

    @available {MinUploadedAtFNVersion := 4000}
    GrantReward<native><epic_internal>(EligibleParticipants:[]quest_participant)<transacts>:result(void, []grant_quest_reward_error)

    GrantEvent<native><final><epic_internal>:listenable(tuple(quest_reward, []quest_participant)) = external {}

@available {MinUploadedAtFNVersion := 4000}
MakeGrantRewardSuccessResult<native_callable><epic_internal>():result(comparable, []grant_quest_reward_error) = external {}

@available {MinUploadedAtFNVersion := 4000}
MakeGrantRewardErrorResult<native_callable><epic_internal>():result(void, []grant_quest_reward_error) = external {}