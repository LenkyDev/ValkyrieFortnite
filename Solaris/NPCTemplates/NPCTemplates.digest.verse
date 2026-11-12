# Verse path: /Fortnite.com/Characters
using {/Verse.org/Diagnostics}
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
boar_cosmetic<public> := class<concrete>(entity):


@available {MinUploadedAtFNVersion := 4300}
@export_metadata {Category := "NavigationRequirements"; Key := "Phoebe"; Value := ""}
@experimental
boar_template<public> := class<concrete>(entity):


@available {MinUploadedAtFNVersion := 4300}
@experimental
chicken_mesh_component<public> := class<final><epic_internal>(mesh_component):
    @editable
    var Chicken<public>:material = external {}

@available {MinUploadedAtFNVersion := 4300}
@experimental
chicken_cosmetic<public> := class<concrete>(entity):


@available {MinUploadedAtFNVersion := 4300}
@export_metadata {Category := "NavigationRequirements"; Key := "Phoebe"; Value := ""}
@experimental
chicken_template<public> := class<concrete>(entity):


@available {MinUploadedAtFNVersion := 4300}
@experimental
raptor_mesh_component<public> := class<final><epic_internal>(mesh_component):
    @editable
    var ML_JungleRaptor_Dinosaur<public>:material = external {}

    @editable
    var ML_JungleRaptor_Dinosaur_eye<public>:material = external {}

@available {MinUploadedAtFNVersion := 4300}
@experimental
raptor_cosmetic<public> := class<concrete>(entity):


@available {MinUploadedAtFNVersion := 4300}
@export_metadata {Category := "NavigationRequirements"; Key := "Phoebe"; Value := ""}
@experimental
raptor_template<public> := class<concrete>(entity):


@available {MinUploadedAtFNVersion := 4300}
@experimental
wolf_mesh_component<public> := class<final><epic_internal>(mesh_component):
    @editable
    var Wolf<public>:material = external {}

@available {MinUploadedAtFNVersion := 4300}
@experimental
wolf_cosmetic<public> := class<concrete>(entity):


@available {MinUploadedAtFNVersion := 4300}
@export_metadata {Category := "NavigationRequirements"; Key := "Phoebe"; Value := ""}
@experimental
wolf_template<public> := class<concrete>(entity):
