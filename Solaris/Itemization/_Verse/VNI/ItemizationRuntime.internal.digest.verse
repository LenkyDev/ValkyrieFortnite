using {/Verse.org/Presentation}
using {/Verse.org/Assets}
using {/Verse.org/Simulation}
using {/Verse.org/Native}
using {/Verse.org/SceneGraph}
using {/UnrealEngine.com/Itemization}
# `fort_inventory_component` is a shared class for all Fortnite inventories, with appropriate default UI and behavior. The HUD when using the BR Style Inventory Configuration will only be shown when using the default configuration. If new inventories are added you will need to create your own custom HUD using Verse UI.
fort_inventory_component<native><public> := class<epic_internal>(inventory_component):
    # Returns the total number of slots in this inventory.
    GetMaxSlots<native><public>()<reads><decides>:int

    @experimental
    # Returns the item in the specified slot, if there is one. NOTE: this function will only work consistently with custom (pure Verse) inventories *not* fort_inventory_weapon_hotbar_component
    GetItemInSlot<native><epic_internal>(Slot:int)<reads><decides>:item_component

    # Moves the item to a particular slot. If the item is not already in the inventory, AddItem is called on it. Swaps places with any item already in that slot.
    SetItemInSlot<native><epic_internal>(Item:entity, Slot:int)<transacts><decides>:void

    # Takes either a Melee or Ranged weapon item and reloads its initial ammount of ammo. Does not grant extra ammo
    ResetWeaponState<native><epic_internal>(Weapon:item_component)<transacts><decides>:void

# `fort_inventory_legacy_quickbar_component` is a shared class for all Fortnite inventories that rely on coupling to the legacy AFortQuickBars class.
fort_inventory_legacy_quickbar_component<native><epic_internal> := class(fort_inventory_component):


# `fort_br_inventory_legacy_quickbar_component` is a shared class for FNBR inventories that rely on coupling to the legacy AFortQuickBars class.
fort_br_inventory_legacy_quickbar_component<native><epic_internal> := class<abstract>(fort_inventory_legacy_quickbar_component):


# `fort_br_inventory_weapon_hotbar_component` is the FNBR inventory for Fortnite weapons and gadgets.
fort_br_inventory_weapon_hotbar_component<native><epic_internal> := class(fort_br_inventory_legacy_quickbar_component):


# `fort_inventory_weapon_hotbar_component` is the UEFN inventory for Fortnite weapons and gadgets.
fort_inventory_weapon_hotbar_component<native><public> := class<final>(fort_br_inventory_weapon_hotbar_component):
    # Returns the item currently selected, if there is one.
    GetEquippedItem<native><epic_internal>()<reads><decides>:item_component

    # Succeeds if the inventory has infinite consumables.
    HasInfiniteConsumables<native><epic_internal>()<reads><decides>:void

    # Sets the total number of slots.
    SetMaxSlots<native><public>(InNumSlots:int):void

    # Called when the inventory owner's team changes.
    TeamChangedEvent<native><final><epic_internal>:listenable(tuple()) = external {}

    # Called when the inventory owner's class changes.
    ClassChangedEvent<native><final><epic_internal>:listenable(tuple()) = external {}

@experimental
# `fort_npc_inventory_weapon_component` is the NPC inventory for Fortnite weapons and gadgets.
fort_npc_inventory_weapon_component<native><epic_internal> := class<final>(fort_inventory_component):
    # Returns the item currently selected, if there is one.
    GetEquippedItem<native><epic_internal>()<reads><decides>:item_component

    @available {MinUploadedAtFNVersion := 4000}
    OnReceive<override>(Event:scene_event):logic = external {}

# `fort_br_inventory_build_hotbar_component` is the FNBR inventory for Fortnite build tools.
fort_br_inventory_build_hotbar_component<native><epic_internal> := class(fort_br_inventory_legacy_quickbar_component):


# `fort_inventory_build_hotbar_component` is the UEFN inventory for Fortnite build tools.
fort_inventory_build_hotbar_component<native><public> := class<final>(fort_br_inventory_build_hotbar_component):
    # Returns the item currently selected, if there is one.
    GetEquippedItem<native><epic_internal>()<reads><decides>:item_component

# `fort_br_inventory_harvest_tool_component` is the FNBR inventory for the Fortnite harvest tool.
fort_br_inventory_harvest_tool_component<native><epic_internal> := class(fort_br_inventory_legacy_quickbar_component):


# `fort_inventory_harvest_tool_component` is the UEFN inventory for the Fortnite harvest tool.
fort_inventory_harvest_tool_component<native><public> := class<final>(fort_br_inventory_harvest_tool_component):
    # Returns the item currently selected, if there is one.
    GetEquippedItem<native><epic_internal>()<reads><decides>:item_component

# `fort_br_inventory_trap_component` is the FNBR inventory for the Fortnite trap slot.
fort_br_inventory_trap_component<native><epic_internal> := class(fort_br_inventory_legacy_quickbar_component):


# `fort_inventory_trap_component` is the UEFN inventory for the Fortnite trap slot.
fort_inventory_trap_component<native><public> := class<final>(fort_br_inventory_trap_component):


# `fort_inventory_collectible_component` is the inventory for Fortnite collectibles.
fort_inventory_collectibles_component<native><epic_internal> := class<final>(fort_inventory_component):


