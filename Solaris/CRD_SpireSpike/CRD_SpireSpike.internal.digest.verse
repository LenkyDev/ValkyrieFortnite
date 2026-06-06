using {/Verse.org/Simulation}
# A Destroyable environment prop that when destroyed, drops loot. When players approach the Spire Spike, they start a countdown to a knockback ability. When players are knocked back, they do not receive damage from the knockback ability or take fall damage. They can destroy structures near the knockback location. Damaging the spike can also start the countdown to the knockback or restart the countdown if it is already started.
spire_spike_device<public> := class<concrete><final>(creative_device_base):
    # Triggers when the Spire Spike does its knockback ability.
    KnockbackEvent<public>:listenable(tuple()) = external {}

    # Triggers when the Spire Spike is destroyed.
    # Includes the `agent` that destroyed it, if any.
    DestroyEvent<public>:listenable(?agent) = external {}

    # Destroy the Spire Spike. Will cause the Spire Spike to drop its loot.
    Destroy<public>(Instigator:?agent):void = external {}

    # Spawn the Spire Spike. Resets CurrentHealth back to max health. Resets any timers currently active.
    Spawn<public>():void = external {}

    # Despawns the Spire Spike. It will not drop loot.
    Despawn<public>():void = external {}

    # Returns if Spire Spike is currently spawned.
    IsSpawned<public>()<transacts><decides>:void = external {}

    # The current health of the Spire Spike. Setting to `0.0` or negative will destroy the Spire Spike. Clamps to the maximum of MaxHealth.
    var CurrentHealth<public>:float = external {}

    # The max health of the Spire Spike. Must be greater than or equal to `1.0`. Current health will be scaled up or down based on the scale difference between the old and new MaxHealth.
    var MaxHealth<public>:float = external {}

    # Determines if the Spire Spike can take any damage.
    var IsInvulnerable<public>:logic = external {}

    # Determine if the Spire Spike should drop loot when destroyed or not.
    var CanGrantItems<public>:logic = external {}

    # Determines if the knockback ability should charge once a player has entered the trigger range.
    var ShouldChargeKnockbackOnPlayerProximity<public>:logic = external {}

    # Determines if taking damage should start the knockback charge timer. If the timer was already active and this is true, taking damage will restart the timer.
    var ShouldKnockbackChargeFromTakingDamage<public>:logic = external {}

    # The range (in meters) a player needs to be within to trigger the proximity countdown. This is also the range of the knockback abilities affected targets. Clamped between `2.0` and `10.0`.
    var KnockbackTriggerRange<public>:float = external {}

    # Horizontal force on the knockback ability. Clamped between `0.0` and `100.0`.
    var HorizontalKnockbackMultiplier<public>:float = external {}

    # Vertical force on the knockback ability. Clamped between `0.0` and `100.0`.
    var VerticalKnockbackMultiplier<public>:float = external {}

    # Additive vertical force on the knockback ability. Clamped between `0.0` and `100.0`.
    var AdditionalVerticalKnockback<public>:float = external {}

    # Determines if structures should be destroyed if a player is knocked back into them.
    var ShouldKnockbackDestroyStructures<public>:logic = external {}

    # The length of the knockback charge timer in seconds, regardless of the timer's current state. Clamped between `0.0` and `60.0`.
    var KnockbackChargeTimerLength<public>:float = external {}

    # The remaining time (in seconds) on the knockback charge timer. Clamped between `0.0` and `60.0`.
    #  * When setting, this also sets the length of this Spire Spike's future knockback charge timers.
    #  * If there is no active timer, getting returns `0.0`.
    var KnockbackChargeTimer<public>:float = external {}

    # Force the Spire Spike to trigger its knockback ability immediately.
    Knockback<public>():void = external {}

    # Force begins the knockback charge timer. Will restart the charge timer if already active.
    ChargeKnockback<public>():void = external {}

    GetBPFunctionNamesForValidation<override>():[]string = external {}