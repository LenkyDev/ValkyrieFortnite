using {/Verse.org/Assets}
using {/Fortnite.com/Teams}
using {/Verse.org/SceneGraph}
using {/Fortnite.com/Characters}
using {/Verse.org/Simulation}
using {/UnrealEngine.com/Temporary/SpatialMath}
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
    MakeNavigationTarget<native><public>(Entity:entity):navigation_target

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

# Module import path: /Fortnite.com/Assets
(/Fortnite.com:)Assets<public> := module:
