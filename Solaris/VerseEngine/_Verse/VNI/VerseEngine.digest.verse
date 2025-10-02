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