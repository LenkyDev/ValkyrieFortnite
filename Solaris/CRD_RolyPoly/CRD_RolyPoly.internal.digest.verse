using {/UnrealEngine.com/Temporary/SpatialMath}
using {/Fortnite.com/Game}
using {/Verse.org/Simulation}
# Enum for determining if a spawner should spawn when it becomes enabled
spawn_on_enable_behavior<epic_internal> := enum<open>:
    Always
    Never
    IfNone

# Device for spawning a Roly Poly
roly_poly_spawner_device<epic_internal> := class<concrete><final>(creative_device_base, enableable):
    # Enable the spawner. While enabled, the spawner maintains at most one active Roly Poly.
    Enable<override>():void = external {}

    # Disable the spawner: dismiss the active Roly Poly (if 'DismissOnDisabled' is true) and prevent any further spawns.
    # Any pending respawn timers are cancelled.
    Disable<override>():void = external {}

    # Succeeds if the Spawner is enabled, fails if it's disabled.
    IsEnabled<override>()<transacts><decides>:void = external {}

    # If true, when a Roly Poly flees while the spawner is enabled, a new one will spawn after RespawnDelay.
    var AutomaticRespawn<epic_internal>:logic = external {}

    # Seconds to wait before respawning after a flee when AutomaticRespawn is true.
    var RespawnDelay<epic_internal>:float = external {}

    # If not Never, enabling the spawner immediately spawns a Roly Poly, IfNone will only spawn there is no active Roly Poly.
    var SpawnOnEnabled<epic_internal>:spawn_on_enable_behavior = external {}

    # If true, disabling the spawner immediately dismisses the active roly poly.
    var DismissOnDisabled<epic_internal>:logic = external {}

    # Determines if Roly Poly will take damage when hit.
    var Invulnerable<epic_internal>:logic = external {}

    # Determines how much damage the Roly Poly will take before fleeing.
    var MaxHealth<epic_internal>:float = external {}

    # Determines if the Roly Poly will get tired and leave after rolling around.
    var UnlimitedEnergy<epic_internal>:logic = external {}

    # Determines the amount of energy the Roly Poly will spawn with.
    var StartingEnergy<epic_internal>:float = external {}

    # Determines if the Roly Poly will curl up and hide when attacked.
    var CanBeFrightened<epic_internal>:logic = external {}

    # Determines if the Roly Poly will spawn in curled up.
    var StartFrightened<epic_internal>:logic = external {}

    # Determines if frightened Roly Poly will open up on its own.
    var SelfSootheEnabled<epic_internal>:logic = external {}

    # Determines the time in seconds that the Roly Poly will stay curled up and hide before opening up on its own.
    var SelfSootheTime<epic_internal>:float = external {}

    # Determines the time in seconds that the player needs to soothe the Roly Poly before it opens up.
    var SootheTime<epic_internal>:float = external {}

    # Determines if the Roly Poly will remove the player when it takes damage.
    var BuckPlayerWhenDamaged<epic_internal>:logic = external {}

    # Spawn a Roly Poly now. If one is active, dismiss it first, then spawn.
    # If the spawner is disabled, this call does nothing.
    Spawn<epic_internal>():void = external {}

    # Dismiss the active Roly Poly if present.
    # If 'AutomaticRespawn' is true, a respawn timer for 'RespawnDelay' seconds will be created.
    Dismiss<epic_internal>():void = external {}

    # Attempt to set 'agent' as the spawned Roly Poly's rider.
    Ride<epic_internal>(Agent:agent):void = external {}

    # Signaled when a Roly Poly is spawned or respawned by this device.
    SpawnEvent<epic_internal>:listenable(tuple()) = external {}

    # Signaled when a spawned Roly Poly flees.
    FleeEvent<epic_internal>:listenable(tuple()) = external {}

    # Signaled when an 'agent' enters a spawned Roly Poly.
    # Sends the 'agent' that entered the Roly Poly.
    RideEvent<epic_internal>:listenable(agent) = external {}

    # Signaled when an 'agent' exits a spawned Roly Poly.
    # Sends the 'agent' that exited the Roly Poly.
    DismountEvent<epic_internal>:listenable(agent) = external {}

    # Signaled when an 'agent' causes the spawned Roly Poly to curl up and hide.
    FrightenEvent<epic_internal>:listenable(?agent) = external {}

    # Signaled when an 'agent' causes the spawned Roly Poly to open up after being scared.
    SootheEvent<epic_internal>:listenable(?agent) = external {}

    GetActiveRolyPoly<epic_internal>()<transacts><decides>:?roly_poly = external {}

