# Verse path: /Fortnite.com/Devices
using {/Verse.org/SpatialMath}
using {/Verse.org/Simulation}
# Used with `guard_spawner_device.Accuracy` to define how accurate the NPC is when it fires at targets.
guard_spawner_accuracy<public> := enum<open>:
    # Not accurate, missing most shots fired.
    Low
    # Somewhat accurate, hitting targets occasionally.
    Moderate
    # Fairly accurate, hitting targets consistently.
    High
    # Very accurate, hitting most shots fired.
    VeryHigh

# Used with `guard_spawner_device.VisibilityRangeRestriction` to define how the guard uses `guard_spawner_device.VisibilityRange`
guard_spawner_visibility_range_restriction<public> := enum<open>:
    # The NPC only uses its `VisibilityRange` when it does not have a target. Otherwise, the guard has an infinite range.
    OnlyWhenUnaware
    # The NPC uses its `VisibilityRange` both when it is unaware and when it has a target.
    Always

# Used to spawn guards that can patrol and attack other `agent`s.
# Changing properties will only affect newly spawned guards.
guard_spawner_device<public> := class<concrete><final>(creative_device_base):
    # Whether the guard can receive damage.
    var Invincible<public>:logic = external {}

    # Determines the starting health of the guard.
    # This value is clamped between 1 and 10000.
    var InitialHealth<public>:float = external {}

    # The health value of the guard.
    # This value is clamped between 1 and 10000.
    var MaxHealth<public>:float = external {}

    # Determines the starting shield of the guard.
    # This value is clamped between 1 and 10000.
    var InitialShield<public>:float = external {}

    # Determines the maximum shield value of the guard.
    # This value is clamped between 1 and 10000.
    var MaxShield<public>:float = external {}

    # Distance in centimeters from its spawn position from which the guard will peacefully roam.
    # This value is clamped between 200.0 and 25000.0.
    var PatrolRange<public>:float = external {}

    # Determines the range, in centimeters, from which the guard will respond.
    # This value is clamped between 0.0 and 25000.0.
    var VisibilityRange<public>:float = external {}

    # Determines how the guard uses its `VisibilityRange` as defined by `guard_spawner_visibility_range_restriction`.
    var Accuracy<public>:guard_spawner_accuracy = external {}

    # If true, displays the guard's health to players.
    var ShowHealthBar<public>:logic = external {}

    # Determines if the guard displays its alertness level over its head.
    var DisplayAlertness<public>:logic = external {}

    # Determines how the guard uses its `VisibilityRange` as defined by `guard_spawner_visibility_range_restriction`.
    var VisibilityRangeRestriction<public>:guard_spawner_visibility_range_restriction = external {}

    # If true, agents can hire the guard.
    var CanBeHired<public>:logic = external {}

    # Determines if the guard is healed when it is hired.
    var RestoreHealthAndShieldOnHire<public>:logic = external {}

    # Determines if the guard despawns when it is dismissed.
    var DespawnOnDismissal<public>:logic = external {}

    # Determines if the guard obeys ping commands from its hired player.
    var ObeyCommands<public>:logic = external {}

    # Signaled when a guard is spawned.
    # Sends the `agent` guard who was spawned.
    SpawnedEvent<public>:listenable(agent) = external {}

    # Signaled when a guard has identified an opponent.
    # `Source` is the guard who is aware.
    # `Target` is the agent who alerted the guard.
    AlertedEvent<public>:listenable(device_ai_interaction_result) = external {}

    # Signaled when a guard has lost track of a target.
    # `Source` is the guard that lost track of a target.
    # `Target` is the `agent` no longer targeted by the guard.
    TargetLostEvent<public>:listenable(device_ai_interaction_result) = external {}

    # Signaled when a guard becomes suspicious.
    # Sends the `agent` guard who is suspicious.
    SuspiciousEvent<public>:listenable(agent) = external {}

    # Signaled when a guard becomes unaware.
    # Sends the `agent` guard who is unaware.
    UnawareEvent<public>:listenable(agent) = external {}

    # Signaled when guard is damaged.
    # `Source` is the `agent` that damaged the guard. If the guard was damaged by a non-agent then `false` is returned.
    # `Target` is the guard that was damaged.
    DamagedEvent<public>:listenable(device_ai_interaction_result) = external {}

    # Signaled when a guard is eliminated.
    # `Source` is the `agent` that eliminated the guard. If the guard was eliminated by a non-agent then `Source` is 'false'.
    # `Target` is the guard that was eliminated.
    EliminatedEvent<public>:listenable(device_ai_interaction_result) = external {}

    # Signaled when a guard eliminates an agent.
    # `Source` is the guard that eliminated the agent.
    # `Target` is the agent that was eliminated.
    EliminatingEvent<public>:listenable(device_ai_interaction_result) = external {}

    # Signaled when a guard is hired by a player.
    # `Source` is the `agent` who hired the guard.
    # `Target` is the guard that was hired.
    HiredEvent<public>:listenable(device_ai_interaction_result) = external {}

    # Signaled when a guard is dismissed by a player.
    # `Source` is the `agent` who dismissed the guard.
    # `Target` is the guard that was dismissed.
    DismissedEvent<public>:listenable(device_ai_interaction_result) = external {}

    # Enables this device. Guards will start to spawn.
    Enable<public>():void = external {}

    # Disables this device. Guards will despawn if *Despawn Guards When Disabled* is set.
    Disable<public>():void = external {}

    # Resets the spawn count allowing spawning of a new batch of guards.
    (/Fortnite.com/Devices/guard_spawner_device:)Reset<public>():void = external {}

    # Tries to spawn a guard.
    Spawn<public>():void = external {}

    # Tries to spawn a guard. If *Auto Hire When Spawned* is set to *Triggering Player* the guard will be hired by `Instigator`.
    Spawn<public>(Instigator:agent):void = external {}

    # Despawns guards.
    Despawn<public>():void = external {}

    # Despawns guards. `Instigator` will be considered as the eliminator of those guards.
    Despawn<public>(Instigator:agent):void = external {}

    # Hires guards to `Instigator`'s team.
    Hire<public>(Instigator:agent):void = external {}

    # Dismisses all hired guards.
    DismissAllHiredGuards<public>():void = external {}

    # Dismisses all hired guards that were recruited by `Instigator`.
    DismissAgentHiredGuards<public>(Instigator:agent):void = external {}

    # Forces guards to attack `Target`, bypassing perception checks.
    # 'ForgetTime' ranges from 0.0 to 600.0 (in seconds, default is 600.0), it is the time after which the target will be ignored if not found.
    # 'ForgetDistance' ranges from 0.0 to 100000.0 (in centimeters, default is 100000.0), it is the distance at which the target will be ignored if not found.
    ForceAttackTarget<public>(Target:agent, ?ForgetTime:float = external {}, ?ForgetDistance:float = external {}):void = external {}

    # Allows guards to be hired.
    SetGuardsHireable<public>():void = external {}

    # Prevents guards from being hired.
    SetGuardsNotHireable<public>():void = external {}

    # Returns the spawn limit of the device.
    GetSpawnLimit<public>()<transacts>:int = external {}

    # Get all agents created by this device.
    GetAgents<public>()<transacts>:[]agent = external {}

    # Sets the name of the guard in the hire the guard conversation and elimination feed.
    SetName<public>(InText:message):void = external {}

    # Gets the name of the guard in the hire the guard conversation and elimination feed.
    GetName<public>():string = external {}

    # Spawn a guard at the given position. When Rotation is not provided, it will default to the Device`s rotation.
    # Returns the agent spawned or false if the device has reached its maximum spawn count.
    # This function is `<suspends>` because it takes time to load the NPC before it can be returned.
    SpawnAt<public>(Position:(/Verse.org/SpatialMath:)vector3, ?Rotation:?(/Verse.org/SpatialMath:)rotation = external {})<suspends>:?agent = external {}