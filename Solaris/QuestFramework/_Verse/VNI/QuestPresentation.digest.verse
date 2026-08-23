# Verse path: /UnrealEngine.com
using {/Verse.org/Native}
@available {MinUploadedAtFNVersion := 4110}
# Module import path: /UnrealEngine.com/Progression
(/UnrealEngine.com:)Progression<public> := module:
    using {/Verse.org/Native}
    using {/Verse.org/Presentation}
    using {/Verse.org/Assets}
    @available {MinUploadedAtFNVersion := 4200}
    @experimental
    # A category in the quest UI.
    quest_category<native><public> := class<abstract><unique><castable>(has_icon, has_description):
        # Relative ordering among categories in the quest UI; lower values sort first.
        SortOrder<native><public>:rational

        # The owning category that this category is considered nested under.
        Parent<native><public>:?quest_category = external {}

    @available {MinUploadedAtFNVersion := 4200}
    @experimental
    # Implement on a quest class to customize how it displays in the quest UI.
    has_quest_presentation<native><public> := interface:
        # Whether HUD notifications play for this quest's granted/progress/completed moments.
        var ShowNotification<native><public>:logic

        # Whether players may favorite this quest to the HUD quest tracker.
        var AllowFavorite<native><public>:logic

        # The categories this quest is grouped under in the quest UI. Empty = uncategorized.
        var Categories<native><public>:[]quest_category