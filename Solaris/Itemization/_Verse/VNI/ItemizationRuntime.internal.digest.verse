using {/Verse.org/Assets}
using {/Verse.org/SceneGraph}
using {/UnrealEngine.com/Itemization}
@experimental
# `fort_inventory_component` is a shared class for all Fortnite inventories, with appropriate default UI and behavior.
fort_inventory_component<native><public> := class<epic_internal>(inventory_component):
    # Returns the item in the specified slot, if there is one.
    GetItemInSlot<native><public>(Slot:int)<reads><decides>:item_component

    # Returns the total number of slots in this inventory
    GetMaxSlots<native><public>()<reads><decides>:int

@experimental
# `fort_br_inventory_legacy_quickbar_component` is a shared class for FNBR inventories that rely on coupling to the legacy AFortQuickBars class.
fort_br_inventory_legacy_quickbar_component<native><epic_internal> := class(fort_inventory_component):


@experimental
# `fort_inventory_weapon_hotbar_component` is the UEFN inventory for Fortnite weapons and gadgets.
fort_inventory_weapon_hotbar_component<native><public> := class<final>(fort_inventory_component):
    # Returns the item currently selected, if there is one.
    GetEquippedItem<native><epic_internal>()<reads><decides>:item_component

    # Sets the total number of slots.
    SetMaxSlots<native><public>(InNumSlots:int):void

    # Called when the time changes from 0 to the reload time, then every frame with the updated time until it reaches 0, or when the reload is canceled and the time is set to 0 early.
    ReloadTimeChangedEvent<native><final><epic_internal>:listenable(float) = external {}

    var TotalSlots<override>:int = external {}

@experimental
# `fort_br_inventory_weapon_hotbar_component` is the FNBR inventory for Fortnite weapons and gadgets.
fort_br_inventory_weapon_hotbar_component<native><epic_internal> := class<final>(fort_br_inventory_legacy_quickbar_component):
    # Sets the total number of slots.
    SetMaxSlots<native><public>(InNumSlots:int):void

    var TotalSlots<override>:int = external {}

@experimental
# `fort_inventory_build_hotbar_component` is the UEFN inventory for Fortnite build tools.
fort_inventory_build_hotbar_component<native><public> := class<final>(fort_inventory_component):
    # Returns the item currently selected, if there is one.
    GetEquippedItem<native><epic_internal>()<reads><decides>:item_component

    var TotalSlots<override>:int = external {}

@experimental
# `fort_br_inventory_build_hotbar_component` is the FNBR inventory for Fortnite build tools.
fort_br_inventory_build_hotbar_component<native><epic_internal> := class<final>(fort_br_inventory_legacy_quickbar_component):
    var TotalSlots<override>:int = external {}

@experimental
# `fort_inventory_harvest_tool_component` is the UEFN inventory for the Fortnite harvest tool.
fort_inventory_harvest_tool_component<native><public> := class<final>(fort_inventory_component):
    # Returns the item currently selected, if there is one.
    GetEquippedItem<native><epic_internal>()<reads><decides>:item_component

    var TotalSlots<override>:int = external {}

@experimental
# `fort_br_inventory_harvest_tool_component` is the FNBR inventory for the Fortnite harvest tool.
fort_br_inventory_harvest_tool_component<native><epic_internal> := class<final>(fort_br_inventory_legacy_quickbar_component):
    var TotalSlots<override>:int = external {}

@experimental
# `fort_inventory_trap_component` is the UEFN inventory for the Fortnite trap slot.
fort_inventory_trap_component<native><public> := class<final>(fort_inventory_component):
    # Returns the item currently selected, if there is one.
    GetEquippedItem<native><epic_internal>()<reads><decides>:item_component

@experimental
# `fort_br_inventory_trap_component` is the FNBR inventory for the Fortnite trap slot.
fort_br_inventory_trap_component<native><epic_internal> := class<final>(fort_br_inventory_legacy_quickbar_component):


@experimental
# `fort_inventory_collectible_component` is the inventory for Fortnite collectibles.
fort_inventory_collectibles_component<native><public> := class<final>(fort_inventory_component):


@experimental
# `fort_inventory_resources_component` is the inventory for Fortnite resources.
fort_inventory_resources_component<native><public> := class<final>(fort_inventory_component):


@experimental
# `fort_inventory_ammo_component` is the inventory for Fortnite ammo.
fort_inventory_ammo_component<native><public> := class<final>(fort_inventory_component):


@experimental
# `fort_inventory_currencies_component` is the inventory for Fortnite currencies.
fort_inventory_currencies_component<native><public> := class<final>(fort_inventory_component):


@experimental
fort_inventory_rule<native><epic_internal> := class(inventory_rule_interface):
    CanAddItem<native><override>(InventoryComponent:inventory_component, Item:entity, ?AllowMergeItems:logic = external {}):?failure_reason

    CanMergeItem<native><override>(InventoryComponent:inventory_component, Item:entity):?failure_reason

    CanRemoveItem<native><override>(InventoryComponent:inventory_component, Item:entity):?failure_reason

FortniteItemCategoryWorldItemName<localizes><epic_internal>:message = external {}

FortniteItemCategoryCurrencyName<localizes><epic_internal>:message = external {}

