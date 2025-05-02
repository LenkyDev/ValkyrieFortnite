# Apply a distortion effect to Patchwork audio inputs.
distortion_effect_device<public> := class<concrete><final>(patchwork_device):
    var Mix<epic_internal>:float = external {}

    var Tame<epic_internal>:float = external {}

    var Shatter<epic_internal>:float = external {}

    var Drive<epic_internal>:float = external {}

    var Style<epic_internal>:int = external {}