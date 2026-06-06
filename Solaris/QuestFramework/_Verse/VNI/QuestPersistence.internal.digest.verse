using {/Verse.org/Progression}
progress_objective_snapshot<native><epic_internal> := class<final><persistable><epic_internal>:
    ObjectiveId<native><epic_internal>:string = external {}

    ObjectiveVersePath<native><epic_internal>:string = external {}

    Progress<native><epic_internal>:float = external {}

    RequiredCount<native><epic_internal>:float = external {}

composite_objective_snapshot<native><epic_internal> := class<final><persistable><epic_internal>:
    ObjectiveId<native><epic_internal>:string = external {}

    ObjectiveVersePath<native><epic_internal>:string = external {}

    CompletedCount<native><epic_internal>:int = external {}

    RequiredCount<native><epic_internal>:int = external {}

    Children<native><epic_internal>:[]objective_snapshot = external {}

sequential_objective_snapshot<native><epic_internal> := class<final><persistable><epic_internal>:
    ObjectiveId<native><epic_internal>:string = external {}

    ObjectiveVersePath<native><epic_internal>:string = external {}

    CurrentIndex<native><epic_internal>:int = external {}

    Children<native><epic_internal>:[]objective_snapshot = external {}

timed_objective_snapshot<native><epic_internal> := class<final><persistable><epic_internal>:
    ObjectiveId<native><epic_internal>:string = external {}

    ObjectiveVersePath<native><epic_internal>:string = external {}

    TimeRemainingMs<native><epic_internal>:int = external {}

    Inner<native><epic_internal>:?objective_snapshot = external {}

state_machine_objective_snapshot<native><epic_internal> := class<final><persistable><epic_internal>:
    ObjectiveId<native><epic_internal>:string = external {}

    ObjectiveVersePath<native><epic_internal>:string = external {}

    CurrentStateId<native><epic_internal>:string = external {}

objective_snapshot<native><epic_internal> := class<final><persistable><epic_internal>:
    Progress<native><epic_internal>:?progress_objective_snapshot = external {}

    Sequential<native><epic_internal>:?sequential_objective_snapshot = external {}

    Composite<native><epic_internal>:?composite_objective_snapshot = external {}

    Timed<native><epic_internal>:?timed_objective_snapshot = external {}

    StateMachine<native><epic_internal>:?state_machine_objective_snapshot = external {}

SnapshotQuestData<native><epic_internal>(Quest:quest)<reads>:quest_progress_data

RestoreQuestData<native><epic_internal>(Data:quest_progress_data)<transacts><decides>:quest

quest_progress_data<native><epic_internal> := class<final><persistable><epic_internal>:
    QuestId<native><epic_internal>:string = external {}

    QuestVersePath<native><epic_internal>:string = external {}

    State<native><epic_internal>:quest_state = external {}

    Objective<native><epic_internal>:?objective_snapshot = external {}