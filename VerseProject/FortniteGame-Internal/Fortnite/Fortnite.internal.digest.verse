# Copyright Epic Games, Inc. All Rights Reserved.
#################################################
# Generated Digest of Verse API
# DO NOT modify this manually!
# Generated from build: ++Fortnite+Release-35.10-CL-42906078
#################################################

Devices<public> := module:
    using {/Verse.org/SceneGraph}
    using {/Verse.org/Native}
    @import_as("/Script/FortniteGame.ULevelSaveRecord")
    @experimental
    level_save_record<native><epic_internal> := class<epic_internal>:

    @experimental
    bridge_component<native><epic_internal> := class<final><final_super>(component):
        OnInitializedInternal<native><override>():void

        OnUninitializingInternal<native><override>():void

        OnAddedToSceneInternal<native><override>():void

        @experimental
        AsCreativeDevice<public>(creative_device_type:subtype(creative_device_base))<suspends>:?creative_device_type = external {}

    # Module import path: /Fortnite.com/Devices/CreativeAnimation
    CreativeAnimation<public> := module:
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
            Linear<public>:cubic_bezier_parameters = external {}

            # `Ease` animations start slowly, speed up, then end slowly. The speed of the animation is slightly slower at the end than the start.
            Ease<public>:cubic_bezier_parameters = external {}

            # `EaseIn` animations start slow, then speed up towards the end.
            EaseIn<public>:cubic_bezier_parameters = external {}

            # `EaseOut` animations start fast, then slow down towards the end.
            EaseOut<public>:cubic_bezier_parameters = external {}

            # `EaseInOut` animations are similar to `Ease` but the start and end animation speed is symmetric.
            EaseInOut<public>:cubic_bezier_parameters = external {}

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

    # Internal asset for representing creative devices.
    creative_device_asset<native><public> := class<computes><final><epic_internal>(asset):

    @experimental
    # Returns the simulation entity at the root of the experience this `creative_device` is operating within.
    #   * The simulation entity is the rootmost entity in an experience.
    #   * Fails if this `creative_device` is not operating in a context with a valid SimulationEntity.
    (CreativeDevice:creative_device).(/Fortnite.com/Devices:)GetSimulationEntity<native><public>()<transacts><decides>:entity

    @import_as("/Script/VerseDevices.UVerseMovableObjectBase")
    creative_movable_object_base<native><epic_internal> := class<abstract><epic_internal>:

    (MovableObject:creative_movable_object_base).GetTransformInternalImpl<native><epic_internal>()<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)transform

    (MovableObject:creative_movable_object_base).TeleportToInternalImpl<native><epic_internal>(Transform:(/UnrealEngine.com/Temporary/SpatialMath:)transform)<transacts>:teleport_to_result

    (MovableObject:creative_movable_object_base).TeleportToInternal<epic_internal>(Position:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, Rotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation)<transacts><decides>:void = external {}

    (MovableObject:creative_movable_object_base).TeleportToInternal<epic_internal>(Transform:(/UnrealEngine.com/Temporary/SpatialMath:)transform)<transacts><decides>:void = external {}

    (MovableObject:creative_movable_object_base).MoveToInternalImpl<epic_internal>(TargetTransform:(/UnrealEngine.com/Temporary/SpatialMath:)transform, OverTime:float)<suspends>:move_to_internal_result = external {}

    # Moves the `creative_movable_object_base` to the specified `Position` and `Rotation` over the specified time. If an animation is currently playing on the `creative_movable_object_base` it will be stopped and put into the `AnimationNotSet` state.
    (MovableObject:creative_movable_object_base).MoveToInternal<epic_internal>(Position:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, Rotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation, OverTime:float)<suspends>:move_to_result = external {}

    # Moves the `creative_movable_object_base` to the specified `Transform` over the specified time. If an animation is currently playing on the `creative_movable_object_base` it will be stopped and put into the `AnimationNotSet` state.
    (MovableObject:creative_movable_object_base).MoveToInternal<epic_internal>(Transform:(/UnrealEngine.com/Temporary/SpatialMath:)transform, OverTime:float)<suspends>:move_to_result = external {}

    creative_object_interface<native><public> := interface<epic_internal>(positional):
        # Returns the `fort_playspace` that `CreativeObject` belongs to.
        GetPlayspaceEpicInternal<native_callable><epic_internal>()<transacts>:fort_playspace

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

        # Sets the team to a specific user. 0 is no team.
        SetTeam<native><epic_internal>(TeamIndex:type {_X:int where 0 <= _X, _X <= 255}):void

    @available {MinUploadedAtFNVersion := 2930}
    # Generates a `creative_object_interface` for every creative object that has been marked with the specified `Tag`. Will not find anything if called on a default constructed object.
    (InMovableObject:creative_movable_object_base).FindCreativeObjectsWithTagInternal<native><epic_internal>(Tag:tag)<transacts>:generator(creative_object_interface)

    @available {MinUploadedAtFNVersion := 2930}
    # Generates a `creative_object_interface` for every creative object that has been marked with the specified `Tag`. Will not find anything if called on a default constructed object.
    (InCreativeDevice:creative_device).FindCreativeObjectsWithTag<public>(Tag:tag)<transacts>:generator(creative_object_interface) = external {}

    @available {MinUploadedAtFNVersion := 2930}
    # Generates a `creative_object_interface` for every creative object that has been marked with the specified `Tag`. Will not find anything if called on a default constructed object.
    (InCreativeDevice:creative_device_base).FindCreativeObjectsWithTag<public>(Tag:tag)<transacts>:generator(creative_object_interface) = external {}

    @available {MinUploadedAtFNVersion := 3300}
    # Generates a `creative_object_interface` for every creative object that has been marked with the specified `Tag`. Will not find anything if called on an `npc_behavior` that is not simulating.
    (InNPCBehavior:npc_behavior).FindCreativeObjectsWithTag<native><public>(Tag:tag)<transacts>:generator(creative_object_interface)

    @experimental
    @available {MinUploadedAtFNVersion := 2930}
    # Generates a `creative_object_interface` for every creative object that has been marked with the specified `Tag`. Will not find anything if called on an `entity` that is not in the scene.
    (InEntity:entity).FindCreativeObjectsWithTag<native><public>(Tag:tag)<transacts>:generator(creative_object_interface)

    @deprecated
    # Deprecated, use `FindCreativeObjectsWithTag` instead.
    # Returns an array containing all creative objects which have been marked with the specified `Tag`.
    GetCreativeObjectsWithTag<native><public>(Tag:tag)<transacts>:[]creative_object_interface

    @deprecated
    # Deprecated, use `FindCreativeObjectsWithTag` instead.
    # Returns an array containing creative objects which have tag(s) matching the specified `SearchCriteria`.
    GetCreativeObjectsWithTags<native><public>(SearchCriteria:tag_search_criteria)<transacts>:[]creative_object_interface

    # Returns a queryable `tag_view` which can be used to query the tags on `CreativeObject`.
    (CreativeObject:creative_object_interface).GetTags<native><public>()<transacts>:tag_view

    # Returns the `fort_playspace` that `CreativeObject` belongs to.
    (CreativeObject:creative_object_interface).GetPlayspace<native><public>()<transacts>:fort_playspace

    @experimental
    # Returns the `entity` associated to that `CreativeObject.
    (CreativeObject:creative_object_interface).(/Fortnite.com/Devices:)GetEntity<native><epic_internal>()<transacts><decides>:entity

    @experimental
    # Returns the simulation entity at the root of the experience this `creative_object` is operating within.
    #   * The simulation entity is the rootmost entity in an experience.
    #   * Fails if this `creative_object` is not operating in a context with a valid SimulationEntity.
    (CreativeObject:creative_object).(/Fortnite.com/Devices:)GetSimulationEntity<native><public>()<transacts><decides>:entity

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

        # Changes the Skeletal Mesh used by this instance.
        SetSkeletalMesh<native><epic_internal>(SkeletalMesh:skeletal_mesh)<transacts>:void

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

    # Spawns a `creative_prop` at the specified `Position` and `Rotation`. `Position` and `Rotation` units are in cm.
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
        EventName<native><public>:string

        # Subscribes Callback to this event. That same Callback will only be triggered once per event even if it is called with Subscribe more than once.
        Subscribe<native><override>(Callback:type {_(:t):void})<transacts>:cancelable

        Await<native><override>()<suspends>:t

    # Implementation of `device_event(:type)` with no payload.
    device_event_void<native><epic_internal> := class(device_event(tuple())):

    # Implementation of `device_event(:type)` with required `agent` payload.
    device_event_agent<native><epic_internal> := class(device_event(agent)):

    # Implementation of `device_event(:type)` with required `creative_prop` payload.
    device_event_prop<native><epic_internal> := class(device_event(creative_prop)):

    # Implementation of `device_event(:type)` with optional `agent` payload.
    device_event_optional_agent<native><epic_internal> := class(device_event(?agent)):

    # Implementation of `device_event(:type)` with required `int` payload.
    device_event_int<native><epic_internal> := class(device_event(int)):

    # Implementation of `device_event(:type)` with a `tuple(int, float)` payload.
    device_event_int_float<native><epic_internal> := class(device_event(tuple(int, float))):

    # Implementation of `device_event(:type)` with a `tuple(agent, int)` payload.
    device_event_agent_int<native><epic_internal> := class(device_event(tuple(agent, int))):

    # Implementation of `device_event(:type)` with a `tuple(agent, float)` payload.
    device_event_agent_float<native><epic_internal> := class(device_event(tuple(agent, float))):

    # Implementation of `device_event(:type)` with a `tuple(?agent, int)` payload.
    device_event_optional_agent_int<native><epic_internal> := class(device_event(tuple(?agent, int))):

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

    function_parameter_fort_vehicle<native><epic_internal> := class<computes>(function_parameter_base):
        Value<native><epic_internal>:?fort_vehicle

    function_parameter_logic<native><epic_internal> := class<computes>(function_parameter_base):
        Value<native><epic_internal>:logic

    function_parameter_vector3<native><epic_internal> := class<computes>(function_parameter_base):
        Value<native><epic_internal>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3

    function_parameter_texture<native><epic_internal> := class<computes>(function_parameter_base):
        Value<native><epic_internal>:?texture

    device_function<native><epic_internal> := class:
        FunctionName<native><epic_internal>:string

        Invoke<native><epic_internal>():void

        Invoke<native><epic_internal>(InAgent:agent):void

    device_function_set_base<native><epic_internal> := class<abstract>:
        FunctionName<native><epic_internal>:string

    device_function_set_int<native><epic_internal> := class(device_function_set_base):
        Invoke<native><epic_internal>(Value:int):void

    device_function_set_float<native><epic_internal> := class(device_function_set_base):
        Invoke<native><epic_internal>(Value:float):void

    device_function_set_logic<native><epic_internal> := class(device_function_set_base):
        Invoke<native><epic_internal>(Value:logic):void

    device_function_set_string<native><epic_internal> := class(device_function_set_base):
        Invoke<native><epic_internal>(Value:string):void

    device_function_set_message<native><epic_internal> := class(device_function_set_base):
        Invoke<native><epic_internal>(Value:message):void

    device_function_set_color<native><epic_internal> := class(device_function_set_base):
        Invoke<native><epic_internal>(Value:color):void

    device_function_set_agent<native><epic_internal> := class(device_function_set_base):
        Invoke<native><epic_internal>(InAgent:?agent):void

    device_function_set_agent_array<native><epic_internal> := class(device_function_set_base):
        Invoke<native><epic_internal>(InAgents:[]agent):void

    device_function_set_vector3<native><epic_internal> := class(device_function_set_base):
        Invoke<native><epic_internal>(Value:(/UnrealEngine.com/Temporary/SpatialMath:)vector3):void

    device_function_set_texture<native><epic_internal> := class(device_function_set_base):
        Invoke<native><epic_internal>(Value:?texture):void

    device_function_get_base<native><epic_internal> := class<abstract>:
        FunctionName<native><epic_internal>:string

    device_function_get_int<native><epic_internal> := class(device_function_get_base):
        Invoke<native><epic_internal>()<reads>:int

    device_function_get_float<native><epic_internal> := class(device_function_get_base):
        Invoke<native><epic_internal>()<reads>:float

    device_function_get_logic<native><epic_internal> := class(device_function_get_base):
        Invoke<native><epic_internal>()<reads>:logic

    device_function_get_string<native><epic_internal> := class(device_function_get_base):
        Invoke<native><epic_internal>()<reads>:string

    device_function_get_color<native><epic_internal> := class(device_function_get_base):
        Invoke<native><epic_internal>()<reads>:color

    device_function_get_agent<native><epic_internal> := class(device_function_get_base):
        Invoke<native><epic_internal>()<reads>:?agent

    device_function_get_agent_array<native><epic_internal> := class(device_function_get_base):
        Invoke<native><epic_internal>()<reads>:[]agent

    device_function_get_vector3<native><epic_internal> := class(device_function_get_base):
        Invoke<native><epic_internal>()<reads>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3

    device_function_set_multi_parameter_base<native><epic_internal> := class<abstract>(device_function_set_base):
        return_type<native><epic_internal>:?subtype(function_parameter_base) = external {}

    device_function_set_params_by_name<native><epic_internal> := class(device_function_set_multi_parameter_base):
        Invoke<native><epic_internal>(NamedParameters:[string]function_parameter_base)<transacts>:?function_parameter_base

        parameter_types<native><epic_internal>:[string]subtype(function_parameter_base)

    device_function_set_params_by_name_const<native><epic_internal> := class(device_function_set_params_by_name):
        InvokeConst<native><epic_internal>(NamedParameters:[string]function_parameter_base)<reads>:?function_parameter_base

    device_function_set_params_by_type<native><epic_internal> := class(device_function_set_multi_parameter_base):
        Invoke<native><epic_internal>(TypeExclusiveParameters:[]function_parameter_base)<transacts>:?function_parameter_base

        parameter_types<native><epic_internal>:[]subtype(function_parameter_base)

    device_function_set_params_by_type_const<native><epic_internal> := class(device_function_set_params_by_type):
        InvokeConst<native><epic_internal>(TypeExclusiveParameters:[]function_parameter_base)<reads>:?function_parameter_base

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

