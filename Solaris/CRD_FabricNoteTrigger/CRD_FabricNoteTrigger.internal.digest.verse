# Verse path: /Fortnite.com/Devices/Patchwork
device_event_noteon<epic_internal> := class(listenable(any)):
    BPEvent<epic_internal>:listenable(tuple(int, float))

    Subscribe<override>(Callback:type {_(:any):void})<transacts>:cancelable = external {}

    Await<override>()<suspends>:note_on_message = external {}

noteon_event_wrapper<epic_internal> := class:
    OutputFunc<epic_internal>:type {_(:any):void}

device_event_noteoff<epic_internal> := class(listenable(any)):
    BPEvent<epic_internal>:listenable(int)

    Subscribe<override>(Callback:type {_(:any):void})<transacts>:cancelable = external {}

    Await<override>()<suspends>:note_off_message = external {}

noteoff_event_wrapper<epic_internal> := class:
    OutputFunc<epic_internal>:type {_(:any):void}

# Send events to devices based on Patchwork note inputs.
note_trigger_device<public> := class<concrete><final>(patchwork_device):
    # Signaled when the device receives a note-on that matches one of the enabled pitches.
    NoteOnReceivedEvent<epic_internal>:listenable(note_on_message) = external {}

    # Signaled when the device receives a note-off that matches one of the enabled pitches.
    NoteOffReceivedEvent<epic_internal>:listenable(note_off_message) = external {}