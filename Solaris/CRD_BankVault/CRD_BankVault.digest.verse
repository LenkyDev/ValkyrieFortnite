using {/Verse.org/Simulation}
# A vault door that requires a start of a sequence to damage a number of weakpoints to open.
bank_vault_device<public> := class<concrete><final>(creative_device_base, enableable):
    # Enable the device.
    Enable<override>():void = external {}

    # Disable the device. Pauses vault sequence.
    Disable<override>():void = external {}

    # Succeeds if the device is enabled, fails if it's disabled.
    IsEnabled<override>()<transacts><decides>:void = external {}

    # Triggers when the vault sequence is started by a player or event.
    #  * Sends the triggering `agent` or none if the sequence was triggered by a function.
    StartSequenceEvent<public>:listenable(?agent) = external {}

    # Triggers when the vault is opened either by the destruction of its weakpoints or by an event.
    #  * Sends the last `agent` that damaged a weakpoint or the `agent` that started the sequence if no external damage was done or none if the sequence was triggered by a function.
    OpenEvent<public>:listenable(?agent) = external {}

    # Triggers when a weakpoint is activated. The weakpoint will begin to glow, but does not become vulnerable until a subsequent `WeakpointVulnerableEvent`
    #  * Sends the `agent` that activated the vault or none if the sequence was triggered by a function, and the `int` index of the weakpoint from 0-4, in order of activation.
    ActivateWeakpointEvent<public>:listenable(tuple(?agent, int)) = external {}

    # Triggers when a weakpoint becomes vulnerable.
    #  * Sends the `agent` that activated the vault or none if the sequence was triggered by a function, and the `int` index of the weakpoint from 0-4, in order of activation.
    WeakpointVulnerableEvent<public>:listenable(tuple(?agent, int)) = external {}

    # Triggers when a weakpoint is destroyed.
    #  * Sends the last `agent` that damaged the weakpoint or the `agent` that started the sequence if no external damage was done or none if the sequence was triggered by a function, and the `int` index of the weakpoint from 0-4, in order of activation.
    DestroyWeakpointEvent<public>:listenable(tuple(?agent, int)) = external {}

    # Destroys the remaining weakpoints and opens the vault door. Requires the device to be enabled.
    ForceOpen<public>():void = external {}

    # Begin the sequence of events to open the vault door without thermite, or unpauses the sequence if it was paused. Requires the device to be enabled. Weakpoints can only be damaged while the vault sequence is active.
    StartSequence<public>():void = external {}

    # Disable the weakpoint vulnerability and freeze the progress of each one. Weakpoints can only be damaged while the vault sequence is active.
    PauseSequence<public>():void = external {}

    # Restores vault to default state, deactivates the device, and heals all weakpoints to max health. Requires the device to be enabled.
    Reset<public>():void = external {}

    # Whether the vault sequence is currently active and not paused.
    IsSequenceActive<public>()<transacts><decides>:void = external {}