UI<public> := module:
    using {/Verse.org/Assets}
    using {/Verse.org/Simulation}
    using {/UnrealEngine.com/Temporary/UI}
    using {/UnrealEngine.com/Temporary/SpatialMath}
    dynamic_ui_z_order<native><epic_internal> := enum:
        Back
        Middle
        Front
        Custom

    dynamic_ui_anchor<native><epic_internal> := enum:
        TopLeft
        TopCenter
        TopRight
        CenterLeft
        CenterCenter
        CenterRight
        BottomLeft
        BottomCenter
        BottomRight

    dynamic_ui_constraint_base<native><epic_internal> := class<epic_internal>:
        # Offset applied to the widget after the constraint is resolved.
        Offset<native><epic_internal>:vector2 = external {}

    dynamic_ui_constraint_alignment<native><epic_internal> := class<epic_internal>(dynamic_ui_constraint_base):
        # Horizontal alignment of the widget on screen.
        HorizontalAlignment<native><epic_internal>:horizontal_alignment

        # Vertical alignment of the widget on screen.
        VerticalAlignment<native><epic_internal>:vertical_alignment

        # By which anchor should the widget be attached.
        Anchor<native><epic_internal>:dynamic_ui_anchor = external {}

    dynamic_ui_constraint_widget<native><epic_internal> := class<epic_internal>(dynamic_ui_constraint_base):
        # The `widget` to attach to.
        Widget<native><epic_internal>:widget

        # To which anchor should the source widget be attached on the target widget.
        TargetAnchor<native><epic_internal>:dynamic_ui_anchor = external {}

        # By which anchor should the source widget be attached to the target widget.
        Anchor<native><epic_internal>:dynamic_ui_anchor = external {}

        # Unique id used to identify and attach to a specific instance of the target widget class.
        UniqueID<native><epic_internal>:string = external {}

    dynamic_ui_constraint_widget_fn<native><epic_internal> := class<epic_internal>(dynamic_ui_constraint_base):
        # Unique id used to identify and attach to a specific widget.
        UniqueID<native><epic_internal>:string = external {}

        # Path to widget class.
        WidgetClassPath<native><epic_internal>:string

        # To which anchor should the source widget be attached on the target widget.
        TargetAnchor<native><epic_internal>:dynamic_ui_anchor = external {}

        # By which anchor should the source widget be attached to the target widget.
        Anchor<native><epic_internal>:dynamic_ui_anchor = external {}

    dynamic_ui_constraint_replace<native><epic_internal> := class<epic_internal>(dynamic_ui_constraint_base):
        # The `widget` to replace.
        Widget<native><epic_internal>:widget

        # Unique id used to identify and attach to a specific instance of the target widget class.
        UniqueID<native><epic_internal>:string = external {}

    dynamic_ui_constraint_replace_fn<native><epic_internal> := class<epic_internal>(dynamic_ui_constraint_base):
        # Unique id used to identify and attach to a specific widget
        UniqueID<native><epic_internal>:string = external {}

        # Path to widget class.
        WidgetClassPath<native><epic_internal>:string

    dynamic_ui_allowed<native><epic_internal> := struct:
        # The `widget` to show.
        Widget<native><public>:widget

        # Layout constraint to apply to this widget when putting it on screen.
        LayoutConstraint<native><public>:dynamic_ui_constraint_base

        # Z order used to draw this widget.
        ZOrder<native><public>:dynamic_ui_z_order = external {}

        # Custom z order used to draw this widget. (Higher numbered z order widget are drawn in front of lower numbered one).
        CustomZOrder<native><public>:int = external {}

        # Unique id is used to make this widget a separate instance from other widget of the same class.
        UniqueID<native><public>:string = external {}

    dynamic_ui_unallowed<native><epic_internal> := struct:
        # Path to widget class.
        WidgetClassPath<native><public>:string = external {}

        # Unallow widget with this unique ID.
        UniqueID<native><public>:string

    dynamic_ui_scene<native><epic_internal> := struct:
        # list of allowed widgets in this scene.
        AllowedList<native><public>:[]dynamic_ui_allowed = external {}

        UnallowedList<native><public>:[]dynamic_ui_unallowed = external {}

    # Dynamic UI panel to handle the scenes and apply the constraints.
    dynamic_ui_panel<native><epic_internal> := class<final>(widget):
        # Adds `scene` to this panel.
        AddScene<native><epic_internal>(Scene:dynamic_ui_scene):void

        # Removes `scene` from this panel.
        RemoveScene<native><epic_internal>(Scene:dynamic_ui_scene):void

    # Returns the `fn_ui_extensions_component` associated with `Player`.
    GetUIExtensionsComponent<native><epic_internal>(Player:player)<transacts><decides>:fn_ui_extensions_component

    ui_tab_info<native><epic_internal> := class<epic_internal>:
        # The text label to be shown on the tab button.
        Label<native><public>:message

        # Optional icon to be shown on the tab button.
        Icon<native><public>:?texture = external {}

        # The desired order for the tab. -1 will add tab to the end of the list.
        SortOrder<native><public>:int = external {}

    fn_ui_extension<native><epic_internal> := class<epic_internal>:
        AddTab<native><epic_internal>(Player:player, TabInfo:ui_tab_info, Widget:widget):void

        RemoveTab<native><epic_internal>(Player:player, TabInfo:ui_tab_info):void

    fn_ui_extensions_component<native><epic_internal> := class<epic_internal>:
        Map<native><public>:fn_ui_extension = external {}

        Inventory<native><public>:fn_ui_extension = external {}

        PostGame<native><public>:fn_ui_extension = external {}

    # Button with text message common base class. Displays a button with a custom message string.
    text_button_base<native><public> := class<abstract><epic_internal>(widget):
        # The text to display to the user. Used only during initialization of the widget and not modified by SetText.
        (/Fortnite.com/UI/text_button_base:)DefaultText<localizes><native><public>:message = external {}

        # Subscribable event that fires when the button is clicked.
        OnClick<public>():listenable(widget_message) = external {}

        # Sets the text displayed in the widget.
        SetText<native><public>(InText:message):void

        # Gets the text currently in the widget.
        GetText<native><public>():string

    # Text button with big and loud styling applied.
    button_loud<native><public> := class<final>(text_button_base):

    # Text button with normal styling applied.
    button_regular<native><public> := class<final>(text_button_base):

    # Text button with quiet styling applied.
    button_quiet<native><public> := class<final>(text_button_base):

    @deprecated
    # Deprecated. This function affects all players. Please use `fort_playspace.GetHUDController().ShowElements()`.
    # Shows a set of HUD elements.
    (PlayerUI:player_ui).ShowHUDElements<native><public>(HUDElements:[]hud_element_identifier):void

    @deprecated
    # Deprecated. This function affects all players. Please use `fort_playspace.GetHUDController().HideElements()`.
    # Hides a set of HUD elements.
    (PlayerUI:player_ui).HideHUDElements<native><public>(HUDElements:[]hud_element_identifier):void

    @deprecated
    # Deprecated. This function affects all players. Please use `fort_playspace.GetHUDController().ResetElementVisibility()`.
    # Resets the visibility for a set of HUD elements.
    (PlayerUI:player_ui).ResetHUDElementVisibility<native><public>(HUDElements:[]hud_element_identifier):void

    # A HUD controller that allows for showing and hiding of HUD elements.
    fort_hud_controller<native><public> := interface<epic_internal>:
        # Shows a set of HUD elements for every player. Note: This can be overridden by rules set by 'ForPlayer' functions since player specific rules are prioritized over general rules.
        ShowElements<public>(HUDElements:[]hud_element_identifier):void

        # Hides a set of HUD elements for every player. Note: This can be overridden by rules set by 'ForPlayer' functions since player specific rules are prioritized over general rules.
        HideElements<public>(HUDElements:[]hud_element_identifier):void

        # Resets the visibility for a set of HUD elements for every player. Note: This will not clear player specific rules set by the 'ForPlayer' functions which can only be reset by calling 'ResetElementsForPlayer'.
        ResetElementVisibility<public>(HUDElements:[]hud_element_identifier):void

        # Shows a set of HUD elements for a single player. Note: This overrides general rules set by non-player functions for the given elements. Call 'ResetElementsForPlayer' in order to return the player to general behavior
        ShowElementsForPlayer<public>(Player:player, HUDElements:[]hud_element_identifier):void

        # Hides a set of HUD elements for a single player. Note: This overrides general rules set by non-player functions for the given elements. Call 'ResetElementsForPlayer' in order to return the player to general behavior
        HideElementsForPlayer<public>(Player:player, HUDElements:[]hud_element_identifier):void

        # Resets the player-specific visibility rules of a set of HUD elements for a single player. Note: This will not reset rules that have been set by means other than the 'PerPlayer' functions.
        ResetElementsForPlayer<public>(Player:player, HUDElements:[]hud_element_identifier):void

    # Get the `fort_hud_controller` for the current `fort_playspace`.
    (Playspace:fort_playspace).GetHUDController<native><public>():fort_hud_controller

    creative_hud_identifier_all<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

        TreatAsChildTagCollection<override>:logic = external {}

    creative_hud_identifier_build_menu<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

    creative_hud_identifier_crafting_resources<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

    creative_hud_identifier_elimination_counter<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

    creative_hud_identifier_equipped_item<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

    creative_hud_identifier_experience_level<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

    creative_hud_identifier_experience_supercharged<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

    creative_hud_identifier_experience_ui<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

    creative_hud_identifier_health<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

    creative_hud_identifier_health_numbers<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

    creative_hud_identifier_hud_info<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

    creative_hud_identifier_interaction_prompts<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

    creative_hud_identifier_map_prompts<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

    creative_hud_identifier_mimimap<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

    creative_hud_identifier_minimap<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

    creative_hud_identifier_pickup_stream<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

    creative_hud_identifier_player_count<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

    creative_hud_identifier_player_inventory<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

    creative_hud_identifier_round_info<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

    creative_hud_identifier_round_timer<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

    creative_hud_identifier_shield_numbers<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

    creative_hud_identifier_shileds<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

    creative_hud_identifier_shields<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

    creative_hud_identifier_storm_notifications<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

    creative_hud_identifier_storm_timer<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

    creative_hud_identifier_team_info<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

    player_hud_identifier_all<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

        TreatAsChildTagCollection<override>:logic = external {}

    hud_identifier_world_resource_wood<public> := class<final>(hud_element_world_resource_identifier_base):
        InternalIndex<override>:int = external {}

    hud_identifier_world_resource_stone<public> := class<final>(hud_element_world_resource_identifier_base):
        InternalIndex<override>:int = external {}

    hud_identifier_world_resource_metal<public> := class<final>(hud_element_world_resource_identifier_base):
        InternalIndex<override>:int = external {}

    hud_identifier_world_resource_permanite<public> := class<final>(hud_element_world_resource_identifier_base):
        InternalIndex<override>:int = external {}

    hud_identifier_world_resource_gold_currency<public> := class<final>(hud_element_world_resource_identifier_base):
        InternalIndex<override>:int = external {}

    hud_identifier_world_resource_ingredient<public> := class<final>(hud_element_world_resource_identifier_base):
        InternalIndex<override>:int = external {}

    hud_identifier_visual_sound_effect_weapons<public> := class<final>(hud_element_audio_visualizer_identifier_base):
        HiddenBitmask<override>:int = external {}

    hud_identifier_visual_sound_effect_loot<public> := class<final>(hud_element_audio_visualizer_identifier_base):
        HiddenBitmask<override>:int = external {}

    hud_identifier_visual_sound_effect_movement<public> := class<final>(hud_element_audio_visualizer_identifier_base):
        HiddenBitmask<override>:int = external {}

    hud_identifier_visual_sound_effect_vehicle<public> := class<final>(hud_element_audio_visualizer_identifier_base):
        HiddenBitmask<override>:int = external {}

    hud_identifier_visual_sound_effect_healing<public> := class<final>(hud_element_audio_visualizer_identifier_base):
        HiddenBitmask<override>:int = external {}

    hud_identifier_visual_sound_effect_all<public> := class<final>(hud_element_audio_visualizer_identifier_base):
        HiddenBitmask<override>:int = external {}

    hud_identifier_game_phase_none<epic_internal> := class<final>(hud_element_game_phase_identifier_base):
        InternalIndex<override>:int = external {}

    hud_identifier_game_phase_setup<epic_internal> := class<final>(hud_element_game_phase_identifier_base):
        InternalIndex<override>:int = external {}

    hud_identifier_game_phase_warmup<epic_internal> := class<final>(hud_element_game_phase_identifier_base):
        InternalIndex<override>:int = external {}

    hud_identifier_game_phase_bus_locked<epic_internal> := class<final>(hud_element_game_phase_identifier_base):
        InternalIndex<override>:int = external {}

    hud_identifier_game_phase_bus_flying<epic_internal> := class<final>(hud_element_game_phase_identifier_base):
        InternalIndex<override>:int = external {}

    hud_identifier_game_phase_storm_forming<epic_internal> := class<final>(hud_element_game_phase_identifier_base):
        InternalIndex<override>:int = external {}

    hud_identifier_game_phase_storm_holding<epic_internal> := class<final>(hud_element_game_phase_identifier_base):
        InternalIndex<override>:int = external {}

    hud_identifier_game_phase_storm_shrinking<epic_internal> := class<final>(hud_element_game_phase_identifier_base):
        InternalIndex<override>:int = external {}

    hud_identifier_game_phase_countdown<epic_internal> := class<final>(hud_element_game_phase_identifier_base):
        InternalIndex<override>:int = external {}

    hud_identifier_game_phase_final_countdown<epic_internal> := class<final>(hud_element_game_phase_identifier_base):
        InternalIndex<override>:int = external {}

    hud_identifier_game_phase_end_game<epic_internal> := class<final>(hud_element_game_phase_identifier_base):
        InternalIndex<override>:int = external {}

    # Used to identify a HUD element.
    hud_element_identifier<native><public> := class<abstract><epic_internal>:

    # Base class for hud elements identified by a gameplay tag
    hud_element_gameplay_tag_identifier_base<native><epic_internal> := class<abstract><epic_internal>(hud_element_identifier):
        # Internal string used to make a lookup of an FGameplayTag
        InternalTag<native><epic_internal>:string

        # If set to true the only child tags from the InternalTag will be included in the identifier
        TreatAsChildTagCollection<native><epic_internal>:logic = external {}

    # Base class for hud elements associated with world resource hud elements 
    hud_element_world_resource_identifier_base<native><epic_internal> := class<abstract><epic_internal>(hud_element_identifier):
        # Internal index converted to EFortResourceType
        InternalIndex<native><epic_internal>:int

    # Base class for hud elements associated with game phase hud elements 
    hud_element_game_phase_identifier_base<native><epic_internal> := class<abstract><epic_internal>(hud_element_identifier):
        # Internal index converted to EAthenaGamePhaseStep
        InternalIndex<native><epic_internal>:int

    # Base class for hud elements associated with audio visualizer hud elements 
    hud_element_audio_visualizer_identifier_base<native><epic_internal> := class<abstract><epic_internal>(hud_element_identifier):
        # Bitmask to be converted to EHiddenSoundIndicatorTypes
        HiddenBitmask<native><epic_internal>:int

    # Slider with a text value. Displays a slider, its progress bar and value.
    slider_regular<native><public> := class<final>(widget):
        # The value to display to the user. Used only during initialization of the widget and not modified by SetValue.
        DefaultValue<native><public>:float = external {}

        # The minimum value that the slider can haver. Used only during initialization of the widget and not modified by SetMinValue.
        DefaultMinValue<native><public>:float = external {}

        # The maximum value that the slider can haver. Used only during initialization of the widget and not modified by SetMaxValue.
        DefaultMaxValue<native><public>:float = external {}

        # The amount to adjust the value by, when using a controller or keyboard. Used only during initialization of the widget and not modified by SetStepSize.
        DefaultStepSize<native><public>:float = external {}

        # Sets the value of the slider, will clamp the value to be within the sliders minimum and maximum value.
        SetValue<native><public>(InValue:float):void

        # Gets the value of the slider.
        GetValue<native><public>():float

        # Sets the minimum value of the slider, will enforce that the sliders maximum value is always larger than or equal to the minimum value.
        SetMinValue<native><public>(InMinValue:float):void

        # Gets the minimum value of the slider.
        GetMinValue<native><public>():float

        # Sets the maximum value of the slider, will enforce that the sliders maximum value is always larger than or equal to the minimum value.
        SetMaxValue<native><public>(InMaxValue:float):void

        # Gets the maximum value of the slider.
        GetMaxValue<native><public>():float

        # Sets the amount to adjust the value by, when using a controller or keyboard.
        SetStepSize<native><public>(InValue:float):void

        # Gets the amount to adjust the value by.
        GetStepSize<native><public>():float

        # Subscribable event that fires when the value of the slider has changed.
        OnValueChanged<public>():listenable(widget_message) = external {}

    # Text block widget. Displays text to the user.
    text_block<native><public> := class<final>(text_base):
        # The direction the shadow is cast. Used only during initialization of the widget and not modified by SetShadowOffset.
        DefaultShadowOffset<native><public>:?vector2 = external {}

        # The color of the shadow. Used only during initialization of the widget and not modified by SetShadowColor.
        DefaultShadowColor<native><public>:color = external {}

        # The opacity of the shadow. Used only during initialization of the widget and not modified by SetShadowOpacity.
        DefaultShadowOpacity<native><public>:type {_X:float where 0.000000 <= _X, _X <= 1.000000} = external {}

        # Sets the direction the shadow is cast.
        SetShadowOffset<native><public>(InShadowOffset:?vector2):void

        # Gets the direction the shadow is cast.
        GetShadowOffset<native><public>():?vector2

        # Sets the color of the shadow.
        SetShadowColor<native><public>(InColor:color):void

        # Gets the color of the shadow.
        GetShadowColor<native><public>():color

        # Sets the opacity of the shadow.
        SetShadowOpacity<native><public>(InOpacity:type {_X:float where 0.000000 <= _X, _X <= 1.000000}):void

        # Gets the opacity of the shadow.
        GetShadowOpacity<native><public>():type {_X:float where 0.000000 <= _X, _X <= 1.000000}

    # Editable text block widget common base class. Allows the user to type in a custom text.
    editable_text_base<native><epic_internal> := class<abstract>(text_base):
        # Called whenever the text is committed. This happens when the user presses enter or the text box loses focus.
        OnTextCommitted<public>():listenable(widget_message) = external {}

    # Editable text widget. Allows the user to type in a custom text. Only permits a single line of text to be entered.
    editable_text<native><epic_internal> := class<final>(editable_text_base):

    # Editable text widget contained in a box. Allows the user to type in a custom text. Only permits a single line of text to be entered.
    (/Fortnite.com/UI:)editable_text_box<native><epic_internal> := class<final>(editable_text_base):

    @import_as("/Script/VerseFortniteUI.UVerseFortniteWidgetViewmodel")
    # Verse interface to native `widget viewmodel`.
    fortnite_widget_viewmodel<native><epic_internal> := class<abstract>:

    function_parameter_fortnite_widget_viewmodel<native><epic_internal> := class<computes>(function_parameter_base):
        Value<native><epic_internal>:?fortnite_widget_viewmodel


