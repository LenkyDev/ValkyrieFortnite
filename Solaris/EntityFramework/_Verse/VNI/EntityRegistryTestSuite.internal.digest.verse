using {/Verse.org/Simulation}
using {/Verse.org/SceneGraph}
# Module import path: /UnrealEngine.com/EntityRegistryTestSuite
EntityRegistryTestSuite<public> := module:
    @hide_in_editor
    entity_registry_test_entity<native><epic_internal> := class(entity):


    @hide_in_editor
    entity_registry_not_used_test_entity<native><epic_internal> := class(entity):


    @hide_in_editor
    entity_registry_test_component<native><epic_internal> := class<final_super>(component):


    @hide_in_editor
    entity_registry_other_test_component<native><epic_internal> := class<final_super>(component):


    @hide_in_editor
    entity_registry_unused_test_component<native><epic_internal> := class<final_super>(component):
