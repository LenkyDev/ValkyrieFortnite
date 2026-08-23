# Verse path: /Fortnite.com/Itemization
# Module import path: /Fortnite.com/Itemization/ItemizationTests
ItemizationTests<epic_internal> := module:
    using {/Verse.org/Colors}
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
        AllowMergeInto<override>(TargetEntity:entity)<decides><reads>:void = external {}

    @experimental
    @hide_in_editor
    non_mergeable_item_component<native><epic_internal> := class(item_component, has_merge_rules):
        AllowMergeInto<override>(TargetEntity:entity)<decides><reads>:void = external {}

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

    @experimental
    @hide_in_editor
    event_tester_inventory_component<native><epic_internal> := class(inventory_component):
        var AddedItemCount<native><public>:int = external {}

        var ModifiedItemCount<native><public>:int = external {}

        OnInitialized<override>():void = external {}

        OnUninitializing<override>():void = external {}

    @available {MinUploadedAtFNVersion := 4000}
    @experimental
    @hide_in_editor
    test_custom_rarity<epic_internal> := class<allocates>(rare_rarity):
        Color<override>:color = external {}

    @experimental
    @hide_in_editor
    TestPrefab_AmmoHeavyBullets_BR_PreSeason_Common<epic_internal> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @experimental
    @hide_in_editor
    itemization_test_library<native><epic_internal> := class:
        @available {MinUploadedAtFNVersion := 4000}
        CreateTestCustomRarity<native_callable><epic_internal>():rarity = external {}

        CreateTestPrefab<native_callable><epic_internal>():entity = external {}