InputDoNotUseYet<public> := module:
    using {/Verse.org/Assets}
    # Module import path: /Fortnite.com/InputDoNotUseYet/Character
    Character<epic_internal> := module:
        @experimental
        RangedWeaponMapping<public>:input_mapping = external {}

        @experimental
        Reload<public>:input_action(logic) = external {}

        @experimental
        WeaponPrimary<public>:input_action(logic) = external {}

        @experimental
        WeaponSecondary<public>:input_action(logic) = external {}

        @experimental
        TraversalMapping<public>:input_mapping = external {}

        @experimental
        Crouch<public>:input_action(logic) = external {}

        @experimental
        Sprint<public>:input_action(logic) = external {}

        @experimental
        Jump<public>:input_action(logic) = external {}

using {/Fortnite.com/Devices}
using {/Verse.org/Native}
using {/Verse.org/Colors}
using {/UnrealEngine.com/Temporary/SpatialMath}
using {/Fortnite.com/Playspaces}
using {/Verse.org/Simulation}
using {/UnrealEngine.com/Temporary/UI}
FeralCorgi<public> := module:
    using {/Verse.org/Colors}
    using {/Verse.org/Assets}
    using {/Fortnite.com/Playspaces}
    using {/UnrealEngine.com/Temporary/SpatialMath}
    using {/Verse.org/Native}
    using {/Verse.org/Simulation}
    # Base class for creating analytic events from Verse. This would be the only public api, feral_analytics* would not be made public.
    analytics_event_base<native><epic_internal> := class<persistent>:
        GetEventName<native_callable><epic_internal>():string = external {}

        Send<native><epic_internal>():void

        Send<native><epic_internal>(Agent:agent):void

    # Feral base class for creating analytic events to allow proper name and allow use of Tags to inject native data
    feral_analytics_event_base<native><epic_internal> := class<persistent>(analytics_event_base):
        SendWithTags<native><epic_internal>(AddTags:[]string):void

        SendWithTags<native><epic_internal>(Agent:agent, AddTags:[]string):void

        Send<native><override>():void

        Send<native><override>(Agent:agent):void

        GetAgentId<native><epic_internal>(Agent:agent):string

    # Base class to inherit from to pass to feral_analytics_attributes_request.AppendToAttributes to inject attributes in an analytics event
    feral_analytics_attributes_base<native><epic_internal> := class<persistent>:

    # System to allow verse to listen for native analytic events to allow injection of custom data
    feral_analytics_attributes_request<native><epic_internal> := class<persistent>:
        OnRequestAttributes<public>():listenable(tuple([string]agent)) = external {}

        AppendToAttributesTags<native><public>(AddTags:[]string):void

        AppendToAttributes<native><public>(FieldPrefix:string, Object:feral_analytics_attributes_base):void

    # Module import path: /Fortnite.com/FeralCorgi/AnalyticsBridge
    AnalyticsBridge<epic_internal> := module:
        SendELOAnalyticForPlayer<native><epic_internal>(Player:player, MatchPoints:float, TeamPoints:float, IndividualPoints:float):void

    apparatus_bridge<native><epic_internal> := class:
        Setup<native><public>():void

        EnablePlanting<native><epic_internal>(Agent:agent):void

        DisablePlanting<native><epic_internal>(Agent:agent):void

        EnableDisabling<native><epic_internal>(Agent:agent):void

        DisableDisabling<native><epic_internal>(Agent:agent):void

        ResetApparatus<native><epic_internal>():void

        SetApparatusTimerRemaining<native><epic_internal>(Time:int):void

        GetResidualDisablingProgressSeconds<native><epic_internal>():float

        NativeStateChangedEvent<public>():listenable([]char) = external {}

        NativeStateChangedEventWithAgent<public>():listenable(tuple(string, ?agent)) = external {}

    # Module import path: /Fortnite.com/FeralCorgi/BackfillControlBridge
    BackfillControlBridge<epic_internal> := module:
        EmptyFunction<native><epic_internal>():void

    @import_as("/Script/FeralCorgiGameplayRuntime.UCheatBridge")
    cheat_bridge_base<native><epic_internal> := class<abstract><epic_internal>:

    cheat_bridge<native><epic_internal> := class<concrete>(cheat_bridge_base):
        NativeCheatEvent<public>():listenable(tuple(player, string, float)) = external {}

    # Module import path: /Fortnite.com/FeralCorgi/CommonBridge
    CommonBridge<epic_internal> := module:
        AgentRespawnCleanup<native><epic_internal>(Agent:agent, RespawnPosition:(/UnrealEngine.com/Temporary/SpatialMath:)vector3):void

        GetVersePlayerId<native><epic_internal>(Player:player)<transacts>:int

        SendTestEvent<native><epic_internal>(EventName:string, TargetAgents:[]agent, Params:[string]float)<transacts><decides>:void

        IsCVarEnabled<native><epic_internal>(CVarName:string)<transacts><decides>:void

    game_state_component_bridge<native><epic_internal> := class<concrete>:
        SendEvent<native><epic_internal>(EventName:string, TargetAgents:[]agent, Params:[string]float)<transacts><decides>:void

        OnReceivedEvent<public>():listenable(tuple(string, []agent, [string]float)) = external {}

    # Module import path: /Fortnite.com/FeralCorgi/FeralLoggingBridge
    FeralLoggingBridge<epic_internal> := module:
        LogMessage<native><epic_internal>(Format:string, ?Args:[]string = external {})<transacts>:void

        LogWarning<native><epic_internal>(Format:string, ?Args:[]string = external {})<transacts>:void

        LogError<native><epic_internal>(Format:string, ?Args:[]string = external {})<transacts>:void

    # Module import path: /Fortnite.com/FeralCorgi/PlayerLoadingStatusBridge
    PlayerLoadingStatusBridge<epic_internal> := module:
        AwaitPlayersLoading<native><epic_internal>(Playspace:fort_playspace)<suspends>:void

        IsPlayerLoading<native><epic_internal>(Playspace:fort_playspace, Player:player)<transacts><decides>:void

        GetPlayersLoading<native><epic_internal>(Playspace:fort_playspace)<reads>:[]player

        GetNumPlayersLoading<native><epic_internal>(Playspace:fort_playspace)<reads>:int

    # Module import path: /Fortnite.com/FeralCorgi/ReservationHoldingBridge
    ReservationHoldingBridge<epic_internal> := module:
        EnableLeavingPlayerReservationHolding<native><epic_internal>(Playspace:fort_playspace, HoldingTime:float):void

        RestoreSessionReservationHoldingSettings<native><epic_internal>(Playspace:fort_playspace):void

        FreeHeldReservation<native><epic_internal>(Playspace:fort_playspace, Player:player):logic

    ranked_track_progress<native><epic_internal> := struct<concrete>:
        GameId<native><public>:string = external {}

        TrackGUID<native><public>:string = external {}

        AccountId<native><public>:string = external {}

        HabaneroType<native><public>:string = external {}

        HabaneroLastUpdatedTime<native><public>:int = external {}

        LastQueriedTime<native><public>:float = external {}

        CurrentHabanero<native><public>:int = external {}

        HighestHabanero<native><public>:int = external {}

        CurrentPlayerPosition<native><public>:int = external {}

        ProgressTowardsNextHabanero<native><public>:float = external {}

        bProgressIsStale<native><public>:logic = external {}

        bSkippedRequestDueToTTL<native><public>:logic = external {}

    # Module import path: /Fortnite.com/FeralCorgi/SessionAttributesBridge
    SessionAttributesBridge<epic_internal> := module:
        IsRankedMatch<native><epic_internal>(Playspace:fort_playspace)<transacts><decides>:void

        IsVKEdit<native><epic_internal>(Playspace:fort_playspace)<transacts><decides>:void

        IsPlaytest<native><epic_internal>(Playspace:fort_playspace)<transacts><decides>:void

        IsPrivateMatch<native><epic_internal>(Playspace:fort_playspace)<transacts><decides>:void

        IsUsingCustomMatchKeys<native><epic_internal>(Playspace:fort_playspace)<transacts><decides>:void

        IsInEditMode<native><epic_internal>(Playspace:fort_playspace)<transacts><decides>:void

        IsInPlayMode<native><epic_internal>(Playspace:fort_playspace)<transacts><decides>:void

        IsMinigameInProgress<native><epic_internal>(Playspace:fort_playspace)<transacts><decides>:void

        IsQABackend<native><epic_internal>()<transacts><decides>:void

        EndMatch<native><epic_internal>(Playspace:fort_playspace)<transacts><decides>:void

        GetMinigameRound<native><epic_internal>(Playspace:fort_playspace)<transacts>:int

        GetTotalMinigameRounds<native><epic_internal>(Playspace:fort_playspace)<transacts>:int

        ApplyMatchEarlyLeaveBanhammerToPlayer<native><epic_internal>(Player:player, Details:string):logic

        GetUpdatedRankForPlayers<native><epic_internal>(Playspace:fort_playspace, Players:[]player)<suspends>:[]ranked_track_progress

    player_display_info<native><epic_internal> := struct:
        Image<native>:texture

        LargeImage<native>:texture

        SmallImage<native>:texture

        SquadColor<native>:color

        CurrentXP<native>:int

    player_display_info_manager<native><epic_internal> := class:
        GetDisplayInfo<native><epic_internal>(InPlayer:player)<reads>:player_display_info


using {/Verse.org/Simulation/Tags}
# Module import path: /Fortnite.com/QuestUtilities
QuestUtilities<public> := module:
    BroadcastCustomVerb<native><epic_internal>(Author:agent, CustomVerbNameTag:tag, Amount:int):void

    BroadcastCustomVerb<native><epic_internal>(Author:agent, CustomVerbTagString:string, Amount:int):void

