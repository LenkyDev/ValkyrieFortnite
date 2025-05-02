# Create melodic note patterns for Patchwork devices.
note_sequencer_device<public> := class<concrete><final>(patchwork_device):
    var Page<epic_internal>:int = external {}

    var Octave<epic_internal>:int = external {}

    var Length<epic_internal>:int = external {}

    var IsMonophonic<epic_internal>:logic = external {}

    var IsChromatic<epic_internal>:logic = external {}

    var GridHeight<epic_internal>:int = external {}

    var StepRate<epic_internal>:float = external {}

    var TimingStyle<epic_internal>:int = external {}