using {/Verse.org/Colors}
using {/UnrealEngine.com/Abilities}
using {/Verse.org/Assets}
using {/Verse.org/Simulation/Tags}
using {/UnrealEngine.com/EpicGamesRestricted/Network}
using {/Verse.org/Simulation}
using {/Verse.org/Native}
using {/Verse.org/SceneGraph}
@experimental
add_inventory_result<native><epic_internal> := struct<epic_internal>:
    ParentInventory<native><public>:inventory_component

    Inventory<native><public>:inventory_component

@experimental
remove_inventory_result<native><epic_internal> := struct<epic_internal>:
    ParentInventory<native><public>:inventory_component

    Inventory<native><public>:inventory_component

@experimental
add_items_result<native><epic_internal> := struct<epic_internal>:
    Inventory<native><public>:inventory_component

    AddedItems<native><public>:[]entity

@experimental
remove_items_result<native><epic_internal> := struct<epic_internal>:
    Inventory<native><public>:inventory_component

    RemovedItems<native><public>:[]entity

@experimental
change_items_slot_result<native><epic_internal> := struct<epic_internal>:
    Inventory<native><public>:inventory_component

    SlotChangedItems<native><public>:[]item_slot_change

@experimental
inventory_property_change_result<native><epic_internal> := struct<epic_internal>:
    ParentInventory<native><public>:inventory_component

    Inventory<native><public>:inventory_component

@experimental
inventory_component<native><epic_internal> := class<final_super>(component):
    OnInitializedInternal<native><override>():void

    OnUninitializingInternal<native><override>():void

    CanAddItem<native><public>(Item:entity)<decides>:void

    AddItems<native><final><public>(Item:[]entity)<transacts><decides>:add_items_result

    CanRemoveItem<native><public>(Item:entity)<decides>:void

    RemoveItems<native><final><public>(Item:[]entity)<transacts><decides>:remove_items_result

    GetItems<native><final><public>()<computes><reads>:[]entity

    @available {MinUploadedAtFNVersion := 2930}
    FindItems<native><final><public>()<computes><reads>:generator(entity)

    GetItemSlot<native><epic_internal>(Item:entity)<computes><reads>:int

    InventoryAddedEvent<native><public>:listenable(add_inventory_result) = external {}

    InventoryRemovedEvent<native><public>:listenable(remove_inventory_result) = external {}

    InventoryPropertyChangedEvent<native><public>:listenable(inventory_property_change_result) = external {}

    ItemsAddedEvent<native><public>:listenable(add_items_result) = external {}

    ItemsRemovedEvent<native><public>:listenable(remove_items_result) = external {}

    ItemsSlotChangedEvent<native><public>:listenable(change_items_slot_result) = external {}

    AddRule<native><final><public>(Rule:inventory_rule_interface)<decides>:cancelable

    var<private> InventoryRuleList<native><public>:[]inventory_rule_interface = external {}

    @editable
    @replicated("")
    var<private> InventoryName<native><public>:string = external {}

    @editable
    @replicated("")
    var<private> InventoryDisplayName<native><public>:message = external {}

    @editable
    @replicated("")
    var<private> InventoryDescription<native><public>:message = external {}

    @editable
    ItemRequirement<native><public>:?item_requirement_base = external {}

    @editable
    @replicated("")
    var<private> TotalSlots<native><protected>:int = external {}

    @editable
    @replicated("")
    var<private> PickupPriority<native><public>:int = external {}

    @editable
    VerseGameplayTags<native><epic_internal>:tag_container = external {}

    @editable
    @replicated("")
    var<private> EnableItemStacking<native><public>:logic = external {}

    @replicated("")
    var<private> InventoryMaxStackSizeOverride<native><public>:int = external {}

@experimental
fail_reason<native><epic_internal> := class:


@experimental
inventory_rule_interface<native><epic_internal> := interface<unique>:
    OnRuleAdded<native_callable><public>(InventoryComponent:inventory_component):void

    CanAddItem<native_callable><public>(InventoryComponent:inventory_component, Item:entity)<computes><reads>:?fail_reason

    CanMergeItem<native_callable><public>(InventoryComponent:inventory_component, Item:entity)<computes><reads>:?fail_reason

    CanRemoveItem<native_callable><public>(InventoryComponent:inventory_component, Item:entity)<computes><reads>:?fail_reason

