# Verse path: /Fortnite.com/Devices/Patchwork
# Apply a filter effect to Patchwork audio inputs.
filter_effect_device<epic_internal> := class<concrete><final>(patchwork_device):
    var Cutoff<public>:float = external {}

    var Resonance<public>:float = external {}

    var Mix<public>:float = external {}

    var FilterType<public>:int = external {}

    GetBPFunctionNamesForValidation<override>():[]string = external {}