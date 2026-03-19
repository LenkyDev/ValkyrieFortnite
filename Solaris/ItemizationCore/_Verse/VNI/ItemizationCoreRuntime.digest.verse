using {/Verse.org/Assets}
using {/Verse.org/Presentation}
using {/Verse.org/Simulation}
using {/Verse.org/Native}
using {/Verse.org/SceneGraph}
@experimental
add_item_result<native><public> := class<epic_internal>:
    # Items that were newly added to this inventory as a result of the transaction.
    AddedItems<native><public>:[]entity

    # Items whose stack size changed as a result of the transaction, and the previous stack size value.
    ModifiedItems<native><public>:[]tuple(entity, int)

@experimental
remove_item_result<native><public> := class<epic_internal>:
    # The inventory which the item was removed from.
    Inventory<native><public>:inventory_component

    # Total stack count of items removed as a result of this transaction.
    RemovedAmount<native><public>:int

    # Items that were removed from this inventory as a result of the transaction.
    RemovedItems<native><public>:[]entity

    # Item whose stack size changed as a result of the transaction.
    ModifiedItem<native><public>:?tuple(entity, int)

@experimental
equip_item_result<native><public> := class<epic_internal>:
    Item<native><public>:entity

@experimental
unequip_item_result<native><public> := class<epic_internal>:
    Item<native><public>:entity

@experimental
# When adding an item, 'find_inventory_event' is used as a first pass to find the best inventory for an item. It is sent downwards.
# 'add_item_query_event' can be used to veto inventory choices. It is sent upwards.
find_inventory_event<native><public> := class<epic_internal>(scene_event):
    ItemComponent<native><public>:item_component

    var ChosenInventory<native><public>:?inventory_component = external {}

    var ChosenInventoryPriority<native><public>:float = external {}

@experimental
add_item_error<native><public> := class<computes>:


@experimental
# When adding an item, 'find_inventory_event' is used as a first pass to find the best inventory for an item. It is sent downwards.
# 'add_item_query_event' can be used to veto inventory choices. It is sent upwards.
add_item_query_event<native><public> := class<epic_internal>(scene_event):
    Item<native><public>:item_component

    Inventory<native><public>:inventory_component

    var<private> Errors<native><public>:[]add_item_error = external {}

    AddError<public>(Error:add_item_error):void = external {}

@experimental
remove_item_error<native><public> := class<computes>:


@experimental
remove_item_query_event<native><public> := class<epic_internal>(scene_event):
    Item<native><public>:item_component

    Inventory<native><public>:inventory_component

    var<private> Errors<native><public>:[]remove_item_error = external {}

    AddError<public>(Error:remove_item_error):void = external {}

@experimental
# Inventory components hold items. An entity with an inventory component can be considered to have an inventory.
# The inventory component controls which items can enter or exit.
# They also determine whether an item can be equipped.
inventory_component<native><public> := class<final_super>(component):
    @available {MinUploadedAtFNVersion := 3800}
    # Adds the item to this inventory only, ignoring sub-inventories. Fails if no items could be added.
    AddItem<native><final><public>(Item:entity, ?AllowMergeItems:logic = external {})<transacts>:result(add_item_result, []add_item_error)

    @available {MinUploadedAtFNVersion := 3800}
    # Adds the item to this inventory, including sub-inventories. Fails if no items could be added.
    AddItemDistribute<native><final><public>(Item:entity, ?AllowMergeItems:logic = external {})<transacts>:result(add_item_result, []add_item_error)

    @available {MinUploadedAtFNVersion := 3800}
    # Removes an item from this inventory or its descendent inventories. Fails if the item could not be removed.
    RemoveItem<native><final><public>(Item:entity)<transacts>:result(remove_item_result, []remove_item_error)

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

    GetEquippedItems<final><native><public>():[]entity

    AddItemEvent<native><final><public>:listenable(add_item_result) = external {}

    RemoveItemEvent<native><final><public>:listenable(remove_item_result) = external {}

    EquipItemEvent<native><final><public>:listenable(equip_item_result) = external {}

    UnequipItemEvent<native><final><public>:listenable(unequip_item_result) = external {}

