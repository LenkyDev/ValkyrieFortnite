# Copyright Epic Games, Inc. All Rights Reserved.
#################################################
# Generated Digest of Verse API
# DO NOT modify this manually!
# Generated from build: ++Fortnite+Release-35.10-CL-42476511
#################################################

using {/Verse.org/Colors}
using {/UnrealEngine.com/Temporary/SpatialMath}
using {/Fortnite.com/Playspaces}
using {/Verse.org/Simulation}
using {/UnrealEngine.com/Temporary/UI}
# Module import path: /Fortnite.com/UI
(/Fortnite.com:)UI<public> := module:
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

    creative_hud_identifier_all<public> := class<final>(hud_element_identifier):

    creative_hud_identifier_build_menu<public> := class<final>(hud_element_identifier):

    creative_hud_identifier_crafting_resources<public> := class<final>(hud_element_identifier):

    creative_hud_identifier_elimination_counter<public> := class<final>(hud_element_identifier):

    creative_hud_identifier_equipped_item<public> := class<final>(hud_element_identifier):

    creative_hud_identifier_experience_level<public> := class<final>(hud_element_identifier):

    creative_hud_identifier_experience_supercharged<public> := class<final>(hud_element_identifier):

    creative_hud_identifier_experience_ui<public> := class<final>(hud_element_identifier):

    creative_hud_identifier_health<public> := class<final>(hud_element_identifier):

    creative_hud_identifier_health_numbers<public> := class<final>(hud_element_identifier):

    creative_hud_identifier_hud_info<public> := class<final>(hud_element_identifier):

    creative_hud_identifier_interaction_prompts<public> := class<final>(hud_element_identifier):

    creative_hud_identifier_map_prompts<public> := class<final>(hud_element_identifier):

    creative_hud_identifier_mimimap<public> := class<final>(hud_element_identifier):

    creative_hud_identifier_minimap<public> := class<final>(hud_element_identifier):

    creative_hud_identifier_pickup_stream<public> := class<final>(hud_element_identifier):

    creative_hud_identifier_player_count<public> := class<final>(hud_element_identifier):

    creative_hud_identifier_player_inventory<public> := class<final>(hud_element_identifier):

    creative_hud_identifier_round_info<public> := class<final>(hud_element_identifier):

    creative_hud_identifier_round_timer<public> := class<final>(hud_element_identifier):

    creative_hud_identifier_shield_numbers<public> := class<final>(hud_element_identifier):

    creative_hud_identifier_shileds<public> := class<final>(hud_element_identifier):

    creative_hud_identifier_shields<public> := class<final>(hud_element_identifier):

    creative_hud_identifier_storm_notifications<public> := class<final>(hud_element_identifier):

    creative_hud_identifier_storm_timer<public> := class<final>(hud_element_identifier):

    creative_hud_identifier_team_info<public> := class<final>(hud_element_identifier):

    player_hud_identifier_all<public> := class<final>(hud_element_identifier):

    hud_identifier_world_resource_wood<public> := class<final>(hud_element_identifier):

    hud_identifier_world_resource_stone<public> := class<final>(hud_element_identifier):

    hud_identifier_world_resource_metal<public> := class<final>(hud_element_identifier):

    hud_identifier_world_resource_permanite<public> := class<final>(hud_element_identifier):

    hud_identifier_world_resource_gold_currency<public> := class<final>(hud_element_identifier):

    hud_identifier_world_resource_ingredient<public> := class<final>(hud_element_identifier):

    hud_identifier_visual_sound_effect_weapons<public> := class<final>(hud_element_identifier):

    hud_identifier_visual_sound_effect_loot<public> := class<final>(hud_element_identifier):

    hud_identifier_visual_sound_effect_movement<public> := class<final>(hud_element_identifier):

    hud_identifier_visual_sound_effect_vehicle<public> := class<final>(hud_element_identifier):

    hud_identifier_visual_sound_effect_healing<public> := class<final>(hud_element_identifier):

    hud_identifier_visual_sound_effect_all<public> := class<final>(hud_element_identifier):

    # Used to identify a HUD element.
    hud_element_identifier<native><public> := class<abstract><epic_internal>:

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

