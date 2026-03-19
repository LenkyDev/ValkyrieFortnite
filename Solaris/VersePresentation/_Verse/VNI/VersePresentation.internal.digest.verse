using {/Verse.org/Simulation}
using {/Verse.org/SceneGraph}
@experimental
change_description_component_event<epic_internal> := class(scene_event):
    Entity<public>:entity

    DescriptionComponent<public>:?description_component = external {}

@experimental
# Component that holds the details for an entity, such as name and description.
description_component<native><public> := class<final_super>(component, has_description):
    var Name<override>:message = external {}

    var Description<override>:message = external {}

    var ShortDescription<override>:message = external {}

    OnDescriptionChanged<native><epic_internal>()<transacts>:void

    OnBeginSimulation<override>():void = external {}

    OnEndSimulation<override>():void = external {}

# Interface that provides descriptive names or text.
has_description<native><public> := interface:
    @editable
    # Name.
    var Name<public>:message

    @editable
    # Full description.
    var Description<public>:message

    @editable
    # Short description with only the essential information.
    var ShortDescription<public>:message