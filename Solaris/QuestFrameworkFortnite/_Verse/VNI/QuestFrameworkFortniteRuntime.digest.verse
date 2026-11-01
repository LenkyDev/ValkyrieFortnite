# Verse path: /Fortnite.com
using {/Verse.org/Native}
@available {MinUploadedAtFNVersion := 4300}
# Module import path: /Fortnite.com/Progression
(/Fortnite.com:)Progression<public> := module:
    using {/Verse.org}
    using {/UnrealEngine.com}
    # A category in the Fortnite quest UI.
    fort_quest_category<native><public> := class<abstract>((/UnrealEngine.com:)Progression.quest_category):


    # The quest collection whose quests show in the Fortnite quest UI; only quests implementing `has_description` display.
    # `has_icon`, `has_objective` and `has_quest_rewards` supply a shown quest's badge, progress and rewards.
    fort_quest_collection<native><public> := class<final>((/Verse.org:)Progression.quest_collection):
