# Verse path: /Fortnite.com
using {/Verse.org/Native}
@available {MinUploadedAtFNVersion := 3720}
# Module import path: /Fortnite.com/Input
(/Fortnite.com:)Input<public> := module:
    using {/Verse.org/Native}
    @available {MinUploadedAtFNVersion := 3720}
    # Module import path: /Fortnite.com/Input/Character
    Character<public> := module:
        using {/Verse.org/SpatialMath}
        using {/Verse.org/Native}
        using {/Verse.org/Assets}
        @available {MinUploadedAtFNVersion := 3720}
        RangedWeaponMapping<public>:input_mapping = external {}

        @available {MinUploadedAtFNVersion := 3720}
        Reload<public>:input_action(logic) = external {}

        @available {MinUploadedAtFNVersion := 3720}
        WeaponPrimary<public>:input_action(logic) = external {}

        @available {MinUploadedAtFNVersion := 3720}
        WeaponSecondary<public>:input_action(logic) = external {}

        @available {MinUploadedAtFNVersion := 3720}
        TraversalMapping<public>:input_mapping = external {}

        @available {MinUploadedAtFNVersion := 3720}
        Crouch<public>:input_action(logic) = external {}

        @available {MinUploadedAtFNVersion := 3720}
        Sprint<public>:input_action(logic) = external {}

        @available {MinUploadedAtFNVersion := 3720}
        Jump<public>:input_action(logic) = external {}

        @experimental
        @available {MinUploadedAtFNVersion := 4210}
        Interact<public>:input_action(logic) = external {}

        @experimental
        @available {MinUploadedAtFNVersion := 4210}
        InteractMapping<public>:input_mapping = external {}

        @experimental
        @available {MinUploadedAtFNVersion := 4210}
        Move<public>:input_action((/Verse.org/SpatialMath:)vector3) = external {}