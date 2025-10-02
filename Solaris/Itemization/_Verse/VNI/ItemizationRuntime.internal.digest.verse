using {/Verse.org/Simulation}
using {/Verse.org/SceneGraph}
using {/UnrealEngine.com/Itemization}
@experimental
# `fort_inventory_component` is a shared class for Fortnite inventories, with appropriate default UI and behavior.
fort_inventory_component<native><public> := class<epic_internal>(inventory_component):
    # Returns the item in the specified slot, if there is one.
    GetItemInSlot<native><public>(Slot:int)<reads><decides>:item_component

    # Returns the total number of slots in this inventory
    GetMaxSlots<native><public>()<reads>:int

@experimental
# `fort_inventory_legacy_quickbar_component` is a shared class for Fortnite inventories that rely on coupling to the legacy AFortQuickBars class.
fort_inventory_legacy_quickbar_component<native><epic_internal> := class<epic_internal>(fort_inventory_component):


@experimental
# `fort_inventory_weapon_hotbar_component` is the inventory for Fortnite weapons and gadgets.
fort_inventory_weapon_hotbar_component<native><public> := class<final>(fort_inventory_legacy_quickbar_component):
    # Returns the item currently selected, if there is one.
    GetEquippedItem<native><epic_internal>()<reads><decides>:item_component

    # Sets the total number of slots.
    SetMaxSlots<native><public>(InNumSlots:int):void

    # Called when the time changes from 0 to the reload time, then every frame with the updated time until it reaches 0, or when the reload is canceled and the time is set to 0 early.
    ReloadTimeChangedEvent<native><final><epic_internal>:listenable(float) = external {}

    var TotalSlots<override>:int = external {}

@experimental
# `fort_inventory_build_hotbar_component` is the inventory for Fortnite build tools.
fort_inventory_build_hotbar_component<native><public> := class<final>(fort_inventory_legacy_quickbar_component):
    # Returns the item currently selected, if there is one.
    GetEquippedItem<native><epic_internal>()<reads><decides>:item_component

    var TotalSlots<override>:int = external {}

@experimental
# `fort_inventory_harvest_tool_component` is the Fortnite harvest tool inventory.
fort_inventory_harvest_tool_component<native><public> := class<final>(fort_inventory_legacy_quickbar_component):
    # Returns the item currently selected, if there is one.
    GetEquippedItem<native><epic_internal>()<reads><decides>:item_component

    var TotalSlots<override>:int = external {}

@experimental
# `fort_inventory_trap_component` is the Fortnite trap slot inventory.
fort_inventory_trap_component<native><public> := class<final>(fort_inventory_legacy_quickbar_component):
    # Returns the item currently selected, if there is one.
    GetEquippedItem<native><epic_internal>()<reads><decides>:item_component

    var TotalSlots<override>:int = external {}

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
    CanAddItem<native><override>(InventoryComponent:inventory_component, Item:entity, ?AllowMergeItems:logic = external {}, ?AllowPartialItemMove:logic = external {}):?failure_reason

    CanMergeItem<native><override>(InventoryComponent:inventory_component, Item:entity):?failure_reason

    CanRemoveItem<native><override>(InventoryComponent:inventory_component, Item:entity):?failure_reason

    @editable
    ItemTypeRequirement<native><public>:?item_type = external {}

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
FortniteItemDefinitionUtils<public> := module:
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

@experimental
fort_ammo_item_type_source<native><epic_internal> := class(item_type_source):
    GetItemType<native><override>(Default:item_type):item_type

@experimental
fort_resource_item_type_source<native><epic_internal> := class(item_type_source):
    GetItemType<native><override>(Default:item_type):item_type

@experimental
fort_currency_item_type_source<native><epic_internal> := class(item_type_source):
    GetItemType<native><override>(Default:item_type):item_type

@experimental
fort_collection_item_type_source<native><epic_internal> := class(item_type_source):
    GetItemType<native><override>(Default:item_type):item_type

@experimental
fort_build_tool_item_type_source<native><epic_internal> := class(item_type_source):
    GetItemType<native><override>(Default:item_type):item_type

@experimental
fort_weapon_ranged_item_type_source<native><epic_internal> := class(item_type_source):
    GetItemType<native><override>(Default:item_type):item_type

@experimental
fort_weapon_melee_item_type_source<native><epic_internal> := class(item_type_source):
    GetItemType<native><override>(Default:item_type):item_type

@experimental
fort_gadget_item_type_source<native><epic_internal> := class(item_type_source):
    GetItemType<native><override>(Default:item_type):item_type

@experimental
item_attributes_component<native><final><epic_internal> := class<final_super>(component):
    GetCurrentDurability<native><public>()<reads>:float

    SetCurrentDurability<native><public>(NewDurability:float):void

    GetMaxDurability<native><public>()<reads>:float

    SetMaxDurability<native><public>(NewMaxDurability:float):void

    GetDurabilityPercent<native><public>()<reads>:float

    GetCurrentChargeValue<native><public>()<reads>:float

    GetCurrentAmmoValue<native><public>()<reads>:int

@experimental
smoke_test_debug_item_type<native><epic_internal> := class(item_type):


@experimental
item_rarity_converter<native><epic_internal> := class<concrete><final>:
    FortniteRarityCommon<native><epic_internal>:item_rarity = external {}

    FortniteRarityUncommon<native><epic_internal>:item_rarity = external {}

    FortniteRarityRare<native><epic_internal>:item_rarity = external {}

    FortniteRarityEpic<native><epic_internal>:item_rarity = external {}

    FortniteRarityLegendary<native><epic_internal>:item_rarity = external {}

    FortniteRarityMythic<native><epic_internal>:item_rarity = external {}

    FortniteRarityTranscendent<native><epic_internal>:item_rarity = external {}

    FortniteRarityUnattainable<native><epic_internal>:item_rarity = external {}