using {/Verse.org/Assets}
# Module import path: /Fortnite.com/FN1Native
FN1Native<public> := module:
    # Module import path: /Fortnite.com/FN1Native/FortBus
    FortBus<public> := module:
        fort_battlebus_zone<native><epic_internal> := struct<concrete>:
            @editable
            ZoneMin<native><public>:vector2 = external {}

            @editable
            ZoneMax<native><public>:vector2 = external {}

        @import_as("/Script/FN1NativeRuntime.UVerseFortniteBattlebus")
        fort_battlebus_base<native><epic_internal> := class<abstract>:

        fort_battlebus<native><epic_internal> := class<epic_internal>(fort_battlebus_base):
            StartsEnabled<native><public>:logic = external {}

            FlightHeight<native><public>:float = external {}

            FlightSpeed<native><public>:float = external {}

            DeviationAngle<native><public>:float = external {}

            DesiredDoorOpenTime<native><public>:float = external {}

            SpawnZone<native><public>:fort_battlebus_zone = external {}

            DropZone<native><public>:fort_battlebus_zone = external {}

            VolumeSource<native><public>:creative_device

            Initialize<native><public>()<transacts>:void

            StartFlightPath<native><public>()<transacts>:void

            EjectAllPassengers<native><public>()<transacts>:void

            OnFlightStarted<native><public>:listenable(tuple()) = external {}

            OnFlightEnded<native><public>:listenable(tuple()) = external {}

            OnAllPassengersExited<native><public>:listenable(tuple()) = external {}

            OnPassengerExited<native><public>:listenable(agent) = external {}

            OnDropZoneEntered<native><public>:listenable(tuple()) = external {}

            OnDropZoneExited<native><public>:listenable(tuple()) = external {}

    # Module import path: /Fortnite.com/FN1Native/GameMode
    GameMode<public> := module:
        @import_as("/Script/FN1NativeRuntime.UVerseFortGameMode")
        fort_gamemode_base<native><epic_internal> := class<abstract>:

        fort_br_gamemode<native><epic_internal> := class<epic_internal>(fort_gamemode_base):
            Initialize<native><public>():logic

            WaitingForPlayersCountdownStartedEvent<native><public>:listenable(float) = external {}

            WaitingForPlayersFinishedEvent<native><public>:listenable(tuple()) = external {}

            PlayerPawnRespawnedEvent<native><public>:listenable(agent) = external {}

            PlayerPawnEliminatedEvent<native><public>:listenable(agent) = external {}

            TeamWonEvent<native><public>:listenable(team) = external {}

            WarmupFinishedEvent<native><public>:listenable(tuple()) = external {}

            AircraftFinishedEvent<native><public>:listenable(tuple()) = external {}

            StartMatch<native><public>():logic

            StartWarmupPhase<native><public>():logic

            StartAircraftPhase<native><public>():logic

            StartSafeZonesPhase<native><public>():logic

        fort_reload_gamemode<native><epic_internal> := class<epic_internal>(fort_br_gamemode):
            TeamLivesChangedEvent<native><public>:listenable(tuple(agent, team, int, int)) = external {}

            TimeUntilTeamLivesRechargeChangedEvent<native><public>:listenable(tuple(agent, team, float, float)) = external {}

            RespawnsEnabledEvent<native><public>:listenable(tuple()) = external {}

            RespawnsDisabledEvent<native><public>:listenable(tuple()) = external {}

            RespawnsDisabledCoundownStartedEvent<native><public>:listenable(float) = external {}

            ConsumedRemainingTeamLivesEvent<native><public>:listenable(tuple(agent, int)) = external {}

            GetTeamLivesRemaining<native><public>(InTeam:team)<transacts><decides>:int

            GetTimeUntilTeamLivesRecharge<native><public>(InTeam:team)<transacts><decides>:float

            GetGameModeTeamSize<native><public>()<transacts><decides>:int

            AreRespawnsActive<native><public>()<transacts>:logic

            GetRespawnDelay<native><public>(InAgent:agent)<transacts><decides>:float

            GetTimeUntilRespawnDisabled<native><public>()<transacts>:float

            IsWaveRespawnEnabled<native><public>()<transacts>:logic

            SpawnTestPlayers<native><public>(InSquadCount:int, InPlayersPerSquad:int):logic

            AllowRespawns<native><public>(bInAllowRespawns:logic):void

            SetAllowRespawnsOutsideStormPhase<native><public>(bInAllowRespawnsOutsideStormPhase:logic):void

    # Module import path: /Fortnite.com/FN1Native/FortStorm
    FortStorm<public> := module:
        fort_storm_phase<native><public> := struct<concrete><epic_internal>:
            @editable
            WaitTime<native><public>:float = external {}

            @editable
            ShrinkTime<native><public>:float = external {}

            @editable
            Damage<native><public>:float = external {}

            @editable
            EndRadius<native><public>:float = external {}

            @editable
            OverrideEndLocation<native><public>:?(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

            @editable
            EndLocationDistanceMin<native><public>:float = external {}

            @editable
            EndLocationDistanceMax<native><public>:float = external {}

        fort_storm_volume<native><public> := struct<concrete><epic_internal>:
            @editable
            VolumeActor<native><public>:?creative_prop = external {}

            @editable
            RejectionChance<native><public>:float = external {}

        @import_as("/Script/FN1NativeRuntime.UVerseFortniteStorm")
        fort_storm_base<native><epic_internal> := class<abstract>:

        fort_storm<native><epic_internal> := class<epic_internal>(fort_storm_base):
            InitialRadius<native><public>:float

            Phases<native><public>:[]fort_storm_phase

            StormVolumes<native><public>:[]fort_storm_volume

            VolumeSource<native><public>:creative_device

            Initialize<native><epic_internal>()<transacts>:void

            PauseStorm<native><epic_internal>()<transacts>:void

            ResumeStorm<native><epic_internal>()<transacts>:void

            GetPhaseIndex<native><epic_internal>()<transacts><decides>:int

            SetCurrentPhase<native><epic_internal>(InCurrentPhase:int)<transacts>:void

    player_ui_display_info<native><epic_internal> := struct:
        AvatarLargeImage<native>:texture

        AvatarSmallImage<native>:texture

        AvatarBackgroundColor<native>:color

        AvatarHighlightColor<native>:color

        SquadColor<native>:color

    player_ui_display_info_manager<native><epic_internal> := class:
        GetDisplayInfo<native><epic_internal>(InPlayer:player)<reads>:player_ui_display_info


using {/Fortnite.com/Game}
using {/Verse.org/SceneGraph}
# Module import path: /Fortnite.com/VerseFortniteTestSuite
VerseFortniteTestSuite<public> := module:
    @hide_in_editor
    @experimental
    fort_game_events_testing_component<native><epic_internal> := class<final_super>(component):
        var IsInGame<native><public>:logic = external {}

        var IsInRoundWarmup<native><public>:logic = external {}

        var IsInSimulation<native><public>:logic = external {}

        var IsRegistered<native><public>:logic = external {}

        var IsInRound<native><public>:logic = external {}

        var IsInRound2<native><public>:logic = external {}

        var GameEvents<native><public>:?fort_game_events_component = external {}

        OnAddedToScene<override>():void = external {}

        OnRemovingFromScene<override>():void = external {}

        OnBeginSimulation<override>():void = external {}

        OnEndSimulation<override>():void = external {}

        UnbindEvents<native_callable><protected>():void = external {}

    @hide_in_editor
    @experimental
    fort_round_manager_testing_component<native><epic_internal> := class<final_super>(component):
        var IsInSimulation<native><public>:logic = external {}

        var IsRegistered<native><public>:logic = external {}

        var IsInRound<native><public>:logic = external {}

        OnAddedToScene<override>():void = external {}

        OnRemovingFromScene<override>():void = external {}

        OnBeginSimulation<override>():void = external {}

        OnEndSimulation<override>():void = external {}

        UnbindEvents<native_callable><protected>():void = external {}

using {/Fortnite.com/FortSafeZone}
# Module import path: /Fortnite.com/Blastberry
Blastberry<public> := module:
    # Module import path: /Fortnite.com/Blastberry/Respawn
    Respawn<public> := module:
        team_translation_group<epic_internal> := class:
            SafeZone<epic_internal>:fort_storm_safe_zone

            var Agents<public>:[]agent = external {}

            var CachedGroupWeight<public>:?int = external {}

            InRangeOfGroup<public>(InAgent:agent, RangeSq:float)<transacts>:logic = external {}

            GetAverageTranslation<public>()<transacts><decides>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

            InSafeZone<public>(SafeZoneCenter:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, SafeZoneRadius:float)<transacts>:logic = external {}

            GetGroupWeight<public>()<transacts>:int = external {}

            ResetCachedData<public>()<transacts>:void = external {}

        respawn_information<native><public> := struct<epic_internal>:
            SpawnLocation<public>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3

            DeathLocation<public>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3

        @import_as("/Script/BlastBerryRuntime.UBlastBerryVerseRespawnLogic")
        blastberry_respawn_logic_base<native><epic_internal> := class<abstract>:

        blastberry_respawn_logic<native><epic_internal> := class<concrete><epic_internal>(blastberry_respawn_logic_base):
            Initialize<native_callable><epic_internal>(InPlayspace:fort_playspace):void = external {}

            PlayerRespawned<native_callable><epic_internal>(RespawnedAgent:agent):void = external {}

            EQSQueryCompleted<native_callable><epic_internal>(ResultAgent:agent, ResultLoc:(/UnrealEngine.com/Temporary/SpatialMath:)vector3):(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

            RunSoloEQSQuery<native><epic_internal>(RespawningAgent:agent, SpawnLocation:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, SafeZoneRadius:float, SafeZoneCenter:(/UnrealEngine.com/Temporary/SpatialMath:)vector3):void

            CalculateRespawnLocation<native_callable><epic_internal>(RespawningAgent:agent, WholeTeamDead:logic, DebugRandRange:float, DebugRandAngle:float):(/UnrealEngine.com/Temporary/SpatialMath:)transform = external {}

        (InAgent:agent).GetTimeRemainingForRespawn<native><epic_internal>()<transacts><decides>:float

        (InAgent:agent).GetDeathLocation<native><epic_internal>()<transacts><decides>:(/UnrealEngine.com/Temporary/SpatialMath:)transform
AI<public> := module:
    using {/UnrealEngine.com/Temporary/SpatialMath}
    using {/Fortnite.com/AI/HiredGuardCommands/PingCommand}
    using {/Verse.org/Native}
    using {/Fortnite.com/Characters}
    using {/Verse.org/SceneGraph}
    using {/Verse.org/Simulation}
    # Module import path: /Fortnite.com/AI/HiredGuardCommands
    HiredGuardCommands<public> := module:
        @hide_in_editor
        @experimental
        default_npc_behavior<epic_internal> := class(npc_behavior):

        @experimental
        # Fortnite NPC AI Management
        follower_actions_component<native><epic_internal> := class(fort_guard_actions_component):
            @experimental
            # Run the NPC default behavior
            RunDefaultBehavior<native><epic_internal>()<suspends>:ai_action_result

            @experimental
            IsFollowingBehaviorEnabled<native><epic_internal>()<transacts>:logic

        @experimental
        (InEntity:entity).GetAgent<native><epic_internal>()<transacts>:?agent

        @experimental
        (Agent:agent).GetTeamMembers<native><epic_internal>()<transacts>:[]agent

        @experimental
        (Character:fort_character).IsBeingDBNOCarried<native><epic_internal>()<transacts><decides>:void

        @experimental
        (Character:fort_character).GetNPCLeashRadius<native><epic_internal>()<transacts>:tuple(float, float)

        @hide_in_editor
        @experimental
        @available {MinUploadedAtFNVersion := 3200}
        hired_guard_commands<epic_internal> := class<concrete>(npc_behavior):
            OnBegin<override>()<suspends>:void = external {}

        @experimental
        ping_component<native><epic_internal> := class<final_super><epic_internal>(component):
            OnInitialized<native><override>():void

            OnUninitializing<native><override>():void

            @experimental
            AreNPCCommandsEnabled<native><epic_internal>()<transacts>:logic

            @experimental
            CanAcceptPingCommand<native><epic_internal>()<transacts>:logic

            @experimental
            EnableCommandWheel<native><epic_internal>(Enabled:logic):void

            @experimental
            GetCurrentNPCCommand<native><epic_internal>()<transacts><decides>:ping_info

            @experimental
            OnNPCCommand<native><epic_internal>()<suspends>:?ping_info

            @experimental
            DeclineNPCCommand<native><epic_internal>(PlayUnableToPerformAction:logic):void

            @experimental
            IsAttackCommandEnabled<native><epic_internal>()<transacts>:logic

            @experimental
            ConvertPingToAttack<native><epic_internal>(AttackTarget:agent):void

            @experimental
            ConvertedEvent<epic_internal>():subscribable(tuple()) = external {}

            @experimental
            UnconvertedEvent<epic_internal>():subscribable(tuple()) = external {}

        # Module import path: /Fortnite.com/AI/HiredGuardCommands/PingCommand
        PingCommand<epic_internal> := module:
            @experimental
            command_type<native><epic_internal> := enum:
                go_to
                back_to_me
                back_to_default
                hold_position
                revive
                invalid

            @experimental
            entity_type<native><epic_internal> := enum:
                pawn
                pickup
                weapon
                container
                player_built_actor
                building_actor
                undefined

        @experimental
        (/Fortnite.com/AI/HiredGuardCommands:)ToString<epic_internal>(Type:command_type)<transacts>:string = external {}

        @experimental
        (/Fortnite.com/AI/HiredGuardCommands:)ToString<epic_internal>(Type:entity_type)<transacts>:string = external {}

        @experimental
        ping_info<native><epic_internal> := struct:
            @experimental
            Type<native><public>:command_type

            @experimental
            EntityType<native><public>:entity_type

            @experimental
            Location<native><public>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3

            @experimental
            LocationOnHorizontalSurface<native><public>:logic

            @experimental
            Target<native><public>:?entity

            @experimental
            Emitter<native><public>:?agent

    @experimental
    # Result of an AI action
    ai_action_result<native><public> := enum<open>:
        # The action has been successfully executed
        Success
        # The action has failed during its execution
        Failure
        # The action has been canceled before completion
        Canceled
        # The action was not allowed to start
        Disallowed

    @experimental
    ai_target_component<native><epic_internal> := class<final><final_super>(component):
        OnInitialized<native><override>():void

        OnAddedToScene<native><override>():void

        OnRemovingFromScene<native><override>():void

    @experimental
    behavior_tree_injection<native><epic_internal> := class:
        @editable
        Condition<native><epic_internal>:injected_condition

        @editable
        Action<native><epic_internal>:injected_action

    @experimental
    (Agent:agent).AddInjectedBehavior<native><epic_internal>(BehaviorTreeInjection:behavior_tree_injection)<transacts>:void

    @experimental
    (Agent:agent).RemoveInjectedBehavior<native><epic_internal>(BehaviorTreeInjection:behavior_tree_injection)<transacts>:void

    @experimental
    decision_system<native><epic_internal> := interface<epic_internal>:
        # Start the decision system if not started already.
        Start<native_callable><public>(Entity:entity)<suspends>:void

        # Stop the decision system if started already.
        Stop<native_callable><public>():void

    @experimental
    # Component that points to a decision system is responsible to Start, Stop, Pause or Resume it.
    decision_system_component<native><final><epic_internal> := class<final_super><epic_internal>(component):
        @editable
        # The decision system that this component will run.
        var<private> DecisionSystem<native><public>:decision_system

        @editable
        # Whether the decision system will be started when the component is added to the simulation.
        StartOnSimulate<native><public>:logic = external {}

        SetDecisionSystem<native><public>(InDecisionSystem:decision_system)<transacts>:void

    focus_interface<native><public> := interface<epic_internal>:
        # Look At specified location. Will never complete unless interrupted.
        MaintainFocus<public>(Location:(/UnrealEngine.com/Temporary/SpatialMath:)vector3)<suspends>:void

        # Look At specified Agent. Will never complete unless interrupted.
        MaintainFocus<public>(Agent:agent)<suspends>:void

    # Get the focus_interface interface for the specified character.
    (InCharacter:fort_character).GetFocusInterface<native><public>()<transacts><decides>:focus_interface

    @experimental
    # Fortnite Bots AI actions management
    fort_bot_actions_component<native><epic_internal> := class<epic_internal>(fort_guard_actions_component):

    @experimental
    # Fortnite Guards AI actions management
    fort_guard_actions<native><public> := interface<epic_internal>(fort_npc_actions, fort_leashable):
        # Roam around the current position. Use the fort_leashable_component to specify the radius, else will roam anywhere.
        RoamAround<public>(?MovementType:movement_type = external {})<suspends>:navigation_result

        # Move in range to attack the current target
        MoveInRangeToAttack<public>()<suspends>:ai_action_result

        # Change stance to crouch
        Crouch<epic_internal>()<suspends>:ai_action_result

        # Go back to standing
        StandUp<epic_internal>():ai_action_result

        # Change movement speed to sprint and switch to tactical sprint when energy is full.
        TacticalSprint<epic_internal>()<suspends>:ai_action_result

        # Play a random emote from the character emotes bank
        PlayRandomEmote<public>()<suspends>:ai_action_result

        # Play an emote
        PlayEmote<epic_internal>(Emote:emote)<suspends>:ai_action_result

        # Revive the specified target
        Revive<public>(Target:agent)<suspends>:ai_action_result

        # Attack the target
        Attack<public>(Target:fort_target_info)<suspends>:ai_action_result

        # Attack the navigation obstacle
        Attack<epic_internal>(Target:fort_obstacle_info)<suspends>:ai_action_result

    @experimental
    # Get the current fort_guard_actions interface for the specified character.
    (InCharacter:fort_character).GetFortGuardActions<native><public>()<transacts><decides>:fort_guard_actions

    @experimental
    # Fortnite Guards AI actions management
    fort_guard_actions_component<native><epic_internal> := class<epic_internal>(fort_npc_actions_component, fort_guard_actions):
        OnInitialized<native><override>():void

        # Roam around the current position. Use the fort_leashable_component to specify the radius, else will roam anywhere.
        RoamAround<native><override>(?MovementType:movement_type = external {})<suspends>:navigation_result

        # Move in range to attack the current target
        MoveInRangeToAttack<native><override>()<suspends>:ai_action_result

        # Change stance to crouch
        Crouch<native><override>()<suspends>:ai_action_result

        # Go back to standing
        StandUp<native><override>():ai_action_result

        # Change movement speed to sprint and switch to tactical sprint when energy is full.
        TacticalSprint<native><override>()<suspends>:ai_action_result

        # Play a random emote from the character emotes bank
        PlayRandomEmote<native><override>()<suspends>:ai_action_result

        # Play an emote
        PlayEmote<native><override>(Emote:emote)<suspends>:ai_action_result

        # Revive the specified target
        Revive<native><override>(Target:agent)<suspends>:ai_action_result

        # Attack the target
        Attack<native><override>(Target:fort_target_info)<suspends>:ai_action_result

        # Attack the navigation obstacle
        Attack<native><override>(Target:fort_obstacle_info)<suspends>:ai_action_result

        # Set custom leash position.
        #  'InnerRadius' ranges from 0.0 to 20000.0 (in centimeters).
        #  'OuterRadius' ranges from 0.0 to 20000.0 (in centimeters) and no less than 'InnerRadius'.
        SetLeashPosition<native><override>(Location:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, InnerRadius:float, OuterRadius:float):void

        # Set the agent to be the new center of the leash.
        #  'InnerRadius' ranges from 0.0 to 20000.0 (in centimeters).
        #  'OuterRadius' ranges from 0.0 to 20000.0 (in centimeters) and no less than 'InnerRadius'.
        SetLeashAgent<native><override>(Agent:agent, InnerRadius:float, OuterRadius:float):void

        # Removes the current leash.
        ClearLeash<native><override>():void

    @experimental
    # Fortnite NPC perception management
    fort_guard_perception<native><public> := interface<epic_internal>(fort_npc_perception):
        @experimental
        # Get information about the current target.
        GetCurrentTargetInfo<public>()<reads><decides>:fort_target_info

        @experimental
        # Get the current alert level of the guard.
        GetAlertLevel<public>()<reads>:fort_guard_alert_level

        @experimental
        # Get the current alert level of a target for the guard.
        GetAlertLevel<public>(Target:entity)<reads><decides>:fort_guard_alert_level

        @experimental
        # Event when the alert level of the guard has changed.
        AlertLevelChangedEvent<public>:listenable(fort_guard_alert_level)

        @experimental
        # Event when the current target has changed.
        CurrentTargetChangedEvent<public>:listenable(fort_target_info)

        @experimental
        # Get information about the potential current obstacle
        GetObstacleInfo<epic_internal>()<reads><decides>:fort_obstacle_info

        @experimental
        # Event when a new best obstacle is detected
        ObstacleChangedEvent<epic_internal>:listenable(fort_obstacle_info)

    @experimental
    # Get the current fort_guard_perception interface for the specified character.
    (InCharacter:fort_character).GetFortGuardPerception<native><public>()<transacts><decides>:fort_guard_perception

    @experimental
    # Fortnite guard perception management
    fort_guard_perception_component<native><epic_internal> := class<epic_internal>(fort_npc_perception_component, fort_guard_perception):
        OnInitialized<native><override>():void

        OnUninitializing<native><override>():void

        # Get information about the current target.
        GetCurrentTargetInfo<native><override>()<reads><decides>:fort_target_info

        # Get the current alert level of the guard.
        GetAlertLevel<native><override>()<reads>:fort_guard_alert_level

        # Get the current alert level of a target for the guard.
        GetAlertLevel<native><override>(Target:entity)<reads><decides>:fort_guard_alert_level

        # Get information about the potential current obstacle
        GetObstacleInfo<native><override>()<reads><decides>:fort_obstacle_info

        AlertLevelChangedEvent<override><native>:subscribable_event_intrnl(fort_guard_alert_level) = external {}

        CurrentTargetChangedEvent<override><native>:subscribable_event_intrnl(fort_target_info) = external {}

        ObstacleChangedEvent<override><native>:subscribable_event_intrnl(fort_obstacle_info) = external {}

    fort_leashable<native><public> := interface<epic_internal>:
        # Set custom leash position.
        #  'InnerRadius' ranges from 0.0 to 20000.0 (in centimeters).
        #  'OuterRadius' ranges from 0.0 to 20000.0 (in centimeters) and no less than 'InnerRadius'.
        SetLeashPosition<public>(Location:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, InnerRadius:float, OuterRadius:float):void

        # Set the agent to be the new center of the leash.
        #  'InnerRadius' ranges from 0.0 to 20000.0 (in centimeters).
        #  'OuterRadius' ranges from 0.0 to 20000.0 (in centimeters) and no less than 'InnerRadius'.
        SetLeashAgent<public>(Agent:agent, InnerRadius:float, OuterRadius:float):void

        # Removes the current leash.
        ClearLeash<public>():void

    # Get the current fort_leashable interface for the specified character.
    (InCharacter:fort_character).GetFortLeashable<native><public>()<transacts><decides>:fort_leashable

    @experimental
    # Fortnite NPC AI actions management
    fort_npc_actions<native><public> := interface<epic_internal>(navigatable, focus_interface):
        @experimental
        # Fires the currently equipped weapon.
        FireCurrentWeapon<epic_internal>()<suspends>:void

        @experimental
        # Try to reload the currently equipped weapon.
        ReloadCurrentWeapon<epic_internal>()<suspends>:logic

        @experimental
        # Add spare ammo for the currently equipped weapon.
        GiveAmmoForCurrentWeapon<epic_internal>(AmmoQuantity:int)<suspends>:void

    @experimental
    # Get the current fort_npc_actions interface for the specified character.
    (InCharacter:fort_character).GetFortNPCActions<native><public>()<transacts><decides>:fort_npc_actions

    @experimental
    # Fortnite NPC AI actions management
    fort_npc_actions_component<native><epic_internal> := class<final_super><epic_internal>(component, fort_npc_actions):
        OnInitialized<native><override>():void

        OnUninitializing<native><override>():void

        # Return the current destination of the character
        GetCurrentDestination<native><override>()<transacts><decides>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3

        # Navigate toward the specified target
        NavigateTo<native><override>(Target:navigation_target, ?MovementType:movement_type = external {}, ?ReachRadius:float = external {}, ?AllowPartialPath:logic = external {})<suspends>:navigation_result

        # Apply a multiplier on the movement speed (Multiplier is clamped between 0.5 and 2)
        SetMovementSpeedMultiplier<native><override>(Multiplier:float):void

        # Stop navigation
        StopNavigation<native><override>():void

        # Wait for a specific duration
        Wait<native><override>(?Duration:float = external {})<suspends>:void

        # Look At specified location. Will never complete unless interrupted.
        MaintainFocus<native><override>(Location:(/UnrealEngine.com/Temporary/SpatialMath:)vector3)<suspends>:void

        # Look At specified Agent. Will never complete unless interrupted.
        MaintainFocus<native><override>(Agent:agent)<suspends>:void

        # Fires the currently equipped weapon.
        FireCurrentWeapon<native><override>()<suspends>:void

        # Try to reload the currently equipped weapon.
        ReloadCurrentWeapon<native><override>()<suspends>:logic

        # Add spare ammo for the currently equipped weapon.
        GiveAmmoForCurrentWeapon<native><override>(AmmoQuantity:int)<suspends>:void

    @import_as("/Script/VerseFortniteAI.UNPCComponentSettings")
    fort_npc_component_settings<native><epic_internal> := class:

    @experimental
    # NPC Component
    fort_npc_component<native><epic_internal> := class<final_super>(component):
        @editable
        Settings<native><epic_internal>:fort_npc_component_settings = external {}

        OnBeginSimulation<override>():void = external {}

        OnEndSimulation<override><final>():void = external {}

    @experimental
    # Fortnite NPC perception management
    fort_npc_perception<native><public> := interface<epic_internal>:
        @experimental
        # Get the last known position of a target.
        GetLastKnownPosition<public>(Target:entity)<reads><decides>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3

        @experimental
        # Event when a target is added.
        TargetAddedEvent<public>:listenable(fort_target_info)

        @experimental
        # Event when the info about a target has been updated.
        TargetInfoUpdatedEvent<public>:listenable(fort_target_info)

        @experimental
        # Event when a target was removed.
        TargetRemovedEvent<public>:listenable(entity)

        @experimental
        # Event when a target is seen. Sight sense must be active.
        TargetSeenEvent<public>:listenable(fort_target_info)

        @experimental
        # Event when a target is heard. Hearing sense must be active.
        TargetHeardEvent<public>:listenable(fort_target_info)

        @experimental
        # Event when a target is touched. Touch sense must be active.
        TargetTouchedEvent<public>:listenable(fort_target_info)

        @experimental
        # Information about all detected targets.
        var<epic_internal> DetectedTargets<public>:[]fort_target_info

    @experimental
    # Get the current fort_npc_perception interface for the specified character.
    (InCharacter:fort_character).GetFortNPCPerception<native><public>()<transacts><decides>:fort_npc_perception

    @experimental
    # Fortnite NPC perception management
    fort_npc_perception_component<native><epic_internal> := class<final_super><epic_internal>(component, fort_npc_perception):
        OnInitialized<native><override>():void

        OnUninitializing<native><override>():void

        var DetectedTargets<override><native>:[]fort_target_info = external {}

        # Get the last known position of a target.
        GetLastKnownPosition<native><override>(Target:entity)<reads><decides>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3

        TargetAddedEvent<override><native>:subscribable_event_intrnl(fort_target_info) = external {}

        TargetRemovedEvent<override><native>:subscribable_event_intrnl(entity) = external {}

        TargetInfoUpdatedEvent<override><native>:subscribable_event_intrnl(fort_target_info) = external {}

        TargetSeenEvent<override><native>:subscribable_event_intrnl(fort_target_info) = external {}

        TargetHeardEvent<override><native>:subscribable_event_intrnl(fort_target_info) = external {}

        TargetTouchedEvent<override><native>:subscribable_event_intrnl(fort_target_info) = external {}

    @experimental
    # Fortnite Wildlife AI actions management
    fort_wildlife_actions_component<native><epic_internal> := class<epic_internal>(fort_npc_actions_component):
        OnInitialized<native><override>():void

    @import_as("/Script/VerseFortniteAI.UInjectedActionScript")
    injected_action_native_base<native><epic_internal> := class<abstract>:

    @experimental
    # Inherit from this to implement an action for an AI. The action will be started when the associated decision allow it and is the highest priority.
    injected_action<native><epic_internal> := class<abstract>(injected_action_native_base):
        # Called when the action is relevant and allowed by its decision. Returns if the action was a success or a failure.
        OnBegin<native_callable><epic_internal>()<suspends>:ai_action_result

        # Called when the action end with the result of OnBegin or ai_action_result.Canceled if interrupted.
        OnEnd<native_callable><epic_internal>(ActionResult:ai_action_result):void = external {}

        GetAgent<native><epic_internal>()<transacts><decides>:agent

    @import_as("/Script/VerseFortniteAI.UInjectedConditionScript")
    injected_condition_native_base<native><epic_internal> := class<abstract>:

    @experimental
    # Inherit from this to implement a condition in an injected behavior to decide if an action can be injected.
    injected_condition<native><epic_internal> := class<abstract>(injected_condition_native_base):
        # Called when the behavior is relevant. The coroutine should loop and call Allow/DenyAction to set if the  action can be executed. Action like moving or shooting shouldn't be done in this function. Condition start denied and are considered denied once execution finished.
        OnBegin<native_callable><epic_internal>()<suspends>:void

        # Called after OnBegin when the behavior is no longer relevant. Ex: Behavior injected in threatened and the NPC is no longer threatened.
        OnEnd<native_callable><epic_internal>():void = external {}

        # Call this when the condition is met to run the associated action.
        AllowAction<native><epic_internal>():void

        # Call this when the condition to run the associated action is no longer met.
        DenyAction<native><epic_internal>():void

        # Return if the associated action is currently in progress.
        IsActionInProgress<native><epic_internal>()<reads><decides>:void

        # Return if the associated action is currently allowed.
        IsActionAllowed<native><epic_internal>()<reads><decides>:void

        # Triggered when the associated action is started.
        ActionStartedEvent<native><epic_internal>:listenable(tuple()) = external {}

        # Triggered when the associated action end with its result.
        ActionEndedEvent<native><epic_internal>:listenable(ai_action_result) = external {}

        GetAgent<native><epic_internal>()<transacts><decides>:agent

    navigation_target<native><public> := class<epic_internal>:

    # Generate a navigation_target from any position
    MakeNavigationTarget<native><public>(Position:(/UnrealEngine.com/Temporary/SpatialMath:)vector3):navigation_target

    # Generate a navigation_target from an agent
    MakeNavigationTarget<native><public>(Target:agent):navigation_target

    @experimental
    # Generate a navigation_target from an entity
    MakeNavigationTarget<native><public>(Entity:entity)<decides>:navigation_target

    # Result of a navigation request
    navigation_result<native><public> := enum:
        # The destination has been reached
        Reached
        # The destination has been partially reached (AllowPartialPath was used)
        PartiallyReached
        # Navigation has been interrupted before completion
        Interrupted
        # The navigating agent is blocked
        Blocked
        # The destination cannot be reached
        Unreachable

    movement_style<native><epic_internal> := enum:
        (/Fortnite.com/AI/movement_style:)Walking
        (/Fortnite.com/AI/movement_style:)Running

    movement_type<native><public> := class<concrete><final><computes><epic_internal>:
        MovementStyle<native><epic_internal>:movement_style = external {}

    # Module import path: /Fortnite.com/AI/movement_types
    movement_types<public> := module:
        Walking<public>:movement_type = external {}

        Running<public>:movement_type = external {}

    navigatable<native><public> := interface<epic_internal>:
        # Return the current destination of the character
        GetCurrentDestination<public>()<transacts><decides>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3

        # Navigate toward the specified target
        NavigateTo<public>(Target:navigation_target, ?MovementType:movement_type = external {}, ?ReachRadius:float = external {}, ?AllowPartialPath:logic = external {})<suspends>:navigation_result

        # Stop navigation
        StopNavigation<public>():void

        # Wait for a specific duration
        Wait<public>(?Duration:float = external {})<suspends>:void

        # Apply a multiplier on the movement speed (Multiplier is clamped between 0.5 and 2)
        SetMovementSpeedMultiplier<public>(Multiplier:float):void

    # Get the navigatable interface for the specified character
    (InCharacter:fort_character).GetNavigatable<native><public>()<transacts><decides>:navigatable

    # Inherit from this to create a custom NPC behavior.
    # The npc_behavior can be defined for a character in a CharacterDefinition asset, or in a npc_spawner_device.
    npc_behavior<native><public> := class<abstract>:
        # This function is called when the NPC is added to the simulation.
        OnBegin<native_callable><public>()<suspends>:void = external {}

        # This function is called when the NPC is removed from the simulation.
        OnEnd<native_callable><public>():void = external {}

        # Returns the agent associated with this behavior.
        GetAgent<native><public>()<transacts><decides>:agent

    # Returns the `npc_behavior` for `InAgent`.
    (InAgent:agent).GetNPCBehavior<native><public>()<transacts><decides>:npc_behavior

    @experimental
    npc_behavior_component<native><epic_internal> := class<final_super>(component):
        OnInitialized<native><override>():void

        OnBeginSimulation<native><override>():void

        OnEndSimulation<native><override>():void

        @editable
        var<private> NPCBehavior<native><public>:npc_behavior

        SetNPCBehavior<native><public>(NewNPCBehavior:npc_behavior)<transacts>:void

    @experimental
    # Returns the `entity` for `InNPCBehavior`.
    (InNPCBehavior:npc_behavior).GetEntity<native><public>()<reads><decides>:entity

    @experimental
    # The different alert levels of a guard.
    fort_guard_alert_level<native><public> := enum:
        # The guard has not detected any hostile target.
        Unaware
        # The guard has seen a hostile target but hasn't identified it yet.
        Suspicious
        # The guard has identified a hostile target but can't see it any more.
        LostTarget
        # The guard has identified a hostile target.
        Alerted

    @experimental
    # Information about a perceived target.
    fort_target_info<native><public> := class<epic_internal>:
        @experimental
        # The source of the detection stimuli.
        Target<native><public>:entity

        @experimental
        # True if the target can be seen.
        HasLineOfSight<native><public>:logic

        @experimental
        # Attitude toward this target.
        Attitude<native><public>:team_attitude

    @experimental
    fort_obstacle_status<native><epic_internal> := enum:
        incoming_obstacle
        blocked_by_obstacle
        trap_obstacle

    @experimental
    # Information about a perceived obstacle.
    fort_obstacle_info<native><epic_internal> := class<epic_internal>:
        @experimental
        Location<native><public>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3

        @experimental
        Status<native><public>:fort_obstacle_status

        @experimental
        Obstacle<native><public>:entity

    @experimental
    # Create a `navigation_target` from a `fort_target_info`.
    MakeNavigationTarget<native><public>(TargetInfo:fort_target_info):navigation_target

    @experimental
    # Perception settings for sight.
    fort_sight_perception_settings<native><epic_internal> := class<final><concrete>:
        @experimental
        @editable
        # Maximum sight distance in meters to notice a target.
        # This value will be clamped between 0 and 300 meters.
        SightRadius<native><public>:float = external {}

        @experimental
        @editable
        # Maximum sight distance in meters to keep on seeing a target.
        # This value will be clamped between 'SightRadius' and 300 meters.
        LoseSightRadius<native><public>:float = external {}

        @experimental
        @editable
        # How far to the side AI can see, in radians.
        # The value represents the angle measured in relation to the forward vector, not the whole range.
        PeripheralVisionAngle<native><public>:float = external {}

        @experimental
        @editable
        # Specifies duration in seconds after sight stimuli generated by this sense become forgotten. 0 means never.
        MaxStimulusDuration<native><public>:float = external {}

        @experimental
        @editable
        # Specifies if sight is enabled.
        SenseEnabled<native><public>:logic = external {}

        @experimental
        @editable
        # Specifies if this sense is able to detect enemies.
        EnemiesDetected<native><public>:logic = external {}

        @experimental
        @editable
        # Specifies if this sense is able to detect friendlies.
        FriendliesDetected<native><public>:logic = external {}

        @experimental
        @editable
        # Specifies if this sense is able to detect neutral targets.
        NeutralsDetected<native><public>:logic = external {}

    @experimental
    # Perception settings for hearing.
    fort_hearing_perception_settings<native><epic_internal> := class<final><concrete>:
        @experimental
        @editable
        # Maximum hearing distance in meters to notice a target.
        HearingRange<native><public>:float = external {}

        @experimental
        @editable
        # Specifies duration in seconds after audio stimuli generated by this sense become forgotten. 0 means never.
        MaxStimulusDuration<native><public>:float = external {}

        @experimental
        @editable
        # Specifies if hearing is enabled.
        SenseEnabled<native><public>:logic = external {}

        @experimental
        @editable
        # Specifies if this sense is able to detect enemies.
        EnemiesDetected<native><public>:logic = external {}

        @experimental
        @editable
        # Specifies if this sense is able to detect friendlies.
        FriendliesDetected<native><public>:logic = external {}

        @experimental
        @editable
        # Specifies if this sense is able to detect neutral targets.
        NeutralsDetected<native><public>:logic = external {}

    @experimental
    # Perception settings for touch.
    fort_touch_perception_settings<native><epic_internal> := class<final><concrete>:
        @experimental
        @editable
        # Specifies duration in seconds after touch stimuli generated by this sense become forgotten. 0 means never.
        MaxStimulusDuration<native><public>:float = external {}

        @experimental
        @editable
        # Specifies if touch perception is enabled.
        SenseEnabled<native><public>:logic = external {}

        @experimental
        @editable
        # Specifies if this sense is able to detect enemies.
        EnemiesDetected<native><public>:logic = external {}

        @experimental
        @editable
        # Specifies if this sense is able to detect friendlies.
        FriendliesDetected<native><public>:logic = external {}

        @experimental
        @editable
        # Specifies if this sense is able to detect neutral targets.
        NeutralsDetected<native><public>:logic = external {}

    @experimental
    # Perception settings for damage.
    fort_damage_perception_settings<native><epic_internal> := class<final><concrete>:
        @experimental
        @editable
        # Specifies duration in seconds after damage stimuli generated by this sense become forgotten. 0 means never.
        MaxStimulusDuration<native><public>:float = external {}

        @experimental
        @editable
        # Specifies if damage perception is enabled.
        SenseEnabled<native><public>:logic = external {}


using {/Fortnite.com/Vehicles}
using {/UnrealEngine.com/Temporary/Diagnostics}
using {/Fortnite.com/AI}
using {/Fortnite.com/Teams}
using {/Fortnite.com/Assets}
using {/Fortnite.com/Characters}
# Module import path: /Fortnite.com/Animation
Animation<public> := module:
    # Module import path: /Fortnite.com/Animation/PlayAnimation
    PlayAnimation<public> := module:
        # Result of a PlayAndAwait request.
        play_animation_result<native><public> := enum:
            # The animation completed successfully.
            Completed
            # The animation was interrupted whilst playing.
            Interrupted
            # The animation encountered an error during initialization or whilst playing.
            Error

        # An interface for playing an animation on an object.
        play_animation_controller<native><public> := interface<epic_internal>:
            # Play an animation sequence.
            PlayAndAwait<public>(AnimationSequence:animation_sequence, ?PlayRate:float = external {}, ?PlayCount:float = external {}, ?StartPositionSeconds:float = external {}, ?BlendInTime:float = external {}, ?BlendOutTime:float = external {})<suspends>:play_animation_result

            # Start an animation sequence and obtain an instance to query and manipulate.
            Play<public>(AnimationSequence:animation_sequence, ?PlayRate:float = external {}, ?PlayCount:float = external {}, ?StartPositionSeconds:float = external {}, ?BlendInTime:float = external {}, ?BlendOutTime:float = external {}):play_animation_instance

        # An animation instance created from play_animation_controller.Play that can be queried and manipulated.
        play_animation_instance<native><public> := class<epic_internal>:
            # Returns the state of the animation playback.
            GetState<native><public>()<transacts>:play_animation_state

            # Stops the animation.
            Stop<native><public>():void

            # Event triggered when the animation is completed.
            CompletedEvent<native><public>:listenable(tuple()) = external {}

            # Event triggered when the animation is interrupted.
            InterruptedEvent<native><public>:listenable(tuple()) = external {}

            # Event triggered when the animation has finished to blend out.
            BlendedInEvent<native><public>:listenable(tuple()) = external {}

            # Event triggered when the animation is beginning to blend out.
            BlendingOutEvent<native><public>:listenable(tuple()) = external {}

            # Helper function that waits for the animation to complete or be interrupted.
            Await<public>()<suspends>:play_animation_result = external {}

            # Helper function that succeeds if the state is Playing, BlendingIn, or BlendingOut.
            IsPlaying<public>()<transacts><decides>:void = external {}

        # The potential states of a play animation instance.
        play_animation_state<native><public> := enum:
            # The animation is blending in.
            BlendingIn
            # The animation has blended in, is playing, and has not begun blending out.
            Playing
            # The animation is playing and is blending out.
            BlendingOut
            # The animation completed successfully.
            Completed
            # The animation was stopped internally.
            Stopped
            # The animation was interrupted externally.
            Interrupted
            # An error occurred at creation or during playback.
            Error

        @import_as("/Script/VerseFortniteAI.UAIAnimationComponentData")
        fort_npc_play_animation_settings<native><epic_internal> := class:

        # Get the play_animation_controller for the specified character.
        (InCharacter:fort_character).GetPlayAnimationController<native><public>()<transacts><decides>:play_animation_controller

        @experimental
        fort_npc_play_animation_component<native><epic_internal> := class<final_super><epic_internal>(component, play_animation_controller):
            @editable
            PlayAnimationSettings<native><epic_internal>:fort_npc_play_animation_settings = external {}

            OnInitialized<native><override>():void

            OnUninitializing<native><override>():void

            PlayAndAwait<override>(AnimationSequence:animation_sequence, ?PlayRate:float = external {}, ?PlayCount:float = external {}, ?StartPositionSeconds:float = external {}, ?BlendInTime:float = external {}, ?BlendOutTime:float = external {})<suspends>:play_animation_result = external {}

            Play<override>(AnimationSequence:animation_sequence, ?PlayRate:float = external {}, ?PlayCount:float = external {}, ?StartPositionSeconds:float = external {}, ?BlendInTime:float = external {}, ?BlendOutTime:float = external {}):play_animation_instance = external {}

# Module import path: /Fortnite.com/Assets
(/Fortnite.com:)Assets<public> := module:
    emote<native><epic_internal> := class<computes><final><epic_internal>(asset):

    character_cosmetic_definition<native><epic_internal> := class<computes><final><epic_internal>(asset):

    npc_character_definition<native><epic_internal> := class<computes><final><epic_internal>(asset):

    (InPlayspace:fort_playspace).SpawnCharacter<native><epic_internal>(CharacterDefinition:npc_character_definition, Transform:(/UnrealEngine.com/Temporary/SpatialMath:)transform)<suspends>:?agent

    (InPlayspace:fort_playspace).DespawnCharacter<native><epic_internal>(Agent:agent):void

using {/Verse.org/SceneGraph/VerseCamera}
using {/UnrealEngine.com/Abilities}
# Module import path: /Fortnite.com/Building
Building<public> := module:
    @experimental
    building_component<native><epic_internal> := class<final><final_super>(component):
        @experimental
        Damage<native><public>(Amount:float):void

        @experimental
        IsPlayerBuilt<native><public>()<decides>:void

        @experimental
        var CanBeDamaged<public>:logic = external {}

        @experimental
        var CanBeReplaced<public>:logic = external {}

# Module import path: /Fortnite.com/Characters
Characters<public> := module:
    # Main API implemented by Fortnite characters.
    fort_character<native><public> := interface<unique><epic_internal>(positional, healable, healthful, damageable, shieldable, game_action_instigator, game_action_causer):
        # Returns the agent associated with this `fort_character`. Use this when interacting with APIs that require an `agent` reference.
        GetAgent<public>()<transacts><decides>:agent

        # Signaled when this `fort_character` is eliminated from the match.
        EliminatedEvent<public>():listenable(elimination_result)

        # Returns the rotation where this `fort_character` is looking or aiming at.
        GetViewRotation<public>()<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)rotation

        # Returns the location where this `fort_character` is looking or aiming from.
        GetViewLocation<public>()<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3

        # Signaled when this `fort_character` jumps. Returns a listenable with a payload of this `fort_character`.
        JumpedEvent<public>():listenable(fort_character)

        # Signaled when this `fort_character` changes crouch state.
        # Sends `tuple` payload:
        #  - 0: the `fort_character` that changed crouch states.
        #  - 1: `true` if the character is crouching. `false` if the character is not crouching.
        CrouchedEvent<public>():listenable(tuple(fort_character, logic))

        # Signaled when this `fort_character` changes sprint state.
        # Sends `tuple` payload:
        #  - 0: the `fort_character` that changed sprint state.
        #  - 1: `true` if the character is sprinting. `false` if the character stopped sprinting.
        SprintedEvent<public>():listenable(tuple(fort_character, logic))

        # Succeeds if this `fort_character` is in the world and has not been eliminated. Most fort_character actions will silently fail if this fails. Please test IsActive if you want to handle these failure cases rather than allow them to silently fail.
        IsActive<public>()<transacts><decides>:void

        # Succeeds if this `fort_character` is in the 'Down But Not Out' state. In this state the character is down but can still be revived by teammates for a period of time.
        IsDownButNotOut<public>()<transacts><decides>:void

        # Signaled when this `fort_character` changes 'Down But Not Out' (DBNO) state.
        # Sends `tuple` payload:
        #  - 0: the `fort_character` that changed DBNO state.
        #  - 1: the `fort_character` that instigated the DBNO state change.
        #  - 2: `true` if the character is DBNO. `false` if the character is not DBNO.
        DownButNotOutEvent<epic_internal>():listenable(tuple(fort_character, ?fort_character, logic))

        # Signaled when this `fort_character` is marked by a reconnassaince device 
        # Sends `tuple` payload:
        #  - 0: the `fort_character` that was marked. 
        #  - 1: `true` if the character being marked. `false` if the character is being unmarked.
        MarkedEvent<epic_internal>():listenable(tuple(fort_character, ?fort_character, logic))

        # Succeeds if this `fort_character` is crouching.
        IsCrouching<public>()<transacts><decides>:void

        # Succeeds if this `fort_character` is standing on the ground.
        IsOnGround<public>()<transacts><decides>:void

        # Succeeds if this `fort_character` is standing in the air.
        IsInAir<public>()<transacts><decides>:void

        # Succeeds if this `fort_character` is inside water volume.
        IsInWater<public>()<transacts><decides>:void

        # Succeeds if this `fort_character` is in falling locomotion state.
        IsFalling<public>()<transacts><decides>:void

        # Succeeds if this `fort_character` is in gliding locomotion state.
        IsGliding<public>()<transacts><decides>:void

        # Succeeds if this `fort_character` is in flying locomotion state.
        IsFlying<public>()<transacts><decides>:void

        # Succeeds if this `fort_character` is marked by the enemy team due to a recon grenade or other surveillance device.
        IsMarked<epic_internal>()<transacts><decides>:void

        # Puts this `fort_character` into stasis, preventing certain types of movement specified by `Args`.
        PutInStasis<public>(Args:stasis_args)<transacts>:void

        # Release this `fort_character` from stasis.
        ReleaseFromStasis<public>()<transacts>:void

        # Sets this `fort_character` visibility to visible.
        Show<public>():void

        # Sets this `fort_character` visibility to invisible.
        Hide<public>():void

        # Control if this `fort_character` can be damaged.
        SetVulnerability<public>(Vulnerable:logic)<transacts>:void

        # Succeeds if this `fort_character` can be damaged. Fails if this `fort_character` cannot be damaged.
        IsVulnerable<public>()<transacts><decides>:void

        # Teleports this `fort_character` to the provided `Position` and applies the yaw and pitch of `Rotation`. Will fail if the `Position` specified is e.g. outside of the playspace or specifies a place where the character cannot fit.
        TeleportTo<public>(Position:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, Rotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation)<transacts><decides>:void

        @experimental
        GetEntity<epic_internal>()<transacts><decides>:entity

        # Epic internal - Signaled when this `fort_character` possesses a pawn.
        PossessedEvent<epic_internal>():listenable(fort_character)

    # Returns the `fort_character` for `InAgent`. Fails if `InAgent` is not a `fort_character`.
    (InAgent:agent).GetFortCharacter<native><public>()<transacts><decides>:fort_character

    # Returns a `game_action_instigator` interface for `InAgent`.
    (InAgent:agent).GetInstigator<native><public>()<transacts>:game_action_instigator

    # Returns the `agent` for `InInstigator`. Fails if `InInstigator` is not an `agent`.
    (InInstigator:game_action_instigator).GetInstigatorAgent<native><public>()<transacts><decides>:agent

    # Parameters for `fort_character.PutInStasis` function.
    stasis_args<native><public> := struct:
        # Controls if `fort_character` can still turn while in stasis.
        AllowTurning<native><public>:logic = external {}

        # Controls if `fort_character` can still fall while in stasis.
        AllowFalling<native><public>:logic = external {}

        # Controls if `fort_character` can still perform emotes while in stasis.
        AllowEmotes<native><public>:logic = external {}

    @hide_in_editor
    @experimental
    fort_character_component<native><epic_internal> := class<final><final_super>(component, fort_character):
        @experimental
        FortCharacter<native><public>:fort_character

        Damage<override>(Amount:float):void = external {}

        Damage<override>(Args:damage_args):void = external {}

        Heal<override>(Amount:float):void = external {}

        Heal<override>(Args:healing_args):void = external {}

        IsActive<override>()<transacts><decides>:void = external {}

        IsDownButNotOut<override>()<transacts><decides>:void = external {}

        IsCrouching<override>()<transacts><decides>:void = external {}

        IsOnGround<override>()<transacts><decides>:void = external {}

        IsInAir<override>()<transacts><decides>:void = external {}

        IsInWater<override>()<transacts><decides>:void = external {}

        IsFalling<override>()<transacts><decides>:void = external {}

        IsGliding<override>()<transacts><decides>:void = external {}

        IsFlying<override>()<transacts><decides>:void = external {}

        IsMarked<override>()<transacts><decides>:void = external {}

        GetHealth<override>()<transacts>:float = external {}

        GetMaxHealth<override>()<transacts>:float = external {}

        SetHealth<override>(Health:float)<transacts>:void = external {}

        SetMaxHealth<override>(MaxHealth:float)<transacts>:void = external {}

        GetShield<override>()<transacts>:float = external {}

        GetMaxShield<override>()<transacts>:float = external {}

        SetShield<override>(Shield:float)<transacts>:void = external {}

        SetMaxShield<override>(MaxShield:float)<transacts>:void = external {}

        GetOvershield<override>()<transacts>:float = external {}

        GetMaxOvershield<override>()<transacts>:float = external {}

        SetOvershield<override>(Overshield:float)<transacts>:void = external {}

        SetMaxOvershield<override>(MaxOvershield:float)<transacts>:void = external {}

        GetAgent<override>()<transacts><decides>:agent = external {}

        GetTransform<override>()<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)transform = external {}

        GetViewRotation<override>()<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)rotation = external {}

        GetViewLocation<override>()<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

        PutInStasis<override>(Args:stasis_args)<transacts>:void = external {}

        ReleaseFromStasis<override>()<transacts>:void = external {}

        Show<override>():void = external {}

        Hide<override>():void = external {}

        SetVulnerability<override>(Vulnerable:logic)<transacts>:void = external {}

        IsVulnerable<override>()<transacts><decides>:void = external {}

        TeleportTo<override>(Position:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, Rotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation)<transacts><decides>:void = external {}

        GetEntity<override>()<transacts><decides>:entity = external {}

        DamagedEvent<override>():listenable(damage_result) = external {}

        DamagedShieldEvent<override>():listenable(damage_result) = external {}

        DamagedOvershieldEvent<override>():listenable(damage_result) = external {}

        HealedEvent<override>():listenable(healing_result) = external {}

        HealedShieldEvent<override>():listenable(healing_result) = external {}

        HealedOvershieldEvent<override>():listenable(healing_result) = external {}

        CrouchedEvent<override>():listenable(tuple(fort_character, logic)) = external {}

        JumpedEvent<override>():listenable(fort_character) = external {}

        SprintedEvent<override>():listenable(tuple(fort_character, logic)) = external {}

        EliminatedEvent<override>():listenable(elimination_result) = external {}

        DownButNotOutEvent<override>():listenable(tuple(fort_character, logic)) = external {}

        PossessedEvent<override>():listenable(fort_character) = external {}

        MarkedEvent<override>():listenable(tuple(fort_character, logic)) = external {}

