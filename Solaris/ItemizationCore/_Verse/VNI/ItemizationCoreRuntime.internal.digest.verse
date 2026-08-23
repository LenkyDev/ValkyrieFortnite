# Verse path: /UnrealEngine.com/Itemization
using {/Verse.org/SpatialMath}
using {/Verse.org/Temporary/EpicGamesRestricted/Network}
using {/Verse.org/Assets}
using {/Verse.org/SceneGraph}
using {/Verse.org/Simulation}
using {/Verse.org/Native}
@hide_in_editor
subscribable_inventory_event<native><epic_internal>(t:type) := class(subscribable_event_intrnl(t)):
    @available {MinUploadedAtFNVersion := 4294967041}
    (/UnrealEngine.com/Itemization/subscribable_inventory_event:)Itemization_subscribable_inventory_event_Variance_Inherited<private>(:t, :t, :t, :t):tuple(t, t, t, t, t, t) = external {}

    (/UnrealEngine.com/Itemization/subscribable_inventory_event:)Itemization_subscribable_inventory_event_Variance<private>():tuple(t, t) = external {}

    Await<native><override>()<suspends>:t

    Subscribe<native><override>(Callback:type {_(:t):void})<transacts>:cancelable

add_inventory_result<native><epic_internal> := class<epic_internal>:
    ParentInventory<native><public>:inventory_component

    Inventory<native><public>:inventory_component

remove_inventory_result<native><epic_internal> := class<epic_internal>:
    ParentInventory<native><public>:inventory_component

    Inventory<native><public>:inventory_component

add_item_result<native><public> := class<epic_internal>:
    # Items that were newly added to this inventory as a result of the transaction.
    AddedItems<native><public>:[]entity

    # Items whose stack size changed as a result of the transaction, and the previous stack size value.
    ModifiedItems<native><public>:[]tuple(entity, int)

remove_item_result<native><public> := class<epic_internal>:
    # The inventory which the item was removed from.
    Inventory<native><public>:inventory_component

    # Total stack count of items removed as a result of this transaction.
    RemovedAmount<native><public>:int

    # Items that were removed from this inventory as a result of the transaction.
    RemovedItems<native><public>:[]entity

    # Item whose stack size changed as a result of the transaction.
    ModifiedItem<native><public>:?tuple(entity, int)

equip_item_result<native><public> := class<epic_internal>:
    Item<native><public>:entity

unequip_item_result<native><public> := class<epic_internal>:
    Item<native><public>:entity

change_items_slot_result<native><epic_internal> := struct<epic_internal>:
    Inventory<native><public>:inventory_component

    SlotChangedItems<native><public>:[]item_slot_change

inventory_property_change_result<native><epic_internal> := struct<epic_internal>:
    Inventory<native><public>:inventory_component

# When adding an item, 'find_inventory_event' is used as a first pass to find the best inventory for an item. It is sent downwards.
# 'add_item_query_event' can be used to veto inventory choices. It is sent upwards.
find_inventory_event<native><public> := class<epic_internal>(scene_event):
    ItemComponent<native><public>:item_component

    var ChosenInventory<native><public>:?inventory_component = external {}

    var ChosenInventoryPriority<native><public>:float = external {}

add_item_error<native><public> := class<computes>:


# When adding an item, 'find_inventory_event' is used as a first pass to find the best inventory for an item. It is sent downwards.
# 'add_item_query_event' can be used to veto inventory choices, sent upwards from the inventory (to its ancestors) and downwards from the item entity (to its children).
add_item_query_event<native><public> := class<epic_internal>(scene_event):
    Item<native><public>:item_component

    Inventory<native><public>:inventory_component

    var<private> Errors<native><public>:[]add_item_error = external {}

    AddError<public>(Error:add_item_error):void = external {}

remove_item_error<native><public> := class<computes>:


# Can be used to veto item removal. Sent upwards from the inventory (to its ancestors) and downwards from the item entity (to its children).
remove_item_query_event<native><public> := class<epic_internal>(scene_event):
    Item<native><public>:item_component

    Inventory<native><public>:inventory_component

    var<private> Errors<native><public>:[]remove_item_error = external {}

    AddError<public>(Error:remove_item_error):void = external {}

