# Verse path: /UnrealEngine.com/Character
using {/Verse.org/Temporary/EpicGamesRestricted/Network}
using {/Verse.org/SceneGraph/Movement}
using {/Verse.org/Assets}
using {/UnrealEngine.com/Abilities}
using {/Verse.org/Simulation}
using {/Verse.org/SpatialMath}
using {/Verse.org/SceneGraph}
using {/Verse.org/Native}
using {/Verse.org/StateMachine}
@available {MinUploadedAtFNVersion := 4200}
@experimental
alive_state<epic_internal> := class<final_super>(fsm_state):
    StateId<override>:subtype(fsm_state) = external {}

    ParentId<override>:?subtype(fsm_state) = external {}

    DebugName<override>:string = external {}

    Mode<override>:behavior_mode = external {}

    RegisterNode<override>(InStateMachine:character_state_machine, ?Pack:?hfsm_pack_component = external {}):void = external {}

    OnAction<override>(Event:character_action_request):character_action_result = external {}

    OnReceive<override>(Event:state_event):state_receive_result = external {}

@available {MinUploadedAtFNVersion := 4110}
@experimental
character_orbit_camera_modifier<epic_internal> := class(internal_camera_modifier):
    Evaluate<override>(InValue:camera_state)<reads>:camera_state = external {}

@available {MinUploadedAtFNVersion := 4110}
@experimental
character_orbit_camera_component<epic_internal> := class(perspective_camera_component):
    OnLook<public>(LookDelta:(/Verse.org/SpatialMath:)vector3)<transacts>:void = external {}

    OnBeginSimulation<override>():void = external {}

    GetAngleOffset<public>()<transacts>:float = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
character_context<epic_internal> := class:
    Mover<epic_internal>:character_controller_component

    var EnableDebug<public>:logic = external {}

    SetIsDead<public>(Dead:logic):void = external {}

    GetIsDead<public>()<reads>:logic = external {}

    GetSpeed<public>()<reads>:float = external {}

    PrintDebug<public>(Message:string):void = external {}

HasMovementIntent<epic_internal>(Intent:(/Verse.org/SpatialMath:)vector3)<computes><decides>:(/Verse.org/SpatialMath:)vector3 = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
FindSkeletalAnimation<epic_internal>(E:entity):?has_skeletal_animation = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
character_controller_component<native><public> := class<final_super>(component):
    var IsAuthority<protected>:logic = external {}

    RunStateMachine<epic_internal>(StateMachineComponent:character_state_machine_component, DeltaTime:float):void = external {}

    SetIntentVector<public>(InIntent:(/Verse.org/SpatialMath:)vector3):void = external {}

    SetMoveInput<public>(InMoveInput:(/Verse.org/SpatialMath:)vector3):void = external {}

    SetIsJumpRequested<public>(InIsJumpRequested:logic):void = external {}

    SetDesiredFacing<public>(InFacing:(/Verse.org/SpatialMath:)vector3):void = external {}

    SetIsCrouchRequested<public>(InIsCrouchRequested:logic):void = external {}

    SetIsDodgeRequested<public>(InIsDodgeRequested:logic):void = external {}

    GetIsOnGround<public>()<decides><reads>:void = external {}

    GetIsCrouching<public>()<decides><reads>:void = external {}

    GetIsJumping<public>()<decides><reads>:void = external {}

    GetIsDodging<public>()<decides><reads>:void = external {}

    GetIsDodgeRequested<public>()<decides><reads>:void = external {}

    GetDesiredFacing<public>()<reads>:(/Verse.org/SpatialMath:)vector3 = external {}

    GetIntentVector<public>()<reads>:(/Verse.org/SpatialMath:)vector3 = external {}

    GetMoveInput<public>()<reads>:(/Verse.org/SpatialMath:)vector3 = external {}

    GetVelocity<public>()<reads>:(/Verse.org/SpatialMath:)vector3 = external {}

    GetIsJumpRequested<public>()<decides><reads>:void = external {}

    IsReady<protected>():logic = external {}

    FinalizeSetup<protected>():logic = external {}

    OnBeginSimulationInternal<override>():void = external {}

    OnBeginSimulation<override>():void = external {}

    UpdateTick<protected>(DeltaTime:float):void = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
local_character_controller_component<public> := class(character_controller_component):
    OnJump<protected>(Arg:tuple(player, logic)):void = external {}

    FinalizeSetup<override>():logic = external {}

    OnEndSimulation<override>():void = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
