using {/Verse.org/Colors}
using {/Verse.org/Presentation}
using {/UnrealEngine.com/Abilities}
using {/Verse.org/Simulation}
using {/Verse.org/Assets}
using {/Verse.org/Temporary/EpicGamesRestricted/Network}
using {/Verse.org/Native}
using {/Verse.org/SceneGraph}
@experimental
copy_from_item<native><epic_internal> := interface<epic_internal>:
    CopyFromItem<native_callable><epic_internal>(SourceItem:entity)<transacts>:void

@experimental
failure_reason<native><public> := class<castable><concrete><reads>:


@experimental
add_inventory_result<native><epic_internal> := class<epic_internal>:
    ParentInventory<native><public>:inventory_component

    Inventory<native><public>:inventory_component

@experimental
remove_inventory_result<native><epic_internal> := class<epic_internal>:
    ParentInventory<native><public>:inventory_component

    Inventory<native><public>:inventory_component

@experimental
add_item_result<native><public> := class<epic_internal>:
    # Items that were newly added to this inventory as a result of the transaction.
    AddedItems<native><public>:[]entity

    # Items whose stack size changed as a result of the transaction.
    ModifiedItems<native><public>:[]tuple(entity, int)

@experimental
remove_item_result<native><public> := class<epic_internal>:
    # Total stack count of items removed as a result of this transaction.
    RemovedAmount<native><public>:int

    # Items that were removed from this inventory as a result of the transaction.
    RemovedItems<native><public>:[]entity

    # Item whose stack size changed as a result of the transaction.
    ModifiedItem<native><public>:?entity

@experimental
equip_item_result<native><public> := class<epic_internal>:
    Inventory<native><public>:inventory_component

    Item<native><public>:entity

@experimental
unequip_item_result<native><public> := class<epic_internal>:
    Inventory<native><public>:inventory_component

    Item<native><public>:entity

@experimental
change_items_slot_result<native><epic_internal> := struct<epic_internal>:
    Inventory<native><public>:inventory_component

    SlotChangedItems<native><public>:[]item_slot_change

@experimental
inventory_property_change_result<native><epic_internal> := struct<epic_internal>:
    Inventory<native><public>:inventory_component

@experimental
inventory_with_priority<native><public> := class:
    Inventory<native><public>:inventory_component

    Priority<native><public>:float

@experimental
# When adding an item, 'find_inventory_event' is used as a first pass to find the best inventory for an item. It is sent downwards.
# 'add_item_query_event' can be used to veto inventory choices. It is sent upwards.
find_inventory_event<native><public> := class<epic_internal>(scene_event):
    ItemComponent<native><public>:item_component

    var EligibleInventories<native><public>:[]inventory_with_priority

@experimental
add_item_error<native><public> := class<computes>:


@experimental
# When adding an item, 'find_inventory_event' is used as a first pass to find the best inventory for an item. It is sent downwards.
# 'add_item_query_event' can be used to veto inventory choices. It is sent upwards.
add_item_query_event<native><public> := class<epic_internal>(scene_event):
    Item<native><public>:item_component

    Inventory<native><public>:inventory_component

    var Errors<native><public>:[]add_item_error = external {}

@experimental
remove_item_error<native><public> := class<computes>:


@experimental
remove_item_query_event<native><public> := class<epic_internal>(scene_event):
    Item<native><public>:item_component

    Inventory<native><public>:inventory_component

    var Errors<native><public>:[]remove_item_error = external {}

