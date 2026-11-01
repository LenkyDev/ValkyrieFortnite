# Verse path: /Fortnite.com
using {/Verse.org/Native}
@available {MinUploadedAtFNVersion := 4300}
# Module import path: /Fortnite.com/QuestFrameworkFortniteTests
QuestFrameworkFortniteTests<public> := module:
    using {/UnrealEngine.com}
    using {/Verse.org/Simulation}
    using {/Verse.org/Presentation}
    using {/Verse.org/Assets}
    using {/Verse.org}
    @hide_in_editor
    fort_admission_test_quest<native><epic_internal> := class<epic_internal>((/Verse.org:)Progression.quest, has_icon, has_description):


    @hide_in_editor
    fort_admission_bare_test_quest<native><epic_internal> := class<epic_internal>((/Verse.org:)Progression.quest):


    @hide_in_editor
    fort_admission_rewarded_test_quest<native><epic_internal> := class<epic_internal>((/Verse.org:)Progression.quest, has_description, (/UnrealEngine.com:)Progression.has_quest_rewards):


    @hide_in_editor
    fort_admission_objective_test_quest<native><epic_internal> := class<epic_internal>((/Verse.org:)Progression.quest, has_description, (/Verse.org:)Progression.has_objective):


    @hide_in_editor
    fort_admission_basic_test_quest<native><epic_internal> := class<epic_internal>((/UnrealEngine.com:)Progression.basic_quest, has_icon, has_description):


    @hide_in_editor
    fort_admission_test_reward<native><epic_internal> := class<epic_internal>((/UnrealEngine.com:)Progression.quest_reward):
        OnGrant<override><native>(Memberships:[](/Verse.org:)Progression.quest_membership)<transacts>:void