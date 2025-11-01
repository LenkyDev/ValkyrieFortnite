using {/Verse.org/Native}
@available {MinUploadedAtFNVersion := 3720}
# Module import path: /Fortnite.com/Input
Input<public> := module:
    using {/Verse.org/Native}
    @available {MinUploadedAtFNVersion := 3720}
    # Module import path: /Fortnite.com/Input/Character
    Character<public> := module:
        using {/Verse.org/Native}
        using {/Verse.org/Assets}
        @available {MinUploadedAtFNVersion := 3720}
        @experimental
        RangedWeaponMapping<public>:input_mapping = external {}

        @available {MinUploadedAtFNVersion := 3720}
        @experimental
        Reload<public>:input_action(logic) = external {}

        @available {MinUploadedAtFNVersion := 3720}
        @experimental
        WeaponPrimary<public>:input_action(logic) = external {}

        @available {MinUploadedAtFNVersion := 3720}
        @experimental
        WeaponSecondary<public>:input_action(logic) = external {}

        @available {MinUploadedAtFNVersion := 3720}
        @experimental
        TraversalMapping<public>:input_mapping = external {}

        @available {MinUploadedAtFNVersion := 3720}
        @experimental
        Crouch<public>:input_action(logic) = external {}

        @available {MinUploadedAtFNVersion := 3720}
        @experimental
        Sprint<public>:input_action(logic) = external {}

        @available {MinUploadedAtFNVersion := 3720}
        @experimental
        Jump<public>:input_action(logic) = external {}