character_input_buffer<native><epic_internal> := class:
    (/UnrealEngine.com/Character/character_input_buffer:)Reset<public>():void = external {}

    (/UnrealEngine.com/Character/character_input_buffer:)HasMovementIntent<public>()<decides><reads>:void = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
spawn_item_context<epic_internal> := class<concrete>(ability_context):
    Prefab<epic_internal>:castable_concrete_subtype(entity) = external {}

    UnspawnDuration<epic_internal>:float = external {}

    SpawnOrigin<epic_internal>:?origin = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
spawn_item_effect_component<epic_internal> := class(ability_effect_component):
    OnBeginUse<override>()<transacts>:void = external {}

    OnEndUse<override>(Reason:?cancel_reason)<transacts>:void = external {}

    OnSimulate<override>()<suspends>:void = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
spawn_item_effect<epic_internal> := class(ability_effect):
    AbilityComponent<override>:spawn_item_effect_component = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
spawn_item_ability<epic_internal> := class(ability(spawn_item_context, spawn_item_effect)):
    MakeAbility<override>()<transacts>:spawn_item_effect = external {}

    MakeContext<override>()<transacts>:spawn_item_context = external {}

    var Icon<override>:texture = external {}

    var ActiveEffects<override>:[]spawn_item_effect = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
spawn_item_ability_component<epic_internal> := class<final_super>(component):
    @editable
    Prefab<epic_internal>:castable_concrete_subtype(entity) = external {}

    @editable
    var UnspawnDuration<public>:float = external {}

    OnBeginSimulation<override>():void = external {}

    OnSimulate<override>()<suspends>:void = external {}

    ResolveSpawnOrigin<epic_internal>()<transacts>:?origin = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
character_spawn_item_ability_component<epic_internal> := class(spawn_item_ability_component):
    ResolveSpawnOrigin<override>()<transacts>:?origin = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
behavior_mode<epic_internal> := enum:
    Exclusive
    Concurrent

@available {MinUploadedAtFNVersion := 4200}
@experimental
fsm_state<epic_internal> := class<abstract><final_super>(state):
    StateId<epic_internal>:subtype(fsm_state) = external {}

    @editable
    ParentId<epic_internal>:?subtype(fsm_state) = external {}

    @editable
    Mode<epic_internal>:behavior_mode = external {}

    Parent<override>:state_container = external {}

    Context<epic_internal>:?character_context = external {}

    OwningStateMachine<epic_internal>:?character_state_machine = external {}

    DebugName<epic_internal>:string = external {}

    Owner<epic_internal>:?hfsm_pack_component = external {}

    var Rules<epic_internal>:?state_rules = external {}

    RegisterNode<epic_internal>(InStateMachine:character_state_machine, ?Pack:?hfsm_pack_component = external {}):void = external {}

    OnEnter<override>():void = external {}

    OnExit<override>():void = external {}

    OnUpdate<epic_internal>(Ctx:character_context, DeltaTime:float):void = external {}

    CanEnter<epic_internal>()<transacts><decides>:void = external {}

    OnReceive<override>(StateEvent:state_event):state_receive_result = external {}

    OnAction<epic_internal>(Event:character_action_request):character_action_result = external {}

    TryReselectRoots<public>(?ForceNew:logic = external {}):void = external {}

    TryReselectParent<public>(?ForceNew:logic = external {}):void = external {}

    TryTransitTo<public>(Target:subtype(fsm_state)):logic = external {}

    HasAncestor<epic_internal>(Target:subtype(fsm_state)):logic = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
