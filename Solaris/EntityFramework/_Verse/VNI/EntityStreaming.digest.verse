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