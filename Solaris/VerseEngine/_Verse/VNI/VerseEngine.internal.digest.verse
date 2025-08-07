using {/Verse.org/Simulation}
# Module import path: /Verse.org/VerseEngine
VerseEngine<public> := module:
    DefaultEmptyString<localizes><epic_internal>:message = external {}

    # Interface that provides descriptive names or text.
    has_description<public> := interface:
        @editable
        # Name.
        var<protected> Name<public>:message = external {}

        @editable
        # Full description.
        var<protected> Description<public>:message = external {}

        @editable
        # Short description with only the essential information.
        var<protected> ShortDescription<public>:message = external {}

    subscribable_event<epic_internal>(t:type) := class(subscribable_event_intrnl(t)):
        Broadcast<epic_internal>(Val:t):void = external {}