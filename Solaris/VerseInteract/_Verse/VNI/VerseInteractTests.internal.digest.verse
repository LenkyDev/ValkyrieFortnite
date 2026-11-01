# Verse path: /UnrealEngine.com
# Module import path: /UnrealEngine.com/VerseInteractTests
VerseInteractTests<public> := module:
    using {/Verse.org/Simulation}
    using {/Verse.org/SceneGraph}
    @hide_in_editor
    @experimental
    test_basic_interactable_component<native><epic_internal> := class<epic_internal>(basic_interactable_component):
        var TimesStarted<native><public>:int = external {}

        var TimesSucceeded<native><public>:int = external {}

        var TimesCanceled<native><public>:int = external {}

        var TimesOnStartedCommitted<native><public>:int = external {}

        var AllowInteract<native><public>:logic = external {}

        OnBeginSimulation<override>():void = external {}

        OnEndSimulation<override>():void = external {}

        CanInteract<override>(Agent:agent)<decides><reads>:void = external {}

        OnStarted<override>(Agent:agent)<transacts><decides>:void = external {}

    @hide_in_editor
    @experimental
    test_interactable_component<native><epic_internal> := class<epic_internal>(interactable_component):
        var TimesSucceeded<native><public>:int = external {}

        OnBeginSimulation<override>():void = external {}

        OnEndSimulation<override>():void = external {}