using {/Verse.org/Simulation}
@experimental
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
    (/Verse.org/subscribable_event:)subscribable_event_Variance<private>:?type {_(:t):tuple()} = external {}

    Broadcast<epic_internal>(Val:t):void = external {}