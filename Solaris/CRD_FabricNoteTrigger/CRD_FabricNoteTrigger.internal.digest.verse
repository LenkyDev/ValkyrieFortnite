# Verse path: /Fortnite.com/Devices/Patchwork
# Send events to devices based on Patchwork note inputs.
note_trigger_device<public> := class<concrete><final>(patchwork_device):
    # Signaled when the device receives a note-on that matches one of the enabled pitches.
    NoteOnReceivedEvent<epic_internal>:listenable(note_on_message) = external {}

    # Signaled when the device receives a note-off that matches one of the enabled pitches.
    NoteOffReceivedEvent<epic_internal>:listenable(note_off_message) = external {}