character_state_machine<epic_internal> := class(state_machine):
    Context<epic_internal>:character_context

    Debug<epic_internal>:state_machine_debug_settings

    var AttachedPacks<epic_internal>:[]attached_pack = external {}

    Start<epic_internal>(BaseStates:[]fsm_state, Attachments:[]attached_pack):void = external {}

    Tick<public>(DeltaTime:float):void = external {}

    Dispatch<public>(Event:state_event, ?ChildFirst:logic = external {}):logic = external {}

    AddPack<epic_internal>(Attachment:attached_pack):void = external {}

    AddPacks<epic_internal>(Attachments:[]attached_pack):void = external {}

    RemovePack<epic_internal>(Owner:?hfsm_pack_component):void = external {}

    (/UnrealEngine.com/Character/character_state_machine:)IsAttached<epic_internal>(Pack:hfsm_pack_component)<transacts><decides>:void = external {}

    AddNode<epic_internal>(Node:node):void = external {}

    FindActiveStateOfClass<epic_internal>(Target:subtype(fsm_state))<reads>:?fsm_state = external {}

    TransitTo<epic_internal>(Target:subtype(fsm_state)):logic = external {}

    ReselectRoots<epic_internal>(?ForceNew:logic = external {}):void = external {}

    ReselectChildrenOf<epic_internal>(ParentInst:fsm_state, ?ForceNew:logic = external {}):void = external {}

    FindFirstStateTemplate<epic_internal>(Target:subtype(fsm_state))<transacts><decides>:fsm_state = external {}

    RunStateTick<epic_internal>(State:fsm_state, DeltaTime:float):state_receive_result = external {}

    RegisterActiveState<epic_internal>(State:fsm_state):void = external {}

    UnregisterActiveState<epic_internal>(State:fsm_state):void = external {}

    SendEventToTransitions<epic_internal>(State:fsm_state, Event:state_event):state_receive_result = external {}

    PerformTransition<epic_internal>(State:fsm_state, Transition:exit_transition, ?Phase:?transition_phase = external {}):logic = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
@deprecated {Message := "Use state_container directly"}
template_parent<epic_internal> := class(state_container):


@available {MinUploadedAtFNVersion := 4200}
@experimental
pack_priority<native><epic_internal> := struct<concrete>:
    @editable
    Pack:?castable_concrete_subtype(entity) = external {}

    @editable
    Priority:int = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
character_state_machine_component<native><epic_internal> := class<final_super>(component, has_character_requests):
    Can<override>(Event:character_action_request):logic = external {}

    Do<override>(Event:character_action_request):void = external {}

    StartStateMachine<public>():void = external {}

    RunStateMachine<public>(InputBuffer:character_input_buffer):void = external {}

    AttachPack<public>(Pack:hfsm_pack_component, ?RequestedPriority:int = external {}):void = external {}

    DetachPack<public>(Pack:hfsm_pack_component):void = external {}

    AttachPack<public>(PackEntity:entity, ?RequestedPriority:int = external {}):void = external {}

    DetachPack<public>(PackEntity:entity):void = external {}

    IsStateMachineRunning<public>()<decides><reads>:void = external {}

    IsStateActive<public>(StateType:subtype(fsm_state))<decides><reads>:void = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
died_event<epic_internal> := class(state_event):


@available {MinUploadedAtFNVersion := 4200}
@experimental
respawned_event<epic_internal> := class(state_event):


@available {MinUploadedAtFNVersion := 4200}
@experimental
tick_event<epic_internal> := class(state_event):
    TimeSinceLastTick<public>:float

@available {MinUploadedAtFNVersion := 4200}
@experimental
character_action_result<epic_internal> := enum:
    Processed
    StopCurrentBranch
    ContinuePropagation

@available {MinUploadedAtFNVersion := 4200}
@experimental
character_action_request<epic_internal> := class<abstract>(state_event):


@available {MinUploadedAtFNVersion := 4200}
@experimental
movement_intention_request<epic_internal> := class(character_action_request):
    WorldIntent<public>:(/Verse.org/SpatialMath:)vector3

@available {MinUploadedAtFNVersion := 4200}
@experimental
jump_request<epic_internal> := class(character_action_request):


@available {MinUploadedAtFNVersion := 4200}
@experimental
dodge_request<epic_internal> := class(character_action_request):


@available {MinUploadedAtFNVersion := 4200}
@experimental
character_interact_request<epic_internal> := class(character_action_request):


@available {MinUploadedAtFNVersion := 4200}
@experimental
has_character_requests<epic_internal> := interface:
    Can<public>(Event:character_action_request):logic

    Do<public>(Event:character_action_request):void

# Module import path: /UnrealEngine.com/Character/CameraHelpers
CameraHelpers<epic_internal> := module:
    using {/Verse.org/SpatialMath}
    using {/Verse.org/Native}
    using {/Verse.org/SceneGraph}
    using {/Verse.org/Simulation}
    @experimental
    (/UnrealEngine.com/Character/CameraHelpers:)GetPlayerByIndex<native><epic_internal>(Index:int)<transacts><decides>:player

    InitGameplayCameras<native><epic_internal>(Player:player)<transacts><decides>:void

    @available {MinUploadedAtFNVersion := 4110}
    @experimental
    RegisterCameraToPlayer<epic_internal>(CameraComponent:camera_component, Player:player, ?Debug:logic = external {}):void = external {}

    ConvertInputVectorToWorldSpacePredicts<native><epic_internal>(Index:int, InputVector:(/Verse.org/SpatialMath:)vector3):(/Verse.org/SpatialMath:)vector3

