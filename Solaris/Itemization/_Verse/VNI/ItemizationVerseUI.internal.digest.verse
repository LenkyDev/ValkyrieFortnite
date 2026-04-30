using {/Verse.org/Colors}
using {/Verse.org/Simulation}
using {/Verse.org/Native}
using {/Verse.org/Presentation}
using {/UnrealEngine.com/Itemization}
using {/Verse.org/SceneGraph}
using {/Verse.org/Temporary/EpicGamesRestricted/Network}
using {/Verse.org/Assets}
inventory_item_action_property_interface_asset<epic_internal>:property_interface_UE5_definition = external {}

inventory_item_action_property_interface<epic_internal> := class<public>(parameterized_property_interface):
    UE5Class<override>:property_interface_UE5_definition = external {}

    @replicated("RepNotify=___PropertyInterface_On_IsSelected_Changed")
    var IsSelected<public>:logic = external {}

    @replicated("RepNotify=___PropertyInterface_On_RequestSelect_Changed")
    var<private> RequestSelect<public>:logic = external {}

    @replicated("RepNotify=___PropertyInterface_On_IsHovered_Changed")
    var IsHovered<public>:logic = external {}

    @replicated("RepNotify=___PropertyInterface_On_RequestHover_Changed")
    var<private> RequestHover<public>:logic = external {}

    @replicated("RepNotify=___PropertyInterface_On_IsSwapping_Changed")
    var IsSwapping<public>:logic = external {}

    RequestSelectChangedEvent<public>:subscribable_event_intrnl(inventory_item_action_property_interface) = external {}

    SetRequestSelect<public>(NewRequestSelect:logic):void = external {}

    RequestHoverChangedEvent<public>:subscribable_event_intrnl(inventory_item_action_property_interface) = external {}

    SetRequestHover<public>(NewRequestHover:logic):void = external {}

    ___PropertyInterface_On_IsSelected_Changed<epic_internal>():void = external {}

    ___PropertyInterface_On_RequestSelect_Changed<epic_internal>():void = external {}

    ___PropertyInterface_On_IsHovered_Changed<epic_internal>():void = external {}

    ___PropertyInterface_On_RequestHover_Changed<epic_internal>():void = external {}

    ___PropertyInterface_On_IsSwapping_Changed<epic_internal>():void = external {}

@available {MinUploadedAtFNVersion := 4000}
@class_and_subclass_group_names("inventory")
@deprecated
@experimental
@hide_in_editor
inventory_item_view_model_component<native><epic_internal> := class<final><final_super>(component):
    InitializeViewModel<native_callable><public>(Item:entity):void = external {}

    UninitializeViewModel<native_callable><epic_internal>():void = external {}

    OnReceive<override>(SceneEvent:scene_event):logic = external {}

    RefreshViewModel<public>(Item:entity):void = external {}

    OnTeamOrClassChanged<protected>():void = external {}

    OnItemCountChanged<protected>(ItemComponent:item_component):void = external {}

    OnStackSizeChanged<protected>(ItemStackSizeChange:change_stack_size_result):void = external {}

    OnItemChanged<protected>(OptionalItemComponent:?item_component):void = external {}

    OnStackableChanged<protected>(OptionalStackableComponent:?stackable_component):void = external {}

    OnIconChanged<protected>(OptionalIconComponent:?icon_component):void = external {}

    OnDetailsChanged<protected>(OptionalDetailsComponent:?description_component):void = external {}

    OnRarityChanged<protected>(OptionalRarityComponent:?rarity_component):void = external {}

    OnReloadTimeChanged<protected>(NewTime:float):void = external {}

    OnTrapInventoryVisibiltyRefresh<protected>(TrapEntity:entity):void = external {}

    OnSimulate<override>()<suspends>:void = external {}

    GetCategoryDisplayName<native><public>(ItemComponent:item_component)<reads>:message

    PropertyInterface<public>:InventoryItemPropertyInterface = external {}

    var StartingReloadTime<protected>:float = external {}

@available {MinUploadedAtFNVersion := 4000}
@class_and_subclass_group_names("inventory")
@deprecated
@experimental
@hide_in_editor
inventory_ui_action_component<native><epic_internal> := class<final><final_super>(component):
    Initialize<native_callable><public>(InventoryComponent:inventory_component):void = external {}

    UninitializeViewModel<native_callable><epic_internal>():void = external {}

    HandleRequestDropSelectedItem<protected>():void = external {}

    HandleRequestDropHalfSelectedItem<protected>():void = external {}

    HandleRequestUseSelectedItem<protected>():void = external {}

    HandleRequestSwapSelectedItem<protected>():void = external {}

    HandleRequestInventoryClosedEvent<protected>():void = external {}

    HandleRequestInventoryOpenedEvent<protected>():void = external {}

    SwapItem<protected>(Item:entity):void = external {}

    ResetSwap<protected>()<transacts>:void = external {}

    HandleItemsAdded<protected>(AddItemResult:add_item_result):void = external {}

    HandleItemsRemoved<protected>(RemoveItemResult:remove_item_result):void = external {}

    HandleEquipItem<protected>(EquipItemResult:equip_item_result):void = external {}

    HandleUnequipItem<protected>(UnequipItemResult:unequip_item_result):void = external {}

    UpdateIsInventoryAllowedToSwap<protected>():void = external {}

InventoryActionPropertyInterface_asset<epic_internal>:property_interface_UE5_definition = external {}

InventoryActionPropertyInterface<epic_internal> := class<public>(parameterized_property_interface):
    UE5Class<override>:property_interface_UE5_definition = external {}

    @replicated("RepNotify=___PropertyInterface_On_IsSwapping_Changed")
    var IsSwapping<public>:logic = external {}

    @replicated("RepNotify=___PropertyInterface_On_RequestDropSelectedItem_Changed")
    var<private> RequestDropSelectedItem<public>:logic = external {}

    RequestDropSelectedItemChangedEvent<public>:listenable(tuple()) = external {}

    SetRequestDropSelectedItem<public>(NewRequestDropSelectedItem:logic):void = external {}

    @replicated("RepNotify=___PropertyInterface_On_RequestDropHalfSelectedItem_Changed")
    var<private> RequestDropHalfSelectedItem<public>:logic = external {}

    RequestDropHalfSelectedItemChangedEvent<public>:listenable(tuple()) = external {}

    SetRequestDropHalfSelectedItem<public>(NewRequestDropHalfSelectedItem:logic):void = external {}

    @replicated("RepNotify=___PropertyInterface_On_RequestUseSelectedItem_Changed")
    var<private> RequestUseSelectedItem<public>:logic = external {}

    RequestUseSelectedItemChangedEvent<public>:listenable(tuple()) = external {}

    SetRequestUseSelectedItem<public>(NewRequestUseSelectedItem:logic):void = external {}

    @replicated("RepNotify=___PropertyInterface_On_RequestSwapSelectedItem_Changed")
    var<private> RequestSwapSelectedItem<public>:logic = external {}

    RequestSwapSelectedItemChangedEvent<public>:listenable(tuple()) = external {}

    SetRequestSwapSelectedItem<public>(NewRequestSwapSelectedItem:logic):void = external {}

    @replicated("RepNotify=___PropertyInterface_On_IsInventoryActive_Changed")
    var<private> IsInventoryActive<public>:logic = external {}

    RequestInventoryClosedEvent<public>:listenable(tuple()) = external {}

    RequestInventoryOpenedEvent<public>:listenable(tuple()) = external {}

    SetIsInventoryActive<public>(NewIsInventoryActive:logic):void = external {}

    ___PropertyInterface_On_SelectedItem_Changed<epic_internal>():void = external {}

    ___PropertyInterface_On_HoveredItem_Changed<epic_internal>():void = external {}

    ___PropertyInterface_On_EquippedItem_Changed<epic_internal>():void = external {}

    ___PropertyInterface_On_IsInventoryAllowedToSwap_Changed<epic_internal>():void = external {}

    ___PropertyInterface_On_IsSwapping_Changed<epic_internal>():void = external {}

    ___PropertyInterface_On_RequestDropSelectedItem_Changed<epic_internal>():void = external {}

    ___PropertyInterface_On_RequestDropHalfSelectedItem_Changed<epic_internal>():void = external {}

    ___PropertyInterface_On_RequestUseSelectedItem_Changed<epic_internal>():void = external {}

    ___PropertyInterface_On_RequestSwapSelectedItem_Changed<epic_internal>():void = external {}

    ___PropertyInterface_On_IsInventoryActive_Changed<epic_internal>():void = external {}

InventoryActionPropertyInterface_subscribable_property_changed_event<epic_internal> := class(subscribable_event_intrnl(tuple())):


@available {MinUploadedAtFNVersion := 4000}
@class_and_subclass_group_names("inventory")
@deprecated
@experimental
@hide_in_editor
inventory_view_model_component<native><epic_internal> := class<final><final_super>(component):
    InitializeViewModel<native_callable><public>(InventoryComponent:inventory_component):void = external {}

    UninitializeViewModel<native_callable><epic_internal>():void = external {}

    HandleInventoryAdded<protected>(AddInventoryResult:add_inventory_result):void = external {}

    HandleInventoryRemoved<protected>(RemoveInventoryResult:remove_inventory_result):void = external {}

    HandleInventoryPropertyChanged<public>(InventoryPropertyChangeResult:inventory_property_change_result):void = external {}

    HandleItemsAdded<public>(AddItemResult:add_item_result):void = external {}

    HandleItemsRemoved<public>(RemoveItemResult:remove_item_result):void = external {}

    HandleItemSlotsChanged<public>(ItemSlotsChangedResult:change_items_slot_result):void = external {}

    PropertyInterface<public>:InventoryPropertyInterface = external {}

@experimental
(Inventory:inventory_component).RegisterPropertyInterface<native><epic_internal>(PropertyInterface:parameterized_property_interface, Identifier:string)<transacts><decides>:cancelable

@experimental
(Item:item_component).RegisterPropertyInterface<native><epic_internal>(PropertyInterface:parameterized_property_interface, Identifier:string)<transacts><decides>:cancelable

InventoryPropertyInterface_asset<epic_internal>:property_interface_UE5_definition = external {}

InventoryPropertyInterface<epic_internal> := class<public>(parameterized_property_interface):
    UE5Class<override>:property_interface_UE5_definition = external {}

    @replicated("RepNotify=___PropertyInterface_On_MagazineAmmo_Changed")
    var MagazineAmmo<public>:int = external {}

    @replicated("RepNotify=___PropertyInterface_On_ReserveAmmo_Changed")
    var ReserveAmmo<public>:int = external {}

    @replicated("RepNotify=___PropertyInterface_On_ShowMagazineAsPercentage_Changed")
    var ShowMagazineAsPercentage<public>:logic = external {}

    ___PropertyInterface_On_InventoryName_Changed<epic_internal>():void = external {}

    ___PropertyInterface_On_InventoryDisplayName_Changed<epic_internal>():void = external {}

    ___PropertyInterface_On_InventoryDescription_Changed<epic_internal>():void = external {}

    ___PropertyInterface_On_TotalSlots_Changed<epic_internal>():void = external {}

    ___PropertyInterface_On_MagazineAmmo_Changed<epic_internal>():void = external {}

    ___PropertyInterface_On_ReserveAmmo_Changed<epic_internal>():void = external {}

    ___PropertyInterface_On_ShowMagazineAsPercentage_Changed<epic_internal>():void = external {}

    ___PropertyInterface_On_InventoryPropertyInterfaces_Changed<epic_internal>():void = external {}

    ___PropertyInterface_On_ItemPropertyInterfaces_Changed<epic_internal>():void = external {}

InventoryItemPropertyInterface_asset<epic_internal>:property_interface_UE5_definition = external {}

InventoryItemPropertyInterface<epic_internal> := class<public>(parameterized_property_interface):
    UE5Class<override>:property_interface_UE5_definition = external {}

    @replicated("RepNotify=___PropertyInterface_On_IsValid_Changed")
    var IsValid<public>:logic = external {}

    @replicated("RepNotify=___PropertyInterface_On_IsActive_Changed")
    var IsActive<public>:logic = external {}

    @replicated("RepNotify=___PropertyInterface_On_Amount_Changed")
    var Amount<public>:int = external {}

    @replicated("RepNotify=___PropertyInterface_On_ItemName_Changed")
    var ItemName<public>:message = external {}

    @replicated("RepNotify=___PropertyInterface_On_ItemDescription_Changed")
    var ItemDescription<public>:message = external {}

    @replicated("RepNotify=___PropertyInterface_On_ItemShortDescription_Changed")
    var ItemShortDescription<public>:message = external {}

    @replicated("RepNotify=___PropertyInterface_On_ItemIcon_Changed")
    var ItemIcon<public>:texture = external {}

    @replicated("RepNotify=___PropertyInterface_On_Durability_Changed")
    var Durability<public>:float = external {}

    @replicated("RepNotify=___PropertyInterface_On_Energy_Changed")
    var Energy<public>:float = external {}

    @replicated("RepNotify=___PropertyInterface_On_Charges_Changed")
    var Charges<public>:int = external {}

    @replicated("RepNotify=___PropertyInterface_On_Ammo_Changed")
    var (/Fortnite.com/Itemization/InventoryItemPropertyInterface:)Ammo<public>:int = external {}

    @replicated("RepNotify=___PropertyInterface_On_AmmoIcon_Changed")
    var AmmoIcon<public>:texture = external {}

    @replicated("RepNotify=___PropertyInterface_On_ShowAmmoIcon_Changed")
    var ShowAmmoIcon<public>:logic = external {}

    @replicated("RepNotify=___PropertyInterface_On_ReloadPercent_Changed")
    var ReloadPercent<public>:float = external {}

    @replicated("RepNotify=___PropertyInterface_On_ReloadTime_Changed")
    var ReloadTime<public>:float = external {}

    @replicated("RepNotify=___PropertyInterface_On_RarityTier_Changed")
    var RarityTier<public>:int = external {}

    @replicated("RepNotify=___PropertyInterface_On_RarityColor_Changed")
    var RarityColor<public>:color = external {}

    @replicated("RepNotify=___PropertyInterface_On_ItemTypeName_Changed")
    var ItemTypeName<public>:message = external {}

    @replicated("RepNotify=___PropertyInterface_On_InputAction_Changed")
    var InputAction<public>:input_action(type) = external {}

    @replicated("RepNotify=___PropertyInterface_On_CyclePreviousInputAction_Changed")
    var CyclePreviousInputAction<public>:input_action(type) = external {}

    @replicated("RepNotify=___PropertyInterface_On_CycleNextInputAction_Changed")
    var CycleNextInputAction<public>:input_action(type) = external {}

    @replicated("RepNotify=___PropertyInterface_On_SlotSize_Changed")
    var SlotSize<public>:int = external {}

    @replicated("RepNotify=___PropertyInterface_On_FirstToUse_Changed")
    var FirstToUse<public>:logic = external {}

    ___PropertyInterface_On_IsValid_Changed<epic_internal>():void = external {}

    ___PropertyInterface_On_IsActive_Changed<epic_internal>():void = external {}

    ___PropertyInterface_On_Amount_Changed<epic_internal>():void = external {}

    ___PropertyInterface_On_ItemName_Changed<epic_internal>():void = external {}

    ___PropertyInterface_On_ItemDescription_Changed<epic_internal>():void = external {}

    ___PropertyInterface_On_ItemShortDescription_Changed<epic_internal>():void = external {}

    ___PropertyInterface_On_ItemIcon_Changed<epic_internal>():void = external {}

    ___PropertyInterface_On_Durability_Changed<epic_internal>():void = external {}

    ___PropertyInterface_On_Energy_Changed<epic_internal>():void = external {}

    ___PropertyInterface_On_Charges_Changed<epic_internal>():void = external {}

    ___PropertyInterface_On_Ammo_Changed<epic_internal>():void = external {}

    ___PropertyInterface_On_AmmoIcon_Changed<epic_internal>():void = external {}

    ___PropertyInterface_On_ShowAmmoIcon_Changed<epic_internal>():void = external {}

    ___PropertyInterface_On_ReloadPercent_Changed<epic_internal>():void = external {}

    ___PropertyInterface_On_ReloadTime_Changed<epic_internal>():void = external {}

    ___PropertyInterface_On_RarityTier_Changed<epic_internal>():void = external {}

    ___PropertyInterface_On_RarityColor_Changed<epic_internal>():void = external {}

    ___PropertyInterface_On_ItemTypeName_Changed<epic_internal>():void = external {}

    ___PropertyInterface_On_InputAction_Changed<epic_internal>():void = external {}

    ___PropertyInterface_On_CyclePreviousInputAction_Changed<epic_internal>():void = external {}

    ___PropertyInterface_On_CycleNextInputAction_Changed<epic_internal>():void = external {}

    ___PropertyInterface_On_SlotSize_Changed<epic_internal>():void = external {}

    ___PropertyInterface_On_FirstToUse_Changed<epic_internal>():void = external {}