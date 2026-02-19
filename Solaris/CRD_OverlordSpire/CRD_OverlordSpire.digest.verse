using {/Verse.org/Simulation}
# A boss-like environmental encounter that will attack players with different abilities
overlord_spire_device<public> := class<concrete><final>(creative_device_base, has_spire_functionality):
    # Enable the device, causing the Spire to become activated when players are within the `Activation Distance`.
    #  * Does nothing if the Spire is destroyed or already enabled.
    Enable<override>():void = external {}

    # Disable the device which causes the Spire to become deactivated, stopping the behaviors and attacks, as well as preventing activation when players are within the `Activation Distance`. 
    #  * Does nothing if the Spire is destroyed or already disabled.
    Disable<override>():void = external {}

    # Succeeds if the device is enabled. Fails if the Spire is disabled. While disabled, the Spire is deactivated and will not react to approaching players, nor take damage.
    IsEnabled<override>()<transacts><decides>:void = external {}

    # Determines the distance where approaching players activate the Spire.
    #  * Values are clamped between `500.0` and `10000.0` cm
    var ActivationDistance<override>:float = external {}

    # If this Spire is currently activated.
    #  * Succeeds if activated. Fails if deactivated 
    #  * An activated will react to enemies and take damage * Becomes activated from being enabled and players entering the `Activation Distance`
    IsActivated<override>()<transacts><decides>:void = external {}

    # Triggers when the Spire becomes activated from players entering the `Activation Distance`
    ActivateEvent<override>:listenable(?agent) = external {}

    # Triggers when the Spire becomes deactivated, either from players leaving the `Activation Distance`
    DeactivateEvent<override>:listenable(tuple()) = external {}

    # Spawns the Spire, causing it to become visible and enabling collision 
    #  *  Does nothing if the Spire is already spawned or destroyed
    Spawn<override>():void = external {}

    # Succeeds if this Spire is in a spawned state. Fails if the Spire is destroyed or has not spawned.
    IsSpawned<override>()<transacts><decides>:void = external {}

    # Sets the Spire's health to zero, destroying it. 
    #  *  Does nothing if the Spire has not spawned or is already destroyed.
    Destroy<override>():void = external {}

    # Succeeds if this Spire's health has reached 0. Fails otherwise
    IsDestroyed<override>()<transacts><decides>:void = external {}

    # Triggers when the Spire is destroyed from damage or events 
    #  * Includes the `agent` that destroyed it, if any.
    DestroyEvent<override>:listenable(?agent) = external {}

    # Resets the Spire to its initial state.
    (/Fortnite.com/Devices/has_spire_functionality:)Reset<override>():void = external {}

    # The maximum health of this Spire.
    var MaxHealth<override>:float = external {}

    # The Spire's current health. Clamped between 0 and `MaxHealth`. 
    #  * Setting this value does nothing if the Spire is destroyed.
    var Health<override>:float = external {}

    # Determines if a Spire-specific icon should be displayed on the map while the Spire is spawned
    var ShowMapIcon<override>:logic = external {}

    # Triggers when the Spire is spawned, either from players entering the `Activation Distance` or by events.
    SpawnEvent<public>:listenable(tuple()) = external {}

    # Determines the minimum amount of time that the Spire must wait to use another ability after previously using one 
    #  * The actual time to wait after each ability is chosen at random between this value and MaximumTimeBetweenAbilities 
    #  * This is effectively a global cooldown across all abilities. 
    #  * Values are clamped between `0.0` and `60.0` seconds
    var MinimumTimeBetweenAbilities<public>:float = external {}

    # Determines the maximum amount of time that the Spire must wait to use another ability after previously using one 
    #  * The actual time to wait after each ability is chosen at random between this value and MinimumTimeBetweenAbilities 
    #  * This is effectively a global cooldown across all abilities. 
    #  * Values are clamped between `0.0` and `60.0` seconds
    var MaximumTimeBetweenAbilities<public>:float = external {}

    # Determines if the Spire is able to use the beam attack. Setting this to false will not interrupt the attack if it is currently in progress.
    var IsBeamAttackEnabled<public>:logic = external {}

    # Determines the amount of time that the Spire must wait to use the beam attack after previously using it
    #  * Values are clamped between `0.0` and `60.0` seconds
    var BeamCooldownTime<public>:float = external {}

    # Determines how long the Spire takes to complete the beam attack
    #  * Values are clamped between `1.0` and `60.0` seconds
    var BeamDuration<public>:float = external {}

    # Determines the distance/angle that the beam will travel 
    #  * Values are clamped between `0.0` and `360.0` degrees
    var BeamArc<public>:float = external {}

    # Determines how much total damage the beam attack does per second to players.
    #  * Values are clamped between `0.0` and `1000.0`
    #  * A portion of the damage is applied multiple times per second while a target is within the beam.
    var BeamDamagePerSecondToPlayers<public>:float = external {}

    # Determines how much total damage the beam attack does per second to vehicles.
    #  * Values are clamped between `0.0` and `1000.0`
    #  * A portion of the damage is applied multiple times per second while a target is within the beam.
    var BeamDamagePerSecondToVehicles<public>:float = external {}

    # Determines how much total damage the beam attack does per second to buildings.
    #  * Values are clamped between `0.0` and `1000.0`
    #  * A portion of the damage is applied multiple times per second while a target is within the beam.
    var BeamDamagePerSecondToBuildings<public>:float = external {}

    # Determines how much total damage the beam attack does per second to wildlife.
    #  * Values are clamped between `0.0` and `1000.0`
    #  * A portion of the damage is applied multiple times per second while a target is within the beam.
    var BeamDamagePerSecondToWildlife<public>:float = external {}

    # Determines how much total damage the beam attack does per second to creatures.
    #  * Values are clamped between `0.0` and `1000.0`
    #  * A portion of the damage is applied multiple times per second while a target is within the beam.
    var BeamDamagePerSecondToCreatures<public>:float = external {}

    # Determines how much total damage the beam attack does per second to guards.
    #  * Values are clamped between `0.0` and `1000.0`
    #  * A portion of the damage is applied multiple times per second while a target is within the beam.
    var BeamDamagePerSecondToGuards<public>:float = external {}

    # Triggers when the Spire begins charging up its beam attack
    BeginBeamEvent<public>:listenable(tuple()) = external {}

    # Triggers when the Spire finishes shooting its beam attack
    EndBeamEvent<public>:listenable(tuple()) = external {}

    # Determines if the Spire is able to use the homing projectile attack. Setting this to false will not interrupt the attack if it is currently in progress.
    var IsHomingProjectileAttackEnabled<public>:logic = external {}

    # Determines the number of homing projectiles that can be fired per attack.
    #  * Values are clamped between `1` and `20` projectiles
    var NumberOfHomingProjectiles<public>:int = external {}

    # Determines the maximum speed that homing projectiles can accelerate to.
    #  * Values are clamped between `100.0` and `5000.0` meters per second
    var HomingProjectileMaxSpeed<public>:float = external {}

    # Determines the amount of time that the Spire must wait to use the homing projectile attack after previously using it
    #  * Values are clamped between `0.0` and `60.0` seconds
    var HomingProjectileCooldownTime<public>:float = external {}

    # Determines how much total damage the homing projectile attack does to players.
    #  * Values are clamped between `0.0` and `10000.0`
    var HomingProjectileDamageToPlayers<public>:float = external {}

    # Determines how much total damage the homing projectile attack does to vehicles.
    #  * Values are clamped between `0.0` and `10000.0`
    var HomingProjectileDamageToVehicles<public>:float = external {}

    # Determines how much total damage the homing projectile attack does to buildings.
    #  * Values are clamped between `0.0` and `10000.0`
    var HomingProjectileDamageToBuildings<public>:float = external {}

    # Determines how much total damage the homing projectile attack does to wildlife.
    #  * Values are clamped between `0.0` and `10000.0`
    var HomingProjectileDamageWildlife<public>:float = external {}

    # Determines how much total damage the homing projectile attack does to creatures.
    #  * Values are clamped between `0.0` and `10000.0`
    var HomingProjectileDamageCreatures<public>:float = external {}

    # Determines how much total damage the homing projectile attack does to guards.
    #  * Values are clamped between `0.0` and `10000.0`
    var HomingProjectileDamageToGuards<public>:float = external {}

    # Triggers when the Spire starts spawning homing projectiles to fire
    BeginHomingProjectileEvent<public>:listenable(tuple()) = external {}

    # Triggers when the last homing projectile has exploded
    EndHomingProjectileEvent<public>:listenable(tuple()) = external {}

    # Determines if the Spire is able to use the slam attack. Setting this to false will not interrupt the attack if it is currently in progress.
    var IsSlamAttackEnabled<public>:logic = external {}

    # Determines the amount of time the Spire must wait to use the slam attack after previously using it
    #  * Values are clamped between `0.0` and `60.0` seconds
    var SlamCooldownTime<public>:float = external {}

    # Determines the radius that the slam attack initially affects before the shockwave spreads.
    #  * Values are clamped between `100.0` and `1000.0` meters
    var SlamInitialRadius<public>:float = external {}

    # Determines the maximum radius that the slam attack's shockwave can spread
    #  * Values are clamped between `100.0` and `5000.0` meters
    var SlamShockwaveMaxRadius<public>:float = external {}

    # Determines the time it takes for the slam attack's shockwave to reach the maximum radius.
    #  * Values are clamped between `1.0` and `30.0` seconds
    var SlamShockwaveDuration<public>:float = external {}

    # Determines the amount of time it takes for the Spire to recover from the slam attack.
    #  * Values are clamped between `0.0` and `60.0` seconds
    #  * The higher the value, the longer the weakpoint is exposed.
    var SlamRecoveryTime<public>:float = external {}

    # Determines how much total damage the slam attack does to players.
    #  * Values are clamped between `0.0` and `10000.0`
    var SlamAttackDamageToPlayers<public>:float = external {}

    # Determines how much total damage the slam attack does to vehicles.
    #  * Values are clamped between `0.0` and `10000.0`
    var SlamAttackDamageToVehicles<public>:float = external {}

    # Determines how much total damage the slam attack does to buildings.
    #  * Values are clamped between `0.0` and `10000.0`
    var SlamAttackDamageToBuildings<public>:float = external {}

    # Determines how much total damage the slam attack does to wildlife.
    #  * Values are clamped between `0.0` and `10000.0`
    var SlamAttackDamageWildlife<public>:float = external {}

    # Determines how much total damage the slam attack does to creatures.
    #  * Values are clamped between `0.0` and `10000.0`
    var SlamAttackDamageCreatures<public>:float = external {}

    # Determines how much total damage the slam attack does to guards.
    #  * Values are clamped between `0.0` and `10000.0`
    var SlamAttackDamageToGuards<public>:float = external {}

    # Triggers when the Spire begins its slam attack
    BeginSlamEvent<public>:listenable(tuple()) = external {}

    # Triggers when the Spire has finished recovering from the slam attack
    EndSlamEvent<public>:listenable(tuple()) = external {}

    # Triggers when the Spire begins trying to recover from the slam attack, when the appendage weakpoint is stuck in the ground.
    BeginSlamRecoverEvent<public>:listenable(tuple()) = external {}

    # Triggers when the Spire finishes recovering from the slam attack and the appendage weakpoint is no longer stuck in the ground.
    EndSlamRecoverEvent<public>:listenable(tuple()) = external {}

    # Determines if the Spire is able to perform the scream attack. 
    #  * The scream is an ability used when the spire drops below a health threshold. It performs an animation and events can be hooked up to it for things like spawning a wave of Guards to fight for it. 
    #  * Setting this to false will not interrupt the ability if it is currently in progress.
    var IsScreamAttackEnabled<public>:logic = external {}

    # Triggers when the Spire begins to perform the scream.
    BeginScreamEvent<public>:listenable(tuple()) = external {}

    # Triggers when the Spire has finished performing the scream
    EndScreamEvent<public>:listenable(tuple()) = external {}

    # Sets the main target of the Spire, causing the Spire to focus attacks on the 'TargetAgent' while they are within the `Activation Distance`. 
    #  * `TargetAgent` is an invalid `agent`, this function will clear the target.
    SetTarget<public>(TargetAgent:?agent):void = external {}

    # Removes the target set from `SetTarget` and allows the Spire to return to its normal targeting pattern
    ClearTarget<public>():void = external {}

    # Triggers when the Spire’s player target is changed to a different player
    TargetChangeEvent<public>:listenable(agent) = external {}

    # Succeeds if the Spire must wait until all projectiles have spawned before moving on to the next attack 
    #  * Fails if the Spire will move on to the next attack when it finishes the spawning animation. 
    #  * This setting is useful to make the encounter more challenging by allowing the Spire to shoot a large number of homing projectiles and to move on to another attack while they are still spawning
    var WaitForAllProjectilesToSpawnBeforeNextAttack<public>:logic = external {}

    # Fades in the preview clouds above where the Spire spawns.
    ShowClouds<public>():void = external {}

    # Fades out the preview clouds above where the Spire spawns.
    HideClouds<public>():void = external {}