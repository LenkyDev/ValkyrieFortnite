# Verse path: /Verse.org/SceneGraph
# Where the entity transform sits relative to the actor mirrored by a transform_component_bridge.
transform_bridge_origin<native><epic_internal> := enum:
    # The entity transform matches the actor transform; for a pawn, the middle of its capsule.
    Center
    # The entity transform sits at the bottom of the actor's collision; for a pawn, the bottom of its capsule.
    Ground

# Implemented by components that want to place the entity transform somewhere other than the actor transform mirrored by a transform_component_bridge.
transform_bridge_offset_interface<native><epic_internal> := interface<epic_internal>:
    # Returns where the entity transform sits relative to the actor, or false if this component doesn't pick an origin.
    GetTransformOrigin<native_callable><protected>()<reads>:?transform_bridge_origin