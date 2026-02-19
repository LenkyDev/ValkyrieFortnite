using {/Verse.org/Simulation}
# A boss-like environmental encounter that will attack players with different abilities
scout_spire_device<public> := class<concrete><final>(creative_device_base, has_spire_functionality):
    # Enable the device, causing the Spire to become activated when players are within the `Activation Distance`.
    #  * Does nothing if the Spire is destroyed or already enabled.
    Enable<override>():void = external {}

    # Disable the device which causes the Spire to become deactivated, stopping the behaviors and attacks, as well as preventing activation when players are within the `Activation Distance`. 
    #  * Does nothing if the Spire is destroyed or already disabled.
    Disable<override>():void = external {}

    # Succeeds if the Spire is enabled and fails if it is disabled.
    #  * While disabled, the Spire is inactive: it will not react to players or take damage. 
    #  * If the Spire is currently despawned, this function instead reports the enabled state the Spire will have the next time it is spawned.
    IsEnabled<override>()<transacts><decides>:void = external {}

    # Determines the distance where approaching players activate the Spire.
    #  * Values are clamped between `500.0` and `10000.0` cm
    var ActivationDistance<override>:float = external {}

    # If this Spire is currently activated.
    #  * Succeeds if activated. Fails if deactivated 
    #  * An activated Spire will react to enemies and take damage * Becomes activated from being enabled and players entering the `Activation Distance`
    IsActivated<override>()<transacts><decides>:void = external {}

    # Triggers when the Spire becomes activated from players entering the `Activation Distance`
    ActivateEvent<override>:listenable(?agent) = external {}

    # Triggers when the Spire becomes deactivated, either from players leaving the `Activation Distance`
    DeactivateEvent<override>:listenable(tuple()) = external {}

    # Spawns the Spire, causing it to become visible and enabling collision 
    #  *  Does nothing if the Spire is already spawned or destroyed.
    Spawn<override>():void = external {}

    # Succeeds if this Spire is in a spawned state. Fails if the Spire is destroyed or has not spawned.
    IsSpawned<override>()<transacts><decides>:void = external {}

    # Sets the Spire's health to zero, destroying it. 
    #  *  Does nothing if the Spire has not spawned or is already destroyed.
    Destroy<override>():void = external {}

    # Succeeds if this Spire's health has reached 0. Fails otherwise.
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

    # Determines if a Spire-specific icon should be displayed on the map while the Spire is spawned.
    var ShowMapIcon<override>:logic = external {}

    # Hides the spire immediately without playing any vfx 
    #  * Does nothing if the Spire is already destroyed or despawned.
    Despawn<public>():void = external {}

    # If the invulnerable shield for this Spire is active. While active, the Spire cannot take damage. 
    #  * Setting this value does nothing if the Spire is destroyed.
    var IsShieldActive<public>:logic = external {}

    # Determines how much total damage the laser attack does to players. 
    #  * Values are clamped between `0.0` and `10000.0`
    var LaserAttackDamageToPlayers<public>:float = external {}

    # Determines how much total damage the laser attack does to vehicles. 
    #  * Values are clamped between `0.0` and `10000.0`
    var LaserAttackDamageToVehicles<public>:float = external {}

    # Determines how much total damage the laser attack does to buildings. 
    #  * Values are clamped between `0.0` and `10000.0`
    var LaserAttackDamageToBuildings<public>:float = external {}

    # Determines how much total damage the laser attack does to wildlife. 
    #  * Values are clamped between `0.0` and `10000.0`
    var LaserAttackDamageToWildlife<public>:float = external {}

    # Determines how much total damage the laser attack does to creatures. 
    #  * Values are clamped between `0.0` and `10000.0`
    var LaserAttackDamageToCreatures<public>:float = external {}

    # Determines how much total damage the laser attack does to guards. 
    #  * Values are clamped between `0.0` and `10000.0`
    var LaserAttackDamageToGuards<public>:float = external {}

    # Determines the time it takes for the Spire to charge up its laser attack. 
    #  * Values are clamped between `0.5` and `60.0`
    var LaserChargeTime<public>:float = external {}

    # Determines the amount of time that the Spire must wait to use the laser attack after previously using it. 
    #  * Values are clamped between `0.5` and `60.0`
    var LaserCooldownTime<public>:float = external {}

    # Determines the multiplicative horizontal force of the impulse applied to targets of the laser attack based on distance. 
    #  * Values are clamped between `0.0` and `10000.0`
    var LaserHorizontalImpulseForce<public>:float = external {}

    # Determines the multiplicative vertical force of the impulse applied to targets of the laser attack based on distance. 
    #  * Values are clamped between `0.0` and `10000.0`
    var LaserVerticalImpulseForce<public>:float = external {}

    # Determines the additive vertical force of the impulse applied to targets of the laser attack. 
    #  * Values are clamped between `0.0` and `10000.0`
    var LaserAdditionalVerticalImpulseForce<public>:float = external {}

    # Determines the number of targets the Spire can shoot lasers at per charged attack. 
    #  * Values are clamped between `1` and `50`
    var LasersPerCharge<public>:int = external {}

    # Determines the radius of the blast from where the laser hits. 
    #  * Values are clamped between `100.0` and `1000.0`
    var LaserEffectRadius<public>:float = external {}

    # Triggers when the Spire begins its laser attack
    BeginChargeLaserEvent<public>:listenable(tuple()) = external {}

    # Triggers when the Spire shoots its laser attack. Triggers once, even if it shoots at multiple targets
    EndChargeAndFireLaserEvent<public>:listenable(tuple()) = external {}