# Verse path: /Verse.org/SceneGraph
# Module import path: /Verse.org/SceneGraph/Movement
Movement<epic_internal> := module:
    using {/Verse.org/Simulation/Tags}
    using {/Verse.org/SpatialMath}
    using {/Verse.org/Native}
    using {/Verse.org/StateMachine}
    using {/Verse.org/Simulation}
    root_movement_mode<native><public> := class<final_super>(movement_mode_base):
        CanEnter<override><final>(MoveState:movement_state)<decides><reads>:void = external {}

        ApplyMove<override><final>(FrameParams:frame_params, CumulativeMove:proposed_move)<reads>:move_result = external {}

        ProposeMove<override><final>(FrameParams:frame_params)<reads>:proposed_move = external {}

    modal_movement_component<native><public> := class(movement_component):
        @editable
        var<protected> DefaultModes<native><public>:[]movement_mode = external {}

        OnBeginSimulation<override>():void = external {}

        GetActiveModeChangedEvent<public>()<reads>:listenable(on_mode_changed_payload) = external {}

        ProposeMove<override><final>(FrameParams:frame_params)<reads>:proposed_move = external {}

        ApplyMove<override><final><native>(ProposedMove:proposed_move, FrameParams:frame_params)<reads>:movement_state

        TryAddMovementMode<public>(MakeModeFunc:type {_(:movement_mode_base)<transacts><decides>:t} where t:subtype(movement_mode))<transacts><decides>:t = external {}

        TryActivateMode<native><protected>(ModeType:subtype(movement_mode))<transacts><decides>:void

    on_mode_changed_payload<native><public> := struct<computes>:
        PreviousMode<native>:movement_mode_base

        NewMode<native>:movement_mode_base

    movement_mode_base<native><public> := class<abstract><final_super>(state):
        CanEnter<native_callable><public>(MoveState:movement_state)<decides><reads>:void = external {}

        ProposeMove<native><native_callable><public>(FrameParams:frame_params)<reads>:proposed_move

        ApplyMove<native><native_callable><public>(FrameParams:frame_params, CumulativeMove:proposed_move)<reads>:move_result

    movement_mode<native><public> := class<abstract><final_super>(movement_mode_base, cancelable):
        Parent<override>:movement_mode_base

        Cancel<override><native>()<transacts>:void

    yield_info<native><public> := struct<computes>:
        TimeUsed<native>:float = external {}

        SuggestedMode<native>:?subtype(movement_mode) = external {}

    move_result<native><public> := struct<concrete><reads>:
        FinalState<native>:movement_state = external {}

        YieldInfo<native>:?yield_info = external {}

    movement_component<native><public> := class<final_super>(component):
        GetLatestMoveState<native><public>()<reads>:movement_state

        ProposeMove<native_callable><protected>(FrameParams:frame_params)<reads>:proposed_move = external {}

        ApplyMove<native_callable><protected>(ProposedMove:proposed_move, FrameParams:frame_params)<reads>:movement_state = external {}

        @editable
        UseTempPredictsAPI<native><epic_internal>:logic = external {}

        ProposeMove_TempPredicts<native_callable><protected>(FrameParams:frame_params)<reads>:proposed_move = external {}

        ApplyMove_TempPredicts<native><native_callable><protected>(ProposedMove:proposed_move, FrameParams:frame_params)<reads>:movement_state

        var TrajectoryGenerationEnabled<epic_internal>:logic = external {}

    @available {MinUploadedAtFNVersion := 4100}
    @experimental
    allows_move_modification<native><public> := interface:
        @editable
        ModifierPipeline<public>:move_modifier_pipeline = external {}

    @available {MinUploadedAtFNVersion := 4100}
    @experimental
    move_modifier<native><public> := class<abstract><castable>(modifier(proposed_move)):
        @editable
        Duration<native><protected>:float = external {}

        GetFrameInfo<native><protected>()<reads>:frame_params

        GetBaseMove<native><protected>()<reads>:proposed_move

        GetStartTime<native><public>()<reads>:?float

        OnStart<native_callable><protected>()<transacts>:void = external {}

        OnEnd<native_callable><protected>()<transacts>:void = external {}

        IsFinalPass<protected>()<decides><reads>:void = external {}

        IsFinished<native_callable><public>(FrameParams:frame_params)<decides><reads>:void = external {}

    @available {MinUploadedAtFNVersion := 4100}
    @experimental
    move_modifier_stack<native><public> := class<abstract><internal>(modifier_stack(proposed_move)):
        Evaluate<override><final><native>(InValue:proposed_move)<reads>:proposed_move

        AddModifier<override>(Modifier:modifier(proposed_move), Position:rational)<transacts>:cancelable = external {}

        AddPhase<public>(Phase:move_modifier_phase)<transacts>:cancelable = external {}

    @available {MinUploadedAtFNVersion := 4100}
    @experimental
    move_modifier_phase<native><public> := class(move_modifier_stack):
        (/Verse.org/Verse/modifier_stack:)AddModifier<override>(Modifier:modifier(proposed_move), Position:rational)<transacts>:cancelable = external {}

        (/Verse.org/SceneGraph/Movement/move_modifier_phase:)AddModifier<public>(Modifier:move_modifier)<transacts>:cancelable = external {}

    @available {MinUploadedAtFNVersion := 4100}
    @experimental
    move_modifier_prioritized_phase<native><public> := class(move_modifier_phase):
        Environmental<native><public>:move_modifier_phase = external {}

        Gameplay<native><public>:move_modifier_phase = external {}

        Forced<native><public>:move_modifier_phase = external {}

    @available {MinUploadedAtFNVersion := 4100}
    @experimental
    move_modifier_pipeline<native><public> := class(move_modifier_stack):
        Base<native><public>:move_modifier_prioritized_phase = external {}

        Additive<native><public>:move_modifier_phase = external {}

        Standard<native><public>:move_modifier_prioritized_phase = external {}

        Limit<native><public>:move_modifier_prioritized_phase = external {}

        Override<native><public>:move_modifier_prioritized_phase = external {}

        ModifyMove<native><public>(BaseMove:proposed_move)<reads>:proposed_move

    proposed_move<native><public> := struct<concrete><computes>:
        LinearVelocity<native>:(/Verse.org/SpatialMath:)vector3 = external {}

        AngularVelocity<native>:(/Verse.org/SpatialMath:)vector3 = external {}

    @import_as("/*.FVerseMovementState")
    movement_state<native><public> := struct<concrete><reads>:
        Location<native>:(/Verse.org/SpatialMath:)vector3 = external {}

        Orientation<native>:(/Verse.org/SpatialMath:)rotation = external {}

        LinearVelocity<native>:(/Verse.org/SpatialMath:)vector3 = external {}

        AngularVelocity<native>:(/Verse.org/SpatialMath:)vector3 = external {}

        StateData<native>:movement_data_collection = external {}

    frame_params<native><public> := struct<reads>:
        StartTime<native>:float

        DeltaTime<native>:float

        InitialState<native>:movement_state = external {}

        TagsInterface<native>:has_tags

    @import_as("/Script/VerseMovement.UVerseMovementData")
    movement_data<native><public> := class<castable><final_super_base><computes><abstract>:


    @import_as("/*.FVerseMovementDataCollection")
    movement_data_collection<native><public> := struct<concrete><computes>:


    (DataCollection:movement_data_collection).FindData<native><public>(t:castable_subtype(movement_data))<decides><reads>:t

    (DataCollection:movement_data_collection).AddData<native><public>(MoveData:movement_data)<reads>:movement_data_collection