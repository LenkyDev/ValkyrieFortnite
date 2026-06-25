# Module import path: /Fortnite.com/Building
Building<public> := module:
    using {/Verse.org/SceneGraph}
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
    using {/Verse.org/SpatialMath}
    using {/Verse.org/SceneGraph}
    using {/UnrealEngine.com/Temporary/SpatialMath}
    using {/Verse.org/Simulation}
    using {/Fortnite.com/Game}
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

        # Signaled when this `fort_character` changes slide state.
        # Sends `tuple` payload:
        #  - 0: the `fort_character` that changed slide state.
        #  - 1: `true` if the character is sliding. `false` if the character stopped sliding.
        SlidEvent<epic_internal>():listenable(tuple(fort_character, logic))

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

        # Succeeds if this `fort_character` is in sliding locomotion state.
        IsSliding<epic_internal>()<transacts><decides>:void

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

        # Returns the entity associated with this `fort_character`. Use this when interacting with APIs that require an `entity` reference.
        GetEntity<public>()<transacts><decides>:entity

        # Epic internal - Signaled when this `fort_character` possesses a pawn.
        PossessedEvent<epic_internal>():listenable(fort_character)

        # Returns a ‘fort_character’s linear velocity in meters/second.
        GetLinearVelocity<public>()<reads>:(/Verse.org/SpatialMath:)vector3

        # Set a ‘fort_character’s linear velocity in meters/second. Will not do anything if physics is disabled.
        SetLinearVelocity<public>(LinearVelocity:(/Verse.org/SpatialMath:)vector3):void

        # Apply a linear impulse to a ‘fort_character’ with units in Newton*seconds. Will not do anything if physics is disabled.
        ApplyLinearImpulse<public>(LinearImpulse:(/Verse.org/SpatialMath:)vector3):void

        # Returns a ‘fort_character’s mass in kilograms.
        GetMass<public>()<reads>:float

        # Apply a force to a ‘fort_character’ with units in Newtons. Will not do anything if physics is disabled.
        ApplyForce<public>(Force:(/Verse.org/SpatialMath:)vector3):void

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

    # Puts the player in the skydiving movement mode.
    (Character:fort_character).BeginSkydiving<native><epic_internal>(FromBus:logic)<transacts>:void

    @hide_in_editor
    @experimental
    @deprecated
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

        IsSliding<override>()<transacts><decides>:void = external {}

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

        GetLinearVelocity<override>()<reads>:(/Verse.org/SpatialMath:)vector3 = external {}

        SetLinearVelocity<override>(LinearVelocity:(/Verse.org/SpatialMath:)vector3):void = external {}

        ApplyLinearImpulse<override>(LinearImpulse:(/Verse.org/SpatialMath:)vector3):void = external {}

        GetMass<override>()<reads>:float = external {}

        ApplyForce<override>(Force:(/Verse.org/SpatialMath:)vector3):void = external {}

        DamagedEvent<override>():listenable(damage_result) = external {}

        DamagedShieldEvent<override>():listenable(damage_result) = external {}

        DamagedOvershieldEvent<override>():listenable(damage_result) = external {}

        HealedEvent<override>():listenable(healing_result) = external {}

        HealedShieldEvent<override>():listenable(healing_result) = external {}

        HealedOvershieldEvent<override>():listenable(healing_result) = external {}

        CrouchedEvent<override>():listenable(tuple(fort_character, logic)) = external {}

        JumpedEvent<override>():listenable(fort_character) = external {}

        SprintedEvent<override>():listenable(tuple(fort_character, logic)) = external {}

        SlidEvent<override>():listenable(tuple(fort_character, logic)) = external {}

        EliminatedEvent<override>():listenable(elimination_result) = external {}

        DownButNotOutEvent<override>():listenable(tuple(fort_character, logic)) = external {}

        PossessedEvent<override>():listenable(fort_character) = external {}

        MarkedEvent<override>():listenable(tuple(fort_character, logic)) = external {}

