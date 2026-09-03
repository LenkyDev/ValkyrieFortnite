# Verse path: /UnrealEngine.com
# Module import path: /UnrealEngine.com/StateMachineTestSuite
StateMachineTestSuite<public> := module:
    using {/Verse.org/StateMachine}
    using {/Verse.org/Native}
    test_log_order<epic_internal> := class:


    test_log<epic_internal> := class:
        Add<public>(Message:string):void = external {}

        Reset<public>():void = external {}

        (/UnrealEngine.com/StateMachineTestSuite/test_log:)Print<public>():void = external {}

        Expect<public>(Message:string)<transacts><decides>:test_log_order = external {}

        Expect<public>(Order:test_log_order, Message:string)<transacts><decides>:test_log_order = external {}

    @import_as("/Script/StateMachineTestSuite.ATestRunnerNativeBase")
    test_runner_native_base<native><epic_internal> := class<abstract>:


    test_runner_base<native><epic_internal> := class<abstract>(test_runner_native_base):
        OnBegin<native_callable><public>()<suspends>:void = external {}

    test_state<epic_internal> := class<final_super>(state):
        TestLog<public>:test_log

        DebugName<public>:string

        OnReceive<override>(StateEvent:state_event):state_receive_result = external {}

        OnEnter<override>():void = external {}

        OnExit<override>():void = external {}

    # Module import path: /UnrealEngine.com/StateMachineTestSuite/Patterns_DynamicSelector
    Patterns_DynamicSelector<epic_internal> := module:
        # Module import path: /UnrealEngine.com/StateMachineTestSuite/Patterns_DynamicSelector/LocomotionStateMachine
        (/UnrealEngine.com/StateMachineTestSuite/Patterns_DynamicSelector:)LocomotionStateMachine<public> := module:
            using {/UnrealEngine.com/StateMachine}
            using {/Verse.org/StateMachine}
            public_move<public> := class<final_super>(state):


            (/UnrealEngine.com/StateMachineTestSuite/Patterns_DynamicSelector/LocomotionStateMachine:)locomotion_state_machine<public> := class(state_machine):
                RegisterMoveFactory<public>(Factory:type {_(:public_move)<transacts><decides>:make_leaves_result}):state_handle = external {}

                UnregisterMoveFactory<public>(Handle:state_handle):void = external {}

                Start<public>():void = external {}

    # Module import path: /UnrealEngine.com/StateMachineTestSuite/Patterns_EntryCondition
    Patterns_EntryCondition<epic_internal> := module:
        my_entity<public> := class:


        # Module import path: /UnrealEngine.com/StateMachineTestSuite/Patterns_EntryCondition/NPC_State_Machine
        (/UnrealEngine.com/StateMachineTestSuite/Patterns_EntryCondition:)NPC_State_Machine<public> := module:
            using {/Verse.org/StateMachine}
            (/UnrealEngine.com/StateMachineTestSuite/Patterns_EntryCondition/NPC_State_Machine:)npc_state_machine<public> := class(state_machine):
                Start<public>():void = external {}

                SetTarget<public>(NewTarget:?my_entity):void = external {}

    # Module import path: /UnrealEngine.com/StateMachineTestSuite/Patterns_FinalState
    Patterns_FinalState<epic_internal> := module:
        # Module import path: /UnrealEngine.com/StateMachineTestSuite/Patterns_FinalState/NPC_State_Machine
        (/UnrealEngine.com/StateMachineTestSuite/Patterns_FinalState:)NPC_State_Machine<public> := module:
            using {/Verse.org/StateMachine}
            (/UnrealEngine.com/StateMachineTestSuite/Patterns_FinalState/NPC_State_Machine:)npc_state_machine<public> := class(state_machine):
                Start<public>():void = external {}

    # Module import path: /UnrealEngine.com/StateMachineTestSuite/Patterns_HistorySelector
    Patterns_HistorySelector<epic_internal> := module:
        # Module import path: /UnrealEngine.com/StateMachineTestSuite/Patterns_HistorySelector/LocomotionStateMachine
        (/UnrealEngine.com/StateMachineTestSuite/Patterns_HistorySelector:)LocomotionStateMachine<public> := module:
            using {/Verse.org/StateMachine}
            (/UnrealEngine.com/StateMachineTestSuite/Patterns_HistorySelector/LocomotionStateMachine:)locomotion_state_machine<public> := class(state_machine):
                Start<public>():void = external {}

    # Module import path: /UnrealEngine.com/StateMachineTestSuite/Patterns_InjectionState
    Patterns_InjectionState<epic_internal> := module:
        # Module import path: /UnrealEngine.com/StateMachineTestSuite/Patterns_InjectionState/NPC_State_Machine
        (/UnrealEngine.com/StateMachineTestSuite/Patterns_InjectionState:)NPC_State_Machine<public> := module:
            using {/Verse.org/StateMachine}
            attack_state_base<public> := class<final_super>(state):


            (/UnrealEngine.com/StateMachineTestSuite/Patterns_InjectionState/NPC_State_Machine:)npc_state_machine<public> := class(state_machine):
                Start<public>():void = external {}

    # Module import path: /UnrealEngine.com/StateMachineTestSuite/Patterns_LinearSelector
    Patterns_LinearSelector<epic_internal> := module:
        # Module import path: /UnrealEngine.com/StateMachineTestSuite/Patterns_LinearSelector/LocomotionStateMachine
        (/UnrealEngine.com/StateMachineTestSuite/Patterns_LinearSelector:)LocomotionStateMachine<public> := module:
            using {/UnrealEngine.com/StateMachine}
            using {/Verse.org/StateMachine}
            (/UnrealEngine.com/StateMachineTestSuite/Patterns_LinearSelector/LocomotionStateMachine:)locomotion_state_machine<public> := class(state_machine):
                Start<public>():void = external {}

            (/UnrealEngine.com/StateMachineTestSuite/Patterns_LinearSelector/LocomotionStateMachine:)root<public> := class<final_super>(state):
                Parent<override>:(/UnrealEngine.com/StateMachineTestSuite/Patterns_LinearSelector/LocomotionStateMachine:)locomotion_state_machine

            (/UnrealEngine.com/StateMachineTestSuite/Patterns_LinearSelector/LocomotionStateMachine:)move<public> := class<final_super>(state):
                Parent<override>:(/UnrealEngine.com/StateMachineTestSuite/Patterns_LinearSelector/LocomotionStateMachine:)root

                TryMakeChildren<public>()<transacts><decides>:make_leaves_result = external {}

                TryMakeWalk<protected>()<transacts><decides>:make_leaves_result = external {}

                TryMakeRun<protected>()<transacts><decides>:make_leaves_result = external {}

                TryMakeUseVehicle<protected>()<transacts><decides>:make_leaves_result = external {}

            (/UnrealEngine.com/StateMachineTestSuite/Patterns_LinearSelector/LocomotionStateMachine:)walk<public> := class<final_super>(state):
                Parent<override>:(/UnrealEngine.com/StateMachineTestSuite/Patterns_LinearSelector/LocomotionStateMachine:)move

                CanEnter<public>()<transacts><decides>:void = external {}

                TryMakeChildren<public>()<transacts><decides>:make_leaves_result = external {}

            (/UnrealEngine.com/StateMachineTestSuite/Patterns_LinearSelector/LocomotionStateMachine:)run<public> := class<final_super>(state):
                Parent<override>:(/UnrealEngine.com/StateMachineTestSuite/Patterns_LinearSelector/LocomotionStateMachine:)move

            (/UnrealEngine.com/StateMachineTestSuite/Patterns_LinearSelector/LocomotionStateMachine:)use_vehicle<public> := class<final_super>(state):
                Parent<override>:(/UnrealEngine.com/StateMachineTestSuite/Patterns_LinearSelector/LocomotionStateMachine:)move

    # Module import path: /UnrealEngine.com/StateMachineTestSuite/Patterns_OverrideState
    Patterns_OverrideState<epic_internal> := module:
        # Module import path: /UnrealEngine.com/StateMachineTestSuite/Patterns_OverrideState/LocomotionStateMachine
        (/UnrealEngine.com/StateMachineTestSuite/Patterns_OverrideState:)LocomotionStateMachine<public> := module:
            using {/UnrealEngine.com/StateMachine}
            using {/Verse.org/StateMachine}
            (/UnrealEngine.com/StateMachineTestSuite/Patterns_OverrideState/LocomotionStateMachine:)locomotion_state_machine<public> := class(state_machine):
                Start<public>():void = external {}

                MakeRoot<protected>():make_leaves_result = external {}

            (/UnrealEngine.com/StateMachineTestSuite/Patterns_OverrideState/LocomotionStateMachine:)root<public> := class<final_super>(state):
                Parent<override>:(/UnrealEngine.com/StateMachineTestSuite/Patterns_OverrideState/LocomotionStateMachine:)locomotion_state_machine

                TryMakeChildren<public>()<transacts><decides>:make_leaves_result = external {}

                TryMakeMove<protected>()<transacts><decides>:make_leaves_result = external {}

            (/UnrealEngine.com/StateMachineTestSuite/Patterns_OverrideState/LocomotionStateMachine:)move<public> := class<final_super>(state):
                Parent<override>:(/UnrealEngine.com/StateMachineTestSuite/Patterns_OverrideState/LocomotionStateMachine:)root

                TryMakeChildren<public>()<transacts><decides>:make_leaves_result = external {}

                TryMakeWalk<protected>()<transacts><decides>:make_leaves_result = external {}

                TryMakeRun<protected>()<transacts><decides>:make_leaves_result = external {}

                (/UnrealEngine.com/StateMachineTestSuite/Patterns_OverrideState/LocomotionStateMachine/move:)TryMakeSwim<protected>()<transacts><decides>:make_leaves_result = external {}

            (/UnrealEngine.com/StateMachineTestSuite/Patterns_OverrideState/LocomotionStateMachine:)walk<public> := class<final_super>(state):
                Parent<override>:(/UnrealEngine.com/StateMachineTestSuite/Patterns_OverrideState/LocomotionStateMachine:)move

                TryMakeChildren<public>()<transacts><decides>:make_leaves_result = external {}

                OnEnter<override>():void = external {}

            (/UnrealEngine.com/StateMachineTestSuite/Patterns_OverrideState/LocomotionStateMachine:)run<public> := class<final_super>(state):
                Parent<override>:(/UnrealEngine.com/StateMachineTestSuite/Patterns_OverrideState/LocomotionStateMachine:)move

            (/UnrealEngine.com/StateMachineTestSuite/Patterns_OverrideState/LocomotionStateMachine:)swim<public> := class<final_super>(state):
                Parent<override>:(/UnrealEngine.com/StateMachineTestSuite/Patterns_OverrideState/LocomotionStateMachine:)move

        # Module import path: /UnrealEngine.com/StateMachineTestSuite/Patterns_OverrideState/UserCode
        UserCode<public> := module:
            using {/UnrealEngine.com/StateMachine}
            using {/UnrealEngine.com/StateMachineTestSuite/Patterns_OverrideState/LocomotionStateMachine}
            my_walk<public> := class((/UnrealEngine.com/StateMachineTestSuite/Patterns_OverrideState/LocomotionStateMachine:)walk):
                OnEnter<override>():void = external {}

            my_move<public> := class((/UnrealEngine.com/StateMachineTestSuite/Patterns_OverrideState/LocomotionStateMachine:)move):
                TryMakeWalk<override>()<transacts><decides>:make_leaves_result = external {}

            my_root<public> := class((/UnrealEngine.com/StateMachineTestSuite/Patterns_OverrideState/LocomotionStateMachine:)root):
                TryMakeMove<override>()<transacts><decides>:make_leaves_result = external {}

            my_locomotion_state_machine<public> := class((/UnrealEngine.com/StateMachineTestSuite/Patterns_OverrideState/LocomotionStateMachine:)locomotion_state_machine):
                MakeRoot<override>():make_leaves_result = external {}

    # Module import path: /UnrealEngine.com/StateMachineTestSuite/Patterns_Sequencer
    Patterns_Sequencer<epic_internal> := module:
        # Module import path: /UnrealEngine.com/StateMachineTestSuite/Patterns_Sequencer/NPC_State_Machine
        (/UnrealEngine.com/StateMachineTestSuite/Patterns_Sequencer:)NPC_State_Machine<public> := module:
            using {/Verse.org/StateMachine}
            (/UnrealEngine.com/StateMachineTestSuite/Patterns_Sequencer/NPC_State_Machine:)npc_state_machine<public> := class(state_machine):
                Start<public>():void = external {}

    # Module import path: /UnrealEngine.com/StateMachineTestSuite/Patterns_TrySequencer
    Patterns_TrySequencer<epic_internal> := module:
        # Module import path: /UnrealEngine.com/StateMachineTestSuite/Patterns_TrySequencer/NPC_State_Machine
        (/UnrealEngine.com/StateMachineTestSuite/Patterns_TrySequencer:)NPC_State_Machine<public> := module:
            using {/Verse.org/StateMachine}
            (/UnrealEngine.com/StateMachineTestSuite/Patterns_TrySequencer/NPC_State_Machine:)npc_state_machine<public> := class(state_machine):
                Start<public>():void = external {}

    # Module import path: /UnrealEngine.com/StateMachineTestSuite/Patterns_WeightedSelector
    Patterns_WeightedSelector<epic_internal> := module:
        # Module import path: /UnrealEngine.com/StateMachineTestSuite/Patterns_WeightedSelector/LocomotionStateMachine
        (/UnrealEngine.com/StateMachineTestSuite/Patterns_WeightedSelector:)LocomotionStateMachine<public> := module:
            using {/Verse.org/StateMachine}
            (/UnrealEngine.com/StateMachineTestSuite/Patterns_WeightedSelector/LocomotionStateMachine:)locomotion_state_machine<public> := class(state_machine):
                Start<public>():void = external {}