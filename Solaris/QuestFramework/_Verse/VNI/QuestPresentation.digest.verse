# Verse path: /UnrealEngine.com
using {/Verse.org/Native}
@available {MinUploadedAtFNVersion := 4300}
# Module import path: /UnrealEngine.com/Progression
(/UnrealEngine.com:)Progression<public> := module:
    using {/Verse.org/Presentation}
    using {/Verse.org/Assets}
    # A category to represent a set of quests, usually for UI purposes.
    quest_category<native><public> := class<abstract><unique><castable>(has_icon, has_description):
        # Relative ordering among categories; lower values sort first.
        SortOrder<native><public>:rational

        # The category this one is nested under; `false` is a top-level category.
        Parent<native><public>:?quest_category = external {}

    # Implement on a quest to control presentation settings.
    has_quest_presentation<native><public> := interface(has_icon, has_description):
        # Sets `ShowNotification` and refreshes this quest in the quest UI; an unchanged write does nothing.
        SetShowNotification<final><native_callable><public>(InShowNotification:logic)<transacts>:void = external {}

        # Sets `AllowFavorite` and refreshes this quest in the quest UI; an unchanged write does nothing.
        SetAllowFavorite<final><native_callable><public>(InAllowFavorite:logic)<transacts>:void = external {}

        # Sets `Categories` and refreshes this quest in the quest UI; an unchanged write does nothing.
        SetCategories<final><native_callable><public>(InCategories:[]quest_category)<transacts>:void = external {}

        # Whether notifications play for this quest.
        # Write it with `SetShowNotification`.
        var<private> ShowNotification<native><public>:logic

        # Whether players may favorite this quest.
        # Write it with `SetAllowFavorite`.
        var<private> AllowFavorite<native><public>:logic

        # The categories this quest is grouped under; an empty array leaves it uncategorized.
        # Write it with `SetCategories`.
        var<private> Categories<native><public>:[]quest_category