using {/Verse.org/Simulation}
# Used to dynamically assemble or disassemble one or more building actors. Only available in LEGO islands.
assembly_device<public> := class<concrete><final>(creative_device_base, enableable):
    # Signaled when the device finishes assembling, at the same time as other 'finished' effects are started.
    AssemblyFinishedEvent<public>:listenable(?agent) = external {}

    # Signaled when the device finishes disassembling.
    DisassemblyFinishedEvent<public>:listenable(?agent) = external {}

    # Enable this object.
    Enable<override>():void = external {}

    # Disable this object.
    Disable<override>():void = external {}

    # Succeeds if the object is enabled, fails if itâs disabled.
    IsEnabled<override>()<transacts><decides>:void = external {}

    # Initiates the assembly process.
    Assemble<public>():void = external {}

    # Initiates the assembly process.
    Assemble<public>(Agent:agent):void = external {}

    # Initiates the disassembly process.
    Disassemble<public>():void = external {}

    # Initiates the disassembly process.
    Disassemble<public>(Agent:agent):void = external {}

    # Pause the assembly or disassembly process.
    Pause<public>():void = external {}

    # Pause the assembly or disassembly process.
    Pause<public>(Agent:agent):void = external {}

    # Succeeds if the device is paused, fails if it is not.
    IsPaused<public>()<transacts><decides>:void = external {}

    # Resets affected building actors to the state they were in at the start of the round.
    Reset<public>():void = external {}

    # Resets affected building actors to the state they were in at the start of the round.
    Reset<public>(Agent:agent):void = external {}

    # The amount of progress the device has made towards fully assembling (1.0) or fully disassembling (0.0).
    var<private> Progress<public>:float = external {}