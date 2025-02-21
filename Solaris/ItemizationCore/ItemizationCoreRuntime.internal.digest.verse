using {/Verse.org/Colors}
using {/UnrealEngine.com/Abilities}
using {/Verse.org/Assets}
using {/Verse.org/Simulation/Tags}
using {/UnrealEngine.com/EpicGamesRestricted/Network}
using {/Verse.org/Simulation}
using {/Verse.org/Native}
using {/UnrealEngine.com/Temporary/SceneGraph}
@experimental
inventory_creation_type<native><public> := enum<persistable>:
    Runtime
    SetupData

@experimental
add_inventory_result<native><public> := struct<epic_internal>:
    ParentInventory<native><public>:inventory_component

    Inventory<native><public>:inventory_component

@experimental
remove_inventory_result<native><public> := struct<epic_internal>:
    ParentInventory<native><public>:inventory_component

    Inventory<native><public>:inventory_component

@experimental
add_items_result<native><public> := struct<epic_internal>:
    Inventory<native><public>:inventory_component

    AddedItems<native><public>:[]entity

@experimental
remove_items_result<native><public> := struct<epic_internal>:
    Inventory<native><public>:inventory_component

    RemovedItems<native><public>:[]entity

@experimental
change_items_slot_result<native><public> := struct<epic_internal>:
    Inventory<native><public>:inventory_component

    SlotChangedItems<native><public>:[]item_slot_change

@experimental
inventory_property_change_result<native><public> := struct<epic_internal>:
    ParentInventory<native><public>:inventory_component

    Inventory<native><public>:inventory_component

@experimental
inventory_component<native><public> := class<final_super>(component):
    OnInitializedInternal<native><override>():void

    OnUninitializingInternal<native><override>():void

    CanAddItem<native><public>(Item:entity)<decides>:void

    AddItems<native><final><public>(Item:[]entity)<transacts><decides>:add_items_result

    CanRemoveItem<native><public>(Item:entity)<decides>:void

    RemoveItems<native><final><public>(Item:[]entity)<transacts><decides>:remove_items_result

    GetItems<native><final><public>()<computes><reads>:[]entity

    @available {MinUploadedAtFNVersion := 2930}
    FindItems<native><final><public>()<computes><reads>:generator(entity)

    InventoryAddedEvent<native><public>:listenable(add_inventory_result) = external {}

    InventoryRemovedEvent<native><public>:listenable(remove_inventory_result) = external {}

    InventoryPropertyChangedEvent<native><public>:listenable(inventory_property_change_result) = external {}

    ItemsAddedEvent<native><public>:listenable(add_items_result) = external {}

    ItemsRemovedEvent<native><public>:listenable(remove_items_result) = external {}

    ItemsSlotChangedEvent<native><public>:listenable(change_items_slot_result) = external {}

    @editable
    @replicated("")
    var<private> InventoryName<native><public>:string = external {}

    @editable
    @replicated("")
    var<private> InventoryDisplayName<native><public>:message

    @editable
    @replicated("")
    var<private> InventoryDescription<native><public>:message

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

    @replicated("")
    var<private> InventoryType<native><public>:inventory_creation_type = external {}

    @editable
    @replicated("")
    var<private> EnableItemStacking<native><public>:logic = external {}

    @replicated("")
    var<private> InventoryMaxStackSizeOverride<native><public>:int = external {}

@import_as("/Script/ItemizationCoreRuntime.UEquippableItemRestrictionBase")
@experimental
equippable_item_restriction_base<native><public> := class<unique><concrete>:


@experimental
active_item_limit_behavior<native><public> := enum<persistable>:
    UnequipLeastRecentlyUsed
    Block

@experimental
equippable_item_restriction<native><public> := class(equippable_item_restriction_base):
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
equippable_inventory_component<native><public> := class(inventory_component):
    CanEquipItem<native><public>(Item:entity)<decides>:void

    EquipItem<native><public>(Item:entity)<transacts><decides>:void

    UnequipItem<native><public>(Item:entity)<transacts><decides>:void

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
inventory_backpack_component<public> := class(inventory_component):
    var TotalSlots<override>:int = external {}

@experimental
equippable_inventory_slot_component<native><public> := class(equippable_inventory_component):
    var TotalSlots<override>:int = external {}

    EquipmentRestrictionList<override>:[]equippable_item_restriction_base = external {}

    AutoEquipRequirementList<override>:[]item_requirement_base = external {}

@experimental
equippable_inventory_hotbar_component<native><public> := class(equippable_inventory_component):
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
inventory_setup_data_result<native><public> := struct<epic_internal>:
    Inventory<native><public>:inventory_component

    AddedInventoryMap<native><public>:[]tuple(inventory_component, []entity)

@experimental
inventory_setup_data<native><public> := class<concrete>:
    ApplyTo<native><public>(Target:inventory_component)<decides>:inventory_setup_data_result

    @editable
    InventorySetupDataName<native><public>:string = external {}

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
    var<private> ActiveState<native><public>:item_state = external {}

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
item_state<native><public> := enum:
    NotInInventory
    InInventory
    Equipped