FortniteItemWorldItemName<localizes><epic_internal>:message = external {}

FortniteItemAmmoName<localizes><epic_internal>:message = external {}

FortniteItemBadgeName<localizes><epic_internal>:message = external {}

FortniteItemBackpackPickupName<localizes><epic_internal>:message = external {}

FortniteItemBuildingPieceName<localizes><epic_internal>:message = external {}

FortniteItemCharacterPartName<localizes><epic_internal>:message = external {}

FortniteItemConsumableName<localizes><epic_internal>:message = external {}

FortniteItemDecoName<localizes><epic_internal>:message = external {}

FortniteItemEditToolName<localizes><epic_internal>:message = external {}

FortniteItemIngredientName<localizes><epic_internal>:message = external {}

FortniteItemItemCacheName<localizes><epic_internal>:message = external {}

FortniteItemFoodName<localizes><epic_internal>:message = external {}

FortniteItemGadgetName<localizes><epic_internal>:message = external {}

FortniteItemAthenaGadgetName<localizes><epic_internal>:message = external {}

FortniteItemHomebaseGadgetName<localizes><epic_internal>:message = external {}

FortniteItemSpyTechPerkName<localizes><epic_internal>:message = external {}

FortniteItemHeroAbilityName<localizes><epic_internal>:message = external {}

FortniteItemMissionItemName<localizes><epic_internal>:message = external {}

FortniteItemTrapName<localizes><epic_internal>:message = external {}

FortniteItemMultiItemName<localizes><epic_internal>:message = external {}

FortniteItemWeaponName<localizes><epic_internal>:message = external {}

FortniteItemWeaponMeleeName<localizes><epic_internal>:message = external {}

FortniteItemWeaponRangedName<localizes><epic_internal>:message = external {}

FortniteItemWeaponHarvestName<localizes><epic_internal>:message = external {}

FortniteItemWeaponCreativePhoneName<localizes><epic_internal>:message = external {}

FortniteItemWeaponModName<localizes><epic_internal>:message = external {}

FortniteItemWorldResourceName<localizes><epic_internal>:message = external {}

FortniteItemCreativeUserPrefabName<localizes><epic_internal>:message = external {}

FortniteItemCreativePlaysetName<localizes><epic_internal>:message = external {}

FortniteItemVehicleName<localizes><epic_internal>:message = external {}

FortniteItemNpcName<localizes><epic_internal>:message = external {}

FortniteItemPlayerAugmentName<localizes><epic_internal>:message = external {}

FortniteItemCollectedResourceName<localizes><epic_internal>:message = external {}

FortniteItemCurrencyName<localizes><epic_internal>:message = external {}

@experimental
item_type_converter<native><epic_internal> := class<concrete><final>:
    FortniteTypeWorldItem<native><epic_internal>:item_type = external {}

    FortniteTypeAmmo<native><epic_internal>:item_type = external {}

    FortniteTypeBadge<native><epic_internal>:item_type = external {}

    FortniteTypeBackpackPickup<native><epic_internal>:item_type = external {}

    FortniteTypeBuildingPiece<native><epic_internal>:item_type = external {}

    FortniteTypeCharacterPart<native><epic_internal>:item_type = external {}

    FortniteTypeConsumable<native><epic_internal>:item_type = external {}

    FortniteTypeDeco<native><epic_internal>:item_type = external {}

    FortniteTypeEditTool<native><epic_internal>:item_type = external {}

    FortniteTypeIngredient<native><epic_internal>:item_type = external {}

    FortniteTypeItemCache<native><epic_internal>:item_type = external {}

    FortniteTypeFood<native><epic_internal>:item_type = external {}

    FortniteTypeGadget<native><epic_internal>:item_type = external {}

    FortniteTypeAthenaGadget<native><epic_internal>:item_type = external {}

    FortniteTypeHomebaseGadget<native><epic_internal>:item_type = external {}

    FortniteTypeSpyTechPerk<native><epic_internal>:item_type = external {}

    FortniteTypeHeroAbility<native><epic_internal>:item_type = external {}

    FortniteTypeMissionItem<native><epic_internal>:item_type = external {}

    FortniteTypeTrap<native><epic_internal>:item_type = external {}

    FortniteTypeMultiItem<native><epic_internal>:item_type = external {}

    FortniteTypeWeapon<native><epic_internal>:item_type = external {}

    FortniteTypeWeaponMelee<native><epic_internal>:item_type = external {}

    FortniteTypeWeaponRanged<native><epic_internal>:item_type = external {}

    FortniteTypeWeaponHarvest<native><epic_internal>:item_type = external {}

    FortniteTypeWeaponCreativePhone<native><epic_internal>:item_type = external {}

    FortniteTypeWeaponMod<native><epic_internal>:item_type = external {}

    FortniteTypeWorldResource<native><epic_internal>:item_type = external {}

    FortniteTypeCreativeUserPrefab<native><epic_internal>:item_type = external {}

    FortniteTypeCreativePlayset<native><epic_internal>:item_type = external {}

    FortniteTypeVehicle<native><epic_internal>:item_type = external {}

    FortniteTypeNpc<native><epic_internal>:item_type = external {}

    FortniteTypePlayerAugment<native><epic_internal>:item_type = external {}

    FortniteTypeCollectedResource<native><epic_internal>:item_type = external {}

    FortniteTypeCurrency<native><epic_internal>:item_type = external {}