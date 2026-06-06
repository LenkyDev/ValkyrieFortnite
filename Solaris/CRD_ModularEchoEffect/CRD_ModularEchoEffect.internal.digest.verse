# Apply an echo effect to Patchwork audio inputs.
echo_effect_device<public> := class<concrete><final>(patchwork_device):
    var TimingStyle<epic_internal>:int = external {}

    var Mix<epic_internal>:float = external {}

    var Filter<epic_internal>:float = external {}

    var Feedback<epic_internal>:float = external {}

    var BeatDelay<epic_internal>:float = external {}

    GetBPFunctionNamesForValidation<override>():[]string = external {}