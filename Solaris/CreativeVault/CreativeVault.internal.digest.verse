using {/Verse.org/Simulation}
bank_vault_interface<public> := interface<epic_internal>(enableable):
    # Triggers when the vault sequence is started by a player or event.
    #  * Sends the `agent` that triggered this event, if applicable.
    StartSequenceEvent<public>:listenable(?agent)

    # Triggers when the vault is opened either by the destruction of its weakpoints or by an event.
    #  * Sends the last `agent` that damaged a weakpoint or the `agent` that started the sequence if no external damage was done or none if the sequence was triggered by a function.
    OpenEvent<public>:listenable(?agent)

    # Triggers when a weakpoint is activated. The weakpoint will begin to glow, but does not become vulnerable until a subsequent `WeakpointVulnerableEvent`.
    #  * Sends the `agent` that activated the vault or none if the sequence was triggered by a function, and the `int` index of the weakpoint from 0-4, in order of activation.
    ActivateWeakpointEvent<public>:listenable(tuple(?agent, int))

    # Triggers when a weakpoint becomes vulnerable.
    #  * Sends the `agent` that activated the vault or none if the sequence was triggered by a function, and the `int` index of the weakpoint from 0-4, in order of activation.
    WeakpointVulnerableEvent<public>:listenable(tuple(?agent, int))

    # Triggers when a weakpoint is destroyed.
    #  * Sends the last `agent` that damaged the weakpoint or the `agent` that started the sequence if no external damage was done or none if the sequence was triggered by a function, and the `int` index of the weakpoint from 0-4, in order of activation.
    DestroyWeakpointEvent<public>:listenable(tuple(?agent, int))

    # Destroys the remaining weakpoints and opens the vault door. Requires the device to be enabled.
    ForceOpen<public>():void

    # Begin the sequence of events to open the vault door without thermite, or unpauses the sequence if it was paused. Requires the device to be enabled. Weakpoints can only be damaged while the vault sequence is active.
    StartSequence<public>():void

    # Disable the weakpoint vulnerability and freeze the progress of each one. Weakpoints can only be damaged while the vault sequence is active.
    PauseSequence<public>():void

    # Restores vault to default state, deactivates the device, and heals all weakpoints to max health. Requires the device to be enabled.
    (/Fortnite.com/Devices/bank_vault_interface:)Reset<public>():void

    # Whether the vault sequence is currently active and not paused.
    IsSequenceActive<public>()<transacts><decides>:void

    # Whether the player needs thermite when interacting with the door to start the vault opening sequence.
    var RequireThermite<public>:logic

    # Damage dealt to the active weakpoint each second. Negative numbers heal the weakpoint. Weakpoints can only be damaged while the vault sequence is active.
    var WeakpointDamagePerSecond<public>:float

    # Whether the weakpoint takes damage from weapons and items while vault sequence is active.
    var WeakpointTakesExternalDamage<public>:logic

    # Destroy the active weakpoint. Requires the device to be enabled. Must have active weakpoint.
    DestroyActiveWeakpoint<public>():void

    # Restores the active weakpoint to full health. Requires the device to be enabled. Must have active weakpoint.
    RestoreActiveWeakpoint<public>():void

    # Gets the active weakpoint's index starting at `0`, regardless of device's enabled state. Returns false if there is no active weakpoint, such as when the sequence is not active or directly after a weakpoint is destroyed.
    GetActiveWeakpointIndex<public>()<transacts><decides>:int

    # Gets the total number of weakpoints.
    GetWeakpointCount<public>():int

    # Get active weakpoint's health. If there is no active weakpoint, returns false.
    GetActiveWeakpointHealth<public>()<transacts><decides>:float

    # Set active weakpoint's health. Setting it to `0.0` or false will destroy the weakpoint. Clamps to maximum of WeakpointMaxHealth.
    SetActiveWeakpointHealth<public>(newHealth:float):void

    # The max health of this device's weakpoints.
    var<internal> MaxWeakpointHealth<public>:float