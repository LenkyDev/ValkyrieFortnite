using {/Verse.org/Simulation}
# A vault door that requires a start of a sequence to damage a number of weakpoints to open.
bank_vault_device<public> := class<concrete><final>(creative_device_base, bank_vault_interface):
    # Enable the device.
    Enable<override>():void = external {}

    # Disable the device. Pauses vault sequence.
    Disable<override>():void = external {}

    # Succeeds if the device is enabled, fails if it's disabled.
    IsEnabled<override>()<transacts><decides>:void = external {}

    # Triggers when the vault sequence is started by a player or event.
    #  * Sends the `agent` that triggered this event, if applicable.
    StartSequenceEvent<override>:listenable(?agent) = external {}

    # Triggers when the vault is opened either by the destruction of its weakpoints or by an event.
    #  * Sends the last `agent` that damaged a weakpoint or the `agent` that started the sequence if no external damage was done or none if the sequence was triggered by a function.
    OpenEvent<override>:listenable(?agent) = external {}

    # Triggers when a weakpoint is activated. The weakpoint will begin to glow, but does not become vulnerable until a subsequent `WeakpointVulnerableEvent`.
    #  * Sends the `agent` that activated the vault or none if the sequence was triggered by a function, and the `int` index of the weakpoint from 0-4, in order of activation.
    ActivateWeakpointEvent<override>:listenable(tuple(?agent, int)) = external {}

    # Triggers when a weakpoint becomes vulnerable.
    #  * Sends the `agent` that activated the vault or none if the sequence was triggered by a function, and the `int` index of the weakpoint from 0-4, in order of activation.
    WeakpointVulnerableEvent<override>:listenable(tuple(?agent, int)) = external {}

    # Triggers when a weakpoint is destroyed.
    #  * Sends the last `agent` that damaged the weakpoint or the `agent` that started the sequence if no external damage was done or none if the sequence was triggered by a function, and the `int` index of the weakpoint from 0-4, in order of activation.
    DestroyWeakpointEvent<override>:listenable(tuple(?agent, int)) = external {}

    # Destroys the remaining weakpoints and opens the vault door. Requires the device to be enabled.
    ForceOpen<override>():void = external {}

    # Begin the sequence of events to open the vault door without thermite, or unpauses the sequence if it was paused. Requires the device to be enabled. Weakpoints can only be damaged while the vault sequence is active.
    StartSequence<override>():void = external {}

    # Disable the weakpoint vulnerability and freeze the progress of each one. Weakpoints can only be damaged while the vault sequence is active.
    PauseSequence<override>():void = external {}

    # Restores vault to default state, deactivates the device, and heals all weakpoints to max health. Requires the device to be enabled.
    Reset<override>():void = external {}

    # Whether the vault sequence is currently active and not paused.
    IsSequenceActive<override>()<transacts><decides>:void = external {}

    # Whether the player needs thermite when interacting with the door to start the vault opening sequence.
    var RequireThermite<override>:logic = external {}

    # Damage dealt to the active weakpoint each second. Negative numbers heal the weakpoint. Weakpoints can only be damaged while the vault sequence is active.
    var WeakpointDamagePerSecond<override>:float = external {}

    # Whether the weakpoint takes damage from weapons and items while vault sequence is active.
    var WeakpointTakesExternalDamage<override>:logic = external {}

    # Destroy the active weakpoint. Requires the device to be enabled. Must have active weakpoint.
    DestroyActiveWeakpoint<override>():void = external {}

    # Restores the active weakpoint to full health. Requires the device to be enabled. Must have active weakpoint.
    RestoreActiveWeakpoint<override>():void = external {}

    # Gets the active weakpoint's index starting at `0`, regardless of device's enabled state. Returns false if there is no active weakpoint, such as when the sequence is not active or directly after a weakpoint is destroyed.
    GetActiveWeakpointIndex<override>()<transacts><decides>:int = external {}

    # Gets the total number of weakpoints.
    GetWeakpointCount<override>():int = external {}

    # Get active weakpoint's health. If there is no active weakpoint, returns false.
    GetActiveWeakpointHealth<override>()<transacts><decides>:float = external {}

    # Set active weakpoint's health. Setting it to `0.0` will destroy the weakpoint. Clamps to maximum of WeakpointMaxHealth.
    SetActiveWeakpointHealth<override>(NewHealth:float):void = external {}

    # The max health of this device's weakpoints.
    var MaxWeakpointHealth<override>:float = external {}