# Module import path: /Fortnite.com/FortPlayerUtilities
FortPlayerUtilities<public> := module:
    using {/UnrealEngine.com/Temporary/SpatialMath}
    using {/Verse.org/Simulation}
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

    # Sends `InPlayer` back to the main game lobby with the specified reason.
    (InPlayer:player).SendToLobbyWithReason<native><epic_internal>(Reason:string)<transacts>:void

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

    # Returns the location where the agent was eliminated
    (InAgent:agent).GetEliminationLocation<native><epic_internal>()<transacts><decides>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3

# Module import path: /Fortnite.com/Game
Game<public> := module:
    using {/UnrealEngine.com/Temporary/Diagnostics}
    using {/Verse.org/SpatialMath}
    using {/UnrealEngine.com/Temporary/SpatialMath}
    using {/Verse.org/Simulation}
    using {/Verse.org/SceneGraph}
    using {/Fortnite.com/Characters}
    # Result data for `fort_character` elimination events.
    elimination_result<native><public> := struct<epic_internal>:
        # The `fort_character` eliminated from the match by `EliminatingCharacter`.
        EliminatedCharacter<native><public>:fort_character

        # `fort_character` that eliminated `EliminatedCharacter` from the match. `EliminatingCharacter` will be false when `EliminatedCharacter` was eliminated through non-character actions, such as environmental damage.
        EliminatingCharacter<native><public>:?fort_character

    @experimental
    fort_ability_component<native><epic_internal> := class<final_super>(component):
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

    # This interface is implemented by the round manager living on the simulation entity.
    fort_round_manager<native><public> := interface<epic_internal>:
        # Subscribed callbacks will be invoked in two scenarios:
        #  - When a new Fortnite round starts
        #  - If a round is ongoing, your callback will be invoked immediately
        # Upon the round ending, all callbacks will be canceled
        SubscribeRoundStarted<public>(Callback:type {_()<suspends>:void}):cancelable

        # Subscribed callbacks will be invoked when a Fortnite round ends
        SubscribeRoundEnded<public>(Callback:type {_():void}):cancelable

    fort_game_events_component<native><epic_internal> := class<final_super>(component, fort_round_manager):
        SetupGameEvent<native><epic_internal>:listenable(tuple()) = external {}

        RoundWarmupEvent<native><public>:listenable(tuple()) = external {}

        RoundStartEvent<native><public>:listenable(tuple()) = external {}

        RoundEndEvent<native><public>:listenable(tuple()) = external {}

        EndGameEvent<native><epic_internal>:listenable(tuple()) = external {}

        # Subscribed callbacks will be invoked in two scenarios:
        #  - When a new Fortnite round starts
        #  - If a round is ongoing, your callback will be invoked immediately
        #  Upon the round ending, all callbacks will be canceled
        SubscribeRoundStarted<override>(Callback:type {_()<suspends>:void}):cancelable = external {}

        # Subscribed callbacks will be invoked when a Fortnite round ends
        SubscribeRoundEnded<native><override>(Callback:type {_():void}):cancelable

    # Returns the fort game events component, if it exists.
    (InEntity:entity).GetFortGameEvents<epic_internal>()<transacts><decides>:fort_game_events_component = external {}

    # Returns the round manager from the simulation entity.
    (InEntity:entity).GetFortRoundManager<public>()<transacts><decides>:fort_round_manager = external {}

    # Implemented by objects to allow reading position information.
    positional<native><public> := interface<epic_internal>:
        # Returns the transform of the object.
        GetTransform<public>()<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)transform

        # Returns the transform of the object.
        GetGlobalTransform<public>()<transacts>:(/Verse.org/SpatialMath:)transform = external {}

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

        # `true` if the damage hit a weakpoint, `false` otherwise.
        IsWeakpointDamage<native><public>:logic = external {}

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
    using {/Verse.org/SceneGraph}
    using {/Fortnite.com/Teams}
    using {/Verse.org/Simulation}
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

    # Returns an associated `fort_playspace` for this entity.  * Fails if this entity is not in the scene, and therefore not associated with a playspace.
    (InEntity:entity).GetPlayspaceForEntity<native><public>()<transacts><decides>:fort_playspace