@class_and_subclass_group_names("inventory")
@experimental
@hide_in_editor
inventory_initialization_component<native><epic_internal> := class<final_super>(component):


@class_and_subclass_group_names("inventory")
# Inventory components hold items. An entity with an inventory component can be considered to have an inventory.
# The inventory component controls which items can enter or exit.
# They also determine whether an item can be equipped.
inventory_component<native><public> := class<final_super>(component):
    OnInitializedInternal<native><override>():void

    OnUninitializingInternal<native><override>():void

    @available {MinUploadedAtFNVersion := 4000}
    OnReceive<override><native>(SceneEvent:scene_event):logic

    @available {MinUploadedAtFNVersion := 3800}
    # Adds the item to this inventory only, ignoring sub-inventories. Fails if no items could be added.
    AddItem<native><final><public>(Item:entity, ?AllowMergeItems:logic = external {})<transacts>:result(add_item_result, []add_item_error)

    @available {MinUploadedAtFNVersion := 3800}
    # Adds the item to this inventory, including sub-inventories. Fails if no items could be added.
    AddItemDistribute<native><final><public>(Item:entity, ?AllowMergeItems:logic = external {})<transacts>:result(add_item_result, []add_item_error)

    @available {MinUploadedAtFNVersion := 3800}
    # Removes an item from this inventory or its descendent inventories. Fails if the item could not be removed.
    RemoveItem<native><final><public>(Item:entity)<transacts>:result(remove_item_result, []remove_item_error)

    # Returns a list of items within this inventory only.
    GetItems<native><final><public>()<reads>:[]entity

    # Returns a list of items (of a specific type) within this inventory only.
    GetItems<native><final><public>(Type:castable_subtype(item_component))<reads>:[]entity

    @available {MinUploadedAtFNVersion := 2930}
    # Returns a list of all items within this inventory and its descendant inventories.
    FindItems<native><final><public>()<reads>:generator(entity)

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

    GetEquippedItems<final><native><public>():[]entity

    InventoryAddedEvent<native><final><epic_internal>:listenable(add_inventory_result) = external {}

    InventoryRemovedEvent<native><final><epic_internal>:listenable(remove_inventory_result) = external {}

    InventoryPropertyChangedEvent<native><final><epic_internal>:listenable(inventory_property_change_result) = external {}

    # Triggered when an item is added. Fires on this inventory, then propagates up to all ancestor inventories.
    AddItemEvent<native><final><public>:listenable(add_item_result) = external {}

    # Triggered when an item is removed. Fires on this inventory, then propagates up to all ancestor inventories.
    RemoveItemEvent<native><final><public>:listenable(remove_item_result) = external {}

    ItemsSlotChangedEvent<native><final><epic_internal>:listenable(change_items_slot_result) = external {}

    @available {MinUploadedAtFNVersion := 3800}
    MakeCanAddItemResultInternal<final><native_callable><epic_internal>(IsSuccess:logic):result(comparable, []add_item_error) = external {}

    @available {MinUploadedAtFNVersion := 3800}
    MakeAddItemResultInternal<final><native_callable><epic_internal>(IsSuccess:logic, AddItemResult:add_item_result):result(add_item_result, []add_item_error) = external {}

    @available {MinUploadedAtFNVersion := 3800}
    MakeCanRemoveItemResultInternal<final><native_callable><epic_internal>(IsSuccess:logic):result(comparable, []remove_item_error) = external {}

    @available {MinUploadedAtFNVersion := 3800}
    MakeRemoveItemResultInternal<final><native_callable><epic_internal>(IsSuccess:logic, RemoveItemResult:remove_item_result):result(remove_item_result, []remove_item_error) = external {}

    var<private> InventoryName<native><epic_internal>:string = external {}

    var<private> InventoryDisplayName<native><epic_internal>:message = external {}

    var<private> InventoryDescription<native><epic_internal>:message = external {}

    var<private> PickupPriority<native><epic_internal>:int = external {}

    # Triggered when an item is equipped. Fires on this inventory, then propagates up to all ancestor inventories.
    EquipItemEvent<native><final><public>:listenable(equip_item_result) = external {}

    # Triggered when an item is unequipped. Fires on this inventory, then propagates up to all ancestor inventories.
    UnequipItemEvent<native><final><public>:listenable(unequip_item_result) = external {}

