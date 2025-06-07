using {/Verse.org/Native}
@available {MinUploadedAtFNVersion := 3200}
# Finds all descendant entities including `InEntity` of type `entity_type`.
# The order of the returned entities is unspecified and subject to change.
(InEntity:entity).FindDescendantEntities<native><public>(entity_type:castable_subtype(entity))<transacts>:generator(entity_type)

@available {MinUploadedAtFNVersion := 3200}
# Finds all descendant entities including `InEntity` containing a component of type `component_type`.
# The order of the returned entities is unspecified and subject to change.
(InEntity:entity).FindDescendantEntitiesWithComponent<native><public>(component_type:castable_subtype(component))<transacts>:generator(entity)

@available {MinUploadedAtFNVersion := 3200}
# Finds all components attached to descendant entities to and including `InEntity` of type `component_type`.
# The order of the returned components is unspecified and subject to change.
(InEntity:entity).FindDescendantComponents<native><public>(component_type:castable_subtype(component))<transacts>:generator(component_type)

@available {MinUploadedAtFNVersion := 3200}
# Finds all ancestor entities to `InEntity` of type `entity_type`.
# The order of the returned entities is unspecified and subject to change.
(InEntity:entity).FindAncestorEntities<native><public>(entity_type:castable_subtype(entity))<transacts>:generator(entity_type)

@available {MinUploadedAtFNVersion := 3200}
# Finds all ancestor entities to `InEntity` containing a component of type `component_type`.
# The order of the returned entities is unspecified and subject to change.
(InEntity:entity).FindAncestorEntitiesWithComponent<native><public>(component_type:castable_subtype(component))<transacts>:generator(entity)

@available {MinUploadedAtFNVersion := 3200}
# Finds all components attached to ancestor entities to `InEntity` of type `component_type`.
# The order of the returned components is unspecified and subject to change.
(InEntity:entity).FindAncestorComponents<native><public>(component_type:castable_subtype(component))<transacts>:generator(component_type)