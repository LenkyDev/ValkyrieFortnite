# Verse path: /Fortnite.com
using {/Verse.org/Native}
@available {MinUploadedAtFNVersion := 4200}
# Module import path: /Fortnite.com/Progression
(/Fortnite.com:)Progression<public> := module:
    using {/Verse.org}
    using {/UnrealEngine.com}
    @experimental
    # A category in the Fortnite quest log.
    fort_quest_category<native><public> := class<abstract><castable>((/UnrealEngine.com:)Progression.quest_category):


    @experimental
    # The quest collection whose quests show in the Fortnite quest UI. A quest displays for
    # each participant observing it.
    fort_quest_collection<native><public> := class<final>((/Verse.org:)Progression.quest_collection):