@available {MinUploadedAtFNVersion := 3800}
# Returns a failure reason (such as being full) if the provided item entity cannot be added. Does not consider sub-inventories.
(Inventory:inventory_component).CanAddItem<native><public>(Item:entity, ?AllowMergeItems:logic = external {})<transacts>:result(false, []add_item_error)

@available {MinUploadedAtFNVersion := 3800}
# Returns a failure reason (such as being full) if the provided item entity cannot be added. AddItemDistribute allows the item to enter sub-inventories.
(Inventory:inventory_component).CanAddItemDistribute<native><public>(Item:entity, ?AllowMergeItems:logic = external {})<transacts>:result(false, []add_item_error)

@available {MinUploadedAtFNVersion := 3800}
# Returns a failure reason if the provided item is not present or cannot be removed.
(Inventory:inventory_component).CanRemoveItem<native><public>(Item:entity)<transacts>:result(false, []remove_item_error)

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

@class_and_subclass_group_names("item")
@experimental
@hide_in_editor
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

@class_and_subclass_group_names("item")
@experimental
item_attach_component<native><final><epic_internal> := class<final_super>(component):
    @editable
    Attachments<native><public>:[]item_attachment_definition = external {}

# item_category is used to classify items.
item_category<native><public> := class<castable><concrete><unique><allocates>:


item_slot_change<native><epic_internal> := struct<epic_internal>:
    Item<native><public>:entity

    PreviousSlot<native><public>:int

    CurrentSlot<native><public>:int

change_equipped_result<native><public> := class<epic_internal>:
    ItemComponent<native><public>:item_component

    IsItemEquipped<native><public>:logic

change_inventory_result<native><public> := class<epic_internal>:
    ItemComponent<native><public>:item_component

    PreviousInventory<native><public>:?inventory_component

    CurrentInventory<native><public>:?inventory_component

equip_item_error<native><public> := class<computes>:


# When equipping an item, 'equip_item_query_event' can be used to veto the equip. It is sent upwards from the inventory (to its ancestors) and downwards from the item entity (to its children).
equip_item_query_event<native><public> := class(scene_event):
    Item<native><public>:item_component

    var<private> Errors<native><public>:[]equip_item_error = external {}

    AddError<public>(Error:equip_item_error):void = external {}

unequip_item_error<native><public> := class<computes>:


# When unequipping an item, 'unequip_item_query_event' can be used to veto the unequip. It is sent upwards from the inventory (to its ancestors) and downwards from the item entity (to its children).
unequip_item_query_event<native><public> := class(scene_event):
    Item<native><public>:item_component

    var<private> Errors<native><public>:[]unequip_item_error = external {}

    AddError<public>(Error:unequip_item_error):void = external {}

change_item_component_event<epic_internal> := class(scene_event):
    Entity<public>:entity

    ItemComponent<public>:?item_component = external {}

@replicatable
@import_as("/Script/ItemizationCoreRuntime.FItemID")
item_id<native><epic_internal> := struct<concrete>:


