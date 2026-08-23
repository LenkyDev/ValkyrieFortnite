# Verse path: /UnrealEngine.com
using {/Verse.org/Native}
@available {MinUploadedAtFNVersion := 4110}
# Module import path: /UnrealEngine.com/Progression
(/UnrealEngine.com:)Progression<public> := module:
    using {/Verse.org}
    @experimental
    modular_quest<native><epic_internal> := class<epic_internal>(basic_quest):
        OnActivate<override><native><native_callable>():void

        OnDeactivate<override><native><native_callable>():void

        CanJoin<override><native><native_callable>(QuestParticipant:(/Verse.org:)Progression.quest_participant)<reads>:result(void, [](/Verse.org:)Progression.join_quest_error)

        CanAbandon<override><native><native_callable>(QuestParticipant:(/Verse.org:)Progression.quest_participant)<reads>:result(void, [](/Verse.org:)Progression.abandon_quest_error)

        OnJoin<override><native><native_callable>(QuestParticipant:(/Verse.org:)Progression.quest_participant):void

        OnAbandon<override><native><native_callable>(QuestParticipant:(/Verse.org:)Progression.quest_participant):void

        OnComplete<override><native><native_callable>():void

        CanGrantRewards<override><native><native_callable>()<decides><reads>:void

        Extensions<native><epic_internal>:[]quest_extension

    @experimental
    quest_extension<native><epic_internal> := class<abstract><castable><epic_internal>:
        OnActivate<native><native_callable><epic_internal>():void

        OnDeactivate<native><native_callable><epic_internal>():void

        CanJoin<native><native_callable><epic_internal>(QuestParticipant:(/Verse.org:)Progression.quest_participant)<reads>:result(void, [](/Verse.org:)Progression.join_quest_error)

        CanAbandon<native><native_callable><epic_internal>(QuestParticipant:(/Verse.org:)Progression.quest_participant)<reads>:result(void, [](/Verse.org:)Progression.abandon_quest_error)

        OnJoin<native><native_callable><epic_internal>(QuestParticipant:(/Verse.org:)Progression.quest_participant):void

        OnAbandon<native><native_callable><epic_internal>(QuestParticipant:(/Verse.org:)Progression.quest_participant):void

        OnComplete<native><native_callable><epic_internal>():void

        CanGrantRewards<native><native_callable><epic_internal>()<decides><reads>:void

        GetOwningQuest<native><final><epic_internal>()<reads>:(/Verse.org:)Progression.quest