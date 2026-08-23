# Verse path: /Verse.org/SceneGraph
using {/Verse.org/Simulation}
@hide_in_editor {CVar := "LevelEntity.ShowLevelEntityInOutliner"; Hidden := false}
level_entity<native><epic_internal> := class<concrete><unique><transacts>(entity):


level_subsim_component<native><epic_internal> := class<final_super>(component):
    @editable
    SimulationEntityPrefab<native><epic_internal>:subtype(simulation_entity) = external {}