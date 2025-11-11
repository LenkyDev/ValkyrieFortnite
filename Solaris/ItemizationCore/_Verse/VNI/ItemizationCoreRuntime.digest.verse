using {/Verse.org/Assets}
using {/Verse.org/Presentation}
using {/Verse.org/Simulation}
using {/Verse.org/Native}
using {/Verse.org/SceneGraph}
@experimental
failure_reason<native><public> := class<castable><concrete><reads>:


@experimental
add_item_result<native><public> := class<epic_internal>:
    # Items that were newly added to this inventory as a result of the transaction.
    AddedItems<native><public>:[]entity

    # Items whose stack size changed as a result of the transaction.
    ModifiedItems<native><public>:[]tuple(entity, int)

@experimental
remove_item_result<native><public> := class<epic_internal>:
    # Total stack count of items removed as a result of this transaction.
    RemovedAmount<native><public>:int

    # Items that were removed from this inventory as a result of the transaction.
    RemovedItems<native><public>:[]entity

    # Item whose stack size changed as a result of the transaction.
    ModifiedItem<native><public>:?entity

@experimental
equip_item_result<native><public> := class<epic_internal>:
    Inventory<native><public>:inventory_component

    Item<native><public>:entity

@experimental
unequip_item_result<native><public> := class<epic_internal>:
    Inventory<native><public>:inventory_component

    Item<native><public>:entity

@experimental
inventory_with_priority<native><public> := class:
    Inventory<native><public>:inventory_component

    Priority<native><public>:float

@experimental
# When adding an item, 'find_inventory_event' is used as a first pass to find the best inventory for an item. It is sent downwards.
# 'add_item_query_event' can be used to veto inventory choices. It is sent upwards.
find_inventory_event<native><public> := class<epic_internal>(scene_event):
    ItemComponent<native><public>:item_component

    var EligibleInventories<native><public>:[]inventory_with_priority

@experimental
add_item_error<native><public> := class<computes>:


@experimental
# When adding an item, 'find_inventory_event' is used as a first pass to find the best inventory for an item. It is sent downwards.
# 'add_item_query_event' can be used to veto inventory choices. It is sent upwards.
add_item_query_event<native><public> := class<epic_internal>(scene_event):
    Item<native><public>:item_component

    Inventory<native><public>:inventory_component

    var Errors<native><public>:[]add_item_error = external {}

@experimental
remove_item_error<native><public> := class<computes>:


@experimental
remove_item_query_event<native><public> := class<epic_internal>(scene_event):
    Item<native><public>:item_component

    Inventory<native><public>:inventory_component

    var Errors<native><public>:[]remove_item_error = external {}

@experimental
# Inventory components hold items. An entity with an inventory component can be considered to have an inventory.
# The inventory component controls which items can enter or exit.
# They also determine whether an item can be equipped.
inventory_component<native><public> := class<final_super>(component):
    # Returns a failure reason (such as being full) if the provided item entity cannot be added.
    CanAddItem<final><native><public>(Item:entity, ?AllowMergeItems:logic = external {}, ?AllowPartialItemMove:logic = external {})<transacts>:?failure_reason

    # Adds items to the inventory. Fails if no items could be added.
    AddItem<native><final><public>(Item:entity, ?AllowMergeItems:logic = external {}, ?AllowPartialItemMove:logic = external {})<transacts><decides>:void

    # Returns a failure reason if the provided item is not present or cannot be removed.
    CanRemoveItem<final><native><public>(Item:entity)<transacts>:?failure_reason

    # Removes items from the inventory. Fails if no items could be removed.
    RemoveItem<native><final><public>(Item:entity)<transacts><decides>:void

    # Returns a list of items within this inventory only.
    GetItems<native><final><public>()<reads>:[]entity

    @available {MinUploadedAtFNVersion := 3200}
    # Returns a list of items (of a specific type) within this inventory only.
    GetItems<native><final><public>(Type:castable_subtype(item_component))<reads>:[]entity

    @available {MinUploadedAtFNVersion := 2930}
    # Returns a list of all items within this inventory and its descendant inventories.
    FindItems<native><final><public>()<reads>:generator(entity)

    @available {MinUploadedAtFNVersion := 3200}
    # Returns a list of all items (of a specific type) within this inventory and its descendant inventories.
    FindItems<native><final><public>(Type:castable_subtype(item_component))<reads>:[]entity

    # Returns a list of sub-inventories of this inventory only.
    GetInventories<native><final><public>()<reads>:[]inventory_component

    @available {MinUploadedAtFNVersion := 2930}
    # Returns a list of all sub-inventories within this inventory and its descendant inventories.
    FindInventories<native><final><public>()<reads>:generator(inventory_component)

    AddItemEvent<native><final><public>:listenable(add_item_result) = external {}

    RemoveItemEvent<native><final><public>:listenable(remove_item_result) = external {}

    # Adds the provided inventory_rule_interface instance to this inventory's rule list if not already present.
    # NOTE: this part of the API is likely to change during Experimental.
    AddRule<native><final><public>(Rule:inventory_rule_interface)<transacts><decides>:cancelable

    var<private> InventoryRuleList<native><public>:[]inventory_rule_interface = external {}

    GetEquippedItems<final><native><public>():[]entity

    EquipItemEvent<native><final><public>:listenable(equip_item_result) = external {}

    UnequipItemEvent<native><final><public>:listenable(unequip_item_result) = external {}

