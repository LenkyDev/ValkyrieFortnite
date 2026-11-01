# Verse path: /Verse.org
# Module import path: /Verse.org/VerseStateMachineTestSuite
VerseStateMachineTestSuite<public> := module:
    using {/Verse.org/StateMachine}
    test_mock_state<native><epic_internal> := class<final_super>(state):
        OnEnter<override><native>():void

        OnExit<override><native>():void

        OnReceive<override><native>(StateEvent:state_event):state_receive_result

    test_mock_state_machine<native><epic_internal> := class(state_machine):


    test_mock_state_event<native><epic_internal> := class(state_event):
