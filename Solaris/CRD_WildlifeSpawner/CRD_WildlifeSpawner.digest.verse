using {/Verse.org/SpatialMath}
using {/Verse.org/Simulation}
# Used to customize the properties of NPCs spawned by this device.
# Changing properties will only affect newly spawned wildlife creatures.
wildlife_spawner_device<public> := class<concrete><final>(creative_device_base):
    # If a value is given, the `Damage` value of the wildlife creature is overridden.
    # If an override is not specified, the default `Damage` of the wildlife creature is used.
    # This value is clamped between 1.0 and 500.0.
    var Damage<public>:?float = external {}

    # If a value is given, the `Damage` value of the wildlife creature is overridden when damaging players.
    # If an override is not specified, the default `Damage` of the wildlife creature is used.
    # This value is clamped between 1.0 and 500.0.
    var DamageToPlayer<public>:?float = external {}

    # If a value is given, the `Damage` value of the wildlife creature is overridden when damaging the environment.
    # If an override is not specified, the default `Damage` of the wildlife creature is used.
    # This value is clamped between 1.0 and 500.0.
    var DamageToEnvironment<public>:?float = external {}

    # If a value is given, the `SpeedMultiplier` value is applied to the default speed of the wildlife creature.
    # If an override is not specified, the wildlife creature moves at its default speed.
    # This value is clamped between 0.1 and 2.0.
    var SpeedMultiplier<public>:float = external {}

    # Distance in meters from the player who tamed it that the wildlife creature will try to stay within.
    # If a value is given, the `TamedFollowDistance` value of the wildlife creature is overridden.
    # If an override is not specified, the default `TamedFollowDistance` of the wildlife creature is used.
    # This value is clamped between 2.0 and 30.0.
    var TamedFollowDistance<public>:?float = external {}

    # Distance in meters from its spawn position from which the wildlife creature will peacefully roam.
    # If a value is given, the `WanderRange` value of the wildlife creature is overridden.
    # If an override is not specified, the default `WanderRange` of the wildlife creature is used.
    # This value is clamped between 10.0 and 100.0.
    var WanderRange<public>:?float = external {}

    # Whether the NPC can receive damage.
    var Invincible<public>:logic = external {}

    # If a value is given, the `MaxHealth` value of the wildlife creature is overridden.
    # If an override is not specified, the default Health of the wildlife creature is used.
    # This value is clamped between 1.0 and 10000.0.
    var MaxHealth<public>:?float = external {}

    # The amount of riding energy the wildlife creature spawns with.
    # This value is clamped between 0 and 100.
    var InitialEnergy<public>:int = external {}

    # The maximum riding energy the wildlife creature spawns with.
    # This value is clamped between 0 and 100.
    var MaxEnergy<public>:int = external {}

    # The amount of riding energy that is restored when the `RestoreEnergy` function is called.
    # This value is clamped between 0 and 100.
    var EnergyRestorationAmount<public>:int = external {}

    # The amount of riding energy that is consumed when the `ConsumeEnergy` function is called.
    # This value is clamped between 0 and 100.
    var EnergyConsumptionAmount<public>:int = external {}

    # If true and the wildlife creature supports being tamed, agents can tame the NPC.
    var CanTame<public>:logic = external {}

    # If true, agents can ride the wildlife creature.
    var CanRide<public>:logic = external {}

    # If true, agents cannot manually use the interact action to dismount from the wildlife creature.
    var PreventDismount<public>:logic = external {}

    # Signaled when this device spawns wildlife.
    # Sends the `agent` wildlife that was spawned.
    SpawnedEvent<public>:listenable(agent) = external {}

    # Signaled when wildlife is eliminated.
    # `Source` is the `agent` that eliminated the wildlife. If the wildlife was eliminated by a non-agent, or because the oldest wildlife was eliminated as Spawn function was called after spawn count was exceeded, then `Source` is 'false'.
    # `Target` is the wildlife that was eliminated.
    EliminatedEvent<public>:listenable(device_ai_interaction_result) = external {}

    # Signaled when a wildlife eliminates an agent.
    # `Source` is the wildlife that eliminated the agent.
    # `Target` is the agent that was eliminated.
    EliminatingEvent<public>:listenable(device_ai_interaction_result) = external {}

    # Signaled when wildlife is tamed.
    # `Source` is the `agent` that tamed the wildlife.
    # `Target` is the wildlife that was tamed.
    TamedEvent<public>:listenable(device_ai_interaction_result) = external {}

    # Signaled when wildlife is untamed.
    # `Source` is the `agent` that tamed the wildlife.
    # `Target` is the wildlife that was untamed.
    UntamedEvent<public>:listenable(device_ai_interaction_result) = external {}

    # Signaled when wildlife is force-spawned and causes the oldest wildlife to be eliminated.
    # Sends the `agent` wildlife that was spawned.
    ForceSpawnedEvent<public>:listenable(agent) = external {}

    # Signaled when wildlife is damaged.
    # `Source` is the `agent` that damaged the wildlife. If the wildlife was damaged by a non-agent then `false` is returned.
    # `Target` is the wildlife that was damaged.
    DamagedEvent<public>:listenable(device_ai_interaction_result) = external {}

    # Signaled when wildlife eats a pickup such as a Shroom or Meat.
    #  Sends the wildlife that ate something.
    SomethingIsEatenEvent<public>:listenable(agent) = external {}

    # Signaled when an `agent` rides wildlife.
    # `Source` is the `agent` that started riding the wildlife.
    # `Target` is the wildlife that was ridden.
    RiddenEvent<public>:listenable(device_ai_interaction_result) = external {}

    # Signaled when an `agent` dismounts wildlife.
    # `Source` is the `agent` that dismounted the wildlife.
    # `Target` is the wildlife that was dismounted.
    DismountedEvent<public>:listenable(device_ai_interaction_result) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Resets the count on the *Total Spawn Count* option.
    Reset<public>():void = external {}

    # Spawns wildlife from this device. If spawn count is exceeded the oldest wildlife will be eliminated.
    Spawn<public>():void = external {}

    # Despawns wildlife. `Agent` is marked as the one who eliminated the wildlife.
    Despawn<public>(Agent:agent):void = external {}

    # Destroys this device, marking `Agent` as the destroyer of the device.
    DestroySpawner<public>(Agent:agent):void = external {}

    # Tames wildlife, making them AI partners of `Agent`.
    Tame<public>(Agent:agent):void = external {}

    # Untames any tamed wildlife that belong to `Agent`.
    Untame<public>(Agent:agent):void = external {}

    # Untames all wildlife.
    UntameAll<public>():void = external {}

    # Teleports `Agent` to the nearest wildlife, then `Agent` mounts that wildlife.
    Ride<public>(Agent:agent):void = external {}

    # Dismounts `Agent` from wildlife.
    Dismount<public>(Agent:agent):void = external {}

    # Dismounts all `agent`s from wildlife.
    DismountAll<public>():void = external {}

    # Restores energy to wildlife belonging to `Agent` by *Energy Restore Amount*.
    RestoreEnergy<public>(Agent:agent):void = external {}

    # Restores energy to wildlife by *Energy Restore Amount*.
    RestoreEnergyForAll<public>():void = external {}

    # Consumes energy from wildlife belonging to `Agent` by *Energy Consume Amount*.
    ConsumeEnergy<public>(Agent:agent):void = external {}

    # Consumes energy from wildlife by *Energy Consume Amount*.
    ConsumeEnergyForAll<public>():void = external {}

    # Returns the spawn limit of the device.
    GetSpawnLimit<public>()<transacts>:int = external {}

    # Get all agents created by this device.
    GetAgents<public>()<transacts>:[]agent = external {}

    # Spawn a creature at the given position. When Rotation is not provided, it will default to the Device`s rotation.
    # Returns the agent spawned or false if the device has reached its maximum spawn count.
    # This function is `<suspends>` because it takes time to load the NPC before it can be returned.
    SpawnAt<public>(Position:(/Verse.org/SpatialMath:)vector3, ?Rotation:?(/Verse.org/SpatialMath:)rotation = external {})<suspends>:?agent = external {}