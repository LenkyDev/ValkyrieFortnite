# Verse path: /Fortnite.com/Devices/Patchwork
# Adjust Gain of a Patchwork audio signal.
gain_device<epic_internal> := class<concrete><final>(patchwork_device):
    var Gain<epic_internal>:float = external {}

    GetBPFunctionNamesForValidation<override>():[]string = external {}