# Module import path: /UnrealEngine.com/Character/InputHelpers
InputHelpers<epic_internal> := module:
    using {/Verse.org/Simulation}
    using {/Verse.org/SpatialMath}
    using {/Verse.org/Assets}
    @experimental
    TraversalMapping<epic_internal>:input_mapping = external {}

    @experimental
    Move<epic_internal>:input_action((/Verse.org/SpatialMath:)vector3) = external {}

    @experimental
    Look<epic_internal>:input_action((/Verse.org/SpatialMath:)vector3) = external {}

    @experimental
    Crouch<epic_internal>:input_action(logic) = external {}

    @experimental
    Dodge<epic_internal>:input_action(logic) = external {}

    @experimental
    Jump<epic_internal>:input_action(logic) = external {}

    @experimental
    (/UnrealEngine.com/Character/InputHelpers:)GetPlayerByIndex<native><epic_internal>(Index:int)<decides><reads>:player

character_movement_component<native><epic_internal> := class(modal_movement_component):
    OnInitializedInternal<native><override>():void

    OnUninitializingInternal<native><override>():void

    SetPlayer<native><public>(InPlayer:?player)<transacts>:void

    SetMoveInput<native><public>(InMove:(/Verse.org/SpatialMath:)vector3):void

    SetOrientationIntent<native><public>(InOrientationIntent:(/Verse.org/SpatialMath:)vector3):void

    SetIsJumpPressed<native><public>(InJumpPressed:logic):void

    ToggleCrouch<native><public>():void

    GetMoveInput<native><public>()<reads>:(/Verse.org/SpatialMath:)vector3

    GetOrientationIntent<native><public>()<reads>:(/Verse.org/SpatialMath:)vector3

    IsCrouching<native><public>()<decides><reads>:void

    IsJumping<native><public>()<decides><reads>:void

    IsOnGround<native><public>()<decides><reads>:void

    IsJumpPressed<native><public>()<decides><reads>:void

    @editable
    Acceleration<native><public>:float = external {}

    @editable
    Deceleration<native><public>:float = external {}

    @editable
    TurningRate<native><public>:float = external {}

    @editable
    TurningBoost<native><public>:float = external {}

    @editable
    MaxSpeed<native><public>:float = external {}

    @editable
    GroundFriction<native><public>:float = external {}

    @editable
    BrakingFriction<native><public>:?float = external {}

    @editable
    BrakingFrictionFactor<native><public>:float = external {}

    @editable
    MaxStepHeight<native><public>:float = external {}

    @editable
    MaxWalkableSlopeAngle<native><public>:float = external {}

character_movement_mode<native><epic_internal> := class<abstract>(movement_mode):
    @editable
    MaxSpeedOverride<native><public>:?float = external {}

    @editable
    AccelerationOverride<native><public>:?float = external {}

    @editable
    ApplyAngularVelocityToTarget<native><public>:logic = external {}

    @editable
    RemainUpright<native><public>:logic = external {}

    ProposeMove<override>(FrameParams:frame_params)<reads>:proposed_move = external {}

    ApplyMove<override>(FrameParams:frame_params, CumulativeMove:proposed_move)<reads>:move_result = external {}

character_walking_mode<native><epic_internal> := class(character_movement_mode):
    @editable
    MaintainHorizontalGroundVelocity<native><public>:logic = external {}

character_falling_mode<native><epic_internal> := class(character_movement_mode):
    @editable
    AirControlPercentage<native><public>:float = external {}

    @editable
    FallingDeceleration<native><public>:float = external {}

    @editable
    OverTerminalSpeedFallingDeceleration<native><public>:float = external {}

    @editable
    TerminalMovementPlaneSpeed<native><public>:float = external {}

    @editable
    FallingLateralFriction<native><public>:float = external {}

    @editable
    FallingAngularFriction<native><public>:float = external {}

    @editable
    TerminalVerticalSpeed<native><public>:float = external {}

    @editable
    ClampTerminalVerticalSpeed<native><public>:logic = external {}

    @editable
    VerticalFallingDeceleration<native><public>:float = external {}

    @editable
    IgnoreGravity<native><public>:logic = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
