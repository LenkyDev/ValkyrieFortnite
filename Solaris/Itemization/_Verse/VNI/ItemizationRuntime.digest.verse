using {/Verse.org/SceneGraph}
using {/UnrealEngine.com/Itemization}
@experimental
# `fort_inventory_component` is a shared class for all Fortnite inventories, with appropriate default UI and behavior.
fort_inventory_component<native><public> := class<epic_internal>(inventory_component):
    # Returns the item in the specified slot, if there is one.
    GetItemInSlot<native><public>(Slot:int)<reads><decides>:item_component

    # Returns the total number of slots in this inventory.
    GetMaxSlots<native><public>()<reads><decides>:int

@experimental
# `fort_inventory_weapon_hotbar_component` is the UEFN inventory for Fortnite weapons and gadgets.
fort_inventory_weapon_hotbar_component<native><public> := class<final>(fort_inventory_component):
    # Sets the total number of slots.
    SetMaxSlots<native><public>(InNumSlots:int):void

@experimental
# `fort_inventory_build_hotbar_component` is the UEFN inventory for Fortnite build tools.
fort_inventory_build_hotbar_component<native><public> := class<final>(fort_inventory_component):


@experimental
# `fort_inventory_harvest_tool_component` is the UEFN inventory for the Fortnite harvest tool.
fort_inventory_harvest_tool_component<native><public> := class<final>(fort_inventory_component):


@experimental
# `fort_inventory_trap_component` is the UEFN inventory for the Fortnite trap slot.
fort_inventory_trap_component<native><public> := class<final>(fort_inventory_component):


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
fort_item_pickup_component<native><final><public> := class<final_super>(component):
    var<private> PickupLifetime<native><public>:float = external {}

    OnBeginSimulation<override>():void = external {}

    OnEndSimulation<override>():void = external {}