@import_as("/Script/ItemizationCoreRuntime.UEquippableItemRestrictionBase")
@experimental
equippable_item_restriction_base<native><epic_internal> := class<unique><concrete>:


@experimental
active_item_limit_behavior<native><epic_internal> := enum<persistable>:
    UnequipLeastRecentlyUsed
    Block

@experimental
equippable_item_restriction<native><epic_internal> := class(equippable_item_restriction_base):
    AppliesTo<native><public>(Item:entity)<transacts><decides>:void

    GetActiveSlotLimit<native><public>(Item:entity)<transacts><decides>:int

    GetActiveLimitBehaviour<native><public>(Item:entity)<transacts><decides>:active_item_limit_behavior

    @editable
    ItemRequirement<native><public>:?item_requirement_base = external {}

    @editable
    ActiveSlotLimit<native><public>:int = external {}

    @editable
    ActiveLimitBehaviour<native><public>:active_item_limit_behavior = external {}

@experimental
equippable_inventory_component<native><epic_internal> := class(inventory_component):
    CanEquipItem<native><public>(Item:entity)<decides>:void

    EquipItem<native><public>(Item:entity)<transacts><decides>:void

    UnequipItem<native><public>(Item:entity)<transacts><decides>:void

    GetInputAction<epic_internal>(ItemSlot:int):?input_action(type) = external {}

    GetNativeInputAction<native><epic_internal>(ItemSlot:int):?input_action(type)

    @editable
    EquipmentRestrictionList<native><public>:[]equippable_item_restriction_base = external {}

    @editable
    AutoEquipRequirementList<native><public>:[]item_requirement_base = external {}

    @editable
    SlotBindingList<native><epic_internal>:[]tuple(input_action(type), int) = external {}

    @editable
    ShowSlotBindings<native><public>:logic = external {}

    GetEquippedItems<final><native><public>():[]entity

@experimental
inventory_backpack_component<epic_internal> := class(inventory_component):
    var TotalSlots<override>:int = external {}

@experimental
equippable_inventory_slot_component<native><epic_internal> := class(equippable_inventory_component):
    var TotalSlots<override>:int = external {}

    EquipmentRestrictionList<override>:[]equippable_item_restriction_base = external {}

    AutoEquipRequirementList<override>:[]item_requirement_base = external {}

@experimental
equippable_inventory_hotbar_component<native><epic_internal> := class(equippable_inventory_component):
    var TotalSlots<override>:int = external {}

    EquipmentRestrictionList<override>:[]equippable_item_restriction_base = external {}

    AutoEquipRequirementList<override>:[]item_requirement_base = external {}

@experimental
(InAgent:agent).GetInventory<native><epic_internal>()<transacts><decides>:inventory_component

@experimental
inventory_debug<native><epic_internal> := class:
    AddTestItem<native_callable><public>(InInventory:inventory_component):void = external {}

    AddTestStackableItem<native_callable><public>(InInventory:inventory_component):void = external {}

    RemoveAllItems<native_callable><public>(InInventory:inventory_component):void = external {}

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
inventory_properties_base<native><epic_internal> := class<epic_internal>:
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
    ItemRequirement<native><public>:?item_requirement = external {}

@experimental
inventory_properties<native><epic_internal> := class<epic_internal>(inventory_properties_base):
    @editable
    InventoryClass<native><public>:subtype(inventory_component)

@experimental
equippable_inventory_slot_binding_definition<native><epic_internal> := struct<concrete><epic_internal>:
    @editable_number(int) {MinValue := option {0}}
    Slot<native><public>:int = external {}

    @editable
    InputAction<native><public>:input_action(type) = external {}

@experimental
equippable_inventory_properties<native><epic_internal> := class<epic_internal>(inventory_properties_base):
    @editable
    InventoryClass<native><public>:subtype(equippable_inventory_component)

    @editable
    SlotBindings<native><public>:[]equippable_inventory_slot_binding_definition

