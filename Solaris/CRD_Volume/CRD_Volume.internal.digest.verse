using {/Verse.org/Simulation}
# Used to track when agents enter and exit a volume.
volume_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when an `agent` enters the device volume.
    AgentEntersEvent<public>:listenable(agent) = external {}

    # Signaled when an `agent` exits the device volume.
    AgentExitsEvent<public>:listenable(agent) = external {}

    # Signaled when an `creative_prop` entered the device volume.
    PropEnterEvent<public>:listenable(creative_prop) = external {}

    # Signaled when an `creative_prop` exited the device volume.
    PropExitEvent<public>:listenable(creative_prop) = external {}

    # Returns an array of agents that are currently occupying the volume.
    GetAgentsInVolume<public>()<reads>:[]agent = external {}

    # Succeeds when `Agent` is in the volume.
    IsInVolume<public>(Agent:agent)<transacts><decides>:void = external {}

    GetBPFunctionNamesForValidation<override>():[]string = external {}