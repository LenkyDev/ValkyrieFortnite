# Verse path: /Fortnite.com/Itemization
using {/Verse.org/Native}
using {/Verse.org/SceneGraph}
using {/Verse.org/Simulation}
using {/UnrealEngine.com/Itemization}
# `fort_inventory_component` is a shared class for all Fortnite inventories, with appropriate default UI and behavior. The HUD when using the BR Style Inventory Configuration will only be shown when using the default configuration. If new inventories are added you will need to create your own custom HUD using Verse UI.
fort_inventory_component<native><public> := class<epic_internal>(inventory_component):
    # Returns the total number of slots in this inventory.
    GetMaxSlots<native><public>()<decides><reads>:int

# `fort_inventory_weapon_hotbar_component` is the UEFN inventory for Fortnite weapons and gadgets. N.B. This inventory has the lowest priority and Items that do not have the WorldItem category will only be added to it if there is no space in any other valid inventory.
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

# Owner poses let an item affect their owner's default animation stance. 
#  For example, to make a character hold an item like a torch, or a 2-handed weapon.
fort_character_pose_modifier<native><public> := class<abstract><epic_internal>:


fort_character_pose_modifier_fire_torch<public> := class<final><concrete>(fort_character_pose_modifier):


fort_character_pose_modifier_consumable_small<public> := class<final><concrete>(fort_character_pose_modifier):


fort_character_pose_modifier_consumable_large<public> := class<final><concrete>(fort_character_pose_modifier):


fort_character_pose_modifier_flashlight<public> := class<final><concrete>(fort_character_pose_modifier):


fort_character_pose_modifier_map<public> := class<final><concrete>(fort_character_pose_modifier):


fort_item_owner_pose_modifier_component<native><public> := class<final><epic_internal>(item_owner_pose_modifier_component):
    OnAddedToScene<native><override>():void

    OnRemovingFromScene<native><override>():void

    @editable
    # Animation layer to apply when this item is equipped. This can be unset if the item doesn't need custom animation logic for its owner.
    var<private> EquippedPose<native><public>:?fort_character_pose_modifier = external {}

    SetEquippedPose<native><public>(InPose:?fort_character_pose_modifier):void

@available {MinUploadedAtFNVersion := 4040}
# Place this component onto an entity to allow it to be added to an agent inventory on interaction. The owning entity should have an item_component and a mesh_component. This component expects the interacting agent to have a subentity with an inventory_component.
fort_item_pickup_interactable_component<native><public> := class(basic_interactable_component):
    OnAddedToScene<override>():void = external {}

    OnRemovingFromScene<override>():void = external {}

    Enable<override>():void = external {}

    Disable<override>():void = external {}

    CanInteract<native><override>(Agent:agent)<decides><reads>:void

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