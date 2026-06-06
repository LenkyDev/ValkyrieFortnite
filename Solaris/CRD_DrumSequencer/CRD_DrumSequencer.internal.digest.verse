# Create drum note patterns for Patchwork devices.
drum_sequencer_device<public> := class<concrete><final>(patchwork_device):
    var Page<epic_internal>:int = external {}

    var IsTriplet<epic_internal>:logic = external {}

    GetBPFunctionNamesForValidation<override>():[]string = external {}