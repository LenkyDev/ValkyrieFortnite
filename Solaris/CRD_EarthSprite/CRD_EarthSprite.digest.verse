# Verse path: /Fortnite.com/Devices
using {/Verse.org/Simulation}
# Use to create a sprite that players can trade in a weapon for a random legendary weapon or a custom item list.
earth_sprite_device<public> := class<concrete><final>(creative_device_base, enableable):
    # Enable the device, and resets all trade counts the Sprite is tracking.
    Enable<override>():void = external {}

    # Disable the device.
    Disable<override>():void = external {}

    # Succeeds if the device is enabled, fails if it's disabled.
    IsEnabled<override>()<transacts><decides>:void = external {}

    # Triggers when a player gives the Earth Sprite a weapon.
    # Sends the triggering `agent`.
    WeaponConsumedEvent<public>:listenable(agent) = external {}

    # Triggers when the grant timer has completed.
    # Sends the triggering `agent`.
    GrantTimerCompletedEvent<public>:listenable(?agent) = external {}

    # Enable the device's ability to grant items.
    EnableItemGranting<public>():void = external {}

    # Disable the device's ability to grant items. Can still interact and consume weapons.
    DisableItemGranting<public>():void = external {}

    # Makes the Earth Sprite invisible.
    Hide<public>():void = external {}

    # Makes the Earth Sprite visible.
    Show<public>():void = external {}

    # Allows a `agent` to trade, and will reset the `agent`'s trade count for this Sprite.
    EnableTradingForPlayer<public>(Agent:agent):void = external {}

    # Prevents the `agent` from trading.
    DisableTradingForPlayer<public>(Agent:agent):void = external {}