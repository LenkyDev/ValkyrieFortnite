# Verse path: /Fortnite.com
# Module import path: /Fortnite.com/Devices
Devices<public> := module:
    using {/Fortnite.com/AI}
    using {/UnrealEngine.com/Temporary/Diagnostics}
    using {/Verse.org/Simulation/Tags}
    using {/Fortnite.com/Game}
    using {/Verse.org/SceneGraph}
    using {/Fortnite.com/Vehicles}
    using {/Fortnite.com/Assets}
    using {/Verse.org/Assets}
    using {/Verse.org/Colors}
    using {/Verse.org/Simulation}
    using {/Verse.org/Native}
    using {/Verse.org/SpatialMath}
    using {/UnrealEngine.com/Temporary/SpatialMath}
    using {/Fortnite.com/Playspaces}
    # Module import path: /Fortnite.com/Devices/Animation
    (/Fortnite.com/Devices:)Animation<public> := module:


    # Module import path: /Fortnite.com/Devices/CreativeAnimation
    CreativeAnimation<public> := module:
        using {/UnrealEngine.com/Temporary/SpatialMath}
        # A structure for defining Bezier interpolation parameters.
        # See https://en.wikipedia.org/wiki/B%C3%A9zier_curve for more info on Bezier curves.
        cubic_bezier_parameters<native><public> := struct<computes>:
            # X value of the P1 control point. `0.0 <= X0 <= 1.0` or an error will be generated when calling `animation_controller.SetAnimation`.
            X0<native><public>:float = external {}

            # Y value of the P1 control point.
            Y0<native><public>:float = external {}

            # X value of the P2 control point. `0.0 <= X1 <= 1.0 or an error will be generated when calling `animation_controller.SetAnimation`.
            X1<native><public>:float = external {}

            # Y value of the P2 control point.
            Y1<native><public>:float = external {}

        # Module import path: /Fortnite.com/Devices/CreativeAnimation/InterpolationTypes
        # Convenience interpolation modes. These built in modes are based on the CSS animation standard: https://www.w3.org/TR/css-easing-1/
        InterpolationTypes<public> := module:
            # `Linear` animations move at a constant speed.
            (/Fortnite.com/Devices/CreativeAnimation/InterpolationTypes:)Linear<public>:cubic_bezier_parameters = external {}

            # `Ease` animations start slowly, speed up, then end slowly. The speed of the animation is slightly slower at the end than the start.
            (/Fortnite.com/Devices/CreativeAnimation/InterpolationTypes:)Ease<public>:cubic_bezier_parameters = external {}

            # `EaseIn` animations start slow, then speed up towards the end.
            (/Fortnite.com/Devices/CreativeAnimation/InterpolationTypes:)EaseIn<public>:cubic_bezier_parameters = external {}

            # `EaseOut` animations start fast, then slow down towards the end.
            (/Fortnite.com/Devices/CreativeAnimation/InterpolationTypes:)EaseOut<public>:cubic_bezier_parameters = external {}

            # `EaseInOut` animations are similar to `Ease` but the start and end animation speed is symmetric.
            (/Fortnite.com/Devices/CreativeAnimation/InterpolationTypes:)EaseInOut<public>:cubic_bezier_parameters = external {}

        # Instead of specifying the actual keyframe positions, we specify the keyframe *deltas*. This allows us to treat the initial position of the prop as keyframe 0 and avoid the question of how to get the prop to its initial location. For a `animation_mode.Loop` animation, the net rotation and translation must both be zero. Each delta is interpreted as a world-space transformation to be concatenated onto the previous transform(s).
        keyframe_delta<native><public> := struct:
            # Target position of the `creative_prop`. This is a world-space coordinate in cm, with the initial position of the `creative_prop` acting as coordinate (0,0).
            DeltaLocation<native><public>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3

            # Target rotation for the `creative_prop`. Rotations are relative to the starting rotation of the `creative_prop`
            DeltaRotation<native><public>:(/UnrealEngine.com/Temporary/SpatialMath:)rotation

            # Target scale for the `creative_prop`. Scale is multiplicative to the starting Scale of the `creative_prop`
            DeltaScale<native><public>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

            # Time in seconds the `creative_prop` should animate between its last frame and this frame.
            Time<native><public>:float

            # Interpolation mode for this `keyframe_delta`. See `InterpolationTypes` for standard interpolation options. See `cubic_bezier_parameters` for authoring custom interpolations. 
            # Default = `InterpolationTypes.Linear`
            Interpolation<native><public>:cubic_bezier_parameters = external {}

        # Animation keyframe delta scale modes.
        keyframe_delta_scale_mode<native><epic_internal> := enum:
            # Scale is applied as a multiple of the previous scale.
            Multiplicative
            # Scale is applied additively to the previous scale.
            Additive

        # Animation play modes.
        animation_mode<native><public> := enum:
            # Stop after playing the animation once.
            OneShot
            # Reverse direction after reaching the final `keyframe_delta`, then play the animation in reverse.
            PingPong
            # Play the animation in a loop. This requires the animation ends exactly where it began.
            Loop

        # Results for `animation_controller.SetAnimation` function.
        set_animation_result<native><epic_internal> := enum:
            # Function succeeded.
            Ok
            # An unknown error has occurred.
            UnknownError
            # No keyframes were provided.
            NoKeyframes
            # The animation mode was 'Loop' but there was a net translation or rotation in the keyframes.
            LoopingAnimationDoesNotLoop
            # The animation would cause the object to at least partially leave the boundaries of play.
            KeyframeOutOfBounds
            # The translation component of a keyframe contained a NaN or Inf.
            InvalidLocation
            # The delta time value of a keyframe was negative.
            InvalidTime
            # See the documentation for cubic_bezier_parameters for more information.
            InvalidInterpolationParameters
            # The target of the animation cannot be scaled.
            ScaleNotAllowed
            # The target of the animation is not an animatable prop. This could be because:
            #  * It is not a `creative_prop` that can be animated.
            #  * It was disposed or otherwise destroyed.
            #  * It has the 'Register with Structural Grid' option set in UEFN.
            InvalidObject

        # Results for `animation_controller.GetAnimationController' function.
        get_animation_controller_result<native><epic_internal> := enum:
            # Function succeeded.
            Ok
            # An unknown error has occurred.
            UnknownError
            # The target of the animation is not an animatable prop. This could be because:
            #  * It is not a `creative_prop` that can be animated.
            #  * It was disposed or otherwise destroyed.
            #  * It has the 'Register with Structural Grid' option set in UEFN.
            InvalidObject

        # Results for `animation_controller`s play, pause, and stop functions.
        playstoppause_result<native><epic_internal> := enum:
            # Function succeeded.
            Ok
            # No animation has been successfully set via SetAnimation, or that animation has been cleared by a failed call to SetAnimation.
            AnimationNotSet
            # The target of the animation is not an animatable prop. This could be because:
            #  * It is not a `creative_prop` that can be animated.
            #  * It was disposed or otherwise destroyed.
            #  * It has the 'Register with Structural Grid' option set in UEFN.
            InvalidObject

        # `animation_controller` states.
        animation_controller_state<native><public> := enum:
            # The target of the animation is not an animatable prop. This could be because:
            #  * It is not a `creative_prop` that can be animated.
            #  * It was disposed or otherwise destroyed.
            #  * It has the 'Register with Structural Grid' option set in UEFN.
            InvalidObject
            # No animation has been successfully set via `animation_controller.SetAnimation`, or that animation has been cleared by a failed call to `animation_controller.SetAnimation`.
            AnimationNotSet
            # Animation has either never started, finished, or was explicitly stopped.
            Stopped
            # Animation is playing.
            Playing
            # Animation is paused.
            Paused

        # Results for `animation_controller.AwaitNextKeyframe` function.
        await_next_keyframe_result<native><public> := enum:
            # The next keyframe has been reached successfully.
            KeyframeReached
            # No animation is currently playing and this function call has returned immediately.
            NotPlaying
            # The animation was canceled either due to the object being destroyed, becoming invalid, or because it was moved via some other API.
            AnimationAborted

        # Used to move and animate the position of `creative_prop` objects.
        #  * See `creative_prop.GetAnimationController` for information on acquiring an instance of an
        #    `animation_controller` for a given `creative_prop`.
        #  * See `SetAnimation` for details on authoring movement and animations.
        animation_controller<native><public> := class<epic_internal>:
            # Suspends at the callsite until the next `keyframe_delta` is finished. This will also return if the animation is aborted or not playing. See `await_next_keyframe_result` if your code needs to take different paths based on why `AwaitNextKeyframe` returned.
            AwaitNextKeyframe<native><public>()<suspends>:await_next_keyframe_result

            # Native implementation of `Play`.
            PlayInternal<native><epic_internal>():playstoppause_result

            # Starts or resumes playback of the animation.
            Play<public>():void = external {}

            # Native implementation of `Pause`.
            PauseInternal<native><epic_internal>():playstoppause_result

            # Pauses the animation if it is already playing.
            Pause<public>():void = external {}

            # Native implementation of `Stop`.
            StopInternal<native><epic_internal>():playstoppause_result

            # Stops playback and resets the animation to the first keyframe. Also resets the prop transform. Calling this method is valid while the animation is in the `Playing` or `Paused` states.
            Stop<public>():void = external {}

            # Returns the current state of this `animation_controller`.
            GetState<native><public>()<transacts>:animation_controller_state

            # Succeeds if this `animation_controller`s target is still valid (i.e., the target has not been disposed of either via `Dispose` or through any external system.)
            IsValid<native><public>()<transacts><decides>:void

            # Native implementation of `SetAnimation`.
            SetAnimationInternal<native><epic_internal>(Keyframes:[]keyframe_delta, ?AnimationMode:animation_mode = external {}, ?DeltaScaleMode:keyframe_delta_scale_mode = external {}):set_animation_result

            # Sets the animation for the `animation_controller`. Animations are processed in the order provided in `Keyframes`. See notes in `keyframe_delta` and `animation_mode` for more details on controlling the animations.
            SetAnimation<public>(Keyframes:[]keyframe_delta, ?Mode:animation_mode):void = external {}

            # Signaled each time a keyframe is reached. Callback(KeyframeIndex:int, InReverse:logic). Note that the KeyframeIndex in the callback is generally in [1, NumDeltaKeyframes] except that in a PingPong animation the final keyframe played in reverse is identified as index 0. This is because SetAnimation takes *delta* keyframes whereas this event notifies the listener that a specific keyframe has been reached.
            KeyframeReachedEvent<native><public>:listenable(tuple(int, logic)) = external {}

            # Signaled when the entire animation is complete. This will only fire for `OneShot` animations.
            MovementCompleteEvent<native><public>:listenable(tuple()) = external {}

            # Signaled when the state has changed. Use `GetState` to get the new state.
            StateChangedEvent<native><public>:listenable(tuple()) = external {}

        # Native implementation of `GetAnimationController`.
        GetAnimationController<native><epic_internal>(MovableObject:creative_movable_object_base)<transacts>:tuple(?animation_controller, get_animation_controller_result)

        # Returns an `animation_controller` used to animate `Prop`. Only a subset of `creative_prop` types can be animated, though this may change in the future. A few examples of props that cannot be animated yet are:
        #  * Walls attached to buildings
        #  * Treasure chests
        #  * Loot llamas
        (Prop:creative_prop).GetAnimationController<public>()<transacts><decides>:animation_controller = external {}

    # Inherit from this to create a custom creative device. Inherited classes will appear in the UEFN content browser the next time Verse compiles. Instances of your derived `creative_device` can then be placed in the island by dragging them from the content browser into the scene.
    creative_device<native><public> := class<concrete>(creative_movable_object_base, creative_object_interface):
        PlayspaceEpicInternal<native><epic_internal>:?fort_playspace = external {}

        # Returns the `fort_playspace` that `creative_device` belongs to.
        GetPlayspaceEpicInternal<override><native>()<transacts>:fort_playspace

        # Override to add custom logic when the game experience begins.
        OnBegin<native_callable><public>()<suspends>:void = external {}

        # Override to add custom logic when the game experience ends. Any coroutines spawned inside `OnEnd` may never execute.
        OnEnd<native_callable><public>():void = external {}

        # Returns the transform of the `creative_device` with units in cm.
        GetTransform<override>()<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)transform = external {}

        # Teleports the `creative_device` to the specified `Position` and `Rotation`.
        TeleportTo<public>(Position:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, Rotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation)<transacts><decides>:void = external {}

        # Teleports the `creative_device` to the specified location defined by `Transform`, also applies rotation and scale accordingly.
        TeleportTo<public>(Transform:(/UnrealEngine.com/Temporary/SpatialMath:)transform)<transacts><decides>:void = external {}

        # Moves the `creative_device` to the specified `Position` and `Rotation` over the specified time, in seconds. If an animation is currently playing on the `creative_device` it will be stopped and put into the `AnimationNotSet` state.
        MoveTo<public>(Position:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, Rotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation, OverTime:float)<suspends>:move_to_result = external {}

        # Moves the `creative_device` to the specified `Transform` over the specified time, in seconds. If an animation is currently playing on the `creative_device` it will be stopped and put into the `AnimationNotSet` state.
        MoveTo<public>(Transform:(/UnrealEngine.com/Temporary/SpatialMath:)transform, OverTime:float)<suspends>:move_to_result = external {}

        # Gets the global transform of this device.
        GetGlobalTransform<override>()<transacts>:(/Verse.org/SpatialMath:)transform = external {}

        # Sets the global transform of this device.
        SetGlobalTransform<public>(NewGlobalTransform:(/Verse.org/SpatialMath:)transform)<transacts>:void = external {}

        @available {MinUploadedAtFNVersion := 4000}
        # Teleports the `creative_device` to the specified location defined by `Transform`, also applies rotation and scale accordingly.
        TeleportTo<public>(Transform:(/Verse.org/SpatialMath:)transform)<transacts><decides>:void = external {}

        @available {MinUploadedAtFNVersion := 4000}
        # Moves the `creative_device` to the specified `Transform` over the specified time, in seconds. If an animation is currently playing on the `creative_device` it will be stopped and put into the `AnimationNotSet` state.
        MoveTo<public>(Transform:(/Verse.org/SpatialMath:)transform, OverTime:float)<suspends>:move_to_result = external {}

        # Shows this device in the world.
        Show<native><public>()<transacts>:void

        # Hides this device in the world.
        Hide<native><public>()<transacts>:void

    # Base class for creative_device.
    creative_device_base<native><public> := class<abstract><epic_internal>(creative_object):
        # Set this device visible in the world.
        Show_Internal<native><epic_internal>()<transacts>:void

        # Set this device invisible in the world.
        Hide_Internal<native><epic_internal>()<transacts>:void

        GetBPFunctionNamesForValidation<native_callable><epic_internal>():[]string = external {}

        InvokeDeviceFunction<native><epic_internal>(FunctionName:string):void

        InvokeDeviceFunction<native><epic_internal>(FunctionName:string, Agent:agent):void

        DeviceFunctionSetInt<native><epic_internal>(FunctionName:string, Value:int):void

        DeviceFunctionSetFloat<native><epic_internal>(FunctionName:string, Value:float):void

        DeviceFunctionSetLogic<native><epic_internal>(FunctionName:string, Value:logic):void

        DeviceFunctionSetString<native><epic_internal>(FunctionName:string, Value:string):void

        DeviceFunctionSetMessage<native><epic_internal>(FunctionName:string, Value:message):void

        DeviceFunctionSetColor<native><epic_internal>(FunctionName:string, Value:color):void

        DeviceFunctionSetAgent<native><epic_internal>(FunctionName:string, Agent:?agent):void

        DeviceFunctionSetAgentArray<native><epic_internal>(FunctionName:string, Agents:[]agent):void

        DeviceFunctionSetVector3<native><epic_internal>(FunctionName:string, Value:(/UnrealEngine.com/Temporary/SpatialMath:)vector3):void

        DeviceFunctionSetTexture<native><epic_internal>(FunctionName:string, Value:?texture):void

        DeviceFunctionSetCreativeProp<native><epic_internal>(FunctionName:string, Value:?creative_prop):void

        DeviceFunctionSetCharacterDefinition<native><epic_internal>(FunctionName:string, Value:?npc_character_definition)<transacts>:void

        DeviceFunctionGetInt<native><epic_internal>(FunctionName:string)<reads>:int

        DeviceFunctionGetFloat<native><epic_internal>(FunctionName:string)<reads>:float

        DeviceFunctionGetLogic<native><epic_internal>(FunctionName:string)<reads>:logic

        DeviceFunctionGetString<native><epic_internal>(FunctionName:string)<reads>:string

        DeviceFunctionGetColor<native><epic_internal>(FunctionName:string)<reads>:color

        DeviceFunctionGetAgent<native><epic_internal>(FunctionName:string)<reads>:?agent

        DeviceFunctionGetAgentArray<native><epic_internal>(FunctionName:string)<reads>:[]agent

        DeviceFunctionGetDevice<native><epic_internal>(FunctionName:string)<reads>:?creative_device_base

        DeviceFunctionGetDeviceArray<native><epic_internal>(FunctionName:string)<reads>:[]creative_device_base

        DeviceFunctionGetVehicle<native><epic_internal>(FunctionName:string)<reads>:?fort_vehicle

        DeviceFunctionGetVector3<native><epic_internal>(FunctionName:string)<reads>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3

        DeviceFunctionGetTransform<native><epic_internal>(FunctionName:string)<reads>:(/UnrealEngine.com/Temporary/SpatialMath:)transform

        DeviceFunctionGetCharacterDefinition<native><epic_internal>(FunctionName:string)<reads>:?npc_character_definition

        InvokeDeviceFunctionByType<native><epic_internal>(FunctionName:string, Params:[]function_parameter_base)<transacts>:?function_parameter_base

        InvokeDeviceFunctionByTypeConst<native><epic_internal>(FunctionName:string, Params:[]function_parameter_base)<reads>:?function_parameter_base

        InvokeDeviceFunctionByName<native><epic_internal>(FunctionName:string, Params:[string]function_parameter_base)<transacts>:?function_parameter_base

        InvokeDeviceFunctionByNameConst<native><epic_internal>(FunctionName:string, Params:[string]function_parameter_base)<reads>:?function_parameter_base

    # Internal asset for representing creative devices.
    creative_device_asset<native><public> := class<computes><final><epic_internal>(asset):


    # Returns the simulation entity at the root of the experience this `creative_device` is operating within.
    #   * The simulation entity is the rootmost entity in an experience.
    #   * Fails if this `creative_device` is not operating in a context with a valid SimulationEntity.
    (CreativeDevice:creative_device).(/Fortnite.com/Devices:)GetSimulationEntity<native><public>()<transacts><decides>:entity

    @import_as("/Script/VerseDevices.UVerseMovableObjectBase")
    creative_movable_object_base<native><epic_internal> := class<abstract><epic_internal>:


    (MovableObject:creative_movable_object_base).GetTransformInternalImpl<native><epic_internal>()<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)transform

    (MovableObject:creative_movable_object_base).TeleportToInternalImpl<native><epic_internal>(Transform:(/UnrealEngine.com/Temporary/SpatialMath:)transform, SkipTransformCheck:logic)<transacts>:teleport_to_result

    (MovableObject:creative_movable_object_base).TeleportToInternal<epic_internal>(Position:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, Rotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation)<transacts><decides>:void = external {}

    (MovableObject:creative_movable_object_base).TeleportToInternal<epic_internal>(Transform:(/UnrealEngine.com/Temporary/SpatialMath:)transform)<transacts><decides>:void = external {}

    (MovableObject:creative_movable_object_base).MoveToInternalImpl<epic_internal>(TargetTransform:(/UnrealEngine.com/Temporary/SpatialMath:)transform, OverTime:float)<suspends>:move_to_internal_result = external {}

    # Moves the `creative_movable_object_base` to the specified `Position` and `Rotation` over the specified time. If an animation is currently playing on the `creative_movable_object_base` it will be stopped and put into the `AnimationNotSet` state.
    (MovableObject:creative_movable_object_base).MoveToInternal<epic_internal>(Position:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, Rotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation, OverTime:float)<suspends>:move_to_result = external {}

    # Moves the `creative_movable_object_base` to the specified `Transform` over the specified time. If an animation is currently playing on the `creative_movable_object_base` it will be stopped and put into the `AnimationNotSet` state.
    (MovableObject:creative_movable_object_base).MoveToInternal<epic_internal>(Transform:(/UnrealEngine.com/Temporary/SpatialMath:)transform, OverTime:float)<suspends>:move_to_result = external {}

    # Base class for creative devices and props.
    creative_object<native><public> := class<epic_internal>(creative_movable_object_base, creative_object_interface):
        # Returns the `fort_playspace` that `creative_object` belongs to.
        GetPlayspaceEpicInternal<override><native>()<transacts>:fort_playspace

        # Returns the transform of the `creative_object` with units in cm. You must check `creative_object.IsValid` before calling this if there is a possibility the object has been disposed or destroyed by gameplay.
        # Otherwise a runtime error will result.
        GetTransform<override>()<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)transform = external {}

        # Teleports the `creative_object` to the specified `Position` and `Rotation`.
        TeleportTo<public>(Position:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, Rotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation)<transacts><decides>:void = external {}

        # Teleports the `creative_object` to the specified location defined by `Transform`, also applies rotation and scale accordingly.
        TeleportTo<public>(Transform:(/UnrealEngine.com/Temporary/SpatialMath:)transform)<transacts><decides>:void = external {}

        # Moves the `creative_object` to the specified `Position` and `Rotation` over the specified time, in seconds. If an animation is currently playing on the `creative_object` it will be stopped and put into the `AnimationNotSet` state.
        MoveTo<public>(Position:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, Rotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation, OverTime:float)<suspends>:move_to_result = external {}

        # Moves the `creative_object` to the specified `Transform` over the specified time, in seconds. If an animation is currently playing on the `creative_object` it will be stopped and put into the `AnimationNotSet` state.
        MoveTo<public>(Transform:(/UnrealEngine.com/Temporary/SpatialMath:)transform, OverTime:float)<suspends>:move_to_result = external {}

        # Gets the global transform of this object.
        GetGlobalTransform<override>()<transacts>:(/Verse.org/SpatialMath:)transform = external {}

        # Sets the global transform of this object.
        SetGlobalTransform<public>(NewGlobalTransform:(/Verse.org/SpatialMath:)transform)<transacts>:void = external {}

        @available {MinUploadedAtFNVersion := 4000}
        # Teleports the `creative_device` to the specified location defined by `Transform`, also applies rotation and scale accordingly.
        TeleportTo<public>(Transform:(/Verse.org/SpatialMath:)transform)<transacts><decides>:void = external {}

        @available {MinUploadedAtFNVersion := 4000}
        # Moves the `creative_device` to the specified `Transform` over the specified time, in seconds. If an animation is currently playing on the `creative_device` it will be stopped and put into the `AnimationNotSet` state.
        MoveTo<public>(Transform:(/Verse.org/SpatialMath:)transform, OverTime:float)<suspends>:move_to_result = external {}

        # Sets the team to a specific user. 0 is no team.
        SetTeam<native><epic_internal>(TeamIndex:type{_X:int where 0 <= _X, _X <= 255}):void

    # Makes a `string` from `creative_object`.
    (/Fortnite.com/Devices:)ToString<native><epic_internal>(InCreativeObject:creative_object)<computes>:string

    # Succeeds if Left and Right are equal.
    (/Fortnite.com/Devices:)Equals<native><epic_internal>(Left:creative_object, Right:creative_object)<transacts><decides>:void

    # Returns a queryable `tag_view` which can be used to query the tags on `CreativeObject`.
    (CreativeObject:creative_object_interface).GetTags<native><public>()<transacts>:tag_view

    # Returns the `fort_playspace` that `CreativeObject` belongs to.
    (CreativeObject:creative_object_interface).GetPlayspace<native><public>()<transacts>:fort_playspace

    @experimental
    # Returns the `entity` associated to that `CreativeObject.
    (CreativeObject:creative_object_interface).GetEntity<native><epic_internal>()<transacts><decides>:entity

    # Returns the simulation entity at the root of the experience this `creative_object` is operating within.
    #   * The simulation entity is the rootmost entity in an experience.
    #   * Fails if this `creative_object` is not operating in a context with a valid SimulationEntity.
    (CreativeObject:creative_object).(/Fortnite.com/Devices:)GetSimulationEntity<native><public>()<transacts><decides>:entity

    creative_object_interface<native><public> := interface<epic_internal>(positional):
        # Returns the `fort_playspace` that `CreativeObject` belongs to.
        GetPlayspaceEpicInternal<native_callable><epic_internal>()<transacts>:fort_playspace

    # A Fortnite prop that has been placed or spawned in the island.
    creative_prop<native><public> := class<concrete><final>(creative_object, invalidatable):
        # Destroys the `creative_prop` and remove it from the island.
        Dispose<native><override>():void

        # Succeeds if this object has been disposed of either via `Dispose()` or through an external system.
        IsDisposed<native><final><public>()<transacts><decides>:void

        # Succeeds if this object has not been disposed of either via `Dispose()` or through an external system.
        IsValid<native><override>()<transacts><decides>:void

        # Changes the Mesh used by this instance.
        SetMesh<native><public>(Mesh:mesh)<transacts>:void

        # Changes the Material of the Mesh used by this instance. Optionally can specify which Mesh element index to apply the material to, otherwise defaults to the 0 (default) Mesh element
        SetMaterial<native><public>(Material:material, ?Index:int = external {})<transacts>:void

        # Shows the `creative_prop` in the world and enable collisions.
        Show<native><public>()<transacts>:void

        # Hides the `creative_prop` in the world and disable collisions.
        Hide<native><public>()<transacts>:void

        # Returns true if the `creative_prop` is hidden in the world.
        IsHidden<native><epic_internal>()<transacts>:logic

        # Enable/disable whether this prop can be damaged. If disabled, the creative prop will not take damage from attacks.
        var CanBeDamaged<public>:logic = external {}

        # Returns a ‘creative_prop’s linear velocity in meters/second.
        GetLinearVelocity<native><public>()<reads>:(/Verse.org/SpatialMath:)vector3

        # Set a ‘creative_prop’s linear velocity in meters/second. Will not do anything if physics is disabled.
        SetLinearVelocity<native><public>(LinearVelocity:(/Verse.org/SpatialMath:)vector3):void

        # Apply a linear impulse to a ‘creative_prop’ with units in Newton*seconds. Will not do anything if physics is disabled.
        ApplyLinearImpulse<native><public>(LinearImpulse:(/Verse.org/SpatialMath:)vector3):void

        # Returns a ‘creative_prop’s angular velocity in radians/second.
        GetAngularVelocity<native><public>()<reads>:(/Verse.org/SpatialMath:)vector3

        # Set a ‘creative_prop’s angular velocity in radians/seconds. Will not do anything if physics is disabled.
        SetAngularVelocity<native><public>(AngularVelocity:(/Verse.org/SpatialMath:)vector3):void

        # Apply an angular impulse to a ‘creative_prop’ with units in Newton*meter*seconds. Will not do anything if physics is disabled.
        ApplyAngularImpulse<native><public>(AngularImpulse:(/Verse.org/SpatialMath:)vector3):void

        # Returns a ‘creative_prop’s mass in kilograms.
        GetMass<native><public>()<reads>:float

        # Apply a force to a ‘creative_prop’ with units in Newtons. Will not do anything if physics is disabled.
        ApplyForce<native><public>(Force:(/Verse.org/SpatialMath:)vector3):void

        # Apply a torque to a ‘creative_prop’ with units in Newton*meters. Will not do anything if physics is disabled.
        ApplyTorque<native><public>(Torque:(/Verse.org/SpatialMath:)vector3):void

        # Get whether a ‘creative_prop’ is dynamic (affected by physics functions).
        GetDynamic<native><public>()<reads>:logic

        # Set whether a ‘creative_prop’ is dynamic (affected by physics functions). Will not do anything if physics is disabled OR the prop does not have a FortPhysicsComponent.
        SetDynamic<native><public>(Dynamic:logic):void

    # Asset used to spawn `creative_prop` instances.
    creative_prop_asset<native><public> := class<computes><concrete><final><epic_internal>:


    # A default asset to be used when creating an editor-specified `creative_prop_asset` variable.
    DefaultCreativePropAsset<public>:creative_prop_asset = external {}

    # Results for `SpawnProp`.
    spawn_prop_result<native><public> := enum:
        # Success.
        Ok
        # An unknown error occurred. If this happens frequently, contact Epic support.
        UnknownError
        # The spawn point contains NaN or Inf.
        InvalidSpawnPoint
        # The spawn point is outside the island's boundaries.
        SpawnPointOutOfBounds
        # The asset is not a valid `creative_prop`.
        InvalidAsset
        # More props have been spawned than are permitted by the island's rules (currently 100 per script device and 200 total per island).
        TooManyProps

    # Spawns a `creative_prop` at the specified `Position` and `Rotation`. `Position` and `Rotation` units are in cm. The relative scale defined in the `creative_prop_asset` will be applied upon spawn.
    # Returns tuple:
    #  0: Instance of a `creative_prop`. False if no `creative_prop` could be created. See `spawn_prop_result` for failure cases.
    #  1: Success or failure results.
    SpawnProp<native><public>(Asset:creative_prop_asset, Position:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, Rotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation)<transacts>:tuple(?creative_prop, spawn_prop_result)

    # Spawns a `creative_prop` at the specified `Transform`. `Units are in cm.
    # Returns tuple:
    #  0: Instance of a `creative_prop`. False if no `creative_prop` could be created. See `spawn_prop_result` for failure cases.
    #  1: Success or failure results.
    SpawnProp<native><public>(Asset:creative_prop_asset, Transform:(/UnrealEngine.com/Temporary/SpatialMath:)transform)<transacts>:tuple(?creative_prop, spawn_prop_result)

    creative_prop_debug_log<epic_internal> := class(log_channel):


    # Base implementation for events on `creative_device`s.
    device_event<native><epic_internal>(t:type) := class<abstract>(listenable(t)):
        @available {MinUploadedAtFNVersion := 4294967041}
        (/Fortnite.com/Devices/device_event:)Devices_device_event_Variance_Inherited<private>():tuple(t, t, t, t) = external {}

        (/Fortnite.com/Devices/device_event:)Devices_device_event_Variance<private>(:t):tuple(t, t, t) = external {}

        EventName<native><public>:string

        # Subscribes Callback to this event. That same Callback will only be triggered once per event even if it is called with Subscribe more than once.
        Subscribe<native><override>(Callback:type {_(:t):void})<transacts>:cancelable

        Await<native><override>()<suspends>:t

    # Implementation of `device_event(:type)` with no payload.
    device_event_void<native><epic_internal> := class(device_event(tuple())):


    # Implementation of `device_event(:type)` with required `agent` payload.
    device_event_agent<native><epic_internal> := class(device_event(agent)):


    # Implementation of `device_event(:type)` with required `player` payload.
    device_event_player<native><epic_internal> := class(device_event(player)):


    # Implementation of `device_event(:type)` with required `creative_prop` payload.
    device_event_prop<native><epic_internal> := class(device_event(creative_prop)):


    # Implementation of `device_event(:type)` with optional `agent` payload.
    device_event_optional_agent<native><epic_internal> := class(device_event(?agent)):


    # Implementation of `device_event(:type)` with required `int` payload.
    device_event_int<native><epic_internal> := class(device_event(int)):


    # Implementation of `device_event(:type)` with a `float` payload.
    device_event_float<native><epic_internal> := class(device_event(float)):


    # Implementation of `device_event(:type)` with required `string` payload.
    device_event_string<native><epic_internal> := class(device_event([]char)):


    # Implementation of `device_event(:type)` with a `tuple(int, float)` payload.
    device_event_int_float<native><epic_internal> := class(device_event(tuple(int, float))):


    # Implementation of `device_event(:type)` with a `tuple(agent, int)` payload.
    device_event_agent_int<native><epic_internal> := class(device_event(tuple(agent, int))):


    # Implementation of `device_event(:type)` with a `tuple(agent, float)` payload.
    device_event_agent_float<native><epic_internal> := class(device_event(tuple(agent, float))):


    # Implementation of `device_event(:type)` with a `tuple(agent, string)` payload.
    device_event_agent_string<native><epic_internal> := class(device_event(tuple(agent, string))):


    # Implementation of `device_event(:type)` with a `tuple(?agent, int)` payload.
    device_event_optional_agent_int<native><epic_internal> := class(device_event(tuple(?agent, int))):


    # Implementation of `device_event(:type)` with a `tuple(?agent, float)` payload.
    device_event_optional_agent_float<native><epic_internal> := class(device_event(tuple(?agent, float))):


    # Implementation of `device_event(:type)` with a `tuple(?agent, []agent)` payload.
    device_event_optional_agent_agent_array<native><epic_internal> := class(device_event(tuple(?agent, []agent))):


    # Implementation of `device_event(:type)` with a `tuple(player, ?agent)` payload.
    device_event_player_optional_agent<native><epic_internal> := class(device_event(tuple(player, ?agent))):


    # Implementation of `device_event(:type)` with a `tuple(player, creative_device_base)` payload.
    device_event_player_creative_device<native><epic_internal> := class(device_event(tuple(player, creative_device_base))):


    # Implementation of `device_event(:type)` with required `fort_vehicle` payload.
    device_event_vehicle<native><epic_internal> := class(device_event(fort_vehicle)):


    # Implementation of `device_event(:type)` with a `tuple(?agent, fort_vehicle, int)` payload.
    device_event_optional_agent_vehicle_int<native><epic_internal> := class(device_event(tuple(?agent, fort_vehicle, int))):


    # Payload of `device_event_ai_interaction`.
    device_ai_interaction_result<native><public> := struct<epic_internal>:
        # Optional agent that triggered the interaction
        Source<native><public>:?agent

        # Optional agent targeted by `Source`.
        Target<native><public>:?agent

    # Implementation of `device_event(:type)` with `device_ai_interaction_result` payload.
    device_event_ai_interaction<native><epic_internal> := class(device_event(device_ai_interaction_result)):
        SourceName<native><public>:string

        TargetName<native><public>:string

    # Payload of `device_event_carryable_spawner_agent_impact`.
    carryable_spawner_agent_impact_result<native><public> := struct<epic_internal>:
        # Agent impacted by the carryable.
        Target<native><public>:?agent

        # The agent responsible for the impact. Either the thrower, or if none exists, the agent who instigated the carryable to spawn.
        Source<native><public>:?agent

        # Damage applied by the impact.
        Damage<native><public>:float

        # Whether the impact was a direct result of being thrown (as opposed to an indirect hit from bouncing or rolling).
        ImpactedFromThrow<native><public>:logic

    # Implementation of `device_event(:type)` with `carryable_spawner_agent_impact_result` payload.
    device_event_carryable_spawner_agent_impact<native><epic_internal> := class(device_event(carryable_spawner_agent_impact_result)):
        SourceName<native><public>:string

        TargetName<native><public>:string

    function_parameter_base<native><epic_internal> := class<abstract><computes>:


    function_parameter_int<native><epic_internal> := class<computes>(function_parameter_base):
        Value<native><epic_internal>:int

    function_parameter_string<native><epic_internal> := class<computes>(function_parameter_base):
        Value<native><epic_internal>:string

    function_parameter_message<native><epic_internal> := class<computes>(function_parameter_base):
        Value<native><epic_internal>:?message

    function_parameter_color<native><epic_internal> := class<computes>(function_parameter_base):
        Value<native><epic_internal>:color

    function_parameter_float<native><epic_internal> := class<computes>(function_parameter_base):
        Value<native><epic_internal>:float

    function_parameter_agent<native><epic_internal> := class<computes>(function_parameter_base):
        Value<native><epic_internal>:?agent

    function_parameter_agent_array<native><epic_internal> := class<computes>(function_parameter_base):
        Value<native><epic_internal>:[]agent

    function_parameter_device<native><epic_internal> := class<computes>(function_parameter_base):
        Value<native><epic_internal>:?creative_device_base

    function_parameter_device_array<native><epic_internal> := class<computes>(function_parameter_base):
        Value<native><epic_internal>:[]creative_device_base

    function_parameter_fort_vehicle<native><epic_internal> := class<computes>(function_parameter_base):
        Value<native><epic_internal>:?fort_vehicle

    function_parameter_logic<native><epic_internal> := class<computes>(function_parameter_base):
        Value<native><epic_internal>:logic

    function_parameter_vector3<native><epic_internal> := class<computes>(function_parameter_base):
        Value<native><epic_internal>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3

    function_parameter_transform<native><epic_internal> := class<computes>(function_parameter_base):
        Value<native><epic_internal>:(/UnrealEngine.com/Temporary/SpatialMath:)transform

    function_parameter_texture<native><epic_internal> := class<computes>(function_parameter_base):
        Value<native><epic_internal>:?texture

    function_parameter_material<native><epic_internal> := class<computes>(function_parameter_base):
        Value<native><epic_internal>:?material

    function_parameter_mesh<native><epic_internal> := class<computes>(function_parameter_base):
        Value<native><epic_internal>:?mesh

    function_parameter_creative_prop<native><epic_internal> := class<computes>(function_parameter_base):
        Value<native><epic_internal>:?creative_prop

    function_parameter_character_definition<native><epic_internal> := class<computes>(function_parameter_base):
        Value<native><epic_internal>:?npc_character_definition

    # Class that implements the common logic for a healthful, damageable, healable device.
    device_health<native><epic_internal> := class<epic_internal>(healthful, damageable, healable):
        GetHealth<override><native>()<transacts>:float

        SetHealth<override><native>(Health:float)<transacts>:void

        GetMaxHealth<override><native>()<transacts>:float

        SetMaxHealth<override><native>(MaxHealth:float)<transacts>:void

        Damage<override><native>(Amount:float):void

        Damage<override><native>(Args:damage_args):void

        DamagedEvent<override>():listenable(damage_result) = external {}

        Heal<override><native>(Amount:float):void

        Heal<override><native>(Args:healing_args):void

        HealedEvent<override>():listenable(healing_result) = external {}

    # Generates a `creative_object_interface` for every creative object that has any tag of type `tag_type`. Will not find anything if called on a default constructed object.
    (InCreativeDevice:creative_device).FindCreativeObjectsWithTag<public>(tag_type:castable_subtype(tag))<transacts>:generator(creative_object_interface) = external {}

    # Generates a `creative_object_interface` for every creative object that has any tag of type `tag_type`. Will not find anything if called on a default constructed object.
    (InCreativeDevice:creative_device_base).FindCreativeObjectsWithTag<public>(tag_type:castable_subtype(tag))<transacts>:generator(creative_object_interface) = external {}

    # Generates a `creative_object_interface` for every creative object that has any tag of type `tag_type`. Will not find anything if called on an `npc_behavior` that is not simulating.
    (InNPCBehavior:npc_behavior).FindCreativeObjectsWithTag<native><public>(tag_type:castable_subtype(tag))<transacts>:generator(creative_object_interface)

    # Generates a `creative_object_interface` for every creative object that has any tag of type `tag_type`. Will not find anything if called on an `entity` that is not in the scene.
    (InEntity:entity).FindCreativeObjectsWithTag<native><public>(tag_type:castable_subtype(tag))<transacts>:generator(creative_object_interface)

    @deprecated {Message := "Use the overload that takes a tag type instead of a tag instance."}
    # DEPRECATED - use corresponding extension methods that takes a tag type instead of a tag instance.
    # Generates a `creative_object_interface` for every creative object that has been marked with the specified `Tag`. Will not find anything if called on a default constructed object.
    (InCreativeDevice:creative_device).FindCreativeObjectsWithTag<public>(Tag:tag)<transacts>:generator(creative_object_interface) = external {}

    @deprecated {Message := "Use the overload that takes a tag type instead of a tag instance."}
    # DEPRECATED - use corresponding extension methods that takes a tag type instead of a tag instance.
    # Generates a `creative_object_interface` for every creative object that has been marked with the specified `Tag`. Will not find anything if called on a default constructed object.
    (InCreativeDevice:creative_device_base).FindCreativeObjectsWithTag<public>(Tag:tag)<transacts>:generator(creative_object_interface) = external {}

    @available {MinUploadedAtFNVersion := 3300}
    @deprecated {Message := "Use the overload that takes a tag type instead of a tag instance."}
    # DEPRECATED - use corresponding extension methods that takes a tag type instead of a tag instance.
    # Generates a `creative_object_interface` for every creative object that has been marked with the specified `Tag`. Will not find anything if called on an `npc_behavior` that is not simulating.
    (InNPCBehavior:npc_behavior).FindCreativeObjectsWithTag<native><public>(Tag:tag)<transacts>:generator(creative_object_interface)

    @deprecated {Message := "Use the overload that takes a tag type instead of a tag instance."}
    # DEPRECATED - use corresponding extension methods that takes a tag type instead of a tag instance.
    # Generates a `creative_object_interface` for every creative object that has been marked with the specified `Tag`. Will not find anything if called on an `entity` that is not in the scene.
    (InEntity:entity).FindCreativeObjectsWithTag<native><public>(Tag:tag)<transacts>:generator(creative_object_interface)

    @deprecated {Message := "Use `FindCreativeObjectsWithTag` instead."}
    # DEPRECATED - use `FindCreativeObjectsWithTag` instead.
    # Returns an array containing all creative objects which have been marked with the specified `Tag`.
    GetCreativeObjectsWithTag<native><public>(Tag:tag)<transacts>:[]creative_object_interface

    @deprecated {Message := "Use `FindCreativeObjectsWithTag` instead."}
    # DEPRECATED - use `FindCreativeObjectsWithTag` instead.
    # Returns an array containing creative objects which have tag(s) matching the specified `SearchCriteria`.
    GetCreativeObjectsWithTags<native><public>(SearchCriteria:tag_search_criteria)<transacts>:[]creative_object_interface

    move_to_debug_log<epic_internal> := class(log_channel):


    # Results for `MoveTo`.
    move_to_result<public> := enum:
        # The destination has been reached.
        DestinationReached
        # The destination will not be reached. See debug log in UEFN for more info.
        WillNotReachDestination

    # Results for `MoveToInternal`.
    move_to_internal_result<epic_internal> := enum:
        # The destination has been reached.
        DestinationReached
        # The move was terminated before completion (e.g., via the `animation_controller` API).
        WillNotReachDestination
        # An unknown error occurred. If this happens frequently, contact Epic support.
        UnknownError
        # NaN or Infinity in the requested destination.
        InvalidDestination
        # The `OverTime` parameter was not a float greater than zero.
        InvalidTime
        # The object being moved is no longer valid. Example invalid states:
        #  * The object has been destroyed during gameplay.
        #  * The object has been destroyed by Verse.
        #  * The object has the 'Register with Structural Grid' option set in UEFN.
        InvalidObject
        # The object being moved cannot be scaled.
        ScaleNotAllowed
        # The destination would cause the object to be at least partially outside the island's boundaries.
        DestinationOutOfBounds

    HandleMoveToInternalResult<epic_internal>(Result:move_to_internal_result):move_to_result = external {}

    # Returns a `string` representation of `move_to_internal_result` objects.
    (/Fortnite.com/Devices:)ToString<epic_internal>(MoveToInternalResult:move_to_internal_result)<computes>:string = external {}