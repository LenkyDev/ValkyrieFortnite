using {/Verse.org/Simulation}
# Used to spawn an `agent` on an island. Use multiple `player_spawner_device`s to spawn multiple `agent`s.
player_spawner_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when an `agent` is spawned from this device.
    # Sends the `agent` that spawned.
    SpawnedEvent<public>:listenable(agent) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Spawn `Agent` from this device.
    # Force respawns if the agent is already spawned.
    SpawnPlayer<epic_internal>(Agent:agent):void = external {}

    # Respawn `Agent` from the best available Player Spawner Device in this device’s *Spawn Group*.
    # Best available spawner is determined by the settings on each spawner device, such as *Priority Group* and *Enemy Range Check*.
    # Force respawns if the player is already spawned.
    RespawnPlayerFromPlayerSpawnerGroup<epic_internal>(Agent:agent):void = external {}

    # Maps to the device option for *Spawner Group*
    # The Spawn Group value can be used to spawn a player at a specific subset of spawner devices.
    var SpawnerGroup<epic_internal>:int = external {}