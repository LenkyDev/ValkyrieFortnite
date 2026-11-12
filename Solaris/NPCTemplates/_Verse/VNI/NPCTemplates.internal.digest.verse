# Verse path: /Fortnite.com/Characters
using {/UnrealEngine.com/HealthPipeline}
using {/Fortnite.com/Animation/PlayAnimation}
using {/Verse.org/Presentation}
using {/Verse.org/Simulation}
using {/Verse.org/SceneGraph}
using {/Verse.org/Native}
using {/Fortnite.com/AI}
@available {MinUploadedAtFNVersion := 4300}
@experimental
default_behavior<epic_internal> := class(npc_behavior):


@available {MinUploadedAtFNVersion := 4300}
@experimental
# The entity cosmetic prefab for a creator customizable wildlife
wildlife_cosmetic_template<native><epic_internal> := class<concrete>(entity):
    @field("Components")
    TransformComponent<native><epic_internal>:transform_component = external {}

    @field("Components")
    MeshComponent<native><epic_internal>:mesh_component = external {}

@available {MinUploadedAtFNVersion := 4300}
@experimental
# The entity prefab for a creator customizable wildlife
wildlife_template<native><epic_internal> := class<concrete>(entity):
    @field("Components")
    NPCComponent<native><epic_internal>:fort_npc_component = external {}

    @field("Components")
    PossessableComponent<native><epic_internal>:possessable_component = external {}

    @field("Components")
    IconComponent<native><epic_internal>:icon_component = external {}

    @field("Components")
    DescriptionComponent<native><epic_internal>:description_component = external {}

    @field("Components")
    PlayAnimationComponent<native><epic_internal>:fort_play_animation_component = external {}

    @field("Components")
    ActionsComponent<native><epic_internal>:npc_actions_component = external {}

    @field("Components")
    AwarenessComponent<native><epic_internal>:npc_awareness_component = external {}

    @field("Components")
    LocomotionComponent<native><epic_internal>:fort_locomotion_component = external {}

    @field("Components")
    HealthComponent<native><epic_internal>:health_component = external {}

    @field("Components")
    RidingComponent<native><epic_internal>:?fort_riding_component = external {}

    @field("OwnedEntities")
    Cosmetic<native><epic_internal>:entity = external {}