FortniteItemCategoryCollectibleName<localizes><epic_internal>:message = external {}

FortniteItemCategoryTrapName<localizes><epic_internal>:message = external {}

FortniteItemCategoryAmmoName<localizes><epic_internal>:message = external {}

FortniteItemCategoryResourceName<localizes><epic_internal>:message = external {}

FortniteItemCategoryBuildingPieceName<localizes><epic_internal>:message = external {}

FortniteItemCategoryEditToolName<localizes><epic_internal>:message = external {}

FortniteItemCategoryWeaponHarvestName<localizes><epic_internal>:message = external {}

# Module import path: /Fortnite.com/Itemization/FortniteItemCategories
FortniteItemCategories<public> := module:
    using {/UnrealEngine.com/Itemization}
    @experimental
    WorldItem<public>:item_category = external {}

    @experimental
    Currency<public>:item_category = external {}

    @experimental
    Collectible<public>:item_category = external {}

    @experimental
    Trap<public>:item_category = external {}

    @experimental
    Ammo<public>:item_category = external {}

    @experimental
    Resource<epic_internal>:item_category = external {}

    @experimental
    BuildingPiece<epic_internal>:item_category = external {}

    @experimental
    EditTool<epic_internal>:item_category = external {}

    @experimental
    WeaponHarvest<epic_internal>:item_category = external {}

# Module import path: /Fortnite.com/Itemization/FortniteItemDefinitionUtils
FortniteItemDefinitionUtils<epic_internal> := module:
    using {/Verse.org/SceneGraph}
    @experimental
    AddItemComponents<native><epic_internal>(InEntity:entity, InItemDefinitionID:string)<converges>:void

@experimental
pickup_overflow_behavior<native><epic_internal> := enum:
    DropExcess
    DestroyExcess

@experimental
fort_item_pickup_component<native><final><public> := class<final_super>(component, copy_from_item):
    var<private> PickupLifetime<native><public>:float = external {}

    var<private> PickupOverflowBehavior<native><epic_internal>:pickup_overflow_behavior = external {}

    var<private> DestroyOnDropFromInventory<native><epic_internal>:logic = external {}

    var<private> DropOnOwnerDeath<native><epic_internal>:logic = external {}

    var<private> DropOnOwnerExit<native><epic_internal>:logic = external {}

    OnBeginSimulation<override>():void = external {}

    OnEndSimulation<override>():void = external {}

    CopyFromItem<override><final><native>(SourceItem:entity)<transacts>:void

FortniteItemRarityCommonName<localizes><epic_internal>:message = external {}

FortniteItemRarityUncommonName<localizes><epic_internal>:message = external {}

FortniteItemRarityRareName<localizes><epic_internal>:message = external {}

FortniteItemRarityEpicName<localizes><epic_internal>:message = external {}

FortniteItemRarityLegendaryName<localizes><epic_internal>:message = external {}

FortniteItemRarityMythicName<localizes><epic_internal>:message = external {}

FortniteItemRarityExoticName<localizes><epic_internal>:message = external {}

# Module import path: /Fortnite.com/Itemization/FortniteItemRarities
FortniteItemRarities<epic_internal> := module:
    using {/UnrealEngine.com/Itemization}
    @experimental
    Common<public>:item_rarity = external {}

    @experimental
    Uncommon<public>:item_rarity = external {}

    @experimental
    Rare<public>:item_rarity = external {}

    @experimental
    Epic<public>:item_rarity = external {}

    @experimental
    Legendary<public>:item_rarity = external {}

    @experimental
    Mythic<epic_internal>:item_rarity = external {}

    @experimental
    Exotic<epic_internal>:item_rarity = external {}

@experimental
fort_ammo_item_type_source<native><epic_internal> := class(item_type_source):


@experimental
fort_resource_item_type_source<native><epic_internal> := class(item_type_source):


@experimental
fort_currency_item_type_source<native><epic_internal> := class(item_type_source):


@experimental
fort_collection_item_type_source<native><epic_internal> := class(item_type_source):


@experimental
fort_build_tool_item_type_source<native><epic_internal> := class(item_type_source):


@experimental
fort_weapon_ranged_item_type_source<native><epic_internal> := class(item_type_source):


@experimental
fort_weapon_melee_item_type_source<native><epic_internal> := class(item_type_source):


@experimental
fort_gadget_item_type_source<native><epic_internal> := class(item_type_source):


@experimental
item_attributes_component<native><final><epic_internal> := class<final_super>(component):
    GetCurrentDurability<native><public>()<reads>:float

    SetCurrentDurability<native><public>(NewDurability:float):void

    GetMaxDurability<native><public>()<reads>:float

    SetMaxDurability<native><public>(NewMaxDurability:float):void

    GetDurabilityPercent<native><public>()<reads>:float

    GetReserveEnergyPercent<native><public>()<reads>:float

    GetCurrentChargesValue<native><public>()<reads>:int

    GetCurrentAmmoValue<native><public>()<reads>:int

    GetCurrentMagazineValue<native><public>()<reads>:int

    ShowMagazineAsPercentage<native><public>()<reads>:logic

    GetAmmoIcon<native><public>()<reads><decides>:texture

    GetCurrentReserveAmmoValue<native><public>()<reads>:int