# Roly Poly spawned from the 'roly_poly_spawner_device'
roly_poly<epic_internal> := class<concrete><final>(positional, healthful, healable, damageable):
    # Returns the transform of the Roly Poly
    GetTransform<override>()<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)transform = external {}

    # Returns the health state of the Roly Poly. This value will be between 0.0 and 'GetMaxHealth'
    GetHealth<override>()<transacts>:float = external {}

    # Sets the health state of the Roly Poly to 'Health'.
    #  * Health state will be clamped between 1.0 and 'GetMaxHealth'.
    #  * Health state cannot be directly set to 0.0. To eliminate the Roly Poly, use the 'Dismiss' function on the spawner instead.
    SetHealth<override>(Health:float)<transacts>:void = external {}

    # Returns the maximum health of the Roly Poly. This value will be between 1.0 and 9999.0.
    GetMaxHealth<override>()<transacts>:float = external {}

    # Sets the maximum health state of the Roly Poly.
    #  * MaxHealth will be clamped between 1.0 and 9999.0.
    #  * Current health state will be scaled up or down based on the scale difference between the old and new MaxHealth state.
    SetMaxHealth<override>(MaxHealth:float)<transacts>:void = external {}

    # Heal the Roly Poly anonymously by 'Amount'. Setting 'Amount' to less than 0 will cause no healing.
    # Use 'Heal(:healing_args):void' when healing is being applied from a known instigator and source.
    Heal<override>(Amount:float):void = external {}

    # Cause 'Args.Amount' damage to the Roly Poly. Setting 'Amount' to less than 0 will cause no damage.
    Heal<override>(Args:healing_args):void = external {}

    # Signaled when healing is applied to the Roly Poly.
    HealedEvent<override>():listenable(healing_result) = external {}

    # Damage the Roly Poly anonymously by 'Amount'. Setting 'Amount' to less than 0 will cause no damage.
    # Use 'Damage(:damage_args):void' when damage is being applied from a known instigator and source.
    # Damage caused by events will not cause players to be bucked from the Roly Poly.
    Damage<override>(Amount:float):void = external {}

    # Damage the Roly Poly by 'Args.Amount'. Setting 'Amount' to less than 0 will cause no damage.
    # Damage caused by events will not cause players to be bucked from the Roly Poly.
    Damage<override>(Args:damage_args):void = external {}

    # Signaled when damage is applied to the Roly Poly.
    DamagedEvent<override>():listenable(damage_result) = external {}

    # Set/Get the Energy level of the spawned Roly Poly.
    # Energy will be clamped to 0 - 100.
    var Energy<epic_internal>:float = external {}

    # Set the Frightened status of the Roly Poly.
    #  * Setting to true will frighten the Roly Poly.
    #  * Setting to false will soothe the Roly Poly.
    #  * An 'agent' can be provided and will be passed back as the signaled events 'agent'.
    #  * Depending on the state the Roly Poly is in, it may take a few seconds for the FrightenedEvent to be signaled. Ex. When a player is in the Roly Poly, it will buck the player and enter the frightened state when it lands on solid ground.
    SetFrightened<epic_internal>(Frightened:logic, Agent:?agent):void = external {}