# Module import path: /Fortnite.com/FortPlayerUtilities
FortPlayerUtilities<public> := module:
    # The possible dynamic resolution rendering modes
    preferred_rendering_mode<native><epic_internal> := enum:
        # Maximize the framerate
        MaximizeFramerate
        # Maximize the dynamic resolution by setting a lower target framerate
        MaximizeResolution

    # Sets the dynamic resolution behavior based on the preferred rendering mode.
    SetPreferredRenderingModeHint<native><epic_internal>(Players:[]player, InPreferredRenderingMode:preferred_rendering_mode):void

    # Sends `InPlayer` back to the main game lobby.
    (InPlayer:player).SendToLobby<native><public>()<transacts>:void

    # Succeeds if `InAgent` is spectating the experience. Fails otherwise.
    (InAgent:agent).IsSpectator<native><public>()<transacts><decides>:void

    # Sets `InAgent` to spectate `ParticipantToSpectate`.
    # Fails if:
    #  * `ParticipantToSpectate` is already eliminated.
    #  * `ParticipantToSpectate` is the same as `InAgent`.
    (InAgent:agent).SpectateParticipant<native><epic_internal>(ParticipantToSpectate:agent)<transacts><decides>:void

    # Sets `InAgent` to spectate the `agent` that eliminated them.
    # Fails if the eliminating `player` has also been eliminated.
    (InAgent:agent).SpectateEliminator<native><epic_internal>()<transacts><decides>:void

    # Returns an `[]player`s currently spectating `InPlayer`.
    (InPlayer:player).GetPlayersSpectating<native><public>()<transacts>:[]player

    # Returns the agent a spectator is currently spectating, fails if the spectator isn't spectating or isn't spectating an agent.
    (InAgent:agent).GetSpectatedAgent<native><public>()<reads><decides>:agent

    # Returns an `[]agent`s currently spectating `InAgent`.
    (InAgent:agent).GetSpectators<native><public>()<transacts>:[]agent

    # Respawns the character for `InAgent` at the provided `RespawnPosition` and applies the yaw of `RespawnRotation`.
    (InAgent:agent).Respawn<native><public>(RespawnPosition:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, RespawnRotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation)<transacts>:void

    (InAgent:agent).RestartPlayer<native><epic_internal>(RespawnPosition:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, RespawnRotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation, SpawnOnGround:logic)<transacts>:void

