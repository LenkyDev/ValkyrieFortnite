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

    # Spawn `Player` from this device.
    # Uses the device's `ShouldRespawnAlivePlayers` setting to control behavior when called on an alive player.
    # If the device is not a valid spawn for that player, they will respawn from a valid spawn device, or from skydive if none are found.
    SpawnPlayer<public>(Player:player):void = external {}

    GetBPFunctionNamesForValidation<override>():[]string = external {}