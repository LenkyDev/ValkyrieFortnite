using {/Verse.org/Progression}
@experimental
progress_objective_snapshot<native><epic_internal> := class<final><persistable><epic_internal>:
    ObjectiveId<native><epic_internal>:string = external {}

    ObjectiveVersePath<native><epic_internal>:string = external {}

    Progress<native><epic_internal>:float = external {}

    RequiredCount<native><epic_internal>:float = external {}

@experimental
composite_objective_snapshot<native><epic_internal> := class<final><persistable><epic_internal>:
    ObjectiveId<native><epic_internal>:string = external {}

    ObjectiveVersePath<native><epic_internal>:string = external {}

    CompletedCount<native><epic_internal>:int = external {}

    RequiredCount<native><epic_internal>:int = external {}

    Children<native><epic_internal>:[]objective_snapshot = external {}

@experimental
sequential_objective_snapshot<native><epic_internal> := class<final><persistable><epic_internal>:
    ObjectiveId<native><epic_internal>:string = external {}

    ObjectiveVersePath<native><epic_internal>:string = external {}

    CurrentIndex<native><epic_internal>:int = external {}

    Children<native><epic_internal>:[]objective_snapshot = external {}

@experimental
timed_objective_snapshot<native><epic_internal> := class<final><persistable><epic_internal>:
    ObjectiveId<native><epic_internal>:string = external {}

    ObjectiveVersePath<native><epic_internal>:string = external {}

    TimeRemainingMs<native><epic_internal>:int = external {}

    Inner<native><epic_internal>:?objective_snapshot = external {}

@experimental
state_machine_objective_snapshot<native><epic_internal> := class<final><persistable><epic_internal>:
    ObjectiveId<native><epic_internal>:string = external {}

    ObjectiveVersePath<native><epic_internal>:string = external {}

    CurrentStateId<native><epic_internal>:string = external {}

@experimental
objective_snapshot<native><epic_internal> := class<final><persistable><epic_internal>:
    Progress<native><epic_internal>:?progress_objective_snapshot = external {}

    Sequential<native><epic_internal>:?sequential_objective_snapshot = external {}

    Composite<native><epic_internal>:?composite_objective_snapshot = external {}

    Timed<native><epic_internal>:?timed_objective_snapshot = external {}

    StateMachine<native><epic_internal>:?state_machine_objective_snapshot = external {}

@experimental
SnapshotQuestData<native><epic_internal>(Quest:quest)<reads>:quest_progress_data

@experimental
RestoreQuestData<native><epic_internal>(Data:quest_progress_data)<transacts><decides>:quest

@experimental
quest_progress_data<native><epic_internal> := class<final><persistable><epic_internal>:
    QuestId<native><epic_internal>:string = external {}

    QuestVersePath<native><epic_internal>:string = external {}

    State<native><epic_internal>:quest_state = external {}

    Objective<native><epic_internal>:?objective_snapshot = external {}