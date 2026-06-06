using {/Verse.org/Native}
using {/Verse.org/Progression}
modular_quest<native><epic_internal> := class<epic_internal>(basic_quest):
    OnActivate<override><native>():void

    OnDeactivate<override><native>():void

    @available {MinUploadedAtFNVersion := 4000}
    CanJoin<override><native>(QuestParticipant:quest_participant)<reads>:result(void, []join_quest_error)

    @available {MinUploadedAtFNVersion := 4000}
    CanAbandon<override><native>(QuestParticipant:quest_participant)<reads>:result(void, []abandon_quest_error)

    OnJoin<override><native>(QuestParticipant:quest_participant):void

    OnAbandon<override><native>(QuestParticipant:quest_participant):void

    OnComplete<override><native>():void

    Extensions<native><epic_internal>:[]quest_extension

quest_extension<native><epic_internal> := class<abstract><castable><epic_internal>:
    OnActivate<native><epic_internal>():void

    OnDeactivate<native><epic_internal>():void

    @available {MinUploadedAtFNVersion := 4000}
    CanJoin<native><epic_internal>(QuestParticipant:quest_participant)<reads>:result(void, []join_quest_error)

    @available {MinUploadedAtFNVersion := 4000}
    CanAbandon<native><epic_internal>(QuestParticipant:quest_participant)<reads>:result(void, []abandon_quest_error)

    OnJoin<native><epic_internal>(QuestParticipant:quest_participant):void

    OnAbandon<native><epic_internal>(QuestParticipant:quest_participant):void

    OnComplete<native><epic_internal>():void

    GetOwningQuest<native><final><epic_internal>()<reads>:quest