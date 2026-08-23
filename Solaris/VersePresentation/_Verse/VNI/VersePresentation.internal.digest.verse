# Verse path: /Verse.org/Presentation
using {/Verse.org/Simulation}
using {/Verse.org/SceneGraph}
change_description_component_event<epic_internal> := class(scene_event):
    Entity<public>:entity

    DescriptionComponent<public>:?description_component = external {}

# Component that holds the details for an entity, such as name and description.
description_component<native><public> := class<final_super>(component, has_description):
    var Name<override>:message = external {}

    var Description<override>:message = external {}

    var ShortDescription<override>:message = external {}

    OnDescriptionChanged<native_callable><epic_internal>():void = external {}

    OnBeginSimulation<override>():void = external {}

    OnEndSimulation<override>():void = external {}

# Interface that provides descriptive names or text.
has_description<native><public> := interface:
    @editable
    # The display name of this entity.
    var Name<public>:message

    @editable
    # The full description of this entity.
    var Description<public>:message

    @editable
    # A shortened description of this entity.
    var ShortDescription<public>:message