# Specialized `vehicle_spawner_device` that allows a Rocket Racing Vehicle to be configured and spawned.
vehicle_spawner_rocketracing_device<public> := class<concrete><final>(vehicle_spawner_device):
    # Whether players can manually exit the vehicle. If `false`, the normal exit input will not remove a player from the vehicle. `true` by default.
    var AllowVehicleExitInput<public>:logic = external {}