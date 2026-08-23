# Verse path: /Fortnite.com/Devices/Patchwork
# Turn Patchwork note inputs into audio using instrument samples.
instrument_player_device<public> := class<concrete><final>(patchwork_device):
    var Volume<epic_internal>:float = external {}

    var VibratoRate<epic_internal>:float = external {}

    var VibratoAmount<epic_internal>:float = external {}

    var Detune<epic_internal>:float = external {}

    var Instrument<epic_internal>:int = external {}

    GetBPFunctionNamesForValidation<override>():[]string = external {}