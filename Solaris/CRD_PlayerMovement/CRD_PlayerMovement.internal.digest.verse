using {/Verse.org/Simulation}
# Used to update the player character's movement settings on different movement mode.
player_movement_settings_device<public> := class<concrete><final>(creative_device_base, enableable):
    # Enables this device, allowing its properties to affect the registered player characters' movement.
    Enable<override>():void = external {}

    # Disables this device, revoking its change to the registered player characters.  
    # Disabling this does not clear the list of registered players.
    Disable<override>():void = external {}

    # Succeeds if the object is enabled, fails if it's disabled.
    IsEnabled<override>()<transacts><decides>:void = external {}

    # Adds the movement settings to the provided agent, activating if it is in the highest priority.
    #  * The highest priority device is applied to players and test players. Ties are broken by which is applied most recently.
    #  * Fails if the provided agent is unsupported including NPC agents like Guard, Wildlife or Custom NPCs.
    AddTo<public>(Agent:agent):void = external {}

    # Adds the movement settings to all the agents in the scene, activating if it is in the highest priority.
    #  * The highest priority device is applied to players and test players. Ties are broken by which is applied most recently.
    AddToAll<public>():void = external {}

    # Removes the movement settings from the provided agent. 
    # Fails if the provided agent doesn't have the movement settings applied.
    RemoveFrom<public>(Agent:agent):void = external {}

    # Removes the movement settings from all the active agents.
    RemoveFromAll<public>():void = external {}

    # Returns the priority of the device, the active device in the highest priority will be applied to the provided agents.
    GetPriority<public>()<reads>:float = external {}

    # Returns the player agents registered to this device.
    GetRegisteredAgents<public>()<reads>:[]agent = external {}

    GetBPFunctionNamesForValidation<override>():[]string = external {}