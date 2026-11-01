# Verse path: /Fortnite.com/Characters
using {/Verse.org/Diagnostics}
using {/UnrealEngine.com/HealthPipeline}
using {/Fortnite.com/Animation/PlayAnimation}
using {/Verse.org/Presentation}
using {/Fortnite.com/AI}
using {/Verse.org/Native}
using {/Verse.org/Simulation}
using {/Verse.org/Temporary/EpicGamesRestricted/Network}
using {/Verse.org/Assets}
using {/Verse.org/SceneGraph}
@available {MinUploadedAtFNVersion := 4300}
@experimental
boar_mesh_component<public> := class<final><epic_internal>(mesh_component, has_skeletal_animation):
    Mesh<override>:mesh = external {}

    @replicated("RepNotify=___PropertyInterface_On_Boar_Changed")
    @display_name("Material")
    @editable
    var Boar<public>:material = external {}

    SkeletalAnimation<override>:modifier_stack(skeleton) = external {}

    ___PropertyInterface_On_Boar_Changed<epic_internal>():void = external {}

@available {MinUploadedAtFNVersion := 4300}
@experimental
fort_boar_component<epic_internal> := class<final><epic_internal>(fort_wildlife_component):
    SpawnerData<override>:string = external {}

    CosmeticAnimClass<override>:string = external {}

    HasCosmetic<override>:logic = external {}

@available {MinUploadedAtFNVersion := 4300}
@experimental
boar_cosmetic<public> := class<concrete>(wildlife_cosmetic_template):
    MeshComponent<override>:mesh_component = external {}

    TransformComponent<override>:transform_component = external {}

@available {MinUploadedAtFNVersion := 4300}
@export_metadata {Category := "NavigationRequirements"; Key := "Phoebe"; Value := ""}
@experimental
boar_template<public> := class<concrete>(wildlife_template):
    NPCComponent<override>:fort_npc_component = external {}

    IconComponent<override>:icon_component = external {}

    DescriptionComponent<override>:description_component = external {}

    PlayAnimationComponent<override>:fort_play_animation_component = external {}

    LocomotionComponent<override>:fort_locomotion_component = external {}

    HealthComponent<override>:health_component = external {}

    Cosmetic<override>:entity = external {}

@available {MinUploadedAtFNVersion := 4300}
@experimental
chicken_mesh_component<public> := class<final><epic_internal>(mesh_component, has_skeletal_animation):
    Mesh<override>:mesh = external {}

    @replicated("RepNotify=___PropertyInterface_On_Chicken_Changed")
    @display_name("Material")
    @editable
    var Chicken<public>:material = external {}

    SkeletalAnimation<override>:modifier_stack(skeleton) = external {}

    ___PropertyInterface_On_Chicken_Changed<epic_internal>():void = external {}

@available {MinUploadedAtFNVersion := 4300}
@experimental
fort_chicken_component<epic_internal> := class<final><epic_internal>(fort_wildlife_component):
    SpawnerData<override>:string = external {}

    CosmeticAnimClass<override>:string = external {}

    HasCosmetic<override>:logic = external {}

@available {MinUploadedAtFNVersion := 4300}
@experimental
chicken_cosmetic<public> := class<concrete>(wildlife_cosmetic_template):
    MeshComponent<override>:mesh_component = external {}

    TransformComponent<override>:transform_component = external {}

@available {MinUploadedAtFNVersion := 4300}
@export_metadata {Category := "NavigationRequirements"; Key := "Phoebe"; Value := ""}
@experimental
chicken_template<public> := class<concrete>(wildlife_template):
    NPCComponent<override>:fort_npc_component = external {}

    IconComponent<override>:icon_component = external {}

    DescriptionComponent<override>:description_component = external {}

    PlayAnimationComponent<override>:fort_play_animation_component = external {}

    LocomotionComponent<override>:fort_locomotion_component = external {}

    HealthComponent<override>:health_component = external {}

    Cosmetic<override>:entity = external {}

