# Verse path: /UnrealEngine.com
using {/Verse.org/Native}
@available {MinUploadedAtFNVersion := 4300}
# Module import path: /UnrealEngine.com/Progression
(/UnrealEngine.com:)Progression<public> := module:
    using {/Verse.org}
    # Implemented by quests that carry a quest_extension list. The interface owns the storage.
    has_quest_extensions<native><epic_internal> := interface:
        # Replaces the extension list. An override owns the write.
        SetQuestExtensions<native_callable><epic_internal>(InExtensions:[]quest_extension)<transacts>:void = external {}

        # Extensions attached to this quest. Write it with SetQuestExtensions.
        var<protected> QuestExtensions<native><epic_internal>:[]quest_extension = external {}

    modular_quest<native><epic_internal> := class<epic_internal>(basic_quest, has_quest_extensions):
        OnActivate<override><native><native_callable>()<transacts>:void

        OnDeactivate<override><native><native_callable>()<transacts>:void

        CanJoin<override><native><native_callable>(Participant:(/Verse.org:)Progression.quest_participant, Info:(/Verse.org:)Progression.quest_participant_info)<reads>:result(void, [](/Verse.org:)Progression.quest_error)

        CanAbandon<override><native><native_callable>(Participant:(/Verse.org:)Progression.quest_participant, Info:(/Verse.org:)Progression.quest_participant_info)<reads>:result(void, [](/Verse.org:)Progression.quest_error)

        OnJoin<override><native><native_callable>(Participant:(/Verse.org:)Progression.quest_participant, Info:(/Verse.org:)Progression.quest_participant_info)<transacts>:void

        OnAbandon<override><native><native_callable>(Participant:(/Verse.org:)Progression.quest_participant, Info:(/Verse.org:)Progression.quest_participant_info)<transacts>:void

        OnComplete<override><native><native_callable>(Reason:(/Verse.org:)Progression.complete_objective_reason)<transacts>:void

        CanGrantRewards<override>(Memberships:[](/Verse.org:)Progression.quest_membership)<reads>:result(void, []quest_reward_error) = external {}

        ExtensionGrantRefusals<epic_internal>(Memberships:[](/Verse.org:)Progression.quest_membership)<reads>:[][]quest_reward_error = external {}

    quest_extension<native><epic_internal> := class<abstract><castable><epic_internal>:
        OnActivate<native><native_callable><epic_internal>():void

        OnDeactivate<native><native_callable><epic_internal>():void

        CanJoin<native><native_callable><epic_internal>(QuestParticipant:(/Verse.org:)Progression.quest_participant)<reads>:result(void, [](/Verse.org:)Progression.join_quest_error)

        CanAbandon<native><native_callable><epic_internal>(QuestParticipant:(/Verse.org:)Progression.quest_participant)<reads>:result(void, [](/Verse.org:)Progression.abandon_quest_error)

        OnJoin<native><native_callable><epic_internal>(QuestParticipant:(/Verse.org:)Progression.quest_participant):void

        OnAbandon<native><native_callable><epic_internal>(QuestParticipant:(/Verse.org:)Progression.quest_participant):void

        OnComplete<native><native_callable><epic_internal>(Reason:(/Verse.org:)Progression.complete_objective_reason):void

        CanGrantRewards<native><native_callable><epic_internal>(Memberships:[](/Verse.org:)Progression.quest_membership)<reads>:result(void, []quest_reward_error)

        GetOwningQuest<native><final><epic_internal>()<decides><reads>:(/Verse.org:)Progression.quest