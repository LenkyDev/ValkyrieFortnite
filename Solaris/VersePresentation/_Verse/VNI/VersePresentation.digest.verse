using {/Verse.org/Simulation}
@experimental
# Interface that provides descriptive names or text.
has_description<public> := interface:
    @editable
    # Name.
    var<protected> Name<public>:message

    @editable
    # Full description.
    var<protected> Description<public>:message

    @editable
    # Short description with only the essential information.
    var<protected> ShortDescription<public>:message