@available {MinUploadedAtFNVersion := 4300}
@experimental
raptor_mesh_component<public> := class<final><epic_internal>(mesh_component, has_skeletal_animation):
    Mesh<override>:mesh = external {}

    @replicated("RepNotify=___PropertyInterface_On_ML_JungleRaptor_Dinosaur_Changed")
    @display_name("BodyMaterial")
    @editable
    var ML_JungleRaptor_Dinosaur<public>:material = external {}

    @replicated("RepNotify=___PropertyInterface_On_ML_JungleRaptor_Dinosaur_eye_Changed")
    @display_name("EyeMaterial")
    @editable
    var ML_JungleRaptor_Dinosaur_eye<public>:material = external {}

    SkeletalAnimation<override>:modifier_stack(skeleton) = external {}

    ___PropertyInterface_On_ML_JungleRaptor_Dinosaur_Changed<epic_internal>():void = external {}

    ___PropertyInterface_On_ML_JungleRaptor_Dinosaur_eye_Changed<epic_internal>():void = external {}

@available {MinUploadedAtFNVersion := 4300}
@experimental
fort_raptor_component<epic_internal> := class<final><epic_internal>(fort_wildlife_component):
    SpawnerData<override>:string = external {}

    CosmeticAnimClass<override>:string = external {}

    HasCosmetic<override>:logic = external {}

@available {MinUploadedAtFNVersion := 4300}
@experimental
raptor_cosmetic<public> := class<concrete>(wildlife_cosmetic_template):
    MeshComponent<override>:mesh_component = external {}

    TransformComponent<override>:transform_component = external {}

@available {MinUploadedAtFNVersion := 4300}
@export_metadata {Category := "NavigationRequirements"; Key := "Phoebe"; Value := ""}
@experimental
raptor_template<public> := class<concrete>(wildlife_template):
    NPCComponent<override>:fort_npc_component = external {}

    IconComponent<override>:icon_component = external {}

    DescriptionComponent<override>:description_component = external {}

    PlayAnimationComponent<override>:fort_play_animation_component = external {}

    LocomotionComponent<override>:fort_locomotion_component = external {}

    HealthComponent<override>:health_component = external {}

    Cosmetic<override>:entity = external {}

@available {MinUploadedAtFNVersion := 4300}
@experimental
wolf_mesh_component<public> := class<final><epic_internal>(mesh_component, has_skeletal_animation):
    Mesh<override>:mesh = external {}

    @replicated("RepNotify=___PropertyInterface_On_Wolf_Changed")
    @display_name("Material")
    @editable
    var Wolf<public>:material = external {}

    SkeletalAnimation<override>:modifier_stack(skeleton) = external {}

    ___PropertyInterface_On_Wolf_Changed<epic_internal>():void = external {}

@available {MinUploadedAtFNVersion := 4300}
@experimental
fort_wolf_component<epic_internal> := class<final><epic_internal>(fort_wildlife_component):
    SpawnerData<override>:string = external {}

    CosmeticAnimClass<override>:string = external {}

    HasCosmetic<override>:logic = external {}

@available {MinUploadedAtFNVersion := 4300}
@experimental
wolf_cosmetic<public> := class<concrete>(wildlife_cosmetic_template):
    MeshComponent<override>:mesh_component = external {}

    TransformComponent<override>:transform_component = external {}

@available {MinUploadedAtFNVersion := 4300}
@export_metadata {Category := "NavigationRequirements"; Key := "Phoebe"; Value := ""}
@experimental
wolf_template<public> := class<concrete>(wildlife_template):
    NPCComponent<override>:fort_npc_component = external {}

    IconComponent<override>:icon_component = external {}

    DescriptionComponent<override>:description_component = external {}

    PlayAnimationComponent<override>:fort_play_animation_component = external {}

    LocomotionComponent<override>:fort_locomotion_component = external {}

    HealthComponent<override>:health_component = external {}

    Cosmetic<override>:entity = external {}