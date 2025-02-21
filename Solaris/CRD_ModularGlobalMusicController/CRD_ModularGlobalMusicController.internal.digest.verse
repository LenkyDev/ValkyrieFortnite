# Provides a shared tempo, key, and timeline for Patchwork devices to follow.
music_manager_device<public> := class<concrete><final>(patchwork_device):
    # Returns the tempo of the music manager, in beats per minute.
    GetTempoBPM<epic_internal>()<computes><reads>:float = external {}

    # Returns the number of elapsed beats since the Patchwork timeline has started, for tracking current musical time.
    GetElapsedBeats<epic_internal>()<computes><reads>:float = external {}