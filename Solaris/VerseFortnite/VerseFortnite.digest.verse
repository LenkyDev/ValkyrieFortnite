using {/Fortnite.com/Game}
using {/Verse.org/Assets}
using {/Fortnite.com/Teams}
using {/UnrealEngine.com/Temporary/SceneGraph}
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
    fort_guard_actions<native><public> := interface<epic_internal>(fort_npc_actions):
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
        GetCurrentTargetInfo<public>()<computes><decides><reads>:fort_target_info

        @experimental
        # Get the current alert level of the guard.
        GetAlertLevel<public>()<computes><reads>:fort_guard_alert_level

        @experimental
        # Get the current alert level of a target for the guard.
        GetAlertLevel<public>(Target:entity)<computes><decides><reads>:fort_guard_alert_level

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
        GetLastKnownPosition<public>(Target:entity)<computes><decides><reads>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3

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
    (InNPCBehavior:npc_behavior).GetEntity<native><public>()<computes><decides><reads>:entity

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


# Module import path: /Fortnite.com/Building
Building<public> := module:


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

# Module import path: /Fortnite.com/FortSafeZone
FortSafeZone<public> := module:


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