# `fort_inventory_resources_component` is the inventory for Fortnite resources.
fort_inventory_resources_component<native><public> := class<final>(fort_inventory_component):


# `fort_inventory_ammo_component` is the inventory for Fortnite ammo.
fort_inventory_ammo_component<native><public> := class<final>(fort_inventory_component):


# `fort_inventory_currencies_component` is the inventory for Fortnite currencies.
fort_inventory_currencies_component<native><public> := class<final>(fort_inventory_component):


@experimental
# `fort_inventory_edit_modecomponent` is the inventory for Fortnite edit mode items.
fort_inventory_edit_mode_component<native><epic_internal> := class<final>(fort_inventory_component):


hidden_item_category<epic_internal> := class<allocates>(item_category):


# Module import path: /Fortnite.com/Itemization/FortniteItemCategories
FortniteItemCategories<public> := module:
    using {/UnrealEngine.com/Itemization}
    WorldItem<public>:item_category = external {}

    Currency<public>:item_category = external {}

    Collectible<epic_internal>:item_category = external {}

    Trap<public>:item_category = external {}

    Ammo<public>:item_category = external {}

    Resource<public>:item_category = external {}

    @experimental
    BuildingPiece<epic_internal>:item_category = external {}

    @experimental
    EditTool<epic_internal>:item_category = external {}

    @experimental
    WeaponHarvest<epic_internal>:item_category = external {}

    WeaponMelee<public>:item_category = external {}

    WeaponRanged<public>:item_category = external {}

@hide_in_editor
fort_item_definition_entity_base<native><epic_internal> := class<concrete>(entity):
    ItemDefinitionID<native><protected>:string = external {}

@hide_in_editor
fort_item_definition_entity<native><epic_internal> := class<concrete>(fort_item_definition_entity_base):
    @field("Components")
    @available {MinUploadedAtFNVersion := 4000}
    ItemComponent<native><protected>:item_component = external {}

    @field("Components")
    @available {MinUploadedAtFNVersion := 4020}
    IconComponent<native><protected>:?icon_component = external {}

    @field("Components")
    @available {MinUploadedAtFNVersion := 4020}
    RarityComponent<native><protected>:?rarity_component = external {}

    @field("Components")
    @available {MinUploadedAtFNVersion := 4020}
    StackableComponent<native><protected>:?basic_stackable_component = external {}

ExpandItemComponents<native><epic_internal>(InEntity:fort_item_definition_entity_base)<converges>:void

MakeItemComponent<native><epic_internal>(Category:item_category)<converges>:item_component

@available {MinUploadedAtFNVersion := 4100}
InitializeIconComponentField<native><epic_internal>(IconTexture:texture)<converges>:icon_component

MakeIconComponent<native><epic_internal>(IconTexture:texture)<converges>:?icon_component

@available {MinUploadedAtFNVersion := 4100}
InitializeRarityComponentField<native><epic_internal>(Rarity:rarity)<converges>:rarity_component

@available {MinUploadedAtFNVersion := 4000}
MakeRarityComponent<native><epic_internal>(Rarity:rarity)<converges>:?rarity_component

@available {MinUploadedAtFNVersion := 4100}
InitializeStackableComponentField<native><epic_internal>(SplitPrefabType:castable_concrete_subtype(entity), StackSize:int, MaxStackSize:?int)<converges>:basic_stackable_component

@available {MinUploadedAtFNVersion := 4000}
MakeStackableComponent<native><epic_internal>(SplitPrefabType:castable_concrete_subtype(entity), StackSize:int, MaxStackSize:?int)<converges>:?basic_stackable_component

@available {MinUploadedAtFNVersion := 4100}
InitializeDescriptionComponentField<native><epic_internal>(Name:message, Description:message, ShortDescription:message)<converges>:description_component

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

@available {MinUploadedAtFNVersion := 4040}
@class_and_subclass_group_names("item")
# Place this component onto an entity to allow it to be added to an agent inventory on interaction. The owning entity should have an item_component and a mesh_component. This component expects the interacting agent to have a subentity with an inventory_component.
fort_item_pickup_interactable_component<public> := class(basic_interactable_component):
    OnAddedToScene<override>():void = external {}

    OnRemovingFromScene<override>():void = external {}

    Enable<override>():void = external {}

    Disable<override>():void = external {}

    EnableItemInteraction<protected>():void = external {}

    DisableItemInteraction<protected>():void = external {}

    OnInteractionSucceeded<protected>(Agent:agent):void = external {}

    GetInteractorInventory<public>(Agent:agent)<transacts><decides>:inventory_component = external {}

@available {MinUploadedAtFNVersion := 4000}
# Module import path: /Fortnite.com/Itemization/FortniteRarities
FortniteRarities<public> := module:
    using {/Verse.org/SceneGraph}
    Common<public>:rarity = external {}

    Uncommon<public>:rarity = external {}

    Rare<public>:rarity = external {}

    Epic<public>:rarity = external {}

    Legendary<public>:rarity = external {}

    Mythic<public>:rarity = external {}

    Exotic<public>:rarity = external {}

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

    # Called when the time changes from 0 to the reload time, then every frame with the updated time until it reaches 0, or when the reload is canceled and the time is set to 0 early.
    ReloadTimeChangedEvent<native><final><epic_internal>:listenable(float) = external {}