using {/Verse.org/Native}
using {/Verse.org/Progression}
@experimental
modular_quest<native><epic_internal> := class<epic_internal>(basic_quest):
    OnActivate<override><native><native_callable>():void

    OnDeactivate<override><native><native_callable>():void

    @available {MinUploadedAtFNVersion := 4000}
    CanJoin<override><native><native_callable>(QuestParticipant:quest_participant)<reads>:result(void, []join_quest_error)

    @available {MinUploadedAtFNVersion := 4000}
    CanAbandon<override><native><native_callable>(QuestParticipant:quest_participant)<reads>:result(void, []abandon_quest_error)

    OnJoin<override><native><native_callable>(QuestParticipant:quest_participant):void

    OnAbandon<override><native><native_callable>(QuestParticipant:quest_participant):void

    OnComplete<override><native><native_callable>():void

    CanGrantRewards<override><native><native_callable>()<reads><decides>:void

    Extensions<native><epic_internal>:[]quest_extension

@experimental
quest_extension<native><epic_internal> := class<abstract><castable><epic_internal>:
    OnActivate<native><native_callable><epic_internal>():void

    OnDeactivate<native><native_callable><epic_internal>():void

    @available {MinUploadedAtFNVersion := 4000}
    CanJoin<native><native_callable><epic_internal>(QuestParticipant:quest_participant)<reads>:result(void, []join_quest_error)

    @available {MinUploadedAtFNVersion := 4000}
    CanAbandon<native><native_callable><epic_internal>(QuestParticipant:quest_participant)<reads>:result(void, []abandon_quest_error)

    OnJoin<native><native_callable><epic_internal>(QuestParticipant:quest_participant):void

    OnAbandon<native><native_callable><epic_internal>(QuestParticipant:quest_participant):void

    OnComplete<native><native_callable><epic_internal>():void

    CanGrantRewards<native><native_callable><epic_internal>()<reads><decides>:void

    GetOwningQuest<native><final><epic_internal>()<reads>:quest