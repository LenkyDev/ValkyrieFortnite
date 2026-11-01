# Verse path: /Fortnite.com/Characters
using {/Verse.org/Diagnostics}
using {/UnrealEngine.com/HealthPipeline}
using {/Verse.org/Presentation}
using {/Verse.org/Native}
using {/Verse.org/Simulation}
using {/Verse.org/Assets}
using {/Verse.org/SceneGraph}
@available {MinUploadedAtFNVersion := 4300}
@experimental
boar_mesh_component<public> := class<final><epic_internal>(mesh_component):
    @editable
    var Boar<public>:material = external {}

@available {MinUploadedAtFNVersion := 4300}
@experimental
boar_cosmetic<public> := class<concrete>(wildlife_cosmetic_template):
    MeshComponent<override>:mesh_component = external {}

    TransformComponent<override>:transform_component = external {}

@available {MinUploadedAtFNVersion := 4300}
@export_metadata {Category := "NavigationRequirements"; Key := "Phoebe"; Value := ""}
@experimental
boar_template<public> := class<concrete>(wildlife_template):
    IconComponent<override>:icon_component = external {}

    DescriptionComponent<override>:description_component = external {}

    LocomotionComponent<override>:fort_locomotion_component = external {}

    HealthComponent<override>:health_component = external {}

    Cosmetic<override>:entity = external {}

@available {MinUploadedAtFNVersion := 4300}
@experimental
chicken_mesh_component<public> := class<final><epic_internal>(mesh_component):
    @editable
    var Chicken<public>:material = external {}

@available {MinUploadedAtFNVersion := 4300}
@experimental
chicken_cosmetic<public> := class<concrete>(wildlife_cosmetic_template):
    MeshComponent<override>:mesh_component = external {}

    TransformComponent<override>:transform_component = external {}

@available {MinUploadedAtFNVersion := 4300}
@export_metadata {Category := "NavigationRequirements"; Key := "Phoebe"; Value := ""}
@experimental
chicken_template<public> := class<concrete>(wildlife_template):
    IconComponent<override>:icon_component = external {}

    DescriptionComponent<override>:description_component = external {}

    LocomotionComponent<override>:fort_locomotion_component = external {}

    HealthComponent<override>:health_component = external {}

    Cosmetic<override>:entity = external {}

@available {MinUploadedAtFNVersion := 4300}
@experimental
raptor_mesh_component<public> := class<final><epic_internal>(mesh_component):
    @editable
    var ML_JungleRaptor_Dinosaur<public>:material = external {}

    @editable
    var ML_JungleRaptor_Dinosaur_eye<public>:material = external {}

@available {MinUploadedAtFNVersion := 4300}
@experimental
raptor_cosmetic<public> := class<concrete>(wildlife_cosmetic_template):
    MeshComponent<override>:mesh_component = external {}

    TransformComponent<override>:transform_component = external {}

@available {MinUploadedAtFNVersion := 4300}
@export_metadata {Category := "NavigationRequirements"; Key := "Phoebe"; Value := ""}
@experimental
raptor_template<public> := class<concrete>(wildlife_template):
    IconComponent<override>:icon_component = external {}

    DescriptionComponent<override>:description_component = external {}

    LocomotionComponent<override>:fort_locomotion_component = external {}

    HealthComponent<override>:health_component = external {}

    Cosmetic<override>:entity = external {}

@available {MinUploadedAtFNVersion := 4300}
@experimental
wolf_mesh_component<public> := class<final><epic_internal>(mesh_component):
    @editable
    var Wolf<public>:material = external {}

@available {MinUploadedAtFNVersion := 4300}
@experimental
wolf_cosmetic<public> := class<concrete>(wildlife_cosmetic_template):
    MeshComponent<override>:mesh_component = external {}

    TransformComponent<override>:transform_component = external {}

@available {MinUploadedAtFNVersion := 4300}
@export_metadata {Category := "NavigationRequirements"; Key := "Phoebe"; Value := ""}
@experimental
wolf_template<public> := class<concrete>(wildlife_template):
    IconComponent<override>:icon_component = external {}

    DescriptionComponent<override>:description_component = external {}

    LocomotionComponent<override>:fort_locomotion_component = external {}

    HealthComponent<override>:health_component = external {}

    Cosmetic<override>:entity = external {}