# Module import path: /Fortnite.com/Game
Game<public> := module:
    # Result data for `fort_character` elimination events.
    elimination_result<native><public> := struct<epic_internal>:
        # The `fort_character` eliminated from the match by `EliminatingCharacter`.
        EliminatedCharacter<native><public>:fort_character

        # `fort_character` that eliminated `EliminatedCharacter` from the match. `EliminatingCharacter` will be false when `EliminatedCharacter` was eliminated through non-character actions, such as environmental damage.
        EliminatingCharacter<native><public>:?fort_character

    @experimental
    fort_ability_component<native><epic_internal> := class(ability_component):
        OnBeginSimulation<native><override>():void

        OnEndSimulation<native><override>():void

    @experimental
    fort_damageable_component<native><epic_internal> := class(damageable_component):
        OnInitialized<native><override>():void

        OnUninitializing<native><override>():void

        OnBeginSimulation<native><override>():void

        OnEndSimulation<native><override>():void

        @editable
        @experimental
        MaxHealth<native><epic_internal>:float = external {}

        @experimental
        var Health<public>:float = external {}

        @experimental
        DamagedEventWithAgent<native><epic_internal>:listenable(tuple(float, ?agent)) = external {}

    @experimental
    # The subscription type returned from the round manager interfaces.
    fort_round_subscription<native><epic_internal> := class(cancelable):
        Cancel<native><override>()<transacts>:void

    @experimental
    # This interface is implemented by the round manager living on the simulation entity.
    fort_round_manager<native><public> := interface<epic_internal>:
        # Subscribed callbacks will be invoked in two scenarios:
        #  - When a new Fortnite round starts
        #  - If a round is ongoing, your callback will be invoked immediately
        # Upon the round ending, all callbacks will be canceled
        SubscribeRoundStarted<public>(Callback:type {_()<suspends>:void}):cancelable

        # Subscribed callbacks will be invoked when a Fortnite round ends
        SubscribeRoundEnded<public>(Callback:type {_():void}):cancelable

    @experimental
    fort_game_events_component<native><epic_internal> := class<final_super>(component, fort_round_manager):
        OnAddedToScene<override><native><native_callable>():void

        OnRemovingFromScene<override><native><native_callable>():void

        SetupGameEvent<native><epic_internal>:listenable(tuple()) = external {}

        RoundWarmupEvent<native><public>:listenable(tuple()) = external {}

        RoundStartEvent<native><public>:listenable(tuple()) = external {}

        RoundEndEvent<native><public>:listenable(tuple()) = external {}

        EndGameEvent<native><epic_internal>:listenable(tuple()) = external {}

        # Subscribed callbacks will be invoked in two scenarios:
        #  - When a new Fortnite round starts
        #  - If a round is ongoing, your callback will be invoked immediately
        #  Upon the round ending, all callbacks will be canceled
        SubscribeRoundStarted<native><override>(Callback:type {_()<suspends>:void}):cancelable

        # Subscribed callbacks will be invoked when a Fortnite round ends
        SubscribeRoundEnded<native><override>(Callback:type {_():void}):cancelable

    @experimental
    # Returns the fort game events component, if it exists.
    (InEntity:entity).GetFortGameEvents<epic_internal>()<transacts><decides>:fort_game_events_component = external {}

    @experimental
    # Returns the round manager from the simulation entity.
    (InEntity:entity).GetFortRoundManager<public>()<transacts><decides>:fort_round_manager = external {}

    @experimental
    # Component used to associate a camera behavior component with a player
    fort_player_camera_view<native><epic_internal> := class<epic_internal>(player_camera_view):

    @experimental
    GetPlayerCameraView<native><epic_internal>(Player:player)<transacts><decides>:fort_player_camera_view

    @experimental
    # Activate a camera component for a player, setting it as the active view target
    (InCameraBehavior:camera_component).ActivateForPlayer<native><epic_internal>(InPlayer:player)<transacts><decides>:void

    @experimental
    # Deactivate a camera component for a player, restoring the player's view target to the default
    (InCameraBehavior:camera_component).DeactivateForPlayer<native><epic_internal>(InPlayer:player)<transacts><decides>:void

    # Implemented by objects to allow reading position information.
    positional<native><public> := interface<epic_internal>:
        # Returns the transform of the object.
        GetTransform<public>()<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)transform

    # Implemented by Fortnite objects that have health state and can be eliminated.
    healthful<native><public> := interface<epic_internal>:
        # Returns the health state of the object. This value will be between 0.0 and `GetMaxHealth`
        GetHealth<public>()<transacts>:float

        # Sets the health state of the object to `Health`.
        #  * Health state will be clamped between 1.0 and `GetMaxHealth`.
        #  * Health state cannot be directly set to 0.0. To eliminate `healthful` objects use the `damageable.Damage` functions instead.
        SetHealth<public>(Health:float)<transacts>:void

        # Returns the maximum health of the object. This value will be between 1.0 and Inf.
        GetMaxHealth<public>()<transacts>:float

        # Sets the maximum health state of the object.
        #  * MaxHealth will be clamped between 1.0 and Inf.
        #  * Current health state will be scaled up or down based on the scale difference between the old and new MaxHealth state.
        SetMaxHealth<public>(MaxHealth:float)<transacts>:void

    # Implemented by Fortnite objects that have shields. A shield is a method of protection that can take incoming damage while leaving the health state unchanged.
    shieldable<native><public> := interface<epic_internal>:
        # Returns the shield state of the object. This value will be between 0.0 and `MaxShield`
        GetShield<public>()<transacts>:float

        # Sets the shield state of the object.
        #  * Shield state will be clamped between 0.0 and `MaxShield`.
        SetShield<public>(Shield:float)<transacts>:void

        # Returns the maximum shield state of the object. This value will be between 0.0 and Inf.
        GetMaxShield<public>()<transacts>:float

        # Sets the maximum shield state of the object.
        #  * MaxShield will be clamped between 0.0 and Inf.
        #  * Current shield state will be scaled up or down based on the scale difference between the old and new MaxShield state.
        SetMaxShield<public>(MaxShield:float)<transacts>:void

        # Signaled when the shield is damaged.
        DamagedShieldEvent<public>():listenable(damage_result)

        # Signaled when the shield is healed.
        HealedShieldEvent<public>():listenable(healing_result)

        # Returns the overshield state of the object. This value will be between 0.0 and `MaxOvershield`
        GetOvershield<epic_internal>()<transacts>:float

        # Sets the overshield state of the object.
        #  * Overshield state will be clamped between 0.0 and `MaxOvershield`.
        SetOvershield<epic_internal>(Overshield:float)<transacts>:void

        # Returns the maximum overshield state of the object. This value will be between 0.0 and Inf.
        GetMaxOvershield<epic_internal>()<transacts>:float

        # Sets the maximum overshield state of the object.
        #  * MaxOvershield will be clamped between 0.0 and Inf.
        #  * Current overshield state will be scaled up or down based on the scale difference between the old and new MaxOvershield state.
        SetMaxOvershield<epic_internal>(MaxOvershield:float)<transacts>:void

        # Signaled when the overshield is damaged.
        DamagedOvershieldEvent<epic_internal>():listenable(damage_result)

        # Signaled when the oversshield is healed.
        HealedOvershieldEvent<epic_internal>():listenable(healing_result)

    # Implemented by Fortnite objects that can be damaged.
    damageable<native><public> := interface<epic_internal>:
        # Damage the `damageable` object anonymously by `Amount`. Setting `Amount` to less than 0 will cause no damage.
        # Use `Damage(:damage_args):void` when damage is being applied from a known instigator and source.
        Damage<public>(Amount:float):void

        # Damage the `damageable` object by `Args.Amount`. Setting `Amount` to less than 0 will cause no damage.
        Damage<public>(Args:damage_args):void

        # Signaled when damage is applied to the `damageable` object.
        DamagedEvent<public>():listenable(damage_result)

    # Implemented by Fortnite objects that can be healed.
    healable<native><public> := interface<epic_internal>:
        # Heal the `healable` object anonymously by `Amount`. Setting `Amount` to less than 0 will cause no healing.
        # Use `Heal(:healing_args):void` when healing is being applied from a known instigator and source.
        Heal<public>(Amount:float):void

        # Cause `Args.Amount` damage to the `damageable` object. Setting `Amount` to less than 0 will cause no damage.
        Heal<public>(Args:healing_args):void

        # Signaled when healing is applied to the `healable` object.
        HealedEvent<public>():listenable(healing_result)

    # Parameters for common damage functions on Fortnite objects.
    damage_args<native><public> := struct:
        # Player, agent, etc. that instigated the damage to the object.
        Instigator<native><public>:?game_action_instigator = external {}

        # Player, weapon, vehicle, etc. that damaged the object.
        Source<native><public>:?game_action_causer = external {}

        # Amount of damage to apply to the object.
        Amount<native><public>:float

    # Results for damage events on Fortnite objects.
    damage_result<native><public> := struct<epic_internal>:
        # Object that was damaged.
        Target<native><public>:damageable

        # Amount of damage applied to `Target`.
        Amount<native><public>:float

        # Player, agent, etc. that instigated the damage to `Target`. Can be false when damage is instigated by code, the environment, etc.
        Instigator<native><public>:?game_action_instigator = external {}

        # Player, weapon, vehicle, etc. that damaged `Target`. Can be false when damage is caused by code, the environment, etc.
        Source<native><public>:?game_action_causer = external {}

    # Parameters for common healing functions on Fortnite objects.
    healing_args<native><public> := struct:
        # Player, agents, etc. that instigated the healing of the object.
        Instigator<native><public>:?game_action_instigator = external {}

        # Player, weapon, vehicle, etc. that healed the object.
        Source<native><public>:?game_action_causer = external {}

        # Amount of healing to apply to the object.
        Amount<native><public>:float

    # Results for healing events on Fortnite objects.
    healing_result<native><public> := struct<epic_internal>:
        # Object that was healed.
        Target<native><public>:healable

        # Amount of healing applied to `Target`.
        Amount<native><public>:float

        # Player, agent, etc. that instigated healing of the `Target`. Can be false when damage is instigated by code, the environment, etc.
        Instigator<native><public>:?game_action_instigator = external {}

        # Player, weapon, vehicle, etc. that healed `Target`. Can be false when damage is caused by code, the environment, etc.
        Source<native><public>:?game_action_causer = external {}

    # Implemented by Fortnite objects that initiate game actions, such as damage and heal. For example, player or agents.
    # Event listeners often use `game_action_instigators` to calculate player damage scores.
    game_action_instigator<native><public> := interface<epic_internal>:

    # Implemented by Fortnite objects that can be passed through game action events, such as damage and heal.
    # For example: player, vehicle, or weapon.
    # 
    # Event Listeners often use `game_action_causer` to pass along additional information about what weapon caused the damage.
    # Systems will then use that information for completing quests or processing game specific event logic.
    game_action_causer<native><public> := interface:

    # Implementation of the `game_action_instigator` interface for `agent`s.
    agent_instigator_impl<native><epic_internal> := class(game_action_instigator):
        TheAgent<native><epic_internal>:agent

    teleport_to_debug_log<epic_internal> := class(log_channel):

    # Results for `TeleportTo` of creative objects and devices.
    teleport_to_result<native><epic_internal> := enum:
        # Success.
        Ok
        # An unknown error occurred. If this happens frequently, contact Epic support.
        UnknownError
        # `NaN` or `Infinity` in the requested destination.
        InvalidDestination
        # There is something colliding with the requested destination.
        CollidingDestination
        # The object being moved is no longer valid. Example invalid states:
        #  * The object has been destroyed during gameplay.
        #  * The object has been destroyed by Verse.
        #  * The object has the *Register with Structural Grid* option set in UEFN.
        InvalidObject
        # The object being moved cannot be scaled.
        ScaleNotAllowed
        # The destination would cause the object to be at least partially outside the island's boundaries.
        DestinationOutOfBounds

    HandleTeleportToResult<epic_internal>(Result:teleport_to_result, TargetTragsform:(/UnrealEngine.com/Temporary/SpatialMath:)transform)<transacts><decides>:void = external {}

