# Verse path: /Verse.org
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
        IsActive<native><public>()<decides><reads>:void

    # This class is used for the per-player primitive data feature on mesh_components. Users can derive from it and add fields  and access this user data in callbacks subscribed to ComputePlayerPrimitiveDataEvent.
    player_primitive_data_payload<native><epic_internal> := class:
        PredictsTransport<epic_internal>():void = external {}

        SubscribeToEvent<epic_internal>(Event:subscribable_event_intrnl(tuple()))<transacts>:cancelable = external {}

    player_primitive_data_context<native><epic_internal> := class:
        Player<native><epic_internal>:player

        Entity<native><epic_internal>:entity

        UserData<native><epic_internal>:player_primitive_data_payload = external {}

        WriteFloat<native><epic_internal>(Index:int, Value:float):void

        WriteVector4<native><epic_internal>(Index:int, X:float, Y:float, Z:float, W:float):void