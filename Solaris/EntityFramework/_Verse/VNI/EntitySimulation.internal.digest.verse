# Module import path: /Verse.org/Simulation
Simulation<public> := module:
    using {/Verse.org/SceneGraph}
    user<native><epic_internal> := class<epic_internal>:


    @hide_in_editor
    agent<native><public> := class<unique><epic_internal>(entity):
        User<native><epic_internal>:?user = external {}

    localizable_agent<native><epic_internal> := class(localizable_value):
        Value<native><epic_internal>:agent

    (/Verse.org/Simulation:)MakeLocalizableValue<epic_internal>(Agent:agent):localizable_agent = external {}

    @hide_in_editor
    player<native><public> := class<unique><persistent><module_scoped_var_weak_map_key><epic_internal>(agent):
        # Succeeds when this `player` may be used as a module-scoped `var` `weak_map` key. This coincides with the corresponding player having joined the game and not yet left. Using a `player` as a module-scope `var` `weak_map` key when this method fails results in a runtime error.
        IsActive<native><public>()<reads><decides>:void