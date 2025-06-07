using {/Verse.org/Temporary/EpicGamesRestricted/Network}
using {/Verse.org/Simulation}
using {/Verse.org/Native}
@experimental
frame_component<native><epic_internal> := class<final_super><abstract>(component):


@experimental
@import_as("/Script/UIFramework.UUIFrameworkWidget")
ui_frame<native><epic_internal> := class<epic_internal>:


@experimental
ui_display_component<native><epic_internal> := class<abstract><final_super>(component, enableable):
    # Enable this component.
    Enable<native><override>():void

    # Disable this component.
    Disable<native><override>():void

    # Succeeds if the component is enabled, fails if it is disabled.
    IsEnabled<native><override>()<transacts><decides>:void

@experimental
world_ui_display_component<native><epic_internal> := class<final_super>(ui_display_component):
    OnInitializedInternal<native><override>():void

    OnAddedToSceneInternal<native><override>():void

    OnRemovingFromSceneInternal<native><override>():void

    OnBeginSimulationInternal<native><override>():void

    @editable
    @replicated("RepNotify")
    # Whether or not this frame always faces the camera.
    var FacingCamera<native><public>:logic = external {}