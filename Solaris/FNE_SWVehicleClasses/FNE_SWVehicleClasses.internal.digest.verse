# Specialized `vehicle_spawner_device` that allows an X-wing to be configured and spawned.
vehicle_spawner_xwing_device<public> := class<concrete><final>(vehicle_spawner_device):


# Specialized `vehicle_spawner_device` that allows a TIE Fighter to be configured and spawned.
vehicle_spawner_tie_fighter_device<public> := class<concrete><final>(vehicle_spawner_device):


# Specialized `vehicle_spawner_device` that allows an N-1 Starfighter to be configured and spawned.
vehicle_spawner_n1_starfighter_device<public> := class<concrete><final>(vehicle_spawner_device):


# Specialized `vehicle_spawner_device` that allows an Armored Assault Tank to be configured and spawned.
vehicle_spawner_armored_assault_tank_device<public> := class<concrete><final>(vehicle_spawner_device):


# Specialized `vehicle_spawner_device` that allows a Turbolaser turret to be configured and spawned.
vehicle_spawner_turbolaser_device<public> := class<concrete><final>(vehicle_spawner_device):


# Specialized `vehicle_spawner_device` that allows a DF.9 turret to be configured and spawned.
vehicle_spawner_df9_device<public> := class<concrete><final>(vehicle_spawner_device):