@class_and_subclass_group_names("item")
# Anything using this component should be considered an item. Required to interact with inventories.
item_component<native><public> := class<final_super>(component):
    OnInitializedInternal<native><override>():void

    OnBeginSimulation<override>():void = external {}

    OnEndSimulation<override>():void = external {}

    # Returns the inventory_component this item currently resides in. Fails if it cannot find a valid parent inventory.
    GetParentInventory<native><final><public>()<decides><reads>:inventory_component

    # Succeeds if this item is considered currently within an inventory and equipped.
    IsEquipped<native><final><public>()<decides><reads>:void

    # Broadcast when this item changes inventory.
    ChangeInventoryEvent<native><final><public>:listenable(change_inventory_result) = external {}

    # Broadcast when this item is equipped or unequipped.
    ChangeEquippedEvent<native><final><public>:listenable(change_equipped_result) = external {}

    @available {MinUploadedAtFNVersion := 3800}
    # Attempts to equip this item within the inventory it is currently in.
    # Fails if not in an inventory or if equip_item_query_event contains any errors after querying.
    Equip<final><native><public>()<transacts>:result(false, []equip_item_error)

    @available {MinUploadedAtFNVersion := 3800}
    # Attempts to unequip this item.
    # Fails if not in an inventory, not currently equipped or if unequip_item_query_event contains any errors after querying.
    Unequip<final><native><public>()<transacts>:result(false, []unequip_item_error)

    @replicated("")
    @editable
    # Add one or more category instances to help define and organize this item.
    Categories<native><public>:[]item_category = external {}

    @available {MinUploadedAtFNVersion := 3800}
    MakeEquipResultInternal<final><native_callable><epic_internal>(IsSuccess:logic):result(comparable, []equip_item_error) = external {}

    @available {MinUploadedAtFNVersion := 3800}
    MakeUnequipResultInternal<final><native_callable><epic_internal>(IsSuccess:logic):result(comparable, []unequip_item_error) = external {}

    # Removes the item from its inventory and places it in the simulation world. Works on orphaned items i.e. outside the world or any inventory.
    #  Fails if the item is already a pickup. The transform of the item will not be altered except to unparent it from any inventory.
    (/UnrealEngine.com/Itemization/item_component:)Drop<native><public>()<transacts><decides>:void

    # Removes the item from its inventory and places it in the simulation world. Works on orphaned items i.e. outside the world or any inventory.
    #  Fails if the item is already in the world. The transform of the dropped item will be set to WorldTransform.
    (/UnrealEngine.com/Itemization/item_component:)Drop<native><public>(WorldTransform:(/Verse.org/SpatialMath:)transform)<transacts><decides>:void

    # Fails if this item is already in an inventory, or the inventory cannot accept the item.
    PickUp<native><public>(Inventory:inventory_component)<transacts><decides>:void

    @available {MinUploadedAtFNVersion := 4200}
    @replicated("")
    ItemID<native><epic_internal>:item_id = external {}

    ItemDefinitionAsset<native><epic_internal>:?item_definition = external {}

    @replicated("")
    var<private> ItemDefinition<native><epic_internal>:?item_definition_base = external {}

@available {MinUploadedAtFNVersion := 3800}
(Item:item_component).CanEquip<native><public>()<transacts>:result(false, []equip_item_error)

@available {MinUploadedAtFNVersion := 3800}
(Item:item_component).CanUnequip<native><public>()<transacts>:result(false, []unequip_item_error)

item_definition<native><epic_internal> := class<epic_internal>(asset):


@import_as("/Script/ItemizationCoreRuntime.UItemDefinitionBase")
item_definition_base<native><epic_internal> := class<epic_internal>:


@experimental
@hide_in_editor
itemization_debug_item_component_mergeable<epic_internal> := class(item_component, has_merge_rules):
    AllowMergeInto<override>(TargetEntity:entity)<decides><reads>:void = external {}

@experimental
itemization_core_debug_library<native><epic_internal> := class:
    AddTestItem<native_callable><public>(InInventory:inventory_component):void = external {}

    @available {MinUploadedAtFNVersion := 4000}
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


@class_and_subclass_group_names("item")
@experimental
# Item component setting owner pose data for this item.
item_owner_pose_modifier_component<native><final><epic_internal> := class<final_super>(component):
    @editable
    EquippedPose<native><public>:?pose_modifier = external {}

    @editable
    NotEquippedPose<native><public>:?pose_modifier = external {}

@class_and_subclass_group_names("item")
@experimental
@hide_in_editor
# Component that allows setting the number of slots used by this item in an inventory.
item_slot_size_component<native><epic_internal> := class<final_super>(component):
    @editable
    SlotSize<native><public>:int = external {}

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


@available {MinUploadedAtFNVersion := 4000}
@experimental
native_item_stackable_component<native><epic_internal> := class(stackable_component):
    Split<override><native>(Amount:int)<transacts><decides>:entity