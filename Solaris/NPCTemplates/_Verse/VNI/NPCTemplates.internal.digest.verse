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
wildlife_cosmetic_template<native><public> := class<concrete>(entity):
    @field("Components")
    TransformComponent<native><public>:transform_component = external {}

    @field("Components")
    MeshComponent<native><public>:mesh_component = external {}

@available {MinUploadedAtFNVersion := 4300}
@experimental
# The entity prefab for a creator customizable wildlife
wildlife_template<native><public> := class<concrete>(entity):
    @field("Components")
    NPCComponent<native><epic_internal>:fort_npc_component = external {}

    @field("Components")
    PossessableComponent<native><public>:possessable_component = external {}

    @field("Components")
    IconComponent<native><public>:icon_component = external {}

    @field("Components")
    DescriptionComponent<native><public>:description_component = external {}

    @field("Components")
    PlayAnimationComponent<native><epic_internal>:fort_play_animation_component = external {}

    @field("Components")
    ActionsComponent<native><public>:npc_actions_component = external {}

    @field("Components")
    AwarenessComponent<native><public>:npc_awareness_component = external {}

    @field("Components")
    LocomotionComponent<native><public>:fort_locomotion_component = external {}

    @field("Components")
    HealthComponent<native><public>:health_component = external {}

    @field("OwnedEntities")
    Cosmetic<native><public>:entity = external {}