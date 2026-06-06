note_on_message<epic_internal> := class:
    NoteNumber<public>:int = external {}

    Velocity<public>:float = external {}

note_off_message<epic_internal> := class:
    NoteNumber<public>:int = external {}

# Base class for all Patchwork devices.
patchwork_device<public> := class<concrete>(creative_device_base):
    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    GetBPFunctionNamesForValidation<override>():[]string = external {}