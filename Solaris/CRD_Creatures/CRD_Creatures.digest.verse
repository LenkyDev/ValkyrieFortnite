# Verse path: /Fortnite.com/Devices
using {/Verse.org/SpatialMath}
using {/Verse.org/Simulation}
# Used to customize one creature type at a time. Place multiple `creature_manager_device`s for each type of creature on your island.
# Changing properties will respect the `Affected Creatures` property of the
# device. If `Affected Creatures` is set to `New Pawns Only`, only new spawns will
# get the changed property values. If set to `New and Existing Pawns`, all creatures
# spawned from this device and new ones will have the new properties.
creature_manager_device<public> := class<concrete><final>(creative_device_base):
    # If set, the health value of the creature is overridden.
    # If an override is not specified, the default Health of the creature is used.
    # This value is clamped between 1 and 10000.
    var MaxHealth<public>:?int = external {}

    # If a value is given, the `Score` value of the creature is overridden.
    # If an override is not specified, the default `Score` of the creature is used.
    # This value is clamped between 0 and 100.
    var Score<public>:?int = external {}

    # If a value is given, the `DamageToPlayer` value of the creature is overridden.
    # If an override is not specified, the default `DamageToPlayer` of the creature is used.
    # This value is clamped between 0 and 500.
    var DamageToPlayer<public>:?float = external {}

    # If a value is given, the `DamageToEnvironment` value of the creature is overridden.
    # If an override is not specified, the default `DamageToEnvironment` of the creature is used.
    # This value is clamped between 0 and 500.
    var DamageToEnvironment<public>:?float = external {}

    # If a value is given, the `SpeedMultiplier` value is applied to the default speed of the creature.
    # If an override is not specified, the creature moves at its default speed.
    # This value is clamped between 0.0 and 2.0.
    var MovementSpeed<public>:?float = external {}

    # Determines if the selected Creature type can be knocked back by weapon impacts.
    var AllowWeaponKnockback<public>:logic = external {}

    # Signaled when a creature of the selected *Creature Type* is eliminated.
    # Sends the `agent` that eliminated the creature.
    MatchingCreatureTypeEliminatedEvent<public>:listenable(agent) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

# Used to spawn a creature at a specified location.
creature_placer_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when a creature is spawned.
    # Sends the `agent` creature who was spawned.
    SpawnedEvent<public>:listenable(agent) = external {}

    # Signaled when the creature is eliminated.
    #  * Sends the `agent` that eliminated the creature.
    #  * Sends `false` if the creature was eliminated by something other than an `agent` (e.g. a vehicle).
    EliminatedEvent<public>:listenable(?agent) = external {}

    # Spawns the creature.
    Spawn<public>():void = external {}

    # Despawns the creature.
    Despawn<public>():void = external {}

    # Spawn a creature at the given position. When Rotation is not provided, it will default to the Device's rotation. 
    # Returns the agent spawned or false if the device has reached its maximum spawn count. 
    # This function is '<suspends>' because it takes time to load the creature before it can be returned.
    SpawnAt<public>(Position:(/Verse.org/SpatialMath:)vector3, ?Rotation:?(/Verse.org/SpatialMath:)rotation = external {})<suspends>:?agent = external {}

# Used to spawn one or more waves of creatures of customizable types at selected time intervals.
creature_spawner_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when a creature is spawned.
    # Sends the `agent` creature who was spawned.
    SpawnedEvent<public>:listenable(agent) = external {}

    # Spawn a creature at the given position. When Rotation is not provided, it will default to the Device's rotation. 
    # Returns the agent spawned or false if the device has reached its maximum spawn count. 
    # This function is `<suspends>` because it takes time to load the creature before it can be returned.
    SpawnAt<public>(Position:(/Verse.org/SpatialMath:)vector3, ?Rotation:?(/Verse.org/SpatialMath:)rotation = external {})<suspends>:?agent = external {}

    # Signaled when a creature is eliminated.
    #  `Source` is the `agent` that has eliminated the creature. If the creature was eliminated by a non-agent then `Source` is 'false'.
    #  `Target` is the creature that was eliminated.
    EliminatedEvent<public>:listenable(device_ai_interaction_result) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Destroys this device.
    DestroySpawner<public>():void = external {}

    # Eliminates all creatures spawned by this device.
    EliminateCreatures<public>():void = external {}

    # Returns the spawn limit of the device.
    GetSpawnLimit<public>()<transacts>:int = external {}