# Verse path: /Fortnite.com/Devices
using {/Verse.org/Simulation}
# Allows players to change their outfit in game!
changing_booth_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when a `player` enters the changing booth device.
    PlayerEnterEvent<public>:listenable(player) = external {}

    # Signaled when a `player` exits the changing booth device.
    PlayerExitEvent<public>:listenable(player) = external {}