@experimental
inventory_setup_data<native><epic_internal> := class<abstract>:
    ApplyTo<public>(Target:inventory_component)<decides>:inventory_setup_data_result

@editable_subclass
@experimental
basic_inventory_setup_data<native><epic_internal> := class<concrete>(inventory_setup_data):
    ApplyTo<native><override>(Target:inventory_component)<decides>:inventory_setup_data_result

    @editable
    EquippableInventoryList<native><public>:[]equippable_inventory_properties = external {}

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
    var AttachmentVisibility<native><public>:item_state_filter = external {}

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
item_slot_change<native><epic_internal> := struct<epic_internal>:
    Item<native><public>:entity

    PreviousSlot<native><public>:int

    CurrentSlot<native><public>:int

@experimental
item_equipped_change<native><epic_internal> := class<epic_internal>:
    ItemComponent<native><public>:item_component

    IsItemEquipped<native><public>:logic

@experimental
item_stack_size_change<native><epic_internal> := class<epic_internal>:
    ItemComponent<native><public>:item_component

    PreviousStackSize<native><public>:int

    CurrentStackSize<native><public>:int

@experimental
item_max_stack_size_change<native><epic_internal> := class<epic_internal>:
    ItemComponent<native><public>:item_component

    PreviousMaxStackSize<native><public>:?int

    CurrentMaxStackSize<native><public>:?int

@experimental
# Anything using this component should be considered an item. Required to interact with inventories.
item_component<native><final><epic_internal> := class<final_super>(component):
    OnInitializedInternal<native><override>():void

    GetParentInventory<native><public>()<converges><decides>:inventory_component

    IsItemEquipped<native><public>()<decides>:void

    EquippedChangedEvent<native><public>:listenable(item_equipped_change) = external {}

    ItemChangedSlotEvent<native><public>:listenable(item_slot_change) = external {}

    StackSizeChangedEvent<native><public>:listenable(item_stack_size_change) = external {}

    MaxStackSizeChangedEvent<native><public>:listenable(item_max_stack_size_change) = external {}

    @replicated("")
    var<private> ItemDefinition<native><epic_internal>:?item_definition_base = external {}

@experimental
# Component that holds the details of an item.
item_details_component<native><epic_internal> := class<final_super>(component):
    @editable
    # Name of the item.
    var<protected> Name<native><localizes><public>:message

    @editable
    # Full description of the item.
    var<protected> Description<native><localizes><public>:message

    @editable
    # Short description of the item with only the essential information.
    var<protected> ShortDescription<native><localizes><public>:message

@experimental
# Component that holds the icon of an item.
item_icon_component<native><epic_internal> := class<final_super>(component):
    @editable
    # Texture used for representing the item in the UI.
    var<protected> Icon<native><public>:texture

@experimental
@import_as("/Script/ItemizationCoreRuntime.UItemDefinitionBase")
item_definition_base<native><epic_internal> := class<epic_internal>:


@experimental
@import_as("/Script/ItemizationCoreRuntime.UItemOwnerPoseAsset")
pose_modifier<native><epic_internal> := class<concrete><unique>(asset):


@experimental
item_owner_pose_modifier_component<native><final><epic_internal> := class<final_super>(component):
    @editable
    EquippedPose<native><public>:?pose_modifier = external {}

    @editable
    NotEquippedPose<native><public>:?pose_modifier = external {}

@experimental
item_stack_size_component<native><final><epic_internal> := class<final_super>(component):
    @editable
    var<private> StackSize<native><public>:int = external {}

    @editable
    var<private> MaxStackSize<native><public>:int = external {}

    SetStackSize<native><public>(NewStackSize:int)<transacts>:void

    SetMaxStackSize<native><public>(NewMaxStackSize:int):void

DefaultText<localizes><epic_internal>:message = external {}

DebugItemTypeAmmoName<localizes><epic_internal>:message = external {}

DebugItemTypeAmmoDescription<localizes><epic_internal>:message = external {}

DebugItemTypeResourcesName<localizes><epic_internal>:message = external {}