dead_state<epic_internal> := class<final_super>(fsm_state):
    StateId<override>:subtype(fsm_state) = external {}

    ParentId<override>:?subtype(fsm_state) = external {}

    DebugName<override>:string = external {}

    Mode<override>:behavior_mode = external {}

    RegisterNode<override>(InStateMachine:character_state_machine, ?Pack:?hfsm_pack_component = external {}):void = external {}

    OnEnter<override>():void = external {}

    OnReceive<override>(Event:state_event):state_receive_result = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
dodge_state<epic_internal> := class<final_super>(fsm_state):
    StateId<override>:subtype(fsm_state) = external {}

    ParentId<override>:?subtype(fsm_state) = external {}

    DebugName<override>:string = external {}

    Mode<override>:behavior_mode = external {}

    RegisterNode<override>(InStateMachine:character_state_machine, ?Pack:?hfsm_pack_component = external {}):void = external {}

    OnEnter<override>():void = external {}

    OnExit<override>():void = external {}

    OnUpdate<override>(Ctx:character_context, DeltaTime:float):void = external {}

    OnAction<override>(Event:character_action_request):character_action_result = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
example_game_npc_component<epic_internal> := class<final_super>(character_controller_component):
    UpdateTick<override>(DeltaTime:float):void = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
example_game_player_component<epic_internal> := class<final_super>(local_character_controller_component):
    UpdateTick<override>(DeltaTime:float):void = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
example_game_test_component<epic_internal> := class<final_super>(component):
    OnSimulate<override>()<suspends>:void = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
fall_state<epic_internal> := class<final_super>(fsm_state):
    StateId<override>:subtype(fsm_state) = external {}

    ParentId<override>:?subtype(fsm_state) = external {}

    DebugName<override>:string = external {}

    Mode<override>:behavior_mode = external {}

    RegisterNode<override>(InStateMachine:character_state_machine, ?Pack:?hfsm_pack_component = external {}):void = external {}

    OnEnter<override>():void = external {}

    OnExit<override>():void = external {}

    OnUpdate<override>(Ctx:character_context, DeltaTime:float):void = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
ground_state<epic_internal> := class<final_super>(fsm_state):
    StateId<override>:subtype(fsm_state) = external {}

    ParentId<override>:?subtype(fsm_state) = external {}

    DebugName<override>:string = external {}

    Mode<override>:behavior_mode = external {}

    RegisterNode<override>(InStateMachine:character_state_machine, ?Pack:?hfsm_pack_component = external {}):void = external {}

    OnUpdate<override>(Ctx:character_context, DeltaTime:float):void = external {}

    OnAction<override>(Event:character_action_request):character_action_result = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
hfsm_attach_test_component<epic_internal> := class<final_super>(component):
    OnSimulate<override>()<suspends>:void = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
hfsm_pack_component<epic_internal> := class<final_super>(component):
    @editable
    PackName<public>:string = external {}

    @editable
    DefaultPriority<epic_internal>:int = external {}

    @editable
    States<epic_internal>:[]fsm_state = external {}

    @editable
    EntryConditions<epic_internal>:[]entry_condition = external {}

    @editable
    ExitTransitions<epic_internal>:[]exit_transition = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
no_anim<epic_internal> := class<castable><concrete><final>(modifier(skeleton)):
    Evaluate<override>(InValue:skeleton)<reads>:skeleton = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
idle_state<epic_internal> := class<final_super>(fsm_state):
    StateId<override>:subtype(fsm_state) = external {}

    ParentId<override>:?subtype(fsm_state) = external {}

    DebugName<override>:string = external {}

    Mode<override>:behavior_mode = external {}

    RegisterNode<override>(InStateMachine:character_state_machine, ?Pack:?hfsm_pack_component = external {}):void = external {}

    OnUpdate<override>(Ctx:character_context, DeltaTime:float):void = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
in_air_state<epic_internal> := class<final_super>(fsm_state):
    StateId<override>:subtype(fsm_state) = external {}

    ParentId<override>:?subtype(fsm_state) = external {}

    DebugName<override>:string = external {}

    Mode<override>:behavior_mode = external {}

    RegisterNode<override>(InStateMachine:character_state_machine, ?Pack:?hfsm_pack_component = external {}):void = external {}

    OnEnter<override>():void = external {}

    OnExit<override>():void = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