@available {MinUploadedAtFNVersion := 3800}
@experimental
# Returns a failure reason (such as being full) if the provided item entity cannot be added. Does not consider sub-inventories.
(Inventory:inventory_component).CanAddItem<native><public>(Item:entity, ?AllowMergeItems:logic = external {})<transacts>:result(false, []add_item_error)

@available {MinUploadedAtFNVersion := 3800}
@experimental
# Returns a failure reason (such as being full) if the provided item entity cannot be added. AddItemDistribute allows the item to enter sub-inventories.
(Inventory:inventory_component).CanAddItemDistribute<native><public>(Item:entity, ?AllowMergeItems:logic = external {})<transacts>:result(false, []add_item_error)

@available {MinUploadedAtFNVersion := 3800}
@experimental
# Returns a failure reason if the provided item is not present or cannot be removed.
(Inventory:inventory_component).CanRemoveItem<native><public>(Item:entity)<transacts>:result(false, []remove_item_error)

@experimental
# item_category is used to classify items.
item_category<native><public> := class<castable><concrete><unique><allocates>:


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
equip_item_error<native><public> := class<computes>:


@experimental
equip_item_query_event<native><public> := class(scene_event):
    Item<native><public>:item_component

    var<private> Errors<native><public>:[]equip_item_error = external {}

    AddError<public>(Error:equip_item_error):void = external {}

@experimental
unequip_item_error<native><public> := class<computes>:


@experimental
unequip_item_query_event<native><public> := class(scene_event):
    Item<native><public>:item_component

    var<private> Errors<native><public>:[]unequip_item_error = external {}

    AddError<public>(Error:unequip_item_error):void = external {}

@experimental
# Anything using this component should be considered an item. Required to interact with inventories.
item_component<native><public> := class<final_super>(component):
    OnBeginSimulation<override>():void = external {}

    OnEndSimulation<override>():void = external {}

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
    Equip<final><native><public>()<transacts>:result(false, []equip_item_error)

    @available {MinUploadedAtFNVersion := 3800}
    # Attempts to unequip this item.
    # Fails if not in an inventory, not currently equipped or if unequip_item_query_event contains any errors after querying.
    Unequip<final><native><public>()<transacts>:result(false, []unequip_item_error)

    @editable
    # Categories which this item can belong to. Note that some projects may only use the first entry.
    Categories<native><public>:[]item_category = external {}

    # Removes the item from its inventory and places it in the simulation world. Works on orphaned items i.e. outside the world or any inventory.
    #  Fails if the item is already a pickup. The transform of the item will not be altered except to unparent it from any inventory.
    (/UnrealEngine.com/Itemization/item_component:)Drop<native><public>()<transacts><decides>:void

    # Fails if this item is already in an inventory, or the inventory cannot accept the item.
    PickUp<native><public>(Inventory:inventory_component)<transacts><decides>:void

@available {MinUploadedAtFNVersion := 3800}
@experimental
(Item:item_component).CanEquip<native><public>()<transacts>:result(false, []equip_item_error)

@available {MinUploadedAtFNVersion := 3800}
@experimental
(Item:item_component).CanUnequip<native><public>()<transacts>:result(false, []unequip_item_error)

@deprecated
@experimental
# Deprecated. Please use description_component instead.
item_details_component<native><public> := class<final_super>(component, has_description):
    var Name<override>:message = external {}

    var Description<override>:message = external {}

    var ShortDescription<override>:message = external {}

    OnBeginSimulation<override>():void = external {}

    OnEndSimulation<override>():void = external {}

@deprecated
@experimental
# Deprecated. Please use icon_component instead.
item_icon_component<native><public> := class<final_super>(component, has_icon):
    OnBeginSimulation<override>():void = external {}

    OnEndSimulation<override>():void = external {}

    @editable
    var Icon<native><override>:texture