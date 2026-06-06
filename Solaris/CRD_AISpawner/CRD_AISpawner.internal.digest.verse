using {/Verse.org/SpatialMath}
using {/Fortnite.com/Assets}
using {/Verse.org/Simulation}
# Used to spawn NPCs made with Character Definition asset.
npc_spawner_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when a character is spawned.
    # Sends the `agent` character who was spawned.
    SpawnedEvent<public>:listenable(agent) = external {}

    # Signaled when a character is eliminated.
    # `Source` is the `agent` that eliminated the character. If the character was eliminated by a non-agent then `Source` is 'false'.
    # `Target` is the character that was eliminated.
    EliminatedEvent<public>:listenable(device_ai_interaction_result) = external {}

    # Enables this device. Characters will start to spawn.
    Enable<public>():void = external {}

    # Disables this device. Characters will despawn if *Despawn AIs When Disabled* is set.
    Disable<public>():void = external {}

    # Resets the spawn count allowing spawning of a new batch of characters.
    (/Fortnite.com/Devices/npc_spawner_device:)Reset<public>():void = external {}

    # Set the NPC character definition to use. Fails if the character type is different from one in the current definition.
    SetNPCCharacterDefinition<epic_internal>(CharacterDefinition:npc_character_definition)<transacts><decides>:void = external {}

    # Tries to spawn a character.
    Spawn<public>():void = external {}

    # Despawns all characters. If set, `Instigator` will be considered as the eliminator of those characters.
    DespawnAll<public>(Instigator:?agent):void = external {}

    # Spawn a NPC at the given position. When Rotation is not provided, it will default to the Device`s rotation.
    # Returns the agent spawned or false if the device has reached its maximum spawn count.
    # This function is `<suspends>` because it takes time to load the NPC before it can be returned.
    SpawnAt<public>(Position:(/Verse.org/SpatialMath:)vector3, ?Rotation:?(/Verse.org/SpatialMath:)rotation = external {})<suspends>:?agent = external {}

    # Get all agents created by this device.
    GetAgents<public>()<transacts>:[]agent = external {}

    GetBPFunctionNamesForValidation<override>():[]string = external {}