jump_state<epic_internal> := class<final_super>(fsm_state):
    StateId<override>:subtype(fsm_state) = external {}

    ParentId<override>:?subtype(fsm_state) = external {}

    DebugName<override>:string = external {}

    Mode<override>:behavior_mode = external {}

    RegisterNode<override>(InStateMachine:character_state_machine, ?Pack:?hfsm_pack_component = external {}):void = external {}

    OnExit<override>():void = external {}

    OnUpdate<override>(Ctx:character_context, DeltaTime:float):void = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
locomotion_state<epic_internal> := class<final_super>(fsm_state):
    StateId<override>:subtype(fsm_state) = external {}

    ParentId<override>:?subtype(fsm_state) = external {}

    DebugName<override>:string = external {}

    Mode<override>:behavior_mode = external {}

    RegisterNode<override>(InStateMachine:character_state_machine, ?Pack:?hfsm_pack_component = external {}):void = external {}

    OnUpdate<override>(Ctx:character_context, DeltaTime:float):void = external {}

@hide_in_editor
network_physics_component<native><epic_internal> := class<final_super><epic_internal>(component):
    OnBeginSimulationInternal<native><override>():void

    OnEndSimulationInternal<native><override>():void

    @replicated("RepNotify")
    var OwnerInputHistory<native><epic_internal>:network_physics_input_history = external {}

    @replicated("RepNotify")
    var StateHistory<native><epic_internal>:network_physics_state_history = external {}

    @replicated("RepNotify")
    var RemoteInputHistory<native><epic_internal>:network_physics_remote_input_history = external {}

@replicatable
network_physics_input_history<native><epic_internal> := struct:


@replicatable
network_physics_remote_input_history<native><epic_internal> := struct:


@replicatable
network_physics_state_history<native><epic_internal> := struct:


@available {MinUploadedAtFNVersion := 4200}
@experimental
run_state<epic_internal> := class<final_super>(fsm_state):
    StateId<override>:subtype(fsm_state) = external {}

    ParentId<override>:?subtype(fsm_state) = external {}

    DebugName<override>:string = external {}

    Mode<override>:behavior_mode = external {}

    RegisterNode<override>(InStateMachine:character_state_machine, ?Pack:?hfsm_pack_component = external {}):void = external {}

    CanEnter<override>()<transacts><decides>:void = external {}

    OnEnter<override>():void = external {}

    OnExit<override>():void = external {}

    OnUpdate<override>(Ctx:character_context, DeltaTime:float):void = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
state_machine_debug_settings<epic_internal> := class<concrete>:


@available {MinUploadedAtFNVersion := 4200}
@experimental
state_machine_debug_display<epic_internal> := class:
    Draw<epic_internal>(Roots:[]fsm_state, Active:[]fsm_state, Base:(/Verse.org/SpatialMath:)vector3):void = external {}

    Hide<epic_internal>():void = external {}

# Module import path: /UnrealEngine.com/Character/StateMachineDebug
StateMachineDebug<epic_internal> := module:
    using {/Verse.org/Native}
    @available {MinUploadedAtFNVersion := 4200}
    @experimental
    Trace<epic_internal>(State:fsm_state, Message:string):void = external {}

    @available {MinUploadedAtFNVersion := 4200}
    @experimental
    StateName<epic_internal>(Fsm:character_state_machine, Target:subtype(fsm_state)):string = external {}

    @available {MinUploadedAtFNVersion := 4200}
    @experimental
    DescribeTransition<epic_internal>(Fsm:character_state_machine, State:fsm_state, Transition:exit_transition, Phase:?transition_phase):string = external {}

    @available {MinUploadedAtFNVersion := 4200}
    @experimental
    TraceRefusal<epic_internal>(Fsm:character_state_machine, Target:subtype(fsm_state), Reason:string):void = external {}

    @available {MinUploadedAtFNVersion := 4200}
    @experimental
    TraceStartPacks<epic_internal>(Debug:state_machine_debug_settings, Attachments:[]attached_pack):void = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
node_factory<epic_internal> := type {_(:state_container, :character_state_machine, :character_context, :fsm_state, :?hfsm_pack_component)<transacts>:fsm_state}

@available {MinUploadedAtFNVersion := 4200}
@experimental
node_filter_conditions<epic_internal> := type {_(:character_context):logic}

@available {MinUploadedAtFNVersion := 4200}
@experimental
AlwaysPassFilter<epic_internal>(Ctx:character_context):logic = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
node<epic_internal> := struct:
    Template:fsm_state

    Make:node_factory

    FilterConditions:node_filter_conditions = external {}

    Mode:behavior_mode

    Owner:?hfsm_pack_component = external {}

    Rules:state_rules = external {}

