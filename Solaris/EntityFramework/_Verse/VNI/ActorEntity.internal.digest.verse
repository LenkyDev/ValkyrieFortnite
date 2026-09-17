# Verse path: /Verse.org/SceneGraph
using {/Verse.org/SpatialMath}
transform_bridge_offset_info<native><epic_internal> := struct:


# Implemented by components that want to offset the entity transform from the actor transform mirrored by a transform_component_bridge.
transform_bridge_offset_interface<native><epic_internal> := interface<epic_internal>:
    # Returns the world space translation to add to the actor transform to produce the entity transform, or false if this component doesn't contribute an offset.
    GetTransformOffset<native_callable><protected>(Info:transform_bridge_offset_info)<reads>:?(/Verse.org/SpatialMath:)vector3