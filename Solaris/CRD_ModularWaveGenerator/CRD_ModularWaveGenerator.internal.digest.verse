# Verse path: /Fortnite.com/Devices/Patchwork
# Modify a setting on another Patchwork device in a regularly repeating pattern.
lfo_modulator_device<public> := class<concrete><final>(patchwork_device):
    var Minimum<epic_internal>:float = external {}

    var Maximum<epic_internal>:float = external {}

    var Shape<epic_internal>:float = external {}

    var TimingStyle<epic_internal>:int = external {}

    var Offset<epic_internal>:float = external {}

    var Waveform<epic_internal>:int = external {}

    var Rate<epic_internal>:float = external {}

    var FreeSpeedHz<epic_internal>:float = external {}

    GetBPFunctionNamesForValidation<override>():[]string = external {}