# Module import path: /UnrealEngine.com/Character/NodeHierarchyHelpers
NodeHierarchyHelpers<epic_internal> := module:
    using {/Verse.org/Native}
    @available {MinUploadedAtFNVersion := 4200}
    @experimental
    DescendantNodes<epic_internal>(NodeList:[]node, ParentInst:fsm_state):[]node = external {}

    @available {MinUploadedAtFNVersion := 4200}
    @experimental
    ChainToTarget<epic_internal>(Target:subtype(fsm_state), NodeList:[]node, Depth:int)<transacts><decides>:[]int = external {}

    @available {MinUploadedAtFNVersion := 4200}
    @experimental
    ReorderChainFirst<epic_internal>(NodeList:[]node, ChainIdx:[]int):[]node = external {}

    @available {MinUploadedAtFNVersion := 4200}
    @experimental
    IsOnChain<epic_internal>(ChainIdx:[]int, Index:int)<computes><decides>:void = external {}

    @available {MinUploadedAtFNVersion := 4200}
    @experimental
    DeepestActiveAncestor<epic_internal>(NodeList:[]node, ChainIdx:[]int, Active:[]fsm_state):?fsm_state = external {}

    @available {MinUploadedAtFNVersion := 4200}
    @experimental
    FindActiveState<epic_internal>(Node:node, Active:[]fsm_state)<transacts><decides>:fsm_state = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
attached_pack<epic_internal> := struct:
    Pack:hfsm_pack_component

    Priority:int

# Module import path: /UnrealEngine.com/Character/StateMachinePack
StateMachinePack<epic_internal> := module:
    using {/Verse.org/Native}
    @available {MinUploadedAtFNVersion := 4200}
    @experimental
    IsAttached<epic_internal>(AttachedPacks:[]attached_pack, Pack:hfsm_pack_component)<transacts><decides>:void = external {}

    @available {MinUploadedAtFNVersion := 4200}
    @experimental
    RebuildInjections<epic_internal>(Nodes:[]node, AttachedPacks:[]attached_pack, Debug:state_machine_debug_settings):void = external {}

    @available {MinUploadedAtFNVersion := 4200}
    @experimental
    PackPrecedes<epic_internal>(Left:attached_pack, Right:attached_pack)<computes><decides>:void = external {}

    @available {MinUploadedAtFNVersion := 4200}
    @experimental
    IsSameState<epic_internal>(Nodes:[]node, LeftClass:subtype(fsm_state), RightClass:subtype(fsm_state))<transacts><decides>:void = external {}

    @available {MinUploadedAtFNVersion := 4200}
    @experimental
    FindTemplate<epic_internal>(Nodes:[]node, Target:subtype(fsm_state))<transacts><decides>:fsm_state = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
state_rule<epic_internal> := class<abstract>:
    @editable
    @display_priority("1")
    DebugName<epic_internal>:string = external {}

    GetDebugInfo<final><epic_internal>():string = external {}

    GetDebugDetails<epic_internal>():string = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
entry_condition<epic_internal> := class<abstract>(state_rule):
    @editable
    @display_priority("2")
    Target<epic_internal>:?subtype(fsm_state) = external {}

    Evaluate<epic_internal>(Template:fsm_state, Ctx:character_context, Fsm:character_state_machine):logic = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
transition_phase<epic_internal> := enum:
    PostUpdate
    PreUpdate

@available {MinUploadedAtFNVersion := 4200}
@experimental
PhaseName<epic_internal>(Phase:transition_phase):string = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
exit_transition<epic_internal> := class<abstract>(state_rule):
    @editable
    @display_priority("2")
    Source<epic_internal>:?subtype(fsm_state) = external {}

    @editable
    @display_priority("3")
    Destination<epic_internal>:?subtype(fsm_state) = external {}

    @editable
    @display_priority("4")
    Phase<epic_internal>:transition_phase = external {}

    @editable
    @display_priority("5")
    Execution<epic_internal>:?transition_execution = external {}

    Evaluate<epic_internal>(State:fsm_state, Ctx:character_context, Fsm:character_state_machine):logic = external {}

    OnReceive<epic_internal>(State:fsm_state, Event:state_event, Ctx:character_context, Fsm:character_state_machine):state_receive_result = external {}

    PreTransit<epic_internal>(State:fsm_state, Ctx:character_context, Fsm:character_state_machine):logic = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
