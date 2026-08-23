# Verse path: /Fortnite.com/Devices
using {/Verse.org/Simulation}
# A configurable EMP Volume Hazard that slows Rocket Racing Vehicles.
emp_volume_hazard_rocketracing_device<public> := class<concrete><final>(creative_device_base, enableable):
    # Enable this device. While enabled, this slows Rocket Racing Vehicles.
    Enable<override>():void = external {}

    # Disable this device. While disabled, this has no effect on Rocket Racing Vehicles.
    Disable<override>():void = external {}

    # Succeeds if the device is enabled, fails if it's disabled.
    IsEnabled<override>()<transacts><decides>:void = external {}

    # Signals when a Rocket Racing Vehicle triggers this device, returning the `agent` driving the instigating vehicle, if applicable.
    TriggerEvent<public>:listenable(?agent) = external {}