# Verse path: /Verse.org/SceneGraph
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
    # Determines how the entity will be streamed on clients with regards to its parent.
    EntityStreamingPolicy<native><epic_internal>:?entity_streaming_policy = external {}

    @editable
    # Determines how the entity will stream its children on clients.
    ChildrenStreamingPolicy<native><epic_internal>:?children_streaming_policy = external {}

    @editable
    # Determines the streaming distance at which the entity will be loaded on clients, in meters.
    StreamingDistance<native><epic_internal>:?float = external {}