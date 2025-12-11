# Module import path: /Fortnite.com/AI
AI<public> := module:
    using {/Fortnite.com/Teams}
    using {/Verse.org/SpatialMath}
    using {/Verse.org/SceneGraph}
    using {/Fortnite.com/Characters}
    using {/Verse.org/Simulation}
    using {/UnrealEngine.com/Temporary/SpatialMath}
    using {/Verse.org/Native}
    @available {MinUploadedAtFNVersion := 3900}
    # Result of a failed AI action
    ai_action_error_type<native><public> := enum<open>:
        # The action has failed during its execution.
        Failure
        # The action has been canceled before completion.
        Canceled
        # The action was not allowed to start.
        Disallowed

    focus_interface<public> := interface<epic_internal>:
        # Look At specified location. Will never complete unless interrupted.
        MaintainFocus<public>(Location:(/UnrealEngine.com/Temporary/SpatialMath:)vector3)<suspends>:void

        # Look At specified Agent. Will never complete unless interrupted.
        MaintainFocus<public>(Agent:agent)<suspends>:void

    # Get the focus_interface interface for the specified character.
    (InCharacter:fort_character).GetFocusInterface<public>()<transacts><decides>:focus_interface = external {}

    fort_leashable<public> := interface<epic_internal>:
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
    (InCharacter:fort_character).GetFortLeashable<public>()<transacts><decides>:fort_leashable = external {}

    @available {MinUploadedAtFNVersion := 3900}
    # Fortnite Guards AI actions management
    guard_actions_component<native><public> := class<epic_internal>(npc_actions_component):
        # Roam around the current position. Use 'Tether' to specify the radius; otherwise, the Fortnite guard will roam anywhere.
        RoamAround<native><public>(?MovementType:movement_type = external {})<suspends>:result(void, ai_action_error_type)

        # Move in range to attack the current target.
        MoveInRangeToAttack<native><public>()<suspends>:result(void, ai_action_error_type)

        # Change stance to crouch. Will never complete unless interrupted.
        Crouch<native><public>()<suspends>:result(void, ai_action_error_type)

        # Go back to standing.
        StandUp<native><public>()<suspends>:result(void, ai_action_error_type)

        # Trigger a jump.
        Jump<native><public>()<suspends>:result(void, ai_action_error_type)

        # Play a random emote from the character emotes bank.
        PlayRandomEmote<native><public>()<suspends>:result(void, ai_action_error_type)

        # Revive the specified target.
        Revive<native><public>(Target:entity)<suspends>:result(void, ai_action_error_type)

        # Attack the target. The target must have been detected.
        Attack<native><public>(Target:entity)<suspends>:result(void, ai_action_error_type)

        # Tether the NPC to a position.
        #  'Radius' is in centimeters.
        Tether<native><public>(Location:(/Verse.org/SpatialMath:)vector3, Radius:float):void

        # Tether the NPC to an entity.
        #  'Radius' is in centimeters.
        Tether<native><public>(Target:entity, Radius:float):void

        # Untether the NPC.
        Untether<native><public>():void

    @available {MinUploadedAtFNVersion := 3900}
    # Fortnite Guard perception management
    guard_awareness_component<native><public> := class<epic_internal>(npc_awareness_component):
        # Potentially detected obstacle.
        var<private> DetectedObstacle<native><public>:?entity = external {}

        # Event when a new obstacle is detected.
        DetectObstacleEvent<native><public>:listenable(entity) = external {}

        # Event when the current obstacle was forgotten.
        ForgetObstacleEvent<native><public>:listenable(entity) = external {}

        # Information about the primary threat.
        var<private> PrimaryThreat<native><public>:?npc_target_info = external {}

        # Event when the primary threat has changed.
        PrimaryThreatChangeEvent<native><public>:listenable(npc_target_info) = external {}

        # Current alert level.
        var<private> AlertLevel<native><public>:guard_alert_level = external {}

        # Event when the alert level has changed.
        AlertLevelChangeEvent<native><public>:listenable(guard_alert_level) = external {}

        # Get the current alert level for a specific target.
        GetAlertLevel<native><public>(Target:entity)<reads>:guard_alert_level

    navigation_target<native><public> := class<epic_internal>:


    # Generate a navigation_target from any position.
    MakeNavigationTarget<native><public>(Position:(/Verse.org/SpatialMath:)vector3):navigation_target

    # Generate a navigation_target from any position.
    MakeNavigationTarget<public>(Position:(/UnrealEngine.com/Temporary/SpatialMath:)vector3):navigation_target = external {}

    # Generate a navigation_target from an agent.
    MakeNavigationTarget<native><public>(Agent:agent):navigation_target

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

    @available {MinUploadedAtFNVersion := 3900}
    navigation_action_error_type<native><public> := enum<open>:
        # The navigation request is invalid.
        Invalid
        # Navigation has been interrupted before completion.
        Interrupted
        # The navigating agent is blocked.
        Blocked
        # The destination cannot be reached.
        Unreachable

    @available {MinUploadedAtFNVersion := 3900}
    navigation_action_success_type<native><public> := enum<open>:
        # The destination has been reached.
        Reached
        # The destination was partially reached (the destination is currently not reachable).
        PartiallyReached

    movement_type<native><public> := enum<open>:
        (/Fortnite.com/AI/movement_type:)Walking
        (/Fortnite.com/AI/movement_type:)Running

    # Module import path: /Fortnite.com/AI/movement_types
    movement_types<public> := module:
        Walking<public>:movement_type = external {}

        Running<public>:movement_type = external {}

    navigatable<public> := interface<epic_internal>:
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
    (InCharacter:fort_character).GetNavigatable<public>()<transacts><decides>:navigatable = external {}

    @available {MinUploadedAtFNVersion := 3900}
    # Fortnite NPC AI actions management
    npc_actions_component<native><public> := class<final_super><epic_internal>(component):
        # Return the current destination of the character.
        GetCurrentDestination<native><public>()<transacts><decides>:(/Verse.org/SpatialMath:)vector3

        # Navigate toward the specified navigation target.
        NavigateTo<native><public>(Target:navigation_target, ?MovementType:movement_type = external {}, ?ReachRadius:float = external {}, ?AllowPartialPath:logic = external {})<suspends>:result(navigation_action_success_type, navigation_action_error_type)

        # Multiplier on the movement speed (value is clamped between 0.5 and 2).
        var MovementSpeedMultiplier<public>:float = external {}

        # Stop navigation.
        StopNavigation<native><public>():void

        # Stay idle for a specific duration.
        Idle<native><public>(?Duration:float = external {})<suspends>:void

        # Look at the specified location. If LockFocus is false, the action stops once the NPC is facing the position.
        Focus<native><public>(Location:(/Verse.org/SpatialMath:)vector3, ?LockFocus:logic = external {})<suspends>:void

        # Look at the specified Entity. If LockFocus is false, the action stops once the NPC is facing the entity.
        Focus<native><public>(Target:entity, ?LockFocus:logic = external {})<suspends>:void

    @available {MinUploadedAtFNVersion := 3900}
    # Fortnite NPC perception management
    npc_awareness_component<native><public> := class<final_super><epic_internal>(component):
        # Information about all detected targets.
        var<private> DetectedTargets<native><public>:[]npc_target_info = external {}

        # Event when a target was detected.
        DetectTargetEvent<native><public>:listenable(npc_target_info) = external {}

        # Event when a target was forgotten.
        ForgetTargetEvent<native><public>:listenable(entity) = external {}

        # Event when a target is seen. Sight sense must be active.
        SeeTargetEvent<native><public>:listenable(npc_target_info) = external {}

        # Event when a target is heard. Hearing sense must be active.
        HearTargetEvent<native><public>:listenable(npc_target_info) = external {}

        # Event when a target is touched. Touch sense must be active.
        TouchTargetEvent<native><public>:listenable(npc_target_info) = external {}

    # Inherit from this to create a custom NPC behavior.
    # The npc_behavior can be defined for a character in a CharacterDefinition asset, or in a npc_spawner_device.
    npc_behavior<native><public> := class<abstract>:
        # This function is called when the NPC is added to the simulation.
        OnBegin<native_callable><public>()<suspends>:void = external {}

        # This function is called when the NPC is removed from the simulation.
        OnEnd<native_callable><public>():void = external {}

        # Returns the agent associated with this behavior.
        GetAgent<native><public>()<transacts><decides>:agent

        # Returns the entity associated with this behavior.
        GetEntity<native><public>()<transacts><decides>:entity

    # Returns the `npc_behavior` for `InAgent`.
    (InAgent:agent).GetNPCBehavior<native><public>()<transacts><decides>:npc_behavior

    @available {MinUploadedAtFNVersion := 3900}
    # The different alert levels of a Fortnite Guard.
    guard_alert_level<native><public> := enum:
        # The guard has not detected any hostile target.
        Unaware
        # The guard has seen a hostile target but hasn't identified it yet.
        Suspicious
        # The guard has identified a hostile target but can't see it any more.
        LostTarget
        # The guard has identified a hostile target.
        Alerted

    @available {MinUploadedAtFNVersion := 3900}
    # Information about a perceived target.
    npc_target_info<native><public> := class<epic_internal>:
        # The entity that was detected.
        Target<native><public>:entity

        # True if the target can be seen.
        var<private> HasLineOfSight<native><public>:logic

        # Attitude toward this target.
        var<private> Attitude<native><public>:team_attitude

        # Last known position of this target.
        var<private> LastKnownPosition<public>:(/Verse.org/SpatialMath:)vector3 = external {}

        OnUpdateEvent<native><public>:listenable(tuple()) = external {}

    @available {MinUploadedAtFNVersion := 3800}
    # Sidekicks have a mood that modifies their animations to suit that mood.
    # This is the list of currently supported moods.
    sidekick_mood<native><public> := enum<open>:
        Neutral
        Combat
        Worried
        Bored

    @available {MinUploadedAtFNVersion := 3800}
    # The set of available reactions that can be played on the Sidekick
    sidekick_reaction<native><public> := enum<open>:
        Happy
        Dance
        Emote
        Angry
        Worried

    @available {MinUploadedAtFNVersion := 3800}
    # Component to manage functionality shared by all Sidekick types.
    sidekick_component<native><public> := class<abstract><final_super><epic_internal>(component):
        # By default, Sidekicks will change their mood depending on actions in the game.
        # This value will lock the Sidekick into the mood passed in, overriding the automatic mood system.
        var MoodOverride<public>:?sidekick_mood = external {}

        # Get the Sidekick's current mood.
        GetMood<public>()<reads>:sidekick_mood

        # Signaled whenever the Sidekick's mood changes, either via the underlying mood system, or an override is applied. Returns the previous and new mood.
        ChangeMoodEvent<public>:listenable(tuple(sidekick_mood, sidekick_mood))

        # Request to play a given reaction on the Sidekick.
        # This reaction is not guaranteed to play immediately; instead, the StartPlayReactionEvent should be used to monitor this.
        # This will fail if the Sidekick cannot play the given reaction.
        PlayReaction<public>(Reaction:sidekick_reaction)<transacts><decides>:void

        # Signaled when the Sidekick starts to play a reaction, returns the reaction that started playing.
        StartPlayReactionEvent<public>:listenable(sidekick_reaction)

        # Signaled when the Sidekick ends playing a reaction, returns the reaction that played.
        StopPlayReactionEvent<public>:listenable(sidekick_reaction)

    @available {MinUploadedAtFNVersion := 3800}
    # Component to manage functionality specifically for an NPC Sidekick.
    npc_sidekick_component<native><public> := class<final_super><epic_internal>(sidekick_component):
        # By default, Sidekicks will change their mood depending on actions in the game.
        # This value will lock the Sidekick into the mood passed in, overriding the automatic mood system.
        var MoodOverride<override>:?sidekick_mood = external {}

        # Get the Sidekick's current mood.
        GetMood<override><native>()<reads>:sidekick_mood

        # Signaled whenever the Sidekick's mood changes, either via the underlying mood system, or an override is applied. Returns the previous and new mood.
        ChangeMoodEvent<override><native>:listenable(tuple(sidekick_mood, sidekick_mood)) = external {}

        # Request to play a given reaction on the Sidekick.
        # This reaction is not guaranteed to play immediately; instead, the StartPlayReactionEvent should be used to monitor this.
        # This will fail if the Sidekick cannot play the given reaction.
        PlayReaction<override><native>(Reaction:sidekick_reaction)<transacts><decides>:void

        # Signaled when the Sidekick starts to play a reaction, returns the reaction that started playing.
        StartPlayReactionEvent<override><native>:listenable(sidekick_reaction) = external {}

        # Signaled when the Sidekick ends playing a reaction, returns the reaction that played.
        StopPlayReactionEvent<override><native>:listenable(sidekick_reaction) = external {}

# Module import path: /Fortnite.com/Animation
Animation<public> := module:
    # Module import path: /Fortnite.com/Animation/PlayAnimation
    PlayAnimation<public> := module:
        using {/Fortnite.com/Characters}
        using {/Verse.org/Assets}
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
