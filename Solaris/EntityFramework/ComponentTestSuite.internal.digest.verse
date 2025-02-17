using {/Verse.org/Simulation}
using {/UnrealEngine.com/Temporary/SceneGraph}
# Module import path: /UnrealEngine.com/ComponentTestSuite
ComponentTestSuite<public> := module:
    @experimental
    @hide_in_editor
    test_component_key_component_base<native><epic_internal> := class<final_super>(component):


    @experimental
    @hide_in_editor
    test_component_key_component_a<native><epic_internal> := class(test_component_key_component_base):


    @experimental
    @hide_in_editor
    test_component_key_component_b<native><epic_internal> := class(test_component_key_component_base):