# Module import path: /Fortnite.com/Playspaces
Playspaces<public> := module:
    # A nested container that scopes objects, style, gameplay rules, visuals, etc. All objects and players in an experience will belong to a fort_playspace. There is typically one `fort_playspace` for an entire experience, though this may change in the future as the platform evolves.
    # 
    # To access the `fort_playspace` for a `creative_device` use `creative_device.GetPlayspace`.
    fort_playspace<native><public> := interface<epic_internal>:
        # Get all human `player`s that are in the current `fort_playspace`.
        GetPlayers<public>()<transacts>:[]player

        # Get the `fort_team_collection` for the current `fort_playspace`.
        GetTeamCollection<public>()<transacts>:fort_team_collection

        # Signaled when a human `player` joins the `fort_playspace`. Returns a subscribable with a payload of the`player` that entered the `fort_playspace`.
        PlayerAddedEvent<public>():listenable(player)

        # Signaled when a human `player` leaves the `fort_playspace`. Returns a subscribable with a payload of the`player` that left the `fort_playspace`.
        PlayerRemovedEvent<public>():listenable(player)

        # Get all `agent`s that are participating in the current `fort_playspace` experience. Participants might be human players (of `player` type) or AI-controlled characters (of `agent` type) that are registered and affecting the participant's count.
        GetParticipants<public>()<transacts>:[]agent

        # Signaled when a participant `agent` joins the `fort_playspace`. Returns a subscribable with a payload of the`agent` that entered the `fort_playspace`.
        ParticipantAddedEvent<public>():listenable(agent)

        # Signaled when a participant `agent` leaves the `fort_playspace`. Returns a subscribable with a payload of the`agent` that left the `fort_playspace`.
        ParticipantRemovedEvent<public>():listenable(agent)

        # Signaled when a human `player` abandons the `fort_playspace` via exit match button. Will not fire if the playerleft via a crash, match end, or getting kicked. Returns a subscribable with a payload of the`player` that leftthe `fort_playspace`.
        PlayerAbandonedEvent<epic_internal>():listenable(player)

    @experimental
    # Returns an associated `fort_playspace` for this entity.  * Fails if this entity is not in the scene, and therefore not associated with a playspace.
    (InEntity:entity).GetPlayspaceForEntity<native><public>()<transacts><decides>:fort_playspace

