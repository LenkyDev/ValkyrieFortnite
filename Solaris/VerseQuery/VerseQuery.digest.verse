using {/Verse.org/Native}
using {/Verse.org/Simulation/Tags}
@experimental
# Used to add tags to an entity. Tagged entities can then be queried using `entity.FindEntitiesWithTag` and `entity.FindParentEntitiesWithTag`.
#   * Finding entities from the simulation entity for tagged entities only considers any `tag_component` that has run `OnAddedToScene`.
tag_component<native><public> := class<final><final_super>(component, tag_view):
    # Determine if TagToCheck is present in this container, also checking against parent tags {"A.1"}.Has("A") will return True, {"A"}.Has("A.1") will return False If TagToCheck is not Valid it will always return False.
    Has<native><override>(TagToCheck:tag)<computes><decides><reads>:void

    # Checks if this container contains ANY of the tags in the specified container, also checks against parent tags {"A.1"}.HasAny({"A","B"}) will return True, {"A"}.HasAny({"A.1","B"}) will return False If InTags is empty/invalid it will always return False.
    HasAny<native><override>(InTags:[]tag)<computes><decides><reads>:void

    # Checks if this container contains ALL of the tags in the specified container, also checks against parent tags {"A.1","B.1"}.HasAll({"A","B"}) will return True, {"A","B"}.HasAll({"A.1","B.1"}) will return False If InTags is empty/invalid it will always return True, because there were no failed checks.
    HasAll<native><override>(InTags:[]tag)<computes><decides><reads>:void

    # Adds a tag to this component. Returns `true` if the tag was not present before being added.
    AddTag<native><public>(TagToAdd:tag)<transacts>:logic

    # Removes a tag from this component. Returns `true` if the tag was present before being removed.
    RemoveTag<native><public>(TagToRemove:tag)<transacts>:logic

@experimental
@available {MinUploadedAtFNVersion := 3200}
# Finds all descendant entities including `InEntity` of type `entity_type`.
# When querying from the simulation entity, the simulation entity itself is not included in the results.
# The order of the returned entities is unspecified and subject to change.
(InEntity:entity).FindDescendantEntities<native><public>(entity_type:castable_subtype(entity))<transacts>:generator(entity_type)

@experimental
@available {MinUploadedAtFNVersion := 3200}
# Finds all descendant entities including `InEntity` containing a component of type `component_type`.
# When querying from the simulation entity, the simulation entity itself is not included in the results.
# The order of the returned entities is unspecified and subject to change.
(InEntity:entity).FindDescendantEntitiesWithComponent<native><public>(component_type:castable_subtype(component))<transacts>:generator(entity)

@experimental
@available {MinUploadedAtFNVersion := 2930}
# Finds all descendant entities including `InEntity` with `Tag` present in their `tag_component`.
# When querying from the simulation entity, the simulation entity itself is not included in the results.
# The order of the returned entities is unspecified and subject to change.
(InEntity:entity).FindDescendantEntitiesWithTag<native><public>(Tag:tag)<transacts>:generator(entity)

@experimental
@available {MinUploadedAtFNVersion := 3200}
# Finds all components attached to descendant entities to and including `InEntity` of type `component_type`.
# When querying from the simulation entity, the simulation entity itself is not included in the results.
# The order of the returned components is unspecified and subject to change.
(InEntity:entity).FindDescendantComponents<native><public>(component_type:castable_subtype(component))<transacts>:generator(component_type)

@experimental
@available {MinUploadedAtFNVersion := 3200}
# Finds all ancestor entities to `InEntity` of type `entity_type`.
# The order of the returned entities is unspecified and subject to change.
(InEntity:entity).FindAncestorEntities<native><public>(entity_type:castable_subtype(entity))<transacts>:generator(entity_type)

@experimental
@available {MinUploadedAtFNVersion := 3200}
# Finds all ancestor entities to `InEntity` containing a component of type `component_type`.
# The order of the returned entities is unspecified and subject to change.
(InEntity:entity).FindAncestorEntitiesWithComponent<native><public>(component_type:castable_subtype(component))<transacts>:generator(entity)

@experimental
@available {MinUploadedAtFNVersion := 2930}
# Finds all ancestor entities to `InEntity` with `Tag` present in their `tag_component`.
# The order of the returned entities is unspecified and subject to change.
(InEntity:entity).FindAncestorEntitiesWithTag<native><public>(Tag:tag)<transacts>:generator(entity)

@experimental
@available {MinUploadedAtFNVersion := 3200}
# Finds all components attached to ancestor entities to `InEntity` of type `component_type`.
# The order of the returned components is unspecified and subject to change.
(InEntity:entity).FindAncestorComponents<native><public>(component_type:castable_subtype(component))<transacts>:generator(component_type)