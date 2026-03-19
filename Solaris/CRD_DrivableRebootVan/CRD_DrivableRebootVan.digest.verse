using {/Verse.org/Simulation}
vehicle_spawner_drivable_reboot_van_device<public> := class<concrete><final>(vehicle_spawner_device, reboot_van_interface):
    # Enable the device.
    EnableReboot<override>():void = external {}

    # Disable the device.
    DisableReboot<override>():void = external {}

    # Succeeds if the device is enabled, fails if it's disabled.
    IsEnabledReboot<override>()<transacts><decides>:void = external {}

    # Triggers when Reboot Van has finished recharging.
    #  * `agent` is the last interacting player.
    RechargeCompleteEvent<override>:listenable(?agent) = external {}

    # Triggers when Reboot Van has finished rebooting a set of players.
    #  * `agent`is the player that started the reboot.
    RebootEvent<override>:listenable(agent) = external {}

    # The length of the recharge timer in seconds, regardless of the timer's current state. Clamped between `0.0` and `3600.0`.
    var RechargeTimerLength<override>:float = external {}

    # The remaining time (in seconds) on the recharge timer. Clamped between `0.0` and `3600.0`.
    #  * If there is no active timer, getting returns `0.0`.
    #  * If there is no active timer, setting does nothing.
    var RechargeTimer<override>:float = external {}

    # How quickly reboot progress decays when nobody is interacting with the Reboot Van. Custom Decay - Set a custom multiplier on the decay rate. Instant Reset - Instantly reset progress to zero. Battle Royale - Use Battle Royale's decay rate.
    var RebootProgressDecay<override>:reboot_progress_decay_behavior = external {}

    # Multiplier on the decay rate of reboot progress. Clamped between `0.1` and `2.0`.
    #  * Only used if `RebootProgressDecay` is set to `Custom Decay`.
    var DecayRateMultiplier<override>:?float = external {}

    # Triggers when a player purchases a Reboot Card.
    #  * `agent` is the player that purchased the Reboot Card.
    RebootCardPurchaseEvent<override>:listenable(agent) = external {}

    # Determines if players can purchase an eliminated player's reboot card.
    var CanPurchaseRebootCard<override>:logic = external {}

    # Purchase reboot card options.
    #  * Only used if `CanPurchaseRebootCard` is `true`.
    var PurchaseRebootCardOptions<override>:?reboot_card_purchase_options = external {}

    # Triggers when Reboot Van has finished reviving a player from DBNO.
    #  * `agent` is the player that was just revived.
    ReviveCompleteEvent<public>:listenable(agent) = external {}

    # Enable the revival seat.
    EnableRevive<public>():void = external {}

    # Disable the revival seat.
    DisableRevive<public>():void = external {}

    # Succeeds if the revival seat is enabled, fails if it's disabled.
    IsEnabledRevive<public>()<transacts><decides>:void = external {}