using {/Verse.org/Simulation}
# An interface for shared functionality between different spire devices
has_spire_functionality<public> := interface<epic_internal>(enableable):
    # Determines the distance where approaching players activate the Spire.
    var ActivationDistance<public>:float

    # If this Spire is currently activated.
    #  * Succeeds if activated. Fails if deactivated 
    #  * An activated will react to enemies and take damage 
    #  * Becomes activated from being enabled and players entering the `Activation Distance`
    IsActivated<public>()<transacts><decides>:void

    # Triggers when the Spire becomes activated from players entering the `Activation Distance`
    ActivateEvent<public>:listenable(?agent)

    # Triggers when the Spire becomes deactivated, either from players leaving the `Activation Distance`
    DeactivateEvent<public>:listenable(tuple())

    # Spawns the Spire, causing it to become visible and enabling collision 
    #  *  Does nothing if the Spire is already spawned or destroyed
    Spawn<public>():void

    # Succeeds if this Spire is in a spawned state. Fails if the Spire is destroyed or has not spawned.
    IsSpawned<public>()<transacts><decides>:void

    # Sets the Spire’s health to zero, destroying it.
    Destroy<public>():void

    # Succeeds if this Spire’s health has reached 0. Fails otherwise
    IsDestroyed<public>()<transacts><decides>:void

    # Triggers when the Spire is destroyed from damage or events
    DestroyEvent<public>:listenable(?agent)

    # Resets the Spire to its initial state.
    (/Fortnite.com/Devices/has_spire_functionality:)Reset<public>():void

    # The maximum health of this Spire.
    var<private> MaxHealth<public>:float

    # The Spire's current health. Clamped between 0 and `MaxHealth`. 
    #  * Setting this value does nothing if the Spire is destroyed.
    var Health<public>:float

    # Determines if a Spire-specific icon should be displayed on the map while the Spire is spawned
    var ShowMapIcon<public>:logic