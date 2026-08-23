# Verse path: /Fortnite.com/Devices
using {/Verse.org/Simulation}
# Allow players to bring eliminated teammates back into the game.
reboot_van_device<public> := class<concrete><final>(creative_device_base, reboot_van_interface):
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

reboot_progress_decay_behavior<public> := enum<open>:
    # Set a custom multiplier on the decay rate.
    CustomDecay
    # Instantly reset progress to zero.
    InstantReset
    # Use Battle Royale's decay rate.
    BattleRoyale

reboot_card_purchase_options<public> := class<concrete><final>:
    # Determines how much of the set currency it costs to purchase an eliminated player's reboot card. Clamped between `0` and `99999`.
    var CostToPurchaseRebootCard<public>:int = external {}

    # Determines if the item's rarity is displayed to the player if they are missing resources.
    var ShowItemRarityOnInteractPrompt<public>:logic = external {}

    # Determines if players can purchase a reboot card when the timer has expired.
    var CanPurchaseExpiredRebootCard<public>:logic = external {}

reboot_van_interface<public> := interface<epic_internal>:
    # Enable the device.
    EnableReboot<public>():void

    # Disable the device.
    DisableReboot<public>():void

    # Succeeds if the device is enabled, fails if it's disabled.
    IsEnabledReboot<public>()<transacts><decides>:void

    # Triggers when Reboot Van has finished recharging.
    #  * `agent` is the last interacting player.
    RechargeCompleteEvent<public>:listenable(?agent)

    # Triggers when Reboot Van has finished rebooting a set of players.
    #  * `agent`is the player that started the reboot.
    RebootEvent<public>:listenable(agent)

    # The length of the recharge timer in seconds, regardless of the timer's current state. Clamped between `0.0` and `3600.0`.
    var RechargeTimerLength<public>:float

    # The remaining time (in seconds) on the recharge timer. Clamped between `0.0` and `3600.0`.
    #  * If there is no active timer, getting returns `0.0`.
    #  * If there is no active timer, setting does nothing.
    var RechargeTimer<public>:float

    # How quickly reboot progress decays when nobody is interacting with the Reboot Van. Custom Decay - Set a custom multiplier on the decay rate. Instant Reset - Instantly reset progress to zero. Battle Royale - Use Battle Royale's decay rate.
    var RebootProgressDecay<public>:reboot_progress_decay_behavior

    # Multiplier on the decay rate of reboot progress. Clamped between `0.1` and `2.0`.
    #  * Only used if `RebootProgressDecay` is set to `Custom Decay`.
    var DecayRateMultiplier<public>:?float

    # Triggers when a player purchases a Reboot Card.
    #  * `agent` is the player that purchased the Reboot Card.
    RebootCardPurchaseEvent<public>:listenable(agent)

    # Determines if players can purchase an eliminated player's reboot card.
    var CanPurchaseRebootCard<public>:logic

    # Purchase reboot card options.
    #  * Only used if `CanPurchaseRebootCard` is `true`.
    var PurchaseRebootCardOptions<public>:?reboot_card_purchase_options