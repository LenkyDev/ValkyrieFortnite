# Turn Patchwork note inputs into audio using customizable sound synthesis.
omega_synthesizer_device<public> := class<concrete><final>(patchwork_device):
    var Volume<epic_internal>:float = external {}

    var Tone<epic_internal>:float = external {}

    var Bite<epic_internal>:float = external {}

    var Glide<epic_internal>:float = external {}

    var Overdrive<epic_internal>:float = external {}

    var Resonance<epic_internal>:float = external {}

    var Sync<epic_internal>:float = external {}

    GetBPFunctionNamesForValidation<override>():[]string = external {}