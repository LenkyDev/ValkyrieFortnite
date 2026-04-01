# Module import path: /Verse.org/Simulation
Simulation<public> := module:
    using {/Verse.org/SceneGraph}
    agent<native><public> := class<unique><epic_internal>(entity):
        # All entities possessed by this agent.
        var<private> PossessedEntities<native><epic_internal>:[]possessable_component = external {}

        # Event that will fire when a new entity is possessed.
        BeginPossessEvent<native><epic_internal>:listenable(possessable_component) = external {}

        # Event that will fire when an entity is unpossessed.
        #  Entities are automatically unpossessed when removed from the scene
        EndPossessEvent<native><epic_internal>:listenable(possessable_component) = external {}

        # Possess an entity. Fails if PossessableComponent.CanBePossessedBy[Self] fails.
        BeginPossess<native_callable><epic_internal>(PossessableComponent:possessable_component)<transacts><decides>:void = external {}

        # Unpossesses an entity.
        EndPossess<native_callable><epic_internal>(PossessableComponent:possessable_component)<transacts>:void = external {}

        # Checks if an entity is possessed.
        IsEntityPossessed<native_callable><epic_internal>(PossessableComponent:possessable_component)<reads><decides>:void = external {}

        # Signals the BeginPossessEvent.
        SignalBeginPossessEvent<native><epic_internal>(PossessableComponent:possessable_component)<transacts>:void

        # Signals the EndPossessEvent.
        SignalEndPossessEvent<native><epic_internal>(PossessableComponent:possessable_component)<transacts>:void

    localizable_agent<native><epic_internal> := class(localizable_value):
        Value<native><epic_internal>:agent

    (/Verse.org/Simulation:)MakeLocalizableValue<epic_internal>(Agent:agent):localizable_agent = external {}

    user<native><epic_internal> := class<epic_internal>:


    player<native><public> := class<unique><persistent><module_scoped_var_weak_map_key><epic_internal>(agent):
        # Succeeds when this `player` may be used as a module-scoped `var` `weak_map` key. This coincides with the corresponding player having joined the game and not yet left. Using a `player` as a module-scope `var` `weak_map` key when this method fails results in a runtime error.
        IsActive<native><public>()<reads><decides>:void

    # Payload of the AgentChangeEvent. Contains the previous and the current possessing agent.
    agent_changed_result<native><epic_internal> := struct:
        PreviousAgent<native>:?agent = external {}

        CurrentAgent<native>:?agent = external {}

    # Marks an entity that can be possessed by an agent.
    possessable_component<native><epic_internal> := class<final_super>(component):
        # Which agent is this entity currently possessed by.
        var<private> Agent<native><final><epic_internal>:?agent = external {}

        # Notify when the possessing agent changes.
        AgentChangeEvent<native><final><epic_internal>:listenable(agent_changed_result) = external {}

        # Entity's opinion on whether it can be possessed by a specific agent.
        #  By default it fails if the entity is already possessed.
        CanBePossessedBy<native_callable><epic_internal>(AgentToCheck:agent)<reads><decides>:void = external {}

        # Internal function to call when possessing for updating status and triggering the AgentChangeEvent.
        BeginPossess<final><epic_internal>(NewPossessingAgent:agent)<transacts>:void = external {}

        # Internal function to call when unpossessing for updating status and triggering the AgentChangeEvent.
        EndPossess<final><epic_internal>()<transacts>:void = external {}

        # Signals the AgentChangeEvent.
        SignalAgentChangeEvent<final><epic_internal>(PreviousAgent:?agent)<transacts>:void = external {}

        # Internal function that signals the AgentChangeEvent.
        SignalAgentChangeEventInternal<native><final><epic_internal>(AgentChangedResult:agent_changed_result)<transacts>:void