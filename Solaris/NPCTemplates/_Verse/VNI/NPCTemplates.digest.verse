# Verse path: /Fortnite.com/Characters
using {/UnrealEngine.com/HealthPipeline}
using {/Fortnite.com/AI}
using {/Verse.org/Presentation}
using {/Verse.org/Native}
using {/Verse.org/SceneGraph}
@available {MinUploadedAtFNVersion := 4300}
@experimental
# The entity cosmetic prefab for a creator customizable wildlife
wildlife_cosmetic_template<native><public> := class<concrete>(entity):
    TransformComponent<native><public>:transform_component = external {}

    MeshComponent<native><public>:mesh_component = external {}

@available {MinUploadedAtFNVersion := 4300}
@experimental
# The entity prefab for a creator customizable wildlife
wildlife_template<native><public> := class<concrete>(entity):
    PossessableComponent<native><public>:possessable_component = external {}

    IconComponent<native><public>:icon_component = external {}

    DescriptionComponent<native><public>:description_component = external {}

    ActionsComponent<native><public>:npc_actions_component = external {}

    AwarenessComponent<native><public>:npc_awareness_component = external {}

    LocomotionComponent<native><public>:fort_locomotion_component = external {}

    HealthComponent<native><public>:health_component = external {}

    Cosmetic<native><public>:entity = external {}