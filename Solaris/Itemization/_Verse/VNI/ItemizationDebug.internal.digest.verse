# Module import path: /Fortnite.com/Itemization/ItemizationTests
ItemizationTests<epic_internal> := module:
    using {/Verse.org/Native}
    using {/Verse.org/SceneGraph}
    using {/Verse.org/Simulation}
    using {/UnrealEngine.com/Itemization}
    @experimental
    @hide_in_editor
    subclassed_item_component<native><epic_internal> := class(item_component):


    @experimental
    @hide_in_editor
    mergeable_item_component<native><epic_internal> := class(item_component, has_merge_rules):
        AllowMergeInto<override>(TargetEntity:entity)<reads><decides>:void = external {}

    @experimental
    @hide_in_editor
    non_mergeable_item_component<native><epic_internal> := class(item_component, has_merge_rules):
        AllowMergeInto<override>(TargetEntity:entity)<reads><decides>:void = external {}

    @available {MinUploadedAtFNVersion := 4000}
    @experimental
    @hide_in_editor
    unsplittable_stackable_component<native><epic_internal> := class(stackable_component):
        Split<override>(Amount:int)<transacts><decides>:entity = external {}

    @experimental
    @hide_in_editor
    closed_inventory_component<native><epic_internal> := class(inventory_component):
        @available {MinUploadedAtFNVersion := 4000}
        OnReceive<override>(SceneEvent:scene_event):logic = external {}

    @experimental
    @hide_in_editor
    one_way_inventory_component<native><epic_internal> := class(inventory_component):
        @available {MinUploadedAtFNVersion := 4000}
        OnReceive<override><override>(Event:scene_event):logic = external {}

    @experimental
    @hide_in_editor
    category_inventory_component<native><epic_internal> := class(inventory_component):
        SetRequiredCategory<native_callable><public>(InCategory:item_category):void = external {}

        @available {MinUploadedAtFNVersion := 4000}
        OnReceive<override>(Event:scene_event):logic = external {}

    @experimental
    inventory_full_error<epic_internal> := class(add_item_error):


    @experimental
    @hide_in_editor
    item_limit_inventory_component<native><epic_internal> := class(inventory_component):
        SetItemLimit<native_callable><public>(InLimit:int):void = external {}

        @available {MinUploadedAtFNVersion := 4000}
        OnReceive<override>(Event:scene_event):logic = external {}