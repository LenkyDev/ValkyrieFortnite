# Module import path: /UnrealEngine.com/ComponentTestSuite
ComponentTestSuite<public> := module:
    using {/Verse.org/Simulation}
    using {/Verse.org/SceneGraph}
    @hide_in_editor
    test_component_key_component_base<native><epic_internal> := class<final_super>(component):


    @hide_in_editor
    test_component_key_component_a<native><epic_internal> := class(test_component_key_component_base):


    @hide_in_editor
    test_component_key_component_b<native><epic_internal> := class(test_component_key_component_base):
