using {/Verse.org/Simulation}
# Used to apply a cosmetic disguise to the player.
# The disguise to apply is defined on the device, as are the conditions for when the disguise breaks.
disguise_device<public> := class<concrete><final>(creative_device_base, enableable):
    # Applies the disguise to the provided `player`.
    # If the provided `player` does not pass the device's filter settings, or if another disguise is already present and the device's *Stomp Existing Disguise* option is set to false, the disguise will not be applied.
    ApplyDisguise<public>(Player:player):void = external {}

    # Removes the disguise applied by this device, if it exists, from the provided `player`.
    RemoveDisguise<public>(Player:player):void = external {}

    # Signaled when a disguise from this device is successfully applied to `player`.
    ApplyDisguiseEvent<public>:listenable(player) = external {}

    # Signaled when a disguise applied by this device on `player` is broken.
    # The second optional `agent` describes who broke the disguise (the damage source if broken by damage or elimination).
    # The conditions triggering a disguise to break are set in the device's user options.
    BreakDisguiseEvent<public>:listenable(tuple(player, ?agent)) = external {}

    # Signaled when a disguise applied by this device on `player` is removed.
    # Removal can occur from calling the *Remove Disguise* function, or from getting stomped by another disguise device.
    # This event will not trigger if the disguise is broken.
    RemoveDisguiseEvent<public>:listenable(player) = external {}

    # Succeeds if the provided `player` has a disguise applied from this device.
    IsDisguiseApplied<public>(Player:player)<transacts><decides>:void = external {}

    # Maps to the user option for *Should Apply Disguise on Spawn*.
    #  If this is true, the device will apply a disguise to the player as soon as they spawn, so long as they pass the device's filter options.
    var ShouldApplyDisguiseOnPlayerSpawn<public>:logic = external {}

    # Enables this device, allowing it to listen for inputs.
    Enable<override>():void = external {}

    # Disables this device, preventing it from listening to inputs.
    # Disguises applied by this device are not removed when the device is disabled.
    Disable<override>():void = external {}

    # Succeeds if the object is enabled, fails if it is disabled.
    IsEnabled<override>()<transacts><decides>:void = external {}