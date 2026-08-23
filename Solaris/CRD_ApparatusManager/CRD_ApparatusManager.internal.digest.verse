# Verse path: /Fortnite.com/Devices
using {/Verse.org/Simulation}
# The Rift Point volume is used to interface with and manage the Rift Point item,
# and provides an area that enables players to plant the item to create search and destroy style gameplay.
rift_point_volume_device<public> := class<concrete><final>(creative_device_base, enableable):
    # Sends an event when planting the Rift Point is started, passing in the planting `agent`.
    PlantStartEvent<public>:listenable(agent) = external {}

    # Sends an event when planting the Rift Point is canceled, passing in the planting `agent`.
    PlantCancelEvent<public>:listenable(agent) = external {}

    # Sends an event when the Rift Point is planted, passing in the planting `agent`.
    PlantEvent<public>:listenable(agent) = external {}

    # Sends an event when defusing the Rift Point is started, passing in the defusing `agent`.
    DefuseStartEvent<public>:listenable(agent) = external {}

    # Sends an event when defusing the Rift Point is canceled, passing in the defusing `agent`.
    DefuseCancelEvent<public>:listenable(agent) = external {}

    # Sends an event when the Rift Point is defused, passing in the defusing `agent`.
    DefuseEvent<public>:listenable(agent) = external {}

    # Sends an event when the Rift Point detonates, passing in the planting `agent`.
    DetonateEvent<public>:listenable(agent) = external {}

    # Sends an event when an `agent` enters the volume.
    OnAgentEntered<public>:listenable(agent) = external {}

    # Sends an event when an `agent` exits the volume.
    OnAgentExited<public>:listenable(agent) = external {}

    # Is true when `Agent` is in the volume.
    IsInVolume<public>(Agent:agent)<transacts><decides>:void = external {}

    # Returns an array of agents that are currently occupying the volume.
    GetAgentsInVolume<public>()<reads>:[]agent = external {}

    # Enables the device, allowing the Rift Point to be planted.
    Enable<override>():void = external {}

    # Disables the device, preventing the Rift Point from being planted.
    Disable<override>():void = external {}

    # Succeeds if the component is enabled, fails if it’s disabled.
    IsEnabled<override>()<transacts><decides>:void = external {}

    GetBPFunctionNamesForValidation<override>():[]string = external {}