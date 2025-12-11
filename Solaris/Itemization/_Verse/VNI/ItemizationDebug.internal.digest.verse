# Module import path: /Fortnite.com/Itemization/ItemizationTests
ItemizationTests<epic_internal> := module:
    using {/Verse.org/SceneGraph}
    using {/Verse.org/Native}
    using {/UnrealEngine.com/Itemization}
    @experimental
    subclassed_item_component<native><epic_internal> := class(item_component):


    @experimental
    mergeable_item_component<native><epic_internal> := class(item_component):
        var MaxStackSize<override>:?int = external {}

        @available {MinUploadedAtFNVersion := 3200}
        MergeableItemComponentClasses<override>:[]castable_subtype(item_component) = external {}

    @experimental
    closed_inventory_component<native><epic_internal> := class(inventory_component):
        SendDown<override>(SceneEvent:scene_event):logic = external {}