@experimental
# Interface for inventory rules. Used for composable rules for inventories.
# NOTE: this part of the API is likely to change during Experimental.
inventory_rule_interface<native><public> := interface<unique><castable>:
    # Called after an inventory_rule_interface instance is added to an inventory.
    OnRuleAdded<native_callable><public>(InventoryComponent:inventory_component):void = external {}

    CanAddItem<native_callable><public>(InventoryComponent:inventory_component, Item:entity, ?AllowMergeItems:logic = external {}, ?AllowPartialItemMove:logic = external {}):?failure_reason = external {}

    CanMergeItem<native_callable><public>(InventoryComponent:inventory_component, Item:entity):?failure_reason = external {}

    CanRemoveItem<native_callable><public>(InventoryComponent:inventory_component, Item:entity):?failure_reason = external {}

@experimental
invalid_item_failure_reason<native><public> := class<final><reads>(failure_reason):


@experimental
# item_category is used to classify items.
item_category<native><public> := class<castable><concrete><unique><final>:


@experimental
change_equipped_result<native><public> := class<epic_internal>:
    ItemComponent<native><public>:item_component

    IsItemEquipped<native><public>:logic

@experimental
change_inventory_result<native><public> := class<epic_internal>:
    ItemComponent<native><public>:item_component

    PreviousInventory<native><public>:?inventory_component

    CurrentInventory<native><public>:?inventory_component

@experimental
change_stack_size_result<native><public> := class<epic_internal>:
    ItemComponent<native><public>:item_component

    PreviousStackSize<native><public>:int

    CurrentStackSize<native><public>:int

@experimental
change_max_stack_size_result<native><public> := class<epic_internal>:
    ItemComponent<native><public>:item_component

    PreviousMaxStackSize<native><public>:?int

    CurrentMaxStackSize<native><public>:?int

@experimental
equip_item_error<native><public> := class<computes>:


@experimental
equip_item_query_event<native><public> := class(scene_event):
    Item<native><public>:item_component

    Inventory<native><public>:inventory_component

    var<private> Errors<native><public>:[]equip_item_error = external {}

    Reject<public>(Error:equip_item_error):void = external {}

@experimental
unequip_item_error<native><public> := class<computes>:


@experimental
unequip_item_query_event<native><public> := class(scene_event):
    Item<native><public>:item_component

    Inventory<native><public>:inventory_component

    var<private> Errors<native><public>:[]unequip_item_error = external {}

    Reject<public>(Error:unequip_item_error):void = external {}

