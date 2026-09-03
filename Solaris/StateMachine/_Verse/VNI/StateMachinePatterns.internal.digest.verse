# Verse path: /UnrealEngine.com
# Module import path: /UnrealEngine.com/StateMachine
(/UnrealEngine.com:)StateMachine<public> := module:
    using {/Verse.org/StateMachine}
    # Module import path: /UnrealEngine.com/StateMachine/Patterns
    Patterns<public> := module:
        # Makes states from a list of factories.  Try each factory until one succeeds.  Returns the leaf states of the first factory that succeed.  Fails if no factory succeed.
        LinearSelector<epic_internal>(Factories:[]type {_()<transacts><decides>:make_leaves_result})<transacts><decides>:select_leaves_result = external {}

        # Makes states from a list of factories.  Try each factory until one succeeds.  Returns the leaf states of the first factory that succeed.  Fails if no factory succeed.  Used when the states can be injected or dynamic.
        LinearSelectorFrom<epic_internal>((Parent:t, Factories:[]type {_(:t)<transacts><decides>:make_leaves_result}) where t:type)<transacts><decides>:select_leaves_result = external {}

        # Makes states from a list of factories.  Try each factory in a random order until one succeeds.  Returns the leaf states of the first random factory that succeed.  Fails if no factory succeed.
        RandomSelector<epic_internal>(Factories:[]type {_()<transacts><decides>:make_leaves_result})<transacts><decides>:select_leaves_result = external {}

        # Makes states from a list of factories.  Try each factory in a random order until one succeeds.  Returns the leaf states of the first random factory that succeed.  Fails if no factory succeed.  Used when the states can be injected or dynamic.
        RandomSelectorFrom<epic_internal>((Parent:t, Factories:[]type {_(:t)<transacts><decides>:make_leaves_result}) where t:type)<transacts><decides>:select_leaves_result = external {}

        # Makes states from a list of factories.  Try each factory in order and compare the weighted score of each factory.  The factory with the biggest weighted score wins.  Returns the leaf states of the factory that succeed and has the biggest score.  Fails if no factory succeed.
        MaxWeightSelector<epic_internal>(Factories:[]type {_()<transacts><decides>:scored_leaves_result})<transacts><decides>:select_scored_leaves_result = external {}

        # Makes states from a list of factories.  Try each factory in order and compare the weighted score of each factory.  The factory with the biggest weighted score wins.  Returns the leaf states of the factory that succeed  and has the biggest score.  Fails if no factory succeed.  Used when the states can be injected or dynamic.
        MaxWeightSelectorFrom<epic_internal>((Parent:t, Factories:[]type {_(:t)<transacts><decides>:scored_leaves_result}) where t:type)<transacts><decides>:select_scored_leaves_result = external {}

        # Makes states from a list of factories.  Try each factory in the sequence from the provided Index.  Returns the leaf states of the first factory that succeed from Index.  Fails if no factory succeed.
        TrySequencer<epic_internal>(Factories:[]type {_()<transacts><decides>:make_leaves_result}, Index:int)<transacts><decides>:select_leaves_result = external {}

        # Makes states from a list of factories.  Try each factory in the sequence from the provided Index.  Returns the leaf states of the first factory that succeed from Index.  Fails if no factory succeed.  Used when the states can be injected or dynamic.
        TrySequencerFrom<epic_internal>((Parent:t, Factories:[]type {_(:t)<transacts><decides>:make_leaves_result}, Index:int) where t:type)<transacts><decides>:select_leaves_result = external {}

    # The result of a state's completion.  Used by final states to signal whether they completed successfully or failed.
    state_completed_result<epic_internal> := enum:
        Success
        Failure

    # Event sent via SendUp when a final state completes.  Propagates up the parent chain until a parent handles it in OnReceive.
    state_completed_event<epic_internal> := class(state_event):
        Result<public>:state_completed_result

    # A comparable, hashable handle that uniquely identifies a state factory.  Created via MakeStateHandle. Cannot be constructed directly by external code.  Use this to register, unregister, and identify factories.
    state_handle<native><public> := struct<concrete><computes>:
        Id<native>:int = external {}

    # Creates a new unique state handle. Each call returns a handle with a unique Id.
    MakeStateHandle<native><public>():state_handle

    make_state_result<epic_internal>(state_type:type) := struct:
        State:state_type

        Leaves:[]state

    # The result of a MakeLeaves function.  Contains the terminal states of the selection.  It can returns more than one leaf if it contains parallel states.
    make_leaves_result<epic_internal> := struct:
        Leaves:[]state = external {}

    # The result of a selector pattern such as LinearSelector or RandomSelector.  Contains the terminal states of the selection and the index of the selected factory.
    select_leaves_result<epic_internal> := struct:
        Leaves:[]state = external {}

        Index:int

    # The result of a MakeLeaves with an heuristic function.  Contains the terminal states of the selection and the index of the selected factory.
    scored_leaves_result<epic_internal> := struct:
        Leaves:[]state = external {}

        Score:float

    # The result of a heuristic selector pattern such as UtilitiesWeightedSelector. .  Contains the terminal states of the selection and the index of the selected factory.
    select_scored_leaves_result<epic_internal> := struct:
        Leaves:[]state = external {}

        Score:float

        Index:int

    # State that starts a suspends task and ends the task when it exits
    suspended_state<epic_internal> := class<abstract><unique><final_super>(state):
        OnEnter<override>():void = external {}

        OnSimulate<public>()<suspends>:void = external {}

        OnExit<override>():void = external {}