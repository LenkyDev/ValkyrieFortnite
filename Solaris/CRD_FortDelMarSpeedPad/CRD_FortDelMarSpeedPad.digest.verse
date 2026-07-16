using {/Verse.org/Simulation}
# A boost pad that applies speed to Rocket Racing Vehicles driving over it.
boost_pad_rocketracing_device<public> := class<concrete><final>(creative_device_base, enableable):
    # Enable this device. While enabled, this applies speed to Rocket Racing Vehicles driving over it.
    Enable<override>():void = external {}

    # Disable this device. While disabled, this will not affect Rocket Racing Vehicles driving over it.
    Disable<override>():void = external {}

    # Succeeds if the device is enabled, fails if it's disabled.
    IsEnabled<override>()<transacts><decides>:void = external {}

    # Signals when a Rocket Racing Vehicle triggers this device, returning the `agent` driving the instigating vehicle, if applicable.
    TriggerEvent<public>:listenable(?agent) = external {}