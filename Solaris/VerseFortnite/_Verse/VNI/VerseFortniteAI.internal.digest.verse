# Module import path: /Fortnite.com/AI
AI<public> := module:
    using {/Fortnite.com/Teams}
    using {/Fortnite.com/Playspaces}
    using {/Verse.org/Native}
    using {/Fortnite.com/Assets}
    using {/Fortnite.com/Characters}
    using {/Verse.org/SpatialMath}
    using {/UnrealEngine.com/Temporary/SpatialMath}
    using {/Verse.org/Simulation}
    using {/Verse.org/SceneGraph}
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

        # Look At specified location. Will never complete unless interrupted.
        MaintainFocus<epic_internal>(Location:(/Verse.org/SpatialMath:)vector3)<suspends>:void

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

        # Start jumping
        Jump<epic_internal>():ai_action_result

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

        # Start jumping
        Jump<native><override>():ai_action_result

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

        # Set custom leash position.
        #  'InnerRadius' ranges from 0.0 to 20000.0 (in centimeters).
        #  'OuterRadius' ranges from 0.0 to 20000.0 (in centimeters) and no less than 'InnerRadius'.
        SetLeashPosition<native><override>(Location:(/Verse.org/SpatialMath:)vector3, InnerRadius:float, OuterRadius:float):void

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
        # Equip the best weapon.
        EquipBestWeapon<epic_internal>():void

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
        MaintainFocus<native><override>(Location:(/Verse.org/SpatialMath:)vector3)<suspends>:void

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

        # Equip the best weapon.
        EquipBestWeapon<native><override>():void

        # Simulate the Use button.
        Use<native><epic_internal>(Duration:float)<suspends>:void

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
    MakeNavigationTarget<native><epic_internal>(Position:(/Verse.org/SpatialMath:)vector3):navigation_target

    # Generate a navigation_target from any position
    MakeNavigationTarget<public>(Position:(/UnrealEngine.com/Temporary/SpatialMath:)vector3):navigation_target = external {}

    # Generate a navigation_target from an agent
    MakeNavigationTarget<native><public>(Target:agent):navigation_target

    @experimental
    # Generate a navigation_target from an entity
    MakeNavigationTargetEntity<native><public>(Entity:entity):navigation_target

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

        # Returns the `fort_playspace` associated with this behavior.
        GetPlayspace<native><epic_internal>()<transacts><decides>:fort_playspace

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
        Location<native><public>:(/Verse.org/SpatialMath:)vector3

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

        # Apply the look and customizations of agent's currently equipped Sidekick to this Sidekick NPC.
        # This will fail if the NPC does not use the FortniteSidekick cosmetic look or if the given agent does not have a Sidekick equipped in their locker.
        ApplyEquippedSidekickCosmetic<native><epic_internal>(Agent:agent)<transacts><decides>:void

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
    using {/Verse.org/Simulation}
    using {/UnrealEngine.com/Temporary/SpatialMath}
    using {/Fortnite.com/Playspaces}
    using {/Verse.org/Assets}
    emote<native><epic_internal> := class<computes><final><epic_internal>(asset):


    character_cosmetic_definition<native><epic_internal> := class<computes><final><epic_internal>(asset):


    npc_character_definition<native><epic_internal> := class<computes><final><epic_internal>(asset):


    (InPlayspace:fort_playspace).SpawnCharacter<native><epic_internal>(CharacterDefinition:npc_character_definition, Transform:(/UnrealEngine.com/Temporary/SpatialMath:)transform)<suspends>:?agent

    (InPlayspace:fort_playspace).DespawnCharacter<native><epic_internal>(Agent:agent):void