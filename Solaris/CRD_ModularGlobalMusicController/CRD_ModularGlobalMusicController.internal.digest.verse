# Provides a shared tempo, key, and timeline for Patchwork devices to follow.
music_manager_device<public> := class<concrete><final>(patchwork_device):
    var TempoBPM<epic_internal>:float = external {}

    var TimeSignatureTop<epic_internal>:int = external {}

    var TimeSignatureBottom<epic_internal>:int = external {}

    var Key<epic_internal>:int = external {}

    var Mode<epic_internal>:int = external {}

    # Returns the number of elapsed beats since the Patchwork timeline has started, for tracking current musical time.
    GetElapsedBeats<epic_internal>()<reads>:float = external {}

    GetBPFunctionNamesForValidation<override>():[]string = external {}