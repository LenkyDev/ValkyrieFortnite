using {/Verse.org/Assets}
# Module import path: /Fortnite.com/InputExperimental/Character
Character<epic_internal> := module:
    @experimental
    RangedWeaponMapping<public>:input_mapping = external {}

    @experimental
    Reload<public>:input_action(logic) = external {}

    @experimental
    WeaponPrimary<public>:input_action(logic) = external {}

    @experimental
    WeaponSecondary<public>:input_action(logic) = external {}

    @experimental
    TraversalMapping<public>:input_mapping = external {}

    @experimental
    Crouch<public>:input_action(logic) = external {}

    @experimental
    Sprint<public>:input_action(logic) = external {}

    @experimental
    Jump<public>:input_action(logic) = external {}