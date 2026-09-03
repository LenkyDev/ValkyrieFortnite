# Verse path: /Fortnite.com
# Module import path: /Fortnite.com/AI
AI<public> := module:
    using {/Fortnite.com/Animation/PlayAnimation}
    using {/Fortnite.com/Teams}
    using {/Fortnite.com/Playspaces}
    using {/Fortnite.com/Assets}
    using {/Verse.org/Assets}
    using {/Fortnite.com/Characters}
    using {/Verse.org/SpatialMath}
    using {/UnrealEngine.com/Temporary/SpatialMath}
    using {/Verse.org/Simulation}
    using {/Verse.org/SceneGraph}
    using {/Verse.org/Native}
    # Result of an AI action
    ai_action_result<native><epic_internal> := enum<open>:
        # The action has been successfully executed
        Success
        # The action has failed during its execution
        Failure
        # The action has been canceled before completion
        Canceled
        # The action was not allowed to start
        Disallowed

    @available {MinUploadedAtFNVersion := 3900}
    # Result of a failed AI action
    ai_action_error_type<native><public> := enum<open>:
        # The action has failed during its execution.
        Failure
        # The action has been canceled before completion.
        Canceled
        # The action was not allowed to start.
        Disallowed

    @available {MinUploadedAtFNVersion := 3900}
    MakeAIActionSuccessResult<native_callable><epic_internal>(SuccessType:success_type where success_type:type):result(success_type, false) = external {}

    @available {MinUploadedAtFNVersion := 3950}
    MakeAIActionSuccessEmptyResult<native_callable><epic_internal>():result(comparable, false) = external {}

    @available {MinUploadedAtFNVersion := 3900}
    MakeAIActionErrorResult<native_callable><epic_internal>(ErrorType:error_type where error_type:type):result(false, error_type) = external {}

    @available {MinUploadedAtFNVersion := 3950}
    MakeAIActionErrorEmptyResult<native_callable><epic_internal>():result(false, comparable) = external {}

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

    focus_interface<public> := interface<epic_internal>:
        # Look At specified location. Will never complete unless interrupted.
        MaintainFocus<public>(Location:(/UnrealEngine.com/Temporary/SpatialMath:)vector3)<suspends>:void

        # Look At specified location. Will never complete unless interrupted.
        MaintainFocus<epic_internal>(Location:(/Verse.org/SpatialMath:)vector3)<suspends>:void

        # Look At specified Agent. Will never complete unless interrupted.
        MaintainFocus<public>(Agent:agent)<suspends>:void

    # Get the focus_interface interface for the specified character.
    (InCharacter:fort_character).GetFocusInterface<public>()<transacts><decides>:focus_interface = external {}

    fort_aisettings<native><epic_internal> := class<computes><final><epic_internal>(asset):


    # Fortnite AI Settings Component to replace AI Settings from the playlist
    fort_aisettings_component<native><epic_internal> := class<final_super>(component):
        OnAddedToSceneInternal<override><native>():void

    @available {MinUploadedAtFNVersion := 3900}
    # Fortnite Bots AI actions management
    fort_bot_actions_component<native><epic_internal> := class<epic_internal>(guard_actions_component):


    fort_leashable<public> := interface<epic_internal>:
        # Set custom leash position.
        #  'InnerRadius' ranges from 0.0 to 20000.0 (in centimeters).
        #  'OuterRadius' ranges from 0.0 to 20000.0 (in centimeters) and no less than 'InnerRadius'.
        SetLeashPosition<public>(Location:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, InnerRadius:float, OuterRadius:float):void

        # Set custom leash position.
        #  'InnerRadius' ranges from 0.0 to 20000.0 (in centimeters).
        #  'OuterRadius' ranges from 0.0 to 20000.0 (in centimeters) and no less than 'InnerRadius'.
        SetLeashPosition<epic_internal>(Location:(/Verse.org/SpatialMath:)vector3, InnerRadius:float, OuterRadius:float):void

        # Set the agent to be the new center of the leash.
        #  'InnerRadius' ranges from 0.0 to 20000.0 (in centimeters).
        #  'OuterRadius' ranges from 0.0 to 20000.0 (in centimeters) and no less than 'InnerRadius'.
        SetLeashAgent<public>(Agent:agent, InnerRadius:float, OuterRadius:float):void

        # Removes the current leash.
        ClearLeash<public>():void

    # Get the current fort_leashable interface for the specified character.
    (InCharacter:fort_character).GetFortLeashable<public>()<transacts><decides>:fort_leashable = external {}

    # NPC Component
    fort_npc_component<native><epic_internal> := class<final_super>(component, pawn_interop_interface):
        @editable
        # Path to AI spawner data to spawn the interop actor
        SpawnerData<native><epic_internal>:string = external {}

        @editable
        Logs<epic_internal>:logic = external {}

        HandlePawnLinked<override><native>(Info:pawn_linked_info):void

        OnBeginSimulation<override>():void = external {}

        OnEndSimulation<override><final>():void = external {}

    @available {MinUploadedAtFNVersion := 3900}
    # Fortnite Wildlife AI actions management
    fort_wildlife_actions_component<native><epic_internal> := class<epic_internal>(npc_actions_component):
        OnInitialized<native><override>():void

    @available {MinUploadedAtFNVersion := 3900}
    # Fortnite Guards AI actions management
    guard_actions_component<native><public> := class<final_super><epic_internal>(npc_actions_component):
        OnInitialized<native><override>():void

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

        # Trigger a slide.
        Slide<native><public>()<suspends>:result(void, ai_action_error_type)

        # Change movement speed to sprint and switch to tactical sprint when energy is full.
        TacticalSprint<native><epic_internal>()<suspends>:result(void, ai_action_error_type)

        # Play a random emote from the character emotes bank.
        PlayRandomEmote<native><public>()<suspends>:result(void, ai_action_error_type)

        # Play an emote.
        PlayEmote<native><epic_internal>(Emote:emote)<suspends>:result(void, ai_action_error_type)

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
    guard_awareness_component<native><public> := class<final_super><epic_internal>(npc_awareness_component):
        OnInitialized<native><override>():void

        OnUninitializing<native><override>():void

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
        IsActionInProgress<native><epic_internal>()<decides><reads>:void

        # Return if the associated action is currently allowed.
        IsActionAllowed<native><epic_internal>()<decides><reads>:void

        # Triggered when the associated action is started.
        ActionStartedEvent<native><epic_internal>:listenable(tuple()) = external {}

        # Triggered when the associated action end with its result.
        ActionEndedEvent<native><epic_internal>:listenable(ai_action_result) = external {}

        GetAgent<native><epic_internal>()<transacts><decides>:agent

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
        Sprinting

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
        OnInitialized<native><override>():void

        OnUninitializing<native><override>():void

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

        # Fires the currently equipped weapon.
        FireCurrentWeapon<native><epic_internal>()<suspends>:void

        # Try to reload the currently equipped weapon.
        ReloadCurrentWeapon<native><epic_internal>()<suspends>:logic

        # Add spare ammo for the currently equipped weapon.
        GiveAmmoForCurrentWeapon<native><epic_internal>(AmmoQuantity:int)<suspends>:void

        # Equip the best weapon.
        EquipBestWeapon<native><epic_internal>():void

        # Simulate the Use button.
        Use<native><epic_internal>(Duration:float)<suspends>:void

    @available {MinUploadedAtFNVersion := 3900}
    # Fortnite NPC perception management
    npc_awareness_component<native><public> := class<final_super><epic_internal>(component):
        OnInitialized<native><override>():void

        OnUninitializing<native><override>():void

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

        @deprecated {Message := "Use `GetEntity[].GetPlayspaceForEntity[]` instead."}
        # Returns the `fort_playspace` associated with this behavior.
        GetPlayspace<epic_internal>()<transacts><decides>:fort_playspace = external {}

    # Returns the `npc_behavior` for `InAgent`.
    (InAgent:agent).GetNPCBehavior<native><public>()<transacts><decides>:npc_behavior

    npc_behavior_component<native><epic_internal> := class<final_super>(component):
        OnInitialized<native><override>():void

        OnBeginSimulation<native><override>():void

        OnEndSimulation<native><override>():void

        @editable
        var<private> NPCBehavior<native><public>:npc_behavior

        SetNPCBehavior<native><public>(NewNPCBehavior:npc_behavior)<transacts>:void

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
        Attack
        HitReact
        Sleeping
        Eat

    @available {MinUploadedAtFNVersion := 3800}
    # Component to manage functionality shared by all Sidekick types.
    sidekick_component<native><public> := class<abstract><final_super><epic_internal>(component):
        # By default, Sidekicks will change their mood depending on actions in the game.
        # This value will lock the Sidekick into the mood passed in, overriding the automatic mood system.
        var MoodOverride<public>:?sidekick_mood = external {}

        # Get the Sidekick's current mood.
        GetMood<public>()<reads>:sidekick_mood

        # Signaled whenever the Sidekick's mood changes, either via the underlying mood system, or an override is applied. Returns the previous and new mood.
        ChangeMoodEvent<native><public>:listenable(tuple(sidekick_mood, sidekick_mood))

        # Request to play a given reaction on the Sidekick.
        # This reaction is not guaranteed to play immediately; instead, the StartPlayReactionEvent should be used to monitor this.
        # This will fail if the Sidekick cannot play the given reaction.
        PlayReaction<public>(Reaction:sidekick_reaction)<transacts><decides>:void

        # Signaled when the Sidekick starts to play a reaction, returns the reaction that started playing.
        StartPlayReactionEvent<native><public>:listenable(sidekick_reaction)

        # Signaled when the Sidekick ends playing a reaction, returns the reaction that played.
        StopPlayReactionEvent<native><public>:listenable(sidekick_reaction)

        # Enable or disable antics (idle personality animations) on the Sidekick. Enabled by default.
        var IdleAnticsEnabled<public>:logic = external {}

        GetIdleAnticsEnabled<native><epic_internal>(__dupe___unnamed_parameter_0:accessor)<transacts>:logic

        SetIdleAnticsEnabled<native><epic_internal>(__dupe___unnamed_parameter_0:accessor, NewIdleAnticsEnabled:logic)<transacts>:void

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

        # Apply the look and customizations of agent's currently equipped Sidekick to this Sidekick NPC.
        # This will fail if the NPC does not use the FortniteSidekick cosmetic look or if the given agent does not have a Sidekick equipped in their locker.
        ApplyEquippedSidekickCosmetic<native><public>(Agent:agent)<transacts><decides>:void

        # Apply a sidekick cosmetic.
        # Fails if the NPC does not use the FortniteSidekick cosmetic look or if NPC companion usage is not enabled for the given cosmetic.
        ApplySidekickCosmetic<native><epic_internal>(CosmeticDef:sidekick_cosmetic_definition)<transacts><decides>:void

        # Request to play a given reaction on the Sidekick and wait for it to complete.
        PlayReactionAndWait<native><epic_internal>(Reaction:sidekick_reaction, BlendInTime:float, BlendOutTime:float)<suspends>:logic

        # Play an animation on the Sidekick and wait for it to complete.
        PlayAnimAndWait<native><epic_internal>(AnimationSequence:animation_sequence, BlendInTime:float, BlendOutTime:float)<suspends>:play_animation_result

