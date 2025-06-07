using {/Verse.org/Simulation/Tags}
using {/Verse.org/Simulation}
using {/Verse.org/SceneGraph}
# Module import path: /UnrealEngine.com/ComponentTestSuite
ComponentTestSuite<public> := module:
    @hide_in_editor
    test_component_key_component_base<native><epic_internal> := class<final_super>(component):


    @hide_in_editor
    test_component_key_component_a<native><epic_internal> := class(test_component_key_component_base):


    @hide_in_editor
    test_component_key_component_b<native><epic_internal> := class(test_component_key_component_base):


    @hide_in_editor
    test_tag_animal<native><epic_internal> := class(tag):


    @hide_in_editor
    test_tag_animal_cat<native><epic_internal> := class(test_tag_animal):


    @hide_in_editor
    test_tag_animal_cat_cheddar<native><epic_internal> := class(test_tag_animal_cat):


    @hide_in_editor
    test_tag_animal_cat_jello<native><epic_internal> := class(test_tag_animal_cat):


    @hide_in_editor
    test_tag_animal_dog<native><epic_internal> := class(test_tag_animal):


    @hide_in_editor
    test_tag_animal_dog_kimchi<native><epic_internal> := class(test_tag_animal_dog):


    @hide_in_editor
    test_tag_animal_dog_pollo<native><epic_internal> := class(test_tag_animal_dog):


    @hide_in_editor
    test_tag_vehicle<native><epic_internal> := class(tag):


    @hide_in_editor
    test_tag_vehicle_bike<native><epic_internal> := class(test_tag_vehicle):


    @hide_in_editor
    test_tag_vehicle_bike_norton<native><epic_internal> := class(test_tag_vehicle_bike):


    @hide_in_editor
    test_tag_vehicle_car<native><epic_internal> := class(test_tag_vehicle):


    @hide_in_editor
    test_tag_vehicle_car_datsun<native><epic_internal> := class(test_tag_vehicle_car):
