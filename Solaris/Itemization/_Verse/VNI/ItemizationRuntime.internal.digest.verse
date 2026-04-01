using {/Verse.org/Assets}
using {/Verse.org/Simulation}
using {/Verse.org/Native}
using {/Verse.org/SceneGraph}
using {/UnrealEngine.com/Itemization}
@experimental
# `fort_inventory_component` is a shared class for all Fortnite inventories, with appropriate default UI and behavior.
fort_inventory_component<native><public> := class<epic_internal>(inventory_component):
    # Returns the total number of slots in this inventory.
    GetMaxSlots<native><public>()<reads><decides>:int

    # Returns the item in the specified slot, if there is one.
    GetItemInSlot<native><public>(Slot:int)<reads><decides>:item_component

    # Moves the item to a particular slot. If the item is not already in the inventory, AddItem is called on it. Swaps places with any item already in that slot.
    SetItemInSlot<native><epic_internal>(Item:entity, Slot:int)<reads><decides>:void

    # Takes either a Melee or Ranged weapon item and reloads its initial ammount of ammo. Does not grant extra ammo
    ResetWeaponState<native><epic_internal>(Weapon:item_component)<transacts><decides>:void

@experimental
# `fort_inventory_legacy_quickbar_component` is a shared class for all Fortnite inventories that rely on coupling to the legacy AFortQuickBars class.
fort_inventory_legacy_quickbar_component<native><epic_internal> := class(fort_inventory_component):


@experimental
# `fort_br_inventory_legacy_quickbar_component` is a shared class for FNBR inventories that rely on coupling to the legacy AFortQuickBars class.
fort_br_inventory_legacy_quickbar_component<native><epic_internal> := class(fort_inventory_legacy_quickbar_component):


@experimental
# `fort_inventory_weapon_hotbar_component` is the UEFN inventory for Fortnite weapons and gadgets.
fort_inventory_weapon_hotbar_component<native><public> := class<final>(fort_inventory_component):
    # Returns the item currently selected, if there is one.
    GetEquippedItem<native><epic_internal>()<reads><decides>:item_component

    # Succeeds if the inventory has infinite consumables.
    HasInfiniteConsumables<native><epic_internal>()<reads><decides>:void

    # Sets the total number of slots.
    SetMaxSlots<native><public>(InNumSlots:int):void

    # Called when the time changes from 0 to the reload time, then every frame with the updated time until it reaches 0, or when the reload is canceled and the time is set to 0 early.
    ReloadTimeChangedEvent<native><final><epic_internal>:listenable(float) = external {}

    # Called when the inventory owner's team changes.
    TeamChangedEvent<native><final><epic_internal>:listenable(tuple()) = external {}

    # Called when the inventory owner's class changes.
    ClassChangedEvent<native><final><epic_internal>:listenable(tuple()) = external {}

@experimental
# `fort_br_inventory_weapon_hotbar_component` is the FNBR inventory for Fortnite weapons and gadgets.
fort_br_inventory_weapon_hotbar_component<native><epic_internal> := class<final>(fort_br_inventory_legacy_quickbar_component):
    # Sets the total number of slots.
    SetMaxSlots<native><public>(InNumSlots:int):void

@experimental
# `fort_npc_inventory_weapon_component` is the NPC inventory for Fortnite weapons and gadgets.
fort_npc_inventory_weapon_component<native><epic_internal> := class<final>(fort_inventory_component):
    # Returns the item currently selected, if there is one.
    GetEquippedItem<native><epic_internal>()<reads><decides>:item_component

    @available {MinUploadedAtFNVersion := 4000}
    OnReceive<override>(Event:scene_event):logic = external {}

@experimental
# `fort_inventory_build_hotbar_component` is the UEFN inventory for Fortnite build tools.
fort_inventory_build_hotbar_component<native><public> := class<final>(fort_inventory_component):
    # Returns the item currently selected, if there is one.
    GetEquippedItem<native><epic_internal>()<reads><decides>:item_component

@experimental
# `fort_br_inventory_build_hotbar_component` is the FNBR inventory for Fortnite build tools.
fort_br_inventory_build_hotbar_component<native><epic_internal> := class<final>(fort_br_inventory_legacy_quickbar_component):


@experimental
# `fort_inventory_harvest_tool_component` is the UEFN inventory for the Fortnite harvest tool.
fort_inventory_harvest_tool_component<native><public> := class<final>(fort_inventory_component):
    # Returns the item currently selected, if there is one.
    GetEquippedItem<native><epic_internal>()<reads><decides>:item_component

@experimental
# `fort_br_inventory_harvest_tool_component` is the FNBR inventory for the Fortnite harvest tool.
fort_br_inventory_harvest_tool_component<native><epic_internal> := class<final>(fort_br_inventory_legacy_quickbar_component):


