# Verse path: /Verse.org/SceneGraph
using {/Verse.org/Simulation}
using {/Verse.org/SpatialMath}
using {/Verse.org/Native}
# Enumerated presets for the types of control input variable; Equates to what enhanced input can provide
module_input_value_type<native><public> := enum:
    MBoolean
    MAxis1D
    MAxis2D
    MAxis3D
    MInteger

@experimental
# Defines each of the vehicle control inputs that the individual module simulations are looking for
vehicle_input_setup<native><epic_internal> := struct<epic_internal>:
    InputName<native><public>:string = external {}

    InputType<native><public>:module_input_value_type = external {}

    InputDecay<native><public>:logic = external {}

@experimental
# Information about a module.
module_info<native><epic_internal> := struct<epic_internal>:
    Entity<native><public>:entity

    SimComponent<native><public>:vehicle_sim_base_component

@experimental
# The modular vehicle simulation component simulates vehicle behaviour
modular_vehicle_component<native><epic_internal> := class<final_super><epic_internal>(component):
    # The component is being initialized, called when it is attached to an entity
    OnInitializedInternal<native><override>():void

    # The component is being uninitialized, called when it is about to be detached from an entity
    OnUninitializingInternal<native><override>():void

    # Notification the owner entity was added to a world, create vehicle implementation
    OnAddedToSceneInternal<native><override>():void

    # Notification the owner entity is about to be removed from world, destroy vehicle implementation
    OnRemovingFromSceneInternal<native><override>():void

    # Simulation starting, delayed construction possible
    OnBeginSimulationInternal<native><override>():void

    # Simulation ending
    OnEndSimulationInternal<native><override>():void

    @experimental
    ModuleAddedEvent<native><final><epic_internal>:listenable(module_info) = external {}

    @experimental
    ModuleRemovedEvent<native><final><epic_internal>:listenable(module_info) = external {}

    @experimental
    @available {MinUploadedAtFNVersion := 4100}
    CollisionEnteredEvent<native><epic_internal>:listenable(generator(collision_hit)) = external {}

    @experimental
    @available {MinUploadedAtFNVersion := 4100}
    CollisionEvent<native><epic_internal>:listenable(generator(collision_hit)) = external {}

    @experimental
    @available {MinUploadedAtFNVersion := 4100}
    CollisionExitedEvent<native><epic_internal>:listenable(generator(collision_volume_pair)) = external {}

    # Replace the current control input configuration
    SetupControlInputConfiguration<native_callable><public>(ControlInputConfigurationIn:[]vehicle_input_setup):void = external {}

    # Replace the current state input configuration
    SetupStateInputConfiguration<native_callable><public>(StateInputConfigurationIn:[]vehicle_input_setup):void = external {}

    # Apply control input of type MBoolean
    SetInput<native><public>(InputName:string, Value:logic):void

    # Apply control input of type MInteger
    SetInput<native><public>(InputName:string, Value:int):void

    # Apply control input of type MAxis1D
    SetInput<native><public>(InputName:string, Value:float):void

    # Apply control input of type MAxis3D
    SetInput<native><public>(InputName:string, Value:(/Verse.org/SpatialMath:)vector3):void

    # Possess the vehicle proxy actor with the given player's controller. Required for camera/view control.
    PossessProxyActor<native><epic_internal>(InPlayer:player):void

    # Apply state input of type MBoolean
    SetState<native><public>(InputName:string, Value:logic):void

    # Apply state input of type MInteger
    SetState<native><public>(InputName:string, Value:int):void

    # Apply state input of type MAxis1D
    SetState<native><public>(InputName:string, Value:float):void

    # Apply state input of type MAxis3D
    SetState<native><public>(InputName:string, Value:(/Verse.org/SpatialMath:)vector3):void

@experimental
vehicle_aerofoil_component<native><epic_internal> := class<final><epic_internal>(vehicle_sim_base_component):


@experimental
vehicle_clutch_component<native><epic_internal> := class<final><epic_internal>(vehicle_sim_base_component):