@experimental
item_amount_change<native><public> := struct<epic_internal>:
    Item<native><public>:entity

    NewAmount<native><public>:int

    PreviousAmount<native><public>:int

@experimental
item_slot_change<native><public> := struct<epic_internal>:
    Item<native><public>:entity

    NewSlot<native><public>:int

    PreviousSlot<native><public>:int

@experimental
item_state_change<native><public> := struct<epic_internal>:
    Item<native><public>:entity

    NewState<native><public>:item_state

    PreviousState<native><public>:item_state

@experimental
# Anything using this component should be considered an item. Required to interact with inventories.
item_component<native><final><public> := class<final_super>(component):
    OnInitializedInternal<native><override>():void

    GetParentInventory<native><public>()<converges><decides>:inventory_component

    ItemChangedAmountEvent<native><public>:listenable(item_amount_change) = external {}

    ItemChangedSlotEvent<native><public>:listenable(item_slot_change) = external {}

    ItemChangedStateEvent<native><public>:listenable(item_state_change) = external {}

    OnItemStateChanged<native><public>()<transacts><decides>:void

    var<private> State<native><public>:item_state = external {}

    @replicated("")
    var<private> ItemDefinition<native><epic_internal>:?item_definition_base = external {}

@experimental
item_definition_details_component<native><epic_internal> := class(item_details_component):
    GetItemName<native><override>():message

    GetItemDescription<native><override>():message

    GetItemShortDescription<native><override>():message

@experimental
item_details_component<native><epic_internal> := class<final_super>(component):
    GetItemName<native><public>():message

    GetItemDescription<native><public>():message

    GetItemShortDescription<native><public>():message

    @editable
    ItemName<native><localizes><public>:message = external {}

    @editable
    ItemDescription<native><localizes><public>:message = external {}

    @editable
    ItemShortDescription<native><localizes><public>:message = external {}

@experimental
item_icon_component<native><final><epic_internal> := class<final_super>(component):
    @editable
    var<private> Icon<native><public>:?texture = external {}

@experimental
@import_as("/Script/ItemizationCoreRuntime.UItemDefinitionBase")
item_definition_base<native><epic_internal> := class:


@experimental
@import_as("/Script/ItemizationCoreRuntime.UItemOwnerPoseAsset")
item_owner_pose<native><epic_internal> := class<concrete><unique>(asset):


@experimental
item_owner_pose_component<native><final><epic_internal> := class<final_super>(component):
    @editable
    OwnerPose<native><public>:?item_owner_pose = external {}

    @editable
    var<private> PosePriority<native><public>:float = external {}

    @editable
    var<private> ApplyPoseState<native><public>:item_state_filter = external {}

@experimental
item_stack_size_component<native><final><epic_internal> := class<final_super>(component):
    @editable
    var<private> StackSize<native><public>:int = external {}

    @editable
    var<private> MaxStackSize<native><public>:int = external {}

    SetStackSize<native><public>(NewStackSize:int):void

    SetMaxStackSize<native><public>(NewMaxStackSize:int):void

@experimental
item_type<native><public> := class<concrete><unique>:
    @editable
    ItemTypeName<native><public>:string = external {}

    @editable
    ItemTypeDescription<native><public>:string = external {}

    @editable
    ParentType<native><public>:?item_type = external {}

@experimental
DebugItemTypeAmmo<public> := class(item_type):
    ItemTypeName<override>:string = external {}

    ItemTypeDescription<override>:string = external {}

@experimental
DebugItemTypeResources<public> := class(item_type):
    ItemTypeName<override>:string = external {}

    ItemTypeDescription<override>:string = external {}

@experimental
DebugItemTypeCollectables<public> := class(item_type):
    ItemTypeName<override>:string = external {}

    ItemTypeDescription<override>:string = external {}

@experimental
DebugItemTypeCurrencies<public> := class(item_type):
    ItemTypeName<override>:string = external {}

    ItemTypeDescription<override>:string = external {}

@experimental
DebugItemTypeBuildTools<public> := class(item_type):
    ItemTypeName<override>:string = external {}

    ItemTypeDescription<override>:string = external {}

@experimental
item_type_component<native><final><public> := class<final_super>(component):
    GetItemTypeTags<native><epic_internal>():tag_container

    @editable
    var<private> ItemType<native><public>:item_type

@import_as("/Script/ItemizationCoreRuntime.UItemRequirementBase")
@experimental
item_requirement_base<native><public> := class<unique><concrete>:


@experimental
item_requirement<native><public> := class(item_requirement_base):
    CanAcceptItem<native><public>(Item:entity)<transacts><decides>:void

    @editable
    RequirementName<native><public>:string = external {}

    @editable
    RequirementDescription<native><public>:string = external {}

    @editable
    ItemTypeRequirement<native><public>:?item_type = external {}

@experimental
item_rarity<native><public> := class<unique><concrete>:
    @editable
    RarityName<native><public>:string = external {}

    @editable
    RarityDescription<native><public>:string = external {}

    @editable
    RarityColor<native><public>:color = external {}

    @editable
    RarityTier<native><public>:float = external {}

@experimental
item_rarity_component<native><final><public> := class<final_super>(component):
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
