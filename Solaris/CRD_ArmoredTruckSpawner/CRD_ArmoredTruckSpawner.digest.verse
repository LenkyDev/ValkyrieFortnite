# Verse path: /Fortnite.com/Devices
# Specialized `vehicle_spawner_device` that allows an armored transport to be configured and spawned.
vehicle_spawner_armored_transport_device<public> := class<concrete><final>(vehicle_spawner_device):
    var<private> Vault<public>:bank_vault_interface = external {}