using {/Verse.org/Simulation}
using {/Verse.org/SceneGraph}
@hide_in_editor
@experimental
Test_CustomInteractTime<native><epic_internal> := class<epic_internal>(interactable_component):
    var CurrentAgent<public>:agent

    var TimesSucceeded<native><public>:int = external {}

    OnBeginSimulation<override>():void = external {}

    OnStarted<override>(Agent:agent)<transacts><decides>:void = external {}

@hide_in_editor
@experimental
Test_OnStartedNoSignalling<native><epic_internal> := class<epic_internal>(interactable_component):
    var CurrentAgent<public>:agent

    var TimesSucceeded<native><public>:int = external {}

    OnBeginSimulation<override>():void = external {}

    OnStarted<override>(Agent:agent)<transacts><decides>:void = external {}

@hide_in_editor
@experimental
Test_InitBasicVariables<native><epic_internal> := class<epic_internal>(basic_interactable_component):
    OnBeginSimulation<override>():void = external {}