state_rules<epic_internal> := class:


@available {MinUploadedAtFNVersion := 4200}
@experimental
condition_predicate<epic_internal> := class<abstract>:
    Evaluate<epic_internal>(Ctx:character_context, Fsm:character_state_machine):logic = external {}

    GetDebugInfo<epic_internal>():string = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
transition_execution<epic_internal> := class<abstract>:
    Execute<epic_internal>(State:fsm_state, Ctx:character_context, Fsm:character_state_machine):logic = external {}

    GetDebugInfo<epic_internal>():string = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
condition_by_predicate<epic_internal> := class<concrete>(entry_condition):
    @editable
    Predicate<epic_internal>:?condition_predicate = external {}

    Evaluate<override>(Template:fsm_state, Ctx:character_context, Fsm:character_state_machine):logic = external {}

    GetDebugDetails<override>():string = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
transition_by_predicate<epic_internal> := class<concrete>(exit_transition):
    @editable
    Predicate<epic_internal>:?condition_predicate = external {}

    Evaluate<override>(State:fsm_state, Ctx:character_context, Fsm:character_state_machine):logic = external {}

    GetDebugDetails<override>():string = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
minimum_speed_predicate<epic_internal> := class<concrete>(condition_predicate):
    @editable
    Speed<epic_internal>:float = external {}

    GetDebugInfo<override>():string = external {}

    Evaluate<override>(Ctx:character_context, Fsm:character_state_machine):logic = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
maximum_speed_predicate<epic_internal> := class<concrete>(condition_predicate):
    @editable
    Speed<epic_internal>:float = external {}

    GetDebugInfo<override>():string = external {}

    Evaluate<override>(Ctx:character_context, Fsm:character_state_machine):logic = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
jump_execution<epic_internal> := class<concrete>(transition_execution):
    GetDebugInfo<override>():string = external {}

    Execute<override>(State:fsm_state, Ctx:character_context, Fsm:character_state_machine):logic = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
visual_attachment_component<public> := class<final_super>(component):
    @editable
    var (/UnrealEngine.com/Character/visual_attachment_component:)Input<public>:visual_attachment_input = external {}

    OnBeginSimulation<override>():void = external {}

    GetSlotOrigin<public>(Slot:visual_attachment_slot)<transacts><decides>:origin = external {}

    AttachToSlot<public>(Child:entity, Slot:visual_attachment_slot)<transacts>:logic = external {}

    SpawnSlot<public>(Slot:visual_attachment_slot):?entity = external {}

    DespawnSlot<public>(Slot:visual_attachment_slot):void = external {}

    GetSlotEntity<public>(Slot:visual_attachment_slot)<decides><reads>:entity = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
visual_attachment_slot<public> := enum:
    Head
    (/UnrealEngine.com/Character/visual_attachment_slot:)Back
    RightHand
    LeftHand

@available {MinUploadedAtFNVersion := 4200}
@experimental
visual_attachment_slot_config<public> := class<concrete>:
    @editable
    BoneName<public>:string = external {}

    @editable
    Mesh<public>:mesh = external {}

    @editable
    LocalTransform<public>:(/Verse.org/SpatialMath:)transform = external {}

    @editable
    AutoSpawn<public>:logic = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
visual_attachment_input<public> := class<concrete>:
    @editable
    Head<public>:visual_attachment_slot_config = external {}

    @editable
    (/UnrealEngine.com/Character/visual_attachment_input:)Back<public>:visual_attachment_slot_config = external {}

    @editable
    RightHand<public>:visual_attachment_slot_config = external {}

    @editable
    LeftHand<public>:visual_attachment_slot_config = external {}

    GetSlotConfig<public>(Slot:visual_attachment_slot)<reads>:visual_attachment_slot_config = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
walk_state<epic_internal> := class<final_super>(fsm_state):
    StateId<override>:subtype(fsm_state) = external {}

    ParentId<override>:?subtype(fsm_state) = external {}

    DebugName<override>:string = external {}

    Mode<override>:behavior_mode = external {}

    RegisterNode<override>(InStateMachine:character_state_machine, ?Pack:?hfsm_pack_component = external {}):void = external {}

    CanEnter<override>()<transacts><decides>:void = external {}

    OnEnter<override>():void = external {}

    OnExit<override>():void = external {}

    OnUpdate<override>(Ctx:character_context, DeltaTime:float):void = external {}