# Module import path: /Fortnite.com/FortSafeZone
FortSafeZone<public> := module:
    fort_storm_safe_zone<native><epic_internal> := struct<epic_internal>:
        Center<native><public>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

        Radius<native><public>:float = external {}

    fort_storm_safe_zone_phase<native><epic_internal> := struct<epic_internal>:
        WaitTime<native><public>:float

        ShrinkTime<native><public>:float

    @import_as("/Script/VerseFortnite.UVerseFortniteSafeZone")
    fort_safe_zone_base<native><epic_internal> := class<abstract>:

    fort_safe_zone<native><epic_internal> := class<epic_internal>(fort_safe_zone_base):
        IsInSafeZone<native><epic_internal>(TestLocation:(/UnrealEngine.com/Temporary/SpatialMath:)vector3)<transacts><decides>:void

        GetSafeZone<native><epic_internal>()<transacts><decides>:fort_storm_safe_zone

        GetSafeZoneIdx<native><epic_internal>()<transacts><decides>:int

        GetSafeZonePhase<native><epic_internal>(PhaseIdx:int)<transacts><decides>:fort_storm_safe_zone_phase

        GetRemainingPhaseTime<native><epic_internal>()<transacts><decides>:float

        IsStormHolding<native><epic_internal>()<transacts>:logic

        IsStormForming<native><epic_internal>()<transacts>:logic

        GetTimeUntilSafeZonePhase<native><epic_internal>(PhaseIdx:int)<transacts><decides>:float

        GetSafeZoneAfterDelay<native><epic_internal>(Delay:float)<transacts><decides>:fort_storm_safe_zone

# Module import path: /Fortnite.com/Teams
Teams<public> := module:
    # A generic set of team attitudes. Use this enum to model relationship behavior between your experience's agents/teams.
    team_attitude<native><public> := enum:
        # Agents/teams are friends. In Fortnite games two `agent`s on the same `team` are `friendly`.
        Friendly
        # Agents/teams are neutral. In Fortnite games items and AI not belonging to a `friendly` or `hostile` team are `neutral`.
        Neutral
        # Agents/teams are hostile. In fortnite games two `agent`s on opposing `team`s are `hostile`.
        Hostile

    # Collection used to manage `team`s and `agent`s on those teams.
    # Use `fort_playspace.GetTeamCollection()` to get the `team_collection` for the active experience.
    fort_team_collection<native><public> := interface<epic_internal>:
        # Returns an array of all the `team`s known to this `fort_team_collection`
        GetTeams<public>()<transacts>:[]team

        @experimental
        # Register a team component with the team collection, so that its team can automatically be changed as teams are associated with its tag. 
        # Fails if:
        #  * The team component's tag is not set
        #  * The team component is not attached to an entity
        #  * The owning entity of the team component is already registered.
        RegisterTeamComponent<native_callable><epic_internal>(InTeamComponent:team_component)<transacts><decides>:void

        @experimental
        # Unregister a team component from the team collection. Fails if the team component is not registered with the team collection
        UnregisterTeamComponent<native_callable><epic_internal>(InTeamComponent:team_component)<transacts><decides>:void

        @experimental
        # Associate the team `InTeam` with the tag `InTeamTag`, so that it can be accessed by team_component. Fails if `InTeam` is not a valid team within the team collection
        SetTaggedTeam<epic_internal>(InTeamTag:team_tag, InTeam:team)<transacts><decides>:void

        @experimental
        # Get the team associated with the tag `InTag`. Fails if no such team is associated with `InTag` 
        GetTeamByTag<epic_internal>(InTeamTag:team_tag)<transacts><decides>:team

        # Get all of the tags associated with the team `InTeam`. Fails if `InTeam` is not a valid team within the team collection
        GetTeamTags<epic_internal>(InTeam:team)<transacts><decides>:tag_container

        # Adds `InAgent` to `InTeam`.
        # Fails if `InTeam` is not part of the `fort_team_collection`.
        AddToTeam<public>(InAgent:agent, InTeam:team)<transacts><decides>:void

        @experimental
        # Adds `InEntity` to the team that matches `InTeamTag`.
        # Fails if `InTeamTag` is not a registered team in the `fort_team_collection`.
        AddToTeam<native_callable><epic_internal>(InEntity:entity, InTeamTag:team_tag)<transacts><decides>:void

        # Succeeds if `InAgent` is on `InTeam`.
        # Fails if:
        #  * `InAgent` is not on `InTeam`.
        #  * `InTeam` is not part of the `fort_team_collection`.
        IsOnTeam<public>(InAgent:agent, InTeam:team)<transacts><decides>:void

        @experimental
        # Succeeds if `InEntity` is on `InTeam`.
        # Fails if:
        #  * `InEntity` is not on `InTeam`.
        #  * `InTeam` is not part of the `fort_team_collection`.
        IsOnTeam<epic_internal>(InEntity:entity, InTeam:team)<transacts><decides>:void

        # Returns an array of all `agent`s on `InTeam`.
        # Fails if `InTeam` is not part of the `fort_team_collection`.
        GetAgents<public>(InTeam:team)<transacts><decides>:[]agent

        @experimental
        # Returns an array of all `entities on `InTeam`.
        # Fails if `InTeam` is not part of the `fort_team_collection`.
        GetEntities<epic_internal>(InTeam:team)<transacts><decides>:[]entity

        # Get the `team` that `InAgent` is on.
        # Fails if `InAgent` is not on a team in this `fort_team_collection`.
        GetTeam<public>(InAgent:agent)<transacts><decides>:team

        @experimental
        # Get the `team` that `InEntity` is on.
        # Fails if `InEntity` is not on a team in this `fort_team_collection`.
        GetTeam<epic_internal>(InEntity:entity)<transacts><decides>:team

        # Returns the `team_attitude` between `Team1` and `Team2`.
        # Fails if:
        #  * `Team1` is not in this `fort_team_collection`.
        #  * `Team2` is not in this `fort_team_collection`.
        GetTeamAttitude<public>(Team1:team, Team2:team)<transacts><decides>:team_attitude

        # Returns the `team_attitude` between `Agent1` and `Agent2`.
        # Fails if:
        #  * `Agent1` is not on a team in this `fort_team_collection`.
        #  * `Agent2` is not on a team in this `fort_team_collection`.
        GetTeamAttitude<public>(Agent1:agent, Agent2:agent)<transacts><decides>:team_attitude

        @experimental
        # Returns the `team_attitude` between `Entity1` and `Entity2`.
        # Fails if:
        #  * `Entity1` is not on a team in this `fort_team_collection`.
        #  * `Entity2` is not on a team in this `fort_team_collection`.
        GetTeamAttitude<epic_internal>(Entity1:entity, Entity2:entity)<transacts><decides>:team_attitude

        @experimental
        # Returns the `team_attitude` between `Agent` and `Entity`.
        # Fails if:
        #  * `Agent` is not on a team in this `fort_team_collection`.
        #  * `Entity` is not on a team in this `fort_team_collection`.
        GetTeamAttitude<epic_internal>(Agent:agent, Entity:entity)<transacts><decides>:team_attitude

    @experimental
    team_tag<native><epic_internal> := class<concrete>(tag):

    @experimental
    team_pvp_01_tag<native><epic_internal> := class<concrete>(team_tag):

    @experimental
    team_pvp_02_tag<native><epic_internal> := class<concrete>(team_tag):

    @experimental
    team_monster_tag<native><epic_internal> := class<concrete>(team_tag):

    @experimental
    team_component<native><epic_internal> := class<final><final_super>(component):
        OnInitialized<native><override>():void

        OnUninitializing<native><override>():void

        OnAddedToScene<native><override>():void

        OnRemovingFromScene<native><override>():void

        OnBeginSimulation<native><override>():void

        OnEndSimulation<native><override>():void

        OnSimulate<override>()<suspends>:void = external {}

        @experimental
        # Tag that uniquely identifies the team this entity is on
        var TeamTag<public>:team_tag = external {}

        # Get the team object for the team this entity is on - Fails if team is not registered. team_pvp_01_tag, team_pvp_02_tag and team_monster_tag are registered already by default
        GetTeam<native><public>()<transacts><decides>:team

# Module import path: /Fortnite.com/Vehicles
Vehicles<public> := module:
    # Returns the `fort_vehicle` for `InCharacter`.
    # Fails if `InCharacter` is not associated with a `fort_vehicle`.
    (InCharacter:fort_character).GetVehicle<native><public>()<transacts><decides>:fort_vehicle

    # Main API implemented by Fortnite vehicles.
    fort_vehicle<native><public> := interface<unique><epic_internal>(positional, healthful, damageable, game_action_causer):
        # Succeeds if this `fort_vehicle` is standing on ground.
        IsOnGround<public>()<transacts><decides>:void

        # Succeeds if this `fort_vehicle` is standing in air.
        IsInAir<public>()<transacts><decides>:void

        # Succeeds if this `fort_vehicle` is standing in water.
        IsInWater<public>()<transacts><decides>:void

        # Returns an array with all the passengers of the vehicle.
        GetPassengers<public>()<transacts>:[]fort_character

        # Returns the fuel state of the vehicle. If the vehicle uses fuel, this value will be between 0.0 and `GetFuelCapacity`. Otherwise, this value will be -1.0.
        GetFuelRemaining<public>()<transacts>:float

        # Returns the maximum fuel capacity of the vehicle. If the vehicle uses fuel, this value will be between 1.0 and Inf. Otherwise, this value will be -1.0.
        GetFuelCapacity<public>()<transacts>:float

        # Teleports the `fort_vehicle` to the specified `Position` and `Rotation`.
        TeleportTo<public>(Position:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, Rotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation)<transacts><decides>:void

        @experimental
        GetEntity<epic_internal>()<transacts><decides>:entity

    @hide_in_editor
    @experimental
    fort_vehicle_component<native><epic_internal> := class<final_super>(component, fort_vehicle):
        @experimental
        FortVehicle<native><public>:fort_vehicle

        IsOnGround<override>()<transacts><decides>:void = external {}

        IsInAir<override>()<transacts><decides>:void = external {}

        IsInWater<override>()<transacts><decides>:void = external {}

        GetPassengers<override>()<transacts>:[]fort_character = external {}

        # Returns the fuel state of the vehicle. If the vehicle uses fuel, this value will be between 0.0 and `GetFuelCapacity`. Otherwise, this value will be -1.0.
        GetFuelRemaining<override>()<transacts>:float = external {}

        # Returns the maximum fuel capacity of the vehicle. If the vehicle uses fuel, this value will be between 1.0 and Inf. Otherwise, this value will be -1.0.
        GetFuelCapacity<override>()<transacts>:float = external {}

        # Teleports the vehicle to the specified `Position` and `Rotation`.
        TeleportTo<override>(Position:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, Rotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation)<transacts><decides>:void = external {}

        Damage<override>(Amount:float):void = external {}

        Damage<override>(Args:damage_args):void = external {}

        GetHealth<override>()<transacts>:float = external {}

        SetHealth<override>(Health:float)<transacts>:void = external {}

        GetMaxHealth<override>()<transacts>:float = external {}

        SetMaxHealth<override>(MaxHealth:float)<transacts>:void = external {}

        GetTransform<override>()<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)transform = external {}

        GetEntity<override>()<transacts><decides>:entity = external {}

        DamagedEvent<override>():listenable(damage_result) = external {}