@experimental
# Inventory components hold items. An entity with an inventory component can be considered to have an inventory.
# The inventory component controls which items can enter or exit.
# They also determine whether an item can be equipped.
inventory_component<native><public> := class<final_super>(component):
    OnInitializedInternal<native><override>():void

    OnUninitializingInternal<native><override>():void

    # Returns a failure reason (such as being full) if the provided item entity cannot be added.
    CanAddItem<final><native><public>(Item:entity, ?AllowMergeItems:logic = external {}, ?AllowPartialItemMove:logic = external {})<transacts>:?failure_reason

    # Adds items to the inventory. Fails if no items could be added.
    AddItem<native><final><public>(Item:entity, ?AllowMergeItems:logic = external {}, ?AllowPartialItemMove:logic = external {})<transacts><decides>:void

    # Returns a failure reason if the provided item is not present or cannot be removed.
    CanRemoveItem<final><native><public>(Item:entity)<transacts>:?failure_reason

    # Removes items from the inventory. Fails if no items could be removed.
    RemoveItem<native><final><public>(Item:entity)<transacts><decides>:void

    # Returns a list of items within this inventory only.
    GetItems<native><final><public>()<reads>:[]entity

    @available {MinUploadedAtFNVersion := 3200}
    # Returns a list of items (of a specific type) within this inventory only.
    GetItems<native><final><public>(Type:castable_subtype(item_component))<reads>:[]entity

    @available {MinUploadedAtFNVersion := 2930}
    # Returns a list of all items within this inventory and its descendant inventories.
    FindItems<native><final><public>()<reads>:generator(entity)

    @available {MinUploadedAtFNVersion := 3200}
    # Returns a list of all items (of a specific type) within this inventory and its descendant inventories.
    FindItems<native><final><public>(Type:castable_subtype(item_component))<reads>:[]entity

    GetItemSlot<native><epic_internal>(Item:entity)<reads>:int

    AddInventory<native><final><epic_internal>(Inventory:inventory_component)<transacts><decides>:void

    RemoveInventory<native><final><epic_internal>(Inventory:inventory_component)<transacts><decides>:void

    # Returns a list of sub-inventories of this inventory only.
    GetInventories<native><final><public>()<reads>:[]inventory_component

    @available {MinUploadedAtFNVersion := 2930}
    # Returns a list of all sub-inventories within this inventory and its descendant inventories.
    FindInventories<native><final><public>()<reads>:generator(inventory_component)

    InventoryAddedEvent<native><final><epic_internal>:listenable(add_inventory_result) = external {}

    InventoryRemovedEvent<native><final><epic_internal>:listenable(remove_inventory_result) = external {}

    InventoryPropertyChangedEvent<native><final><epic_internal>:listenable(inventory_property_change_result) = external {}

    AddItemEvent<native><final><public>:listenable(add_item_result) = external {}

    RemoveItemEvent<native><final><public>:listenable(remove_item_result) = external {}

    ItemsSlotChangedEvent<native><final><epic_internal>:listenable(change_items_slot_result) = external {}

    # Adds the provided inventory_rule_interface instance to this inventory's rule list if not already present.
    # NOTE: this part of the API is likely to change during Experimental.
    AddRule<native><final><public>(Rule:inventory_rule_interface)<transacts><decides>:cancelable

    var<private> InventoryRuleList<native><public>:[]inventory_rule_interface = external {}

    @replicated("")
    var<private> InventoryName<native><epic_internal>:string = external {}

    @replicated("")
    var<private> InventoryDisplayName<native><epic_internal>:message = external {}

    @replicated("")
    var<private> InventoryDescription<native><epic_internal>:message = external {}

    @replicated("RepNotify")
    var<private> TotalSlots<native><epic_internal>:int = external {}

    @replicated("")
    var<private> PickupPriority<native><epic_internal>:int = external {}

    @replicated("")
    var<private> EnableItemStacking<native><epic_internal>:logic = external {}

    @replicated("RepNotify")
    var<private> InventoryMaxStackSizeOverride<native><epic_internal>:int = external {}

    GetInputAction<epic_internal>(ItemSlot:int):?input_action(type) = external {}

    GetNativeInputAction<native><epic_internal>(ItemSlot:int):?input_action(type)

    GetNavigatePreviousInputAction<native><epic_internal>():?input_action(type)

    GetNavigateNextInputAction<native><epic_internal>():?input_action(type)

    SlotBindingList<native><epic_internal>:[]tuple(input_action(type), int) = external {}

    ShowSlotBindings<native><epic_internal>:logic = external {}

    GetEquippedItems<final><native><public>():[]entity

    EquipItemEvent<native><final><public>:listenable(equip_item_result) = external {}

    UnequipItemEvent<native><final><public>:listenable(unequip_item_result) = external {}