@experimental
vehicle_engine_component<native><epic_internal> := class<final><epic_internal>(vehicle_sim_base_component):
    GetRPM<epic_internal>(Accessor:accessor)<transacts>:float = external {}

    GetTorque<epic_internal>(Accessor:accessor)<transacts>:float = external {}

@experimental
modular_vehicle_input_component<native><epic_internal> := class<final_super><epic_internal>(component):
    GetThrottlePressedEvent<public>()<reads>:subscribable_event_intrnl(tuple()) = external {}

    GetBrakePressedEvent<public>()<reads>:subscribable_event_intrnl(tuple()) = external {}

    GetSteeringPressedEvent<public>()<reads>:subscribable_event_intrnl(tuple()) = external {}

    GetHandbrakePressedEvent<public>()<reads>:subscribable_event_intrnl(tuple()) = external {}

    GetRollPressedEvent<public>()<reads>:subscribable_event_intrnl(tuple()) = external {}

    GetPitchPressedEvent<public>()<reads>:subscribable_event_intrnl(tuple()) = external {}

    GetYawPressedEvent<public>()<reads>:subscribable_event_intrnl(tuple()) = external {}

    GetGearUpPressedEvent<public>()<reads>:subscribable_event_intrnl(tuple()) = external {}

    GetGearDownPressedEvent<public>()<reads>:subscribable_event_intrnl(tuple()) = external {}

    RegisterAllPlayerBindings<public>():void = external {}

    UnregisterAllPlayerBindings<public>():void = external {}

    OnPlayerAdded<public>(InPlayer:player):void = external {}

    OnPlayerRemoved<public>(InPlayer:player):void = external {}

    OnEndSimulation<override>():void = external {}

@hide_in_editor
@experimental
vehicle_sim_base_component<native><epic_internal> := class<final_super><epic_internal>(component):


@experimental
vehicle_suspension_component<native><epic_internal> := class<final><epic_internal>(vehicle_sim_base_component):
    GetSpringDisplacement<epic_internal>(Accessor:accessor)<transacts>:float = external {}

    GetSpringDisplacementVector<epic_internal>(Accessor:accessor)<transacts>:(/Verse.org/SpatialMath:)vector3 = external {}

    GetSpringSpeed<epic_internal>(Accessor:accessor)<transacts>:float = external {}

    GetImpactNormal<epic_internal>(Accessor:accessor)<transacts>:(/Verse.org/SpatialMath:)vector3 = external {}

@experimental
vehicle_thruster_component<native><epic_internal> := class<final><epic_internal>(vehicle_sim_base_component):


@experimental
# gear change event data
gear_change_info<native><epic_internal> := struct<epic_internal>:
    ChangedToGear<native><public>:int

@experimental
vehicle_transmission_component<native><epic_internal> := class<final><epic_internal>(vehicle_sim_base_component):
    @experimental
    GearChangeEvent<native><final><epic_internal>:listenable(gear_change_info) = external {}

    GetCurrentGear<epic_internal>(Accessor:accessor)<transacts>:int = external {}

@experimental
# wheel contact event
wheel_touch_change_info<native><epic_internal> := struct<epic_internal>:
    IsInContact<native><public>:logic

@experimental
vehicle_wheel_component<native><epic_internal> := class<final><epic_internal>(vehicle_sim_base_component):
    @experimental
    WheelTouchChangeEvent<native><final><epic_internal>:listenable(wheel_touch_change_info) = external {}

    GetTouchingGround<epic_internal>(Accessor:accessor)<transacts>:logic = external {}

    GetForceIntoSurface<epic_internal>(Accessor:accessor)<transacts>:float = external {}

    GetSlipAngle<epic_internal>(Accessor:accessor)<transacts>:float = external {}

    GetRPM<epic_internal>(Accessor:accessor)<transacts>:float = external {}

    GetAngularPositionDegrees<epic_internal>(Accessor:accessor)<transacts>:float = external {}

    GetSteeringAngleDegrees<epic_internal>(Accessor:accessor)<transacts>:float = external {}