using {/Verse.org/Assets}
using {/Fortnite.com/AI}
using {/Verse.org/Native}
using {/Verse.org/Simulation/Tags}
using {/Fortnite.com/Game}
using {/Verse.org/SceneGraph}
# Module import path: /Fortnite.com/Devices
Devices<public> := module:
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

        # Animation play modes.
        animation_mode<native><public> := enum:
            # Stop after playing the animation once.
            OneShot
            # Reverse direction after reaching the final `keyframe_delta`, then play the animation in reverse.
            PingPong
            # Play the animation in a loop. This requires the animation ends exactly where it began.
            Loop

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

            # Starts or resumes playback of the animation.
            Play<public>():void = external {}

            # Pauses the animation if it is already playing.
            Pause<public>():void = external {}

            # Stops playback and resets the animation to the first keyframe. Also resets the prop transform. Calling this method is valid while the animation is in the `Playing` or `Paused` states.
            Stop<public>():void = external {}

            # Returns the current state of this `animation_controller`.
            GetState<native><public>()<transacts>:animation_controller_state

            # Succeeds if this `animation_controller`s target is still valid (i.e., the target has not been disposed of either via `Dispose` or through any external system.)
            IsValid<native><public>()<transacts><decides>:void

            # Sets the animation for the `animation_controller`. Animations are processed in the order provided in `Keyframes`. See notes in `keyframe_delta` and `animation_mode` for more details on controlling the animations.
            SetAnimation<public>(Keyframes:[]keyframe_delta, ?Mode:animation_mode):void = external {}

            # Signaled each time a keyframe is reached. Callback(KeyframeIndex:int, InReverse:logic). Note that the KeyframeIndex in the callback is generally in [1, NumDeltaKeyframes] except that in a PingPong animation the final keyframe played in reverse is identified as index 0. This is because SetAnimation takes *delta* keyframes whereas this event notifies the listener that a specific keyframe has been reached.
            KeyframeReachedEvent<native><public>:listenable(tuple(int, logic)) = external {}

            # Signaled when the entire animation is complete. This will only fire for `OneShot` animations.
            MovementCompleteEvent<native><public>:listenable(tuple()) = external {}

            # Signaled when the state has changed. Use `GetState` to get the new state.
            StateChangedEvent<native><public>:listenable(tuple()) = external {}

        # Returns an `animation_controller` used to animate `Prop`. Only a subset of `creative_prop` types can be animated, though this may change in the future. A few examples of props that cannot be animated yet are:
        #  * Walls attached to buildings
        #  * Treasure chests
        #  * Loot llamas
        (Prop:creative_prop).GetAnimationController<public>()<transacts><decides>:animation_controller = external {}

    # Inherit from this to create a custom creative device. Inherited classes will appear in the UEFN content browser the next time Verse compiles. Instances of your derived `creative_device` can then be placed in the island by dragging them from the content browser into the scene.
    creative_device<native><public> := class<concrete>(creative_object_interface):
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

    # Internal asset for representing creative devices.
    creative_device_asset<native><public> := class<computes><final><epic_internal>:

    @experimental
    # Returns the simulation entity at the root of the experience this `creative_device` is operating within.
    #   * The simulation entity is the rootmost entity in an experience.
    #   * Fails if this `creative_device` is not operating in a context with a valid SimulationEntity.
    (CreativeDevice:creative_device).(/Fortnite.com/Devices:)GetSimulationEntity<native><public>()<transacts><decides>:entity

    creative_object_interface<native><public> := interface<epic_internal>(positional):

    # Base class for creative devices and props.
    creative_object<native><public> := class<epic_internal>(creative_object_interface):
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

        # Changes the Material of the Mesh used by this instance. Optionally can specify which Mesh element index to apply the material to, otherwise defaults to the 0 (default) Mesh element
        SetMaterial<native><public>(Material:material, ?Index:int = external {})<transacts>:void

        # Shows the `creative_prop` in the world and enable collisions.
        Show<native><public>()<transacts>:void

        # Hides the `creative_prop` in the world and disable collisions.
        Hide<native><public>()<transacts>:void

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

    # Payload of `device_event_ai_interaction`.
    device_ai_interaction_result<native><public> := struct<epic_internal>:
        # Optional agent that triggered the interaction
        Source<native><public>:?agent

        # Optional agent targeted by `Source`.
        Target<native><public>:?agent

    # Results for `MoveTo`.
    move_to_result<public> := enum:
        # The destination has been reached.
        DestinationReached
        # The destination will not be reached. See debug log in UEFN for more info.
        WillNotReachDestination

