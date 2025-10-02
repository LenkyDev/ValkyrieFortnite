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
# `fort_inventory_weapon_hotbar_component` is the inventory for Fortnite weapons and gadgets.
fort_inventory_weapon_hotbar_component<native><public> := class<final>(fort_inventory_component):
    # Sets the total number of slots.
    SetMaxSlots<native><public>(InNumSlots:int):void

    var TotalSlots<override>:int = external {}

@experimental
# `fort_inventory_build_hotbar_component` is the inventory for Fortnite build tools.
fort_inventory_build_hotbar_component<native><public> := class<final>(fort_inventory_component):
    var TotalSlots<override>:int = external {}

@experimental
# `fort_inventory_harvest_tool_component` is the Fortnite harvest tool inventory.
fort_inventory_harvest_tool_component<native><public> := class<final>(fort_inventory_component):
    var TotalSlots<override>:int = external {}

@experimental
# `fort_inventory_trap_component` is the Fortnite trap slot inventory.
fort_inventory_trap_component<native><public> := class<final>(fort_inventory_component):
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

# Module import path: /Fortnite.com/Itemization/FortniteItemDefinitionUtils
FortniteItemDefinitionUtils<public> := module:


@experimental
fort_item_pickup_component<native><final><public> := class<final_super>(component):
    var<private> PickupLifetime<native><public>:float = external {}

    OnBeginSimulation<override>():void = external {}

    OnEndSimulation<override>():void = external {}