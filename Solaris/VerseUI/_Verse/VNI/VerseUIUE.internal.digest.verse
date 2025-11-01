# Module import path: /UnrealEngine.com/SceneGraph
(/UnrealEngine.com:)SceneGraph<public> := module:
    using {/Verse.org/Native}
    @available {MinUploadedAtFNVersion := 3800}
    # Module import path: /UnrealEngine.com/SceneGraph/UI
    (/UnrealEngine.com/SceneGraph:)UI<public> := module:
        using {/UnrealEngine.com/Temporary/UI}
        using {/Verse.org/SceneGraph/UI}
        @experimental
        umg_frame_component<native><epic_internal> := class<abstract>(ui_frame_component):
            Asset<native><epic_internal>:umg_widget_class_asset

            GetViewmodel_<native><epic_internal>(viewmodel_type:type, ViewmodelName:[]char)<transacts>:viewmodel_type

            SetViewmodel_<native><epic_internal>(viewmodel_type:type, ViewmodelName:[]char, ViewmodelInstance:viewmodel_type)<transacts>:void

            GetViewmodelOptional_<native><epic_internal>(viewmodel_type:type, ViewmodelName:[]char)<transacts>:viewmodel_type

            SetViewmodelOptional_<native><epic_internal>(viewmodel_type:type, ViewmodelName:[]char, ViewmodelInstance:viewmodel_type)<transacts>:void

            GetNamedSlot_<native><epic_internal>(NamedSlotName:[]char)<transacts>:widget

            SetNamedSlot_<native><epic_internal>(NamedSlotName:[]char, NamedSlotInstance:widget)<transacts>:void

            GetNamedSlotOptional_<native><epic_internal>(NamedSlotName:[]char)<transacts>:?widget

            SetNamedSlotOptional_<native><epic_internal>(NamedSlotName:[]char, NamedSlotInstance:?widget)<transacts>:void