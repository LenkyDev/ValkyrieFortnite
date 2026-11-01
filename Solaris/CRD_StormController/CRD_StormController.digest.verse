# Verse path: /Fortnite.com/Devices
using {/UnrealEngine.com/Temporary/SpatialMath}
# Used in conjunction with `advanced_storm_controller_device` to customize individual storm phases.
advanced_storm_beacon_device<public> := class<concrete><final>(creative_device_base):
    # Teleports the `advanced_storm_beacon_device` to the specified `Position` and `Rotation`. 
    # Existing storms will not target the new location, but newly generated storms will.
    TeleportTo<override>(Position:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, Rotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation)<transacts><decides>:void = external {}

    # Teleports the `advanced_storm_beacon_device` to the specified location defined by `Transform`, also applies rotation and scale accordingly. 
    # Existing storms will not target the new location, but newly generated storms will.
    TeleportTo<override>(Transform:(/UnrealEngine.com/Temporary/SpatialMath:)transform)<transacts><decides>:void = external {}

    # Moves the `advanced_storm_beacon_device` to the specified `Position` and `Rotation` over the specified time, in seconds. 
    # Existing storms will not target the new location, but newly generated storms will.
    MoveTo<override>(Position:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, Rotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation, OverTime:float)<suspends>:move_to_result = external {}

    # Moves the `advanced_storm_beacon_device` to the specified `Transform` over the specified time, in seconds. 
    # Existing storms will not target the new location, but newly generated storms will.
    MoveTo<override>(Transform:(/UnrealEngine.com/Temporary/SpatialMath:)transform, OverTime:float)<suspends>:move_to_result = external {}

# Used to control a Battle Royale-style storm with up to 50 phases.
# 
# Like `basic_storm_controller_device`s, you can use this storm to keep players inside a playable area, but unlike the `basic_storm_controller_device`, this device generates multiple storm phases. When used in conjunction with `advanced_storm_beacon_device`s, you can customize each phase of the storm by applying one or more beacons and setting customization options for the specific phase you assign to that beacon.
advanced_storm_controller_device<public> := class<concrete><final>(storm_controller_device):


# A simplified storm device that provides a way to create a single-phase storm and control its basic behaviors.
# To control multiple phases of the storm see `advanced_storm_controller_device`.
basic_storm_controller_device<public> := class<concrete><final>(storm_controller_device):


# Base class for various specialized storm devices. See also: * `basic_storm_controller_device` * `advanced_storm_controller_device`
storm_controller_device<public> := class<abstract><epic_internal>(creative_device_base):
    # Signaled when storm resizing ends. Use this with the *On Finish Behavior* option for better controls.
    PhaseEndedEvent<public>:listenable(tuple()) = external {}

    # Generates the storm. *Generate Storm On Game Start* must be set to *No* if you choose to use `GenerateStorm`.
    GenerateStorm<public>():void = external {}

    # Destroys the storm.
    DestroyStorm<public>():void = external {}

    # Teleports the `storm_controller_device` to the specified `Position` and `Rotation`. 
    # Existing storms will not target the new location, but newly generated storms will.
    TeleportTo<override>(Position:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, Rotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation)<transacts><decides>:void = external {}

    # Teleports the `storm_controller_device` to the specified location defined by `Transform`, also applies rotation and scale accordingly. 
    # Existing storms will not target the new location, but newly generated storms will.
    TeleportTo<override>(Transform:(/UnrealEngine.com/Temporary/SpatialMath:)transform)<transacts><decides>:void = external {}

    # Moves the `storm_controller_device` to the specified `Position` and `Rotation` over the specified time, in seconds. 
    # Existing storms will not target the new location, but newly generated storms will.
    MoveTo<override>(Position:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, Rotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation, OverTime:float)<suspends>:move_to_result = external {}

    # Moves the `storm_controller_device` to the specified `Transform` over the specified time, in seconds. 
    # Existing storms will not target the new location, but newly generated storms will.
    MoveTo<override>(Transform:(/UnrealEngine.com/Temporary/SpatialMath:)transform, OverTime:float)<suspends>:move_to_result = external {}