@experimental
# Interface for inventory rules. Used for composable rules for inventories.
# NOTE: this part of the API is likely to change during Experimental.
inventory_rule_interface<native><public> := interface<unique><castable>:
    # Called after an inventory_rule_interface instance is added to an inventory.
    OnRuleAdded<native_callable><public>(InventoryComponent:inventory_component):void = external {}

    CanAddItem<native_callable><public>(InventoryComponent:inventory_component, Item:entity, ?AllowMergeItems:logic = external {}, ?AllowPartialItemMove:logic = external {}):?failure_reason = external {}

    CanMergeItem<native_callable><public>(InventoryComponent:inventory_component, Item:entity):?failure_reason = external {}

    CanRemoveItem<native_callable><public>(InventoryComponent:inventory_component, Item:entity):?failure_reason = external {}

@experimental
inventory_full_failure_reason<epic_internal> := class<final><reads>(failure_reason):


@experimental
invalid_item_failure_reason<native><public> := class<final><reads>(failure_reason):


@experimental
item_limit_inventory_rule<native><epic_internal> := class(inventory_rule_interface):
    @editable
    ItemLimit<native><public>:int = external {}

    CanAddItem<override>(InventoryComponent:inventory_component, Item:entity, ?AllowMergeItems:logic = external {}, ?AllowPartialItemMove:logic = external {}):?failure_reason = external {}

@experimental
inventory_setup_data_result<native><epic_internal> := struct<epic_internal>:
    Inventory<native><public>:inventory_component

    AddedInventoryMap<native><public>:[]tuple(inventory_component, []entity)

@experimental
inventory_starting_item<native><epic_internal> := struct<concrete><epic_internal>:
    @editable
    ItemDefinition<native>:?item_definition_base = external {}

    @editable
    ItemEntityClass<native>:?subtype(entity) = external {}

    @editable_number(int) {MinValue := option {1}}
    Amount<native>:int = external {}

@experimental
inventory_properties<native><epic_internal> := class<epic_internal>:
    @editable
    InventoryClass<native><public>:subtype(inventory_component)

    @editable
    InventoryName<native><public>:string = external {}

    @editable
    InventoryDisplayName<native><localizes><public>:message = external {}

    @editable
    InventoryDescription<native><localizes><public>:message = external {}

    @editable
    PickupPriority<native><public>:int = external {}

    @editable_number(int) {MinValue := option {0}}
    TotalSlotsOverride<native><public>:int = external {}

    @editable
    InventoryRules<native><public>:[]inventory_rule_interface = external {}

    @editable
    SlotBindings<native><public>:[]inventory_slot_binding_definition

@experimental
inventory_slot_binding_definition<native><epic_internal> := struct<concrete><epic_internal>:
    @editable_number(int) {MinValue := option {0}}
    Slot<native><public>:int = external {}

    @editable
    InputAction<native><public>:input_action(type) = external {}

@experimental
inventory_setup_data<native><epic_internal> := class<abstract>:
    ApplyTo<public>(Target:inventory_component)<decides>:inventory_setup_data_result

@editor_type
@experimental
basic_inventory_setup_data<native><epic_internal> := class<concrete>(inventory_setup_data):
    ApplyTo<native><override>(Target:inventory_component)<decides>:inventory_setup_data_result

    @editable
    InventoryList<native><public>:[]inventory_properties = external {}

    @editable
    StartingItemList<native><public>:[]inventory_starting_item = external {}

@experimental
@import_as("/Script/ItemizationCoreRuntime.UItemAbilityCost")
item_ability_cost<native><epic_internal> := class<unique><abstract>:


@experimental
item_ability_cost_item<native><epic_internal> := class(item_ability_cost):


@experimental
@import_as("/Script/ItemizationCoreRuntime.UItemAbilityCooldown")
item_ability_cooldown<native><epic_internal> := class<unique><abstract>:


@experimental
item_ability_cooldown_time<native><epic_internal> := class(item_ability_cooldown):


@experimental
item_ability_cooldown_velocity_based<native><epic_internal> := class(item_ability_cooldown):


@experimental
item_ability_binding<native><final><epic_internal> := class<concrete>:
    @editable
    var<private> InputAction<native><public>:?input_action(type) = external {}

    @editable
    var<private> ActiveWhenItemEquipped<native><public>:logic = external {}

    @editable
    var<private> ActiveWhenItemNotEquipped<native><public>:logic = external {}

    @editable
    var<private> Costs<native><public>:[]item_ability_cost = external {}

    @editable
    var<private> Cooldowns<native><public>:[]item_ability_cooldown = external {}

    @editable
    var<private> Ability<native><public>:?ability = external {}