# Module import path: /Fortnite.com/Animation
Animation<public> := module:
    # Module import path: /Fortnite.com/Animation/PlayAnimation
    PlayAnimation<public> := module:
        using {/Verse.org/Simulation}
        using {/Verse.org/SceneGraph}
        using {/Fortnite.com/Characters}
        using {/Verse.org/Native}
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

        @import_as("/Script/VerseFortniteAI.UAIAnimationComponentData")
        fort_npc_play_animation_settings<native><epic_internal> := class:


        # Get the play_animation_controller for the specified character.
        (InCharacter:fort_character).GetPlayAnimationController<native><public>()<transacts><decides>:play_animation_controller

        fort_npc_play_animation_component<native><epic_internal> := class<final_super><epic_internal>(component, play_animation_controller):
            @editable
            PlayAnimationSettings<native><epic_internal>:fort_npc_play_animation_settings = external {}

            OnInitialized<native><override>():void

            OnUninitializing<native><override>():void

            PlayAndAwait<override>(AnimationSequence:animation_sequence, ?PlayRate:float = external {}, ?PlayCount:float = external {}, ?StartPositionSeconds:float = external {}, ?BlendInTime:float = external {}, ?BlendOutTime:float = external {})<suspends>:play_animation_result = external {}

            Play<override>(AnimationSequence:animation_sequence, ?PlayRate:float = external {}, ?PlayCount:float = external {}, ?StartPositionSeconds:float = external {}, ?BlendInTime:float = external {}, ?BlendOutTime:float = external {}):play_animation_instance = external {}

# Module import path: /Fortnite.com/Assets
(/Fortnite.com:)Assets<public> := module:
    using {/Verse.org/Simulation}
    using {/UnrealEngine.com/Temporary/SpatialMath}
    using {/Fortnite.com/Playspaces}
    using {/Verse.org/Assets}
    emote<native><epic_internal> := class<computes><final><epic_internal>(asset):


    character_cosmetic_definition<native><epic_internal> := class<computes><final><epic_internal>(asset):


    sidekick_cosmetic_definition<native><epic_internal> := class<computes><final><epic_internal>(asset):
        GetDisplayName<native><epic_internal>()<decides><reads>:message

    npc_character_definition<native><public> := class<computes><final><epic_internal>(asset):
        IsSame<native><epic_internal>(NPCCharacterDefinition:npc_character_definition)<decides><reads>:void

    (InPlayspace:fort_playspace).SpawnCharacter<native><epic_internal>(CharacterDefinition:npc_character_definition, Transform:(/UnrealEngine.com/Temporary/SpatialMath:)transform)<suspends>:?agent

    (InPlayspace:fort_playspace).DespawnCharacter<native><epic_internal>(Agent:agent):void