using {/Fortnite.com/Teams}
using {/Fortnite.com/Characters}
# Module import path: /Fortnite.com/AI
AI<public> := module:
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

    focus_interface<native><public> := interface<epic_internal>:
        # Look At specified location. Will never complete unless interrupted.
        MaintainFocus<public>(Location:(/UnrealEngine.com/Temporary/SpatialMath:)vector3)<suspends>:void

        # Look At specified Agent. Will never complete unless interrupted.
        MaintainFocus<public>(Agent:agent)<suspends>:void

    # Get the focus_interface interface for the specified character.
    (InCharacter:fort_character).GetFocusInterface<native><public>()<transacts><decides>:focus_interface

    @experimental
    # Fortnite Guards AI actions management
    fort_guard_actions<native><public> := interface<epic_internal>(fort_npc_actions, fort_leashable):
        # Roam around the current position. Use the fort_leashable_component to specify the radius, else will roam anywhere.
        RoamAround<public>(?MovementType:movement_type = external {})<suspends>:navigation_result

        # Move in range to attack the current target
        MoveInRangeToAttack<public>()<suspends>:ai_action_result

        # Play a random emote from the character emotes bank
        PlayRandomEmote<public>()<suspends>:ai_action_result

        # Revive the specified target
        Revive<public>(Target:agent)<suspends>:ai_action_result

        # Attack the target
        Attack<public>(Target:fort_target_info)<suspends>:ai_action_result

    @experimental
    # Get the current fort_guard_actions interface for the specified character.
    (InCharacter:fort_character).GetFortGuardActions<native><public>()<transacts><decides>:fort_guard_actions

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
    # Get the current fort_guard_perception interface for the specified character.
    (InCharacter:fort_character).GetFortGuardPerception<native><public>()<transacts><decides>:fort_guard_perception

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
    # Get the current fort_npc_actions interface for the specified character.
    (InCharacter:fort_character).GetFortNPCActions<native><public>()<transacts><decides>:fort_npc_actions

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

    movement_type<native><public> := class<concrete><final><computes><epic_internal>:

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
    # Create a `navigation_target` from a `fort_target_info`.
    MakeNavigationTarget<native><public>(TargetInfo:fort_target_info):navigation_target

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

        # Get the play_animation_controller for the specified character.
        (InCharacter:fort_character).GetPlayAnimationController<native><public>()<transacts><decides>:play_animation_controller

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

# Module import path: /Fortnite.com/FortPlayerUtilities
FortPlayerUtilities<public> := module:
    # Sends `InPlayer` back to the main game lobby.
    (InPlayer:player).SendToLobby<native><public>()<transacts>:void

    # Succeeds if `InAgent` is spectating the experience. Fails otherwise.
    (InAgent:agent).IsSpectator<native><public>()<transacts><decides>:void

    # Returns an `[]player`s currently spectating `InPlayer`.
    (InPlayer:player).GetPlayersSpectating<native><public>()<transacts>:[]player

    # Returns the agent a spectator is currently spectating, fails if the spectator isn't spectating or isn't spectating an agent.
    (InAgent:agent).GetSpectatedAgent<native><public>()<reads><decides>:agent

    # Returns an `[]agent`s currently spectating `InAgent`.
    (InAgent:agent).GetSpectators<native><public>()<transacts>:[]agent

    # Respawns the character for `InAgent` at the provided `RespawnPosition` and applies the yaw of `RespawnRotation`.
    (InAgent:agent).Respawn<native><public>(RespawnPosition:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, RespawnRotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation)<transacts>:void

# Module import path: /Fortnite.com/Game
Game<public> := module:
    # Result data for `fort_character` elimination events.
    elimination_result<native><public> := struct<epic_internal>:
        # The `fort_character` eliminated from the match by `EliminatingCharacter`.
        EliminatedCharacter<native><public>:fort_character

        # `fort_character` that eliminated `EliminatedCharacter` from the match. `EliminatingCharacter` will be false when `EliminatedCharacter` was eliminated through non-character actions, such as environmental damage.
        EliminatingCharacter<native><public>:?fort_character

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
    # Returns the round manager from the simulation entity.
    (InEntity:entity).GetFortRoundManager<public>()<transacts><decides>:fort_round_manager = external {}

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

    @experimental
    # Returns an associated `fort_playspace` for this entity.  * Fails if this entity is not in the scene, and therefore not associated with a playspace.
    (InEntity:entity).GetPlayspaceForEntity<native><public>()<transacts><decides>:fort_playspace

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

        # Adds `InAgent` to `InTeam`.
        # Fails if `InTeam` is not part of the `fort_team_collection`.
        AddToTeam<public>(InAgent:agent, InTeam:team)<transacts><decides>:void

        # Succeeds if `InAgent` is on `InTeam`.
        # Fails if:
        #  * `InAgent` is not on `InTeam`.
        #  * `InTeam` is not part of the `fort_team_collection`.
        IsOnTeam<public>(InAgent:agent, InTeam:team)<transacts><decides>:void

        # Returns an array of all `agent`s on `InTeam`.
        # Fails if `InTeam` is not part of the `fort_team_collection`.
        GetAgents<public>(InTeam:team)<transacts><decides>:[]agent

        # Get the `team` that `InAgent` is on.
        # Fails if `InAgent` is not on a team in this `fort_team_collection`.
        GetTeam<public>(InAgent:agent)<transacts><decides>:team

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