DebugItemTypeResourcesDescription<localizes><epic_internal>:message = external {}

DebugItemTypeCollectablesName<localizes><epic_internal>:message = external {}

DebugItemTypeCollectablesDescription<localizes><epic_internal>:message = external {}

DebugItemTypeCurrenciesName<localizes><epic_internal>:message = external {}

DebugItemTypeCurrenciesDescription<localizes><epic_internal>:message = external {}

DebugItemTypeBuildToolsName<localizes><epic_internal>:message = external {}

DebugItemTypeBuildToolsDescription<localizes><epic_internal>:message = external {}

@experimental
item_type<native><epic_internal> := class<concrete><unique>:
    @editable
    ItemTypeName<native><public>:message = external {}

    @editable
    ItemTypeDescription<native><public>:message = external {}

    @editable
    ParentType<native><public>:?item_type = external {}

@experimental
DebugItemTypeAmmo<epic_internal> := class(item_type):
    ItemTypeName<override>:message = external {}

    ItemTypeDescription<override>:message = external {}

@experimental
DebugItemTypeResources<epic_internal> := class(item_type):
    ItemTypeName<override>:message = external {}

    ItemTypeDescription<override>:message = external {}

@experimental
DebugItemTypeCollectables<epic_internal> := class(item_type):
    ItemTypeName<override>:message = external {}

    ItemTypeDescription<override>:message = external {}

@experimental
DebugItemTypeCurrencies<epic_internal> := class(item_type):
    ItemTypeName<override>:message = external {}

    ItemTypeDescription<override>:message = external {}

@experimental
DebugItemTypeBuildTools<epic_internal> := class(item_type):
    ItemTypeName<override>:message = external {}

    ItemTypeDescription<override>:message = external {}

@experimental
item_type_component<native><final><epic_internal> := class<final_super>(component):
    GetItemTypeTags<native><epic_internal>():tag_container

    @editable
    var<private> ItemType<native><public>:item_type

@import_as("/Script/ItemizationCoreRuntime.UItemRequirementBase")
@experimental
item_requirement_base<native><epic_internal> := class<unique><concrete>:


@experimental
item_requirement<native><epic_internal> := class(item_requirement_base):
    CanAcceptItem<native><public>(Item:entity)<transacts><decides>:void

    @editable
    RequirementName<native><public>:string = external {}

    @editable
    RequirementDescription<native><public>:string = external {}

    @editable
    ItemTypeRequirement<native><public>:?item_type = external {}

@experimental
item_rarity<native><epic_internal> := class<unique><concrete>:
    @editable
    RarityName<native><public>:string = external {}

    @editable
    RarityDescription<native><public>:string = external {}

    @editable
    RarityColor<native><public>:color = external {}

    @editable
    RarityTier<native><public>:float = external {}

@experimental
item_rarity_component<native><final><epic_internal> := class<final_super>(component):
    @editable
    var<private> Rarity<native><public>:?item_rarity

@experimental
item_state_filter<native><epic_internal> := enum:
    Owned
    Equipped
    EquippedAndActive

@experimental
# Spawns loot to the world or award it to an agent inventory.
loot_component<native><epic_internal> := class<final_super>(component, enableable):
    Enable<native><override>():void

    Disable<native><override>():void

    IsEnabled<native><override>()<transacts><decides>:void

    SpawnPickups<native><public>(Instigators:[]agent):[]entity

    AwardLoot<native><public>(Target:entity, Instigators:[]agent, DestroyOverflow:logic):[]entity

    @editable
    Items<native><public>:[]entity = external {}

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
    Items<native>:[]entity = external {}

    @editable
    LootPools<native>:[]loot_pool = external {}

@experimental
loot_weight_calculator_info<native><epic_internal> := struct:
    Owner<native>:?entity = external {}

    Instigators<native>:[]agent = external {}

    Items<native>:[]entity = external {}

    LootPools<native>:[]loot_pool = external {}

@experimental
loot_weight_calculator<native><epic_internal> := class<concrete>:


@experimental
loot_weight_calculator_fixed<epic_internal> := class<concrete>(loot_weight_calculator):
