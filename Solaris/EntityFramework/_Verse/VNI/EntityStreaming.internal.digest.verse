using {/Verse.org/Simulation}
# Entity client streaming modes
entity_streaming_policy<native><public> := enum:
    # Entity will be spatially loaded.
    Spatial
    # Entity will be non-spatially loaded.
    NonSpatial
    # Entity will be always loaded.
    Persistent

# Child entities client streaming modes
children_streaming_policy<native><public> := enum:
    # Child entities are loaded atomically with their parent.
    Atomic
    # Child entities are loaded independently from their parent.
    Discrete

@experimental
streaming_component<native><epic_internal> := class<final_super>(component):
    @editable
    @experimental
    EntityStreamingPolicy<native><epic_internal>:?entity_streaming_policy = external {}

    @editable
    @experimental
    ChildrenStreamingPolicy<native><epic_internal>:?children_streaming_policy = external {}

@experimental
(InEntity:entity).GetEntityStreamingPolicy<native><epic_internal>()<transacts>:?entity_streaming_policy

(InEntity:entity).GetChildrenStreamingPolicy<native><epic_internal>()<transacts>:?children_streaming_policy