@experimental
# Anything using this component should be considered an item. Required to interact with inventories.
item_component<native><public> := class<final_super>(component):
    # Returns the inventory_component this item currently resides in. Fails if it cannot find a valid parent inventory.
    GetParentInventory<native><final><public>()<reads><decides>:inventory_component

    # Succeeds if this item is considered currently within an inventory and equipped.
    IsEquipped<native><final><public>()<reads><decides>:void

    # Broadcast when this item changes inventory.
    ChangeInventoryEvent<native><final><public>:listenable(change_inventory_result) = external {}

    # Broadcast when this item is equipped or unequipped.
    ChangeEquippedEvent<native><final><public>:listenable(change_equipped_result) = external {}

    @available {MinUploadedAtFNVersion := 3800}
    # Attempts to equip this item within the inventory it is currently in.
    # Fails if not in an inventory or if equip_item_query_event contains any errors after querying.
    Equip<final><native><public>()<transacts>:result(void, []equip_item_error)

    @available {MinUploadedAtFNVersion := 3800}
    # Attempts to unequip this item.
    # Fails if not in an inventory, not currently equipped or if unequip_item_query_event contains any errors after querying.
    Unequip<final><native><public>()<transacts>:result(void, []unequip_item_error)

    # Takes the specified amount of this item's stack, reducing this item's stack size in the process.
    #  If amount is greater than the amount in the stack, the stack amount will be used instead.
    #  Returns a clone of the item with a stack size equial to the amount it was able to take from the item.
    Take<final><native><public>(Amount:int)<transacts><decides>:entity

    @available {MinUploadedAtFNVersion := 3200}
    # List of item_component classes we can be merged with.
    MergeableItemComponentClasses<native><public>:[]castable_subtype(item_component) = external {}

    @editable
    # Categories which this item can belong to. Note that some projects may only use the first entry.
    Categories<native><public>:[]item_category = external {}

    # Succeeds if this item can be merged into the target item. Merging an entity with itself will always fail.
    CanMergeInto<final><native_callable><public>(TargetItem:entity)<reads><decides>:void = external {}

    # Attempts to merge this item into the specified item. Fails if items cannot be merged or no items are moved.
    #  If TargetAmount is specified, only that amount will try to be merged into this item.
    MergeInto<final><native_callable><public>(TargetItem:entity, ?TargetAmount:?int = external {})<transacts><decides>:void = external {}

    # Current stack size of this item.
    var<protected> StackSize<native><public>:int = external {}

    # Sets the stack size of this item.
    SetStackSize<final><native><public>(NewStackSize:int)<transacts>:void

    # Maximum stack size for this item.
    var<protected> MaxStackSize<native><public>:?int = external {}

    # Sets the maximum stack size for this item. If ClampStackSize is true, StackSize will be clamped to NewMaxStackSize.
    SetMaxStackSize<final><native><public>(NewMaxStackSize:int, ?ClampStackSize:logic = external {})<transacts>:void

    ChangeStackSizeEvent<native><final><public>:listenable(change_stack_size_result) = external {}

    ChangeMaxStackSizeEvent<native><final><public>:listenable(change_max_stack_size_result) = external {}

    # Removes the item from its inventory and places it in the simulation world. Works on orphaned items i.e. outside the world or any inventory. Fails if the item is already a pickup.
    Drop<native><public>()<transacts><decides>:void

    # Fails if this item is already in an inventory, or the inventory cannot accept the item.
    PickUp<native><public>(Inventory:inventory_component)<transacts><decides>:void

@experimental
# Item Merge Rules Interface. Implemented by components that want to participate in item mergeability checks.
has_item_merge_rules<public> := interface<unique>:
    CanMergeInto<public>(TargetItem:entity)<reads><decides>:void = external {}

    OnMergeInto<public>(TargetItem:entity, MergeAmount:int)<transacts>:void = external {}

@experimental
# Component that holds the details of an item.
item_details_component<native><public> := class<final_super>(component, has_description):
    var Name<override>:message = external {}

    var Description<override>:message = external {}

    var ShortDescription<override>:message = external {}

@experimental
# Component that holds the icon for an item.
item_icon_component<native><public> := class<final_super>(component, has_icon):
