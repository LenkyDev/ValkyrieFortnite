using {/Verse.org/Simulation}
@experimental
streaming_component<native><epic_internal> := class<final_super>(component):
    @editable
    @experimental
    EnableStreaming<native><epic_internal>:?logic = external {}

    @editable
    @experimental
    AllowsPartialLoading<native><epic_internal>:?logic = external {}

@experimental
(InEntity:entity).GetEnableStreaming<native><epic_internal>()<transacts>:?logic

@experimental
(InEntity:entity).GetAllowsPartialLoading<native><epic_internal>()<transacts>:?logic