# Module import path: /Fortnite.com/FortSafeZone
FortSafeZone<public> := module:
    using {/Verse.org/Native}
    using {/UnrealEngine.com/Temporary/SpatialMath}
    fort_storm_safe_zone<native><epic_internal> := struct<epic_internal>:
        Center<native><public>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

        Radius<native><public>:float = external {}

    fort_storm_safe_zone_phase<native><epic_internal> := struct<epic_internal>:
        WaitTime<native><public>:float

        ShrinkTime<native><public>:float

    @import_as("/Script/VerseFortnite.UVerseFortniteSafeZoneWrapper")
    fort_safe_zone_wrapper_base<native><epic_internal> := class<abstract>:


    fort_safe_zone_wrapper<native><epic_internal> := class<epic_internal>(fort_safe_zone_wrapper_base):
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
    using {/Verse.org/SceneGraph}
    using {/Verse.org/Simulation/Tags}
    using {/Verse.org/Simulation}
    using {/Verse.org/Native}
    using {/Verse.org/AgentGroup}
    @available {MinUploadedAtFNVersion := 4000}
    @experimental
    fort_team_member_info<native><epic_internal> := class(member_info_interface):


    @available {MinUploadedAtFNVersion := 4000}
    @experimental
    # A fortnite instance of a team that is able to reference the current simulations member map
    fort_team<native><epic_internal> := class<unique>(team, agent_group_interface(fort_team_member_info)):
        # Get the underlying member map for this team
        GetMemberMap<override><native_callable>()<reads>:[agent]fort_team_member_info = external {}

        # Signalled whenever an agent successfully joins this agent group.Passes in the agent that joined along with their member_info.
        AddMemberEvent<override><final><native>:listenable(tuple(agent, fort_team_member_info)) = external {}

        # Signalled whenever an agent successfully leaves this agent group.Passes in the agent that left along with their member_info.
        RemoveMemberEvent<override><final><native>:listenable(tuple(agent, fort_team_member_info)) = external {}

        # Signalled whenever the MemberInfo class is re-instantiated for a given agent.Passes in the agent that was updated along with their new member_info.
        MemberInfoChangeEvent<override><final><native>:listenable(tuple(agent, fort_team_member_info)) = external {}

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
        AddToTeamEntity<native_callable><epic_internal>(InEntity:entity, InTeamTag:team_tag)<transacts><decides>:void

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
        IsOnTeamEntity<epic_internal>(InEntity:entity, InTeam:team)<transacts><decides>:void

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
        GetTeamEntity<epic_internal>(InEntity:entity)<transacts><decides>:team

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
        GetTeamAttitudeEntity<epic_internal>(Entity1:entity, Entity2:entity)<transacts><decides>:team_attitude

        @experimental
        # Returns the `team_attitude` between `Agent` and `Entity`.
        # Fails if:
        #  * `Agent` is not on a team in this `fort_team_collection`.
        #  * `Entity` is not on a team in this `fort_team_collection`.
        GetTeamAttitudeAgentEntity<epic_internal>(Agent:agent, Entity:entity)<transacts><decides>:team_attitude

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
    using {/Verse.org/SceneGraph}
    using {/UnrealEngine.com/Temporary/SpatialMath}
    using {/Verse.org/Simulation}
    using {/Fortnite.com/Game}
    using {/Fortnite.com/Characters}
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

        # Returns an array of every `fort_character` in the vehicle. Calls `GetOccupants()` and casts each occupying agent to a `fort_character`.
        GetPassengers<public>()<transacts>:[]fort_character = external {}

        # Returns an array with all `agent` currently occupying the vehicle.
        GetOccupants<public>()<reads>:[]agent

        # Returns an array with all the current drivers of the vehicle, which is usually a single agent.
        GetDrivers<public>()<reads>:[]agent

        # Returns the fuel state of the vehicle. If the vehicle uses fuel, this value will be between 0.0 and `GetFuelCapacity`. Otherwise, this value will be -1.0.
        GetFuelRemaining<public>()<transacts>:float

        # Returns the maximum fuel capacity of the vehicle. If the vehicle uses fuel, this value will be between 1.0 and Inf. Otherwise, this value will be -1.0.
        GetFuelCapacity<public>()<transacts>:float

        # Teleports the `fort_vehicle` to the specified `Position` and `Rotation`.
        TeleportTo<public>(Position:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, Rotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation)<transacts><decides>:void

        @experimental
        GetEntity<epic_internal>()<transacts><decides>:entity

        # The current speed of the vehicle in m/s.
        var<private> Speed<public>:float

        # The boost state of the vehicle. If the vehicle uses boost, this value will be between 0.0 and `BoostCapacity`. Otherwise, this value will be false.
        var<private> BoostRemaining<public>:?float

        # The maximum boost capacity of the vehicle. If the vehicle uses boost, this value will be between 1.0 and Inf. Otherwise, this value will be false.
        var<private> BoostCapacity<public>:?float

        # Removes the specified agent from the vehicle. Fails if the agent is not in the vehicle.
        RemoveAgent<public>(InAgent:agent)<transacts><decides>:void

        # Removes all occupying agents from the vehicle.
        RemoveAll<public>()<transacts>:void

        # Attempts to add the agent to the `fort_vehicle`. If there are no empty seats, or the agent cannot otherwise be placed in the vehicle, the operation fails.
        AddAgent<public>(InAgent:agent)<transacts><decides>:void

        # Returns an array of all `fort_vehicle_seat`s in the `fort_vehicle`.
        GetSeats<public>()<reads>:[]fort_vehicle_seat

    # Represents a seat in a `fort_vehicle`.
    fort_vehicle_seat<native><public> := class<unique><epic_internal>:
        # Succeeds if this is a driver seat.
        IsDriverSeat<native><public>()<reads><decides>:void

        # The `agent` currently occupying this seat, if any.
        var<private> Occupant<public>:?agent

        # Attempts to seat `Agent` into this seat. Fails if the seat is occupied or the agent cannot be seated. Setting the occupant to `false` will remove any seated agent.
        SetOccupant<native><public>(Value:?agent)<transacts><decides>:void

        # The `fort_vehicle` this seat belongs to.
        var<private> Vehicle<public>:fort_vehicle

    @hide_in_editor
    @experimental
    @deprecated
    fort_vehicle_component<native><epic_internal> := class<final_super>(component, fort_vehicle):
        @experimental
        FortVehicle<native><public>:fort_vehicle

        IsOnGround<override>()<transacts><decides>:void = external {}

        IsInAir<override>()<transacts><decides>:void = external {}

        IsInWater<override>()<transacts><decides>:void = external {}

        GetOccupants<override>()<reads>:[]agent = external {}

        GetDrivers<override>()<reads>:[]agent = external {}

        # Returns the fuel state of the vehicle. If the vehicle uses fuel, this value will be between 0.0 and `GetFuelCapacity`. Otherwise, this value will be -1.0.
        GetFuelRemaining<override>()<transacts>:float = external {}

        # Returns the maximum fuel capacity of the vehicle. If the vehicle uses fuel, this value will be between 1.0 and Inf. Otherwise, this value will be -1.0.
        GetFuelCapacity<override>()<transacts>:float = external {}

        # Teleports the vehicle to the specified `Position` and `Rotation`.
        TeleportTo<override>(Position:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, Rotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation)<transacts><decides>:void = external {}

        Damage<override>(Amount:float):void = external {}

        Damage<override>(Args:damage_args):void = external {}

        RemoveAgent<override>(InAgent:agent)<transacts><decides>:void = external {}

        RemoveAll<override>()<transacts>:void = external {}

        AddAgent<override>(InAgent:agent)<transacts><decides>:void = external {}

        GetSeats<override>()<reads>:[]fort_vehicle_seat = external {}

        GetHealth<override>()<transacts>:float = external {}

        SetHealth<override>(Health:float)<transacts>:void = external {}

        GetMaxHealth<override>()<transacts>:float = external {}

        SetMaxHealth<override>(MaxHealth:float)<transacts>:void = external {}

        GetTransform<override>()<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)transform = external {}

        GetEntity<override>()<transacts><decides>:entity = external {}

        DamagedEvent<override>():listenable(damage_result) = external {}