using {/Verse.org/Native}
using {/Verse.org/Simulation}
@experimental
streaming_component<native><epic_internal> := class<final_super>(component):
    @editable
    @experimental
    EnableStreaming<native><epic_internal>:?logic = external {}

@experimental
(InEntity:entity).GetEnableStreaming<native><epic_internal>()<transacts>:?logic

@import_as("/Script/EntityStreaming.UStreamingDataComponentImpl")
streaming_data_component_impl<native><epic_internal> := class<abstract>:


@hide_in_editor
streaming_data_component<native><epic_internal> := class<final_super><epic_internal>(component):
    @experimental
    Impl<native><epic_internal>:streaming_data_component_impl