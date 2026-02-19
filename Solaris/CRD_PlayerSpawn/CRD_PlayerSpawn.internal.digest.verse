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

    # Respawn `Agent` from the best available Player Spawner Device in `Group`.
    # Best available spawner is determined by the settings on each spawner device, such as *Priority Group* and *Enemy Range Check*.
    # Force respawns if the player is already spawned.
    RespawnPlayerFromPlayerSpawnerGroup<epic_internal>(Agent:agent, Group:[]creative_device_base):void = external {}