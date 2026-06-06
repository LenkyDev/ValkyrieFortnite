using {/Verse.org/Native}
using {/Verse.org/Simulation}
using {/Verse.org/SceneGraph}
using {/UnrealEngine.com/Itemization}
# `fort_inventory_component` is a shared class for all Fortnite inventories, with appropriate default UI and behavior. The HUD when using the BR Style Inventory Configuration will only be shown when using the default configuration. If new inventories are added you will need to create your own custom HUD using Verse UI.
fort_inventory_component<native><public> := class<epic_internal>(inventory_component):
    # Returns the total number of slots in this inventory.
    GetMaxSlots<native><public>()<reads><decides>:int

# `fort_inventory_weapon_hotbar_component` is the UEFN inventory for Fortnite weapons and gadgets.
fort_inventory_weapon_hotbar_component<native><public> := class<final>(fort_inventory_component):
    # Sets the total number of slots.
    SetMaxSlots<native><public>(InNumSlots:int):void

# `fort_inventory_build_hotbar_component` is the UEFN inventory for Fortnite build tools.
fort_inventory_build_hotbar_component<native><public> := class<final>(fort_inventory_component):


# `fort_inventory_harvest_tool_component` is the UEFN inventory for the Fortnite harvest tool.
fort_inventory_harvest_tool_component<native><public> := class<final>(fort_inventory_component):


# `fort_inventory_trap_component` is the UEFN inventory for the Fortnite trap slot.
fort_inventory_trap_component<native><public> := class<final>(fort_inventory_component):


# `fort_inventory_resources_component` is the inventory for Fortnite resources.
fort_inventory_resources_component<native><public> := class<final>(fort_inventory_component):


# `fort_inventory_ammo_component` is the inventory for Fortnite ammo.
fort_inventory_ammo_component<native><public> := class<final>(fort_inventory_component):


# `fort_inventory_currencies_component` is the inventory for Fortnite currencies.
fort_inventory_currencies_component<native><public> := class<final>(fort_inventory_component):


# Module import path: /Fortnite.com/Itemization/FortniteItemCategories
FortniteItemCategories<public> := module:
    using {/UnrealEngine.com/Itemization}
    WorldItem<public>:item_category = external {}

    Currency<public>:item_category = external {}

    Trap<public>:item_category = external {}

    Ammo<public>:item_category = external {}

    Resource<public>:item_category = external {}

    WeaponMelee<public>:item_category = external {}

    WeaponRanged<public>:item_category = external {}

@available {MinUploadedAtFNVersion := 4040}
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