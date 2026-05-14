using {/UnrealEngine.com/Itemization}
using {/Verse.org/Simulation}
using {/Verse.org/Native}
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

@available {MinUploadedAtFNVersion := 4000}
@class_and_subclass_group_names("inventory")
@deprecated
@experimental
@hide_in_editor
inventory_ui_action_component<native><epic_internal> := class<final><final_super>(component):
    Initialize<native_callable><public>(InventoryComponent:inventory_component):void = external {}

    UninitializeViewModel<native_callable><epic_internal>():void = external {}

@available {MinUploadedAtFNVersion := 4000}
@class_and_subclass_group_names("inventory")
@deprecated
@experimental
@hide_in_editor
inventory_view_model_component<native><epic_internal> := class<final><final_super>(component):
    InitializeViewModel<native_callable><public>(InventoryComponent:inventory_component):void = external {}

    UninitializeViewModel<native_callable><epic_internal>():void = external {}

@experimental
(Inventory:inventory_component).RegisterPropertyInterface<native><epic_internal>(PropertyInterface:parameterized_property_interface, Identifier:string)<transacts><decides>:cancelable

@experimental
(Item:item_component).RegisterPropertyInterface<native><epic_internal>(PropertyInterface:parameterized_property_interface, Identifier:string)<transacts><decides>:cancelable