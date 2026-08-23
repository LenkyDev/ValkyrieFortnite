# Verse path: /Verse.org
# Module import path: /Verse.org/StateMachine
StateMachine<public> := module:
    state<native><epic_internal> := class<abstract><unique><final_super_base>(state_container):
        # The parent of the state.
        Parent<native><public>:state_container

        # Called by the state machine (in correct order) when the state is activated.
        OnEnter<native><native_callable><public>():void

        # Called by the state machine (in correct order) when the state is deactivated.
        OnExit<native><native_callable><public>():void

        # Send a scene event to this state. OnReceive will be invoked propagating to the child states. Consuming the event at any point will halt propagation. A state that is not active at any point will halt propagation. Returns true if any participant consumed the event.
        SendDown<native><final><public>(StateEvent:state_event):logic

        # Send a scene event to this state. OnReceive will be invoked propagating to the parent's state. Consuming the event at any point will halt propagation. A state that is not active at any point will halt propagation. Returns true if any participant consumed the event.
        SendUp<native><final><public>(StateEvent:state_event):logic

        # Transition to the new leaf states, replacing all the active states child of this state, and keeping the other leaves active.  Propagating from leaf to root, OnExit will be invoked on active states that are not in the new transition.  Then, propagating from root to leaf, OnEnter will be invoked for the new states that were not previously activated.  Other transitions can occur while invoking OnExit or in OnEnter.  The current OnExit or OnEnter invocation will complete before the new transition executes.  The previous transition will merge with the new transition. In case of conflict, the new transition takes precedence.
        TransitionUnder<final><public>(Leaves:[]state):void = external {}

    state_event<native><epic_internal> := interface:


    state_receive_result<native><epic_internal> := enum:
        Consume
        Preserve
        Continue

    state_container<native><epic_internal> := class<unique>:
        # Respond to a state event. Return true to consume the event and halt propagation to the next state/state_machine.
        OnReceive<native><native_callable><protected>(StateEvent:state_event):state_receive_result

    state_tree_node<native><epic_internal> := struct:
        State<native><public>:state_container

        Children<native><public>:[]state

    # Wether the Leaf is the Parent state, or is a child of the Parent state.
    IsChildStateOf<native><epic_internal>(Leaf:state, Parent:state_container)<decides><reads>:void

    # Wether the leaves are the Parent state, or are a child of the Parent state.
    AreChildStatesOf<native><epic_internal>(Leaves:[]state, Parent:state_container)<decides><reads>:void

    state_machine<native><epic_internal> := class(state_container, diagnosable):
        # Transition to the new leaf states, replacing all the active states.  Propagating from leaf to root, OnExit will be invoked on active states that are not in the new transition.  Then, propagating from root to leaf, OnEnter will be invoked for the new states that were not previously activated.  Other transitions can occur while invoking OnExit or in OnEnter.  The current OnExit or OnEnter invocation will complete before the new transition executes.  The previous transition will merge with the new transition. In case of conflict, the new transition takes precedence.
        TransitionTo<final><public>(Leaves:[]state):void = external {}

        # Transition to the new leaf states, replacing all the active states child of Parent state, and keeping the other leaves active.  Propagating from leaf to root, OnExit will be invoked on active states that are not in the new transition.  Then, propagating from root to leaf, OnEnter will be invoked for the new states that were not previously activated.  Other transitions can occur while invoking OnExit or in OnEnter.  The current OnExit or OnEnter invocation will complete before the new transition executes.  The previous transition will merge with the new transition. In case of conflict, the new transition takes precedence.
        TransitionUnder<final><public>(Parent:state, Leaves:[]state):void = external {}

        # Send a scene event to this state machine. OnReceive will be invoked from the root states propagating to the child states. It uses the depth-first pre-order algorithm for progapating the event. Consuming the event at any point will halt propagation. Returns true if any participant consumed the event.
        SendDown<native><final><public>(StateEvent:state_event):logic

        # Send a scene event to this state machine. OnReceive will be invoked on each active leaf states on this state machine propagating to the parent's state. It uses the depth-first post-order algorithm for progapating the event. Consuming the event at any point will halt propagation. Returns true if any participant consumed the event.
        SendUp<native><final><public>(StateEvent:state_event):logic

        GetDiagnostic<override><native>()<reads>:diagnostic