@experimental
item_ability_component<native><final><epic_internal> := class<final_super>(component):
    @editable
    var<private> ItemAbilities<native><public>:[]item_ability_binding

@experimental
item_attachment_definition<native><epic_internal> := class<unique><concrete>:
    @editable
    var VisibleWhenEquipped<native><public>:logic = external {}

    @editable
    var VisibleWhenUnequipped<native><public>:logic = external {}

@experimental
item_mesh_attachment_definition<native><epic_internal> := class<concrete>(item_attachment_definition):
    @editable
    var AttachToSocketName<native><public>:string = external {}

    @editable
    EntityToAttach<native><public>:?subtype(entity) = external {}

@experimental
item_attach_component<native><final><epic_internal> := class<final_super>(component):
    @editable
    Attachments<native><public>:[]item_attachment_definition = external {}

@experimental
# item_category is used to classify items.
item_category<native><public> := class<castable><concrete><unique><final>:


@experimental
item_slot_change<native><epic_internal> := struct<epic_internal>:
    Item<native><public>:entity

    PreviousSlot<native><public>:int

    CurrentSlot<native><public>:int

@experimental
change_equipped_result<native><public> := class<epic_internal>:
    ItemComponent<native><public>:item_component

    IsItemEquipped<native><public>:logic

@experimental
change_inventory_result<native><public> := class<epic_internal>:
    ItemComponent<native><public>:item_component

    PreviousInventory<native><public>:?inventory_component

    CurrentInventory<native><public>:?inventory_component

@experimental
change_stack_size_result<native><public> := class<epic_internal>:
    ItemComponent<native><public>:item_component

    PreviousStackSize<native><public>:int

    CurrentStackSize<native><public>:int

@experimental
change_max_stack_size_result<native><public> := class<epic_internal>:
    ItemComponent<native><public>:item_component

    PreviousMaxStackSize<native><public>:?int

    CurrentMaxStackSize<native><public>:?int

@experimental
equip_item_error<native><public> := class<computes>:


@experimental
equip_item_query_event<native><public> := class(scene_event):
    Item<native><public>:item_component

    Inventory<native><public>:inventory_component

    var<private> Errors<native><public>:[]equip_item_error = external {}

    Reject<public>(Error:equip_item_error):void = external {}

@experimental
unequip_item_error<native><public> := class<computes>:


@experimental
unequip_item_query_event<native><public> := class(scene_event):
    Item<native><public>:item_component

    Inventory<native><public>:inventory_component

    var<private> Errors<native><public>:[]unequip_item_error = external {}

    Reject<public>(Error:unequip_item_error):void = external {}

@experimental
# Anything using this component should be considered an item. Required to interact with inventories.
item_component<native><public> := class<final_super>(component):
    OnInitializedInternal<native><override>():void

    # Returns the inventory_component this item currently resides in. Fails if it cannot find a valid parent inventory.
    GetParentInventory<native><final><public>()<reads><decides>:inventory_component

    # Succeeds if this item is considered currently within an inventory and equipped.
    IsEquipped<native><final><public>()<reads><decides>:void

    # Broadcast when this item changes inventory.
    ChangeInventoryEvent<native><final><public>:listenable(change_inventory_result) = external {}

    # Broadcast when this item is equipped or unequipped.
    ChangeEquippedEvent<native><final><public>:listenable(change_equipped_result) = external {}

    @available {MinUploadedAtFNVersion := 3800}
    # Attempts to equip this item within the inventory it is currently in.
    # Fails if not in an inventory or if equip_item_query_event contains any errors after querying.
    Equip<final><native><public>()<transacts>:result(void, []equip_item_error)

    @available {MinUploadedAtFNVersion := 3800}
    # Attempts to unequip this item.
    # Fails if not in an inventory, not currently equipped or if unequip_item_query_event contains any errors after querying.
    Unequip<final><native><public>()<transacts>:result(void, []unequip_item_error)

    CloneItem<final><native><epic_internal>()<transacts>:entity

    # Takes the specified amount of this item's stack, reducing this item's stack size in the process.
    #  If amount is greater than the amount in the stack, the stack amount will be used instead.
    #  Returns a clone of the item with a stack size equial to the amount it was able to take from the item.
    Take<final><native><public>(Amount:int)<transacts><decides>:entity

    @available {MinUploadedAtFNVersion := 3200}
    # List of item_component classes we can be merged with.
    MergeableItemComponentClasses<native><public>:[]castable_subtype(item_component) = external {}

    @editable
    # Categories which this item can belong to. Note that some projects may only use the first entry.
    Categories<native><public>:[]item_category = external {}

    # Succeeds if this item can be merged into the target item. Merging an entity with itself will always fail.
    CanMergeInto<final><native_callable><public>(TargetItem:entity)<reads><decides>:void = external {}

    CanMergeIntoInternal<final><native><epic_internal>(TargetItem:entity)<reads>:tuple(logic, logic)

    # Attempts to merge this item into the specified item. Fails if items cannot be merged or no items are moved.
    #  If TargetAmount is specified, only that amount will try to be merged into this item.
    MergeInto<final><native_callable><public>(TargetItem:entity, ?TargetAmount:?int = external {})<transacts><decides>:void = external {}

    MergeIntoInternal<final><native><epic_internal>(TargetItem:entity, TargetAmount:int)<transacts><decides>:int

    @available {MinUploadedAtFNVersion := 3800}
    MakeEquipResultInternal<final><native_callable><epic_internal>(IsSuccess:logic):result(any, []equip_item_error) = external {}

    @available {MinUploadedAtFNVersion := 3800}
    MakeUnequipResultInternal<final><native_callable><epic_internal>(IsSuccess:logic):result(any, []unequip_item_error) = external {}

    # Current stack size of this item.
    var<protected> StackSize<native><public>:int = external {}

    # Sets the stack size of this item.
    SetStackSize<final><native><public>(NewStackSize:int)<transacts>:void

    # Maximum stack size for this item.
    var<protected> MaxStackSize<native><public>:?int = external {}

    # Sets the maximum stack size for this item. If ClampStackSize is true, StackSize will be clamped to NewMaxStackSize.
    SetMaxStackSize<final><native><public>(NewMaxStackSize:int, ?ClampStackSize:logic = external {})<transacts>:void

    ChangeStackSizeEvent<native><final><public>:listenable(change_stack_size_result) = external {}

    ChangeMaxStackSizeEvent<native><final><public>:listenable(change_max_stack_size_result) = external {}

    # Removes the item from its inventory and places it in the simulation world. Works on orphaned items i.e. outside the world or any inventory. Fails if the item is already a pickup.
    Drop<native><public>()<transacts><decides>:void

    # Fails if this item is already in an inventory, or the inventory cannot accept the item.
    PickUp<native><public>(Inventory:inventory_component)<transacts><decides>:void

    @replicated("")
    var<private> ItemDefinition<native><epic_internal>:?item_definition_base = external {}

@experimental
# Item Merge Rules Interface. Implemented by components that want to participate in item mergeability checks.
has_item_merge_rules<public> := interface<unique>:
    CanMergeInto<public>(TargetItem:entity)<reads><decides>:void = external {}

    OnMergeInto<public>(TargetItem:entity, MergeAmount:int)<transacts>:void = external {}

@experimental
# Component that holds the details of an item.
item_details_component<native><public> := class<final_super>(component, has_description):
    var Name<override>:message = external {}

    var Description<override>:message = external {}

    var ShortDescription<override>:message = external {}

    ChangeItemDetailsEvent<native><final><epic_internal>:listenable(tuple()) = external {}

    OnItemDetailsChanged<native><epic_internal>()<transacts>:void

@experimental
# Component that holds the icon for an item.
item_icon_component<native><public> := class<final_super>(component, has_icon):


@experimental
@import_as("/Script/ItemizationCoreRuntime.UItemDefinitionBase")
item_definition_base<native><epic_internal> := class<epic_internal>:


@experimental
itemization_debug_item_component_mergeable<epic_internal> := class(item_component):
    @available {MinUploadedAtFNVersion := 3200}
    MergeableItemComponentClasses<override>:[]castable_subtype(item_component) = external {}

@experimental
itemization_core_debug_library<native><epic_internal> := class:
    AddTestItem<native_callable><public>(InInventory:inventory_component):void = external {}

    # Adds a mergeable item which can be stacked to the inventory.
    AddTestStackableItem<native_callable><public>(InInventory:inventory_component):void = external {}

    # Adds an item which is also an inventory (let's call it a bag). There is an object inside the bag.
    AddTestItemWithInventory<native_callable><public>(InInventory:inventory_component):void = external {}

    RemoveAllItems<native_callable><public>(InInventory:inventory_component):void = external {}

@experimental
@import_as("/Script/ItemizationCoreRuntime.UItemOwnerPoseAsset")
# Owner poses let an item affect their owner's default animation stance. 
#  For example, to make a character hold an item like a torch, or a 2-handed weapon.
pose_modifier<native><epic_internal> := class<concrete><unique>(asset):


@experimental
# Item component setting owner pose data for this item.
item_owner_pose_modifier_component<native><final><epic_internal> := class<final_super>(component):
    @editable
    EquippedPose<native><public>:?pose_modifier = external {}

    @editable
    NotEquippedPose<native><public>:?pose_modifier = external {}

@experimental
# item_rarity is used to classify and rank items.
item_rarity<native><epic_internal> := class<castable><concrete><unique><final>:
    @editable
    RarityName<native><public>:string = external {}

    @editable
    RarityColor<native><public>:color = external {}

    @editable
    RarityTier<native><public>:float = external {}

@experimental
# Component that contains the rarity of an item.
item_rarity_component<native><final><epic_internal> := class<final_super>(component):
    @editable
    var<private> Rarity<native><public>:?item_rarity

@experimental
# Component that allows setting the number of slots used by this item in an inventory.
item_slot_size_component<native><epic_internal> := class<final_super>(component):
    @editable
    SlotSize<native><public>:int = external {}

DefaultText<localizes><epic_internal>:message = external {}

@experimental
item_type<native><epic_internal> := class<concrete><unique>:
    @editable
    ItemTypeName<native><public>:message = external {}

@experimental
item_type_source<native><epic_internal> := class<abstract>:


@experimental
item_type_component<native><final><epic_internal> := class<final_super>(component):
    @editable
    var<private> ItemType<native><public>:item_type

    @editable
    ItemTypeSource<native><epic_internal>:?item_type_source = external {}

@experimental
# Spawns loot to the world or award it to an agent inventory.
loot_component<native><epic_internal> := class<final_super>(component, enableable):
    Enable<native><override>():void

    Disable<native><override>():void

    IsEnabled<native><override>()<transacts><decides>:void

    SpawnPickups<native><public>(Instigators:[]agent):[]entity

    AwardLoot<native><public>(Target:entity, Instigators:[]agent, DestroyOverflow:logic):[]entity

    @editable
    Items<native><public>:[]subtype(entity) = external {}

    @editable
    LootPools<native><public>:[]loot_pool = external {}

@experimental
# The Data for the loot component to work with
loot_pool<native><epic_internal> := class<concrete>:


@experimental
# It can be overriden. It will return how many times the loot can be rolled
loot_count_calculator<native><epic_internal> := class<concrete>:


@experimental
calculate_count_info<native><epic_internal> := struct:
    Owner<native>:entity = external {}

    Instigators<native>:[]agent = external {}

@experimental
# Fixed amount of rolls
loot_count_calculator_fixed<native><epic_internal> := class<concrete>(loot_count_calculator):


@experimental
# Random range of rolls
loot_count_calculator_range<native><epic_internal> := class<concrete>(loot_count_calculator):


@experimental
loot_distribution<native><epic_internal> := struct<concrete>:
    @category("Values")
    @editable
    Count<native>:int = external {}

    @category("Values")
    @editable
    Weight<native>:float = external {}

@experimental
# Weighted amount of rolls
loot_count_calculator_weighted<native><epic_internal> := class<concrete>(loot_count_calculator):


@experimental
# Loot Data
loot<native><epic_internal> := struct<concrete>:
    @editable
    Weight<native>:loot_weight_calculator = external {}

    @editable
    MaxSelections<native>:?int = external {}

    @editable
    Items<native>:[]subtype(entity) = external {}

    @editable
    LootPools<native>:[]loot_pool = external {}

@experimental
loot_weight_calculator_info<native><epic_internal> := struct:
    Owner<native>:?entity = external {}

    Instigators<native>:[]agent = external {}

    Items<native>:[]subtype(entity) = external {}

    LootPools<native>:[]loot_pool = external {}

@experimental
loot_weight_calculator<native><epic_internal> := class<concrete>:


@experimental
loot_weight_calculator_fixed<epic_internal> := class<concrete>(loot_weight_calculator):