@experimental
# `fort_inventory_trap_component` is the UEFN inventory for the Fortnite trap slot.
fort_inventory_trap_component<native><public> := class<final>(fort_inventory_legacy_quickbar_component):
    # Returns the item currently selected, if there is one.
    GetEquippedItem<native><epic_internal>()<reads><decides>:item_component

    # Called when the trap inventory is updated and visibility flags for each item should be reset
    OnTrapInventoryVisibiltyRefreshEvent<native><final><epic_internal>:listenable(entity) = external {}

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
# `fort_inventory_edit_modecomponent` is the inventory for Fortnite edit mode items.
fort_inventory_edit_mode_component<native><epic_internal> := class<final>(fort_inventory_component):


@experimental
hidden_item_category<epic_internal> := class<allocates>(item_category):


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
    Resource<public>:item_category = external {}

    @experimental
    BuildingPiece<epic_internal>:item_category = external {}

    @experimental
    EditTool<epic_internal>:item_category = external {}

    @experimental
    WeaponHarvest<epic_internal>:item_category = external {}

    @experimental
    WeaponMelee<epic_internal>:item_category = external {}

    @experimental
    WeaponRanged<epic_internal>:item_category = external {}

@experimental
fort_item_definition_entity_base<native><epic_internal> := class<concrete>(entity):
    ItemDefinitionID<native><protected>:string = external {}

@experimental
fort_item_definition_entity<native><epic_internal> := class<concrete>(fort_item_definition_entity_base):
    @field("Components")
    @available {MinUploadedAtFNVersion := 4000}
    ItemComponent<native><protected>:item_component = external {}

@experimental
ExpandItemComponents<native><epic_internal>(InEntity:fort_item_definition_entity_base)<converges>:void

@experimental
MakeIconComponent<native><epic_internal>(IconTexture:texture)<converges>:?icon_component

@available {MinUploadedAtFNVersion := 4000}
@experimental
MakeRarityComponent<native><epic_internal>(Rarity:rarity)<converges>:?rarity_component

@available {MinUploadedAtFNVersion := 4000}
@experimental
MakeStackableComponent<native><epic_internal>(SplitPrefabType:castable_concrete_subtype(entity), StackSize:int, MaxStackSize:?int)<converges>:?stackable_component

# Module import path: /Fortnite.com/Itemization/FortniteItemDefinitionUtils
FortniteItemDefinitionUtils<epic_internal> := module:
    using {/UnrealEngine.com/Itemization}
    using {/Verse.org/SceneGraph}
    @experimental
    AddItemComponents<native><epic_internal>(InEntity:entity, InItemDefinitionID:string, InItemComponentType:subtype(item_component))<converges>:void

    @experimental
    AddItemComponents<native><epic_internal>(InEntity:entity, InItemDefinitionID:string)<converges>:void

@experimental
pickup_overflow_behavior<native><epic_internal> := enum:
    DropExcess
    DestroyExcess

@class_and_subclass_group_names("item")
@experimental
@hide_in_editor
fort_item_pickup_component<native><final><epic_internal> := class<final_super>(component, copy_from_item):
    var<private> PickupLifetime<native><public>:float = external {}

    var<private> PickupOverflowBehavior<native><epic_internal>:pickup_overflow_behavior = external {}

    var<private> DestroyOnDropFromInventory<native><epic_internal>:logic = external {}

    var<private> DropOnOwnerElimination<native><epic_internal>:logic = external {}

    var<private> DropOnOwnerExit<native><epic_internal>:logic = external {}

    OnSimulate<override>()<suspends>:void = external {}

    OnEndSimulation<override>():void = external {}

    CopyFromItem<override><final><native>(SourceItem:entity)<transacts>:void

@available {MinUploadedAtFNVersion := 4000}
# Module import path: /Fortnite.com/Itemization/FortniteRarities
FortniteRarities<public> := module:
    using {/Verse.org/SceneGraph}
    @experimental
    Common<public>:rarity = external {}

    @experimental
    Uncommon<public>:rarity = external {}

    @experimental
    Rare<public>:rarity = external {}

    @experimental
    Epic<public>:rarity = external {}

    @experimental
    Legendary<public>:rarity = external {}

    @experimental
    Mythic<epic_internal>:rarity = external {}

    @experimental
    Exotic<epic_internal>:rarity = external {}

    @experimental
    Impossible<epic_internal>:rarity = external {}

@class_and_subclass_group_names("item")
@experimental
@hide_in_editor
item_attributes_component<native><final><epic_internal> := class<final_super>(component):
    # Succeeds if the item entity is a consumable.
    IsItemConsumable<native><public>()<reads><decides>:void

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