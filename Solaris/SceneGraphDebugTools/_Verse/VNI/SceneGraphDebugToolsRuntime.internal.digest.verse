# Module import path: /Verse.org/SceneGraph/SceneGraphDebugTools
SceneGraphDebugTools<public> := module:
    using {/Verse.org/Temporary/EpicGamesRestricted/Network}
    using {/Verse.org/Native}
    @import_as("/Script/SceneGraphDebugToolsRuntime.UVerseDebugWidgetBase")
    @experimental
    debug_widget_base<native><epic_internal> := class<abstract>:


    @experimental
    debug_widget<native><epic_internal> := class<abstract>(debug_widget_base):


    @experimental
    debug_container_widget<native><epic_internal> := class<abstract>(debug_widget):
        var Children<public>:[]debug_widget = external {}

        @replicated("")
        var _Children<native><public>:[]debug_widget = external {}

    @experimental
    debug_text_widget<native><epic_internal> := class(debug_widget):
        @replicated("")
        var Text<native><public>:string = external {}

    @experimental
    debug_button_widget<native><epic_internal> := class(debug_widget):
        @replicated("")
        ButtonId<native><public>:string = external {}

        @replicated("")
        var Text<native><public>:string = external {}

        ClickedEvent<native><public>:listenable(tuple()) = external {}

    @experimental
    debug_window_widget<native><epic_internal> := class(debug_container_widget):
        @replicated("")
        var IsVisible<native><public>:logic = external {}

        @replicated("")
        UniqueName<native><public>:string

        @replicated("")
        var WindowTitle<native><public>:string

        @replicated("")
        var WindowWidth<native><public>:float = external {}

        @replicated("")
        var WindowHeight<native><public>:float = external {}

    @experimental
    # Debug component for creating debug UI's'
    debug_ui_component<native><epic_internal> := class<final_super>(component):
        var Windows<public>:[]debug_window_widget = external {}

        OnBeginSimulationInternal<native><override>():void

        OnEndSimulationInternal<native><override>():void