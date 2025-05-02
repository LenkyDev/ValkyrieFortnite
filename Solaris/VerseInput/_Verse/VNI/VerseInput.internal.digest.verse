using {/UnrealEngine.com/Temporary/SpatialMath}
using {/Verse.org/Assets}
using {/Verse.org/Simulation}
# Module import path: /Verse.org/ControlInput
ControlInput<public> := module:
    input_events<native><public>(t:type) := class<epic_internal>:
        ActivationTriggeredEvent<native><public>:listenable(tuple(player, t)) = external {}

        ActivationCanceledEvent<native><public>:listenable(tuple(player, t, float)) = external {}

        DetectionBeginEvent<native><public>:listenable(tuple(player, t)) = external {}

        DetectionOngoingEvent<native><public>:listenable(tuple(player, t, float)) = external {}

        DetectionEndEvent<native><public>:listenable(tuple(player, float)) = external {}

    GetPlayerInput<native><epic_internal>(Player:player)<transacts><decides>:player_input

    MakeInputAsset<native><epic_internal>(InputAction:input_action(t), Path:string where t:type)<converges>:input_action(t)

    player_input<native><epic_internal> := class:
        AddInputMapping<native><public>(InputMapping:input_mapping):void

        RemoveInputMapping<native><public>(InputMapping:input_mapping):void

        GetInputEvents<native><public>(ActionToBind:input_action(t) where t:type):input_events(t)

        MakeLogicInputEvents<native_callable><epic_internal>():input_events(logic) = external {}

        MakeFloatInputEvents<native_callable><epic_internal>():input_events(float) = external {}

        MakeVector2InputEvents<native_callable><epic_internal>():input_events(vector2) = external {}

        MakeVector3InputEvents<native_callable><epic_internal>():input_events((/UnrealEngine.com/Temporary/SpatialMath:)vector3) = external {}