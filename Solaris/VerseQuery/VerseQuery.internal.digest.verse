using {/Verse.org/Native}
using {/Verse.org/Simulation/Tags}
using {/Verse.org/Simulation}
using {/UnrealEngine.com/Temporary/SpatialMath}
@experimental
@deprecated
# Axis aligned box volume.
axis_aligned_box3<native><epic_internal> := class<final><concrete>(convex_volume3):
    # Center point of the box.
    Center<native><public>:vector3 = external {}

    # Extent of the box.
    Extent<native><public>:vector3 = external {}

@deprecated
@experimental
overlap_result<native><epic_internal> := struct<epic_internal>:
    ThisEntity<native><public>:?entity

    ThisComponent<native><public>:?component

    OtherEntity<native><public>:?entity

    OtherComponent<native><public>:?component

@deprecated
@experimental
collision_override<native><epic_internal> := class<epic_internal>:


@deprecated
@experimental
no_collision_override<native><epic_internal> := class<concrete><final><epic_internal>(collision_override):


@deprecated
@experimental
volume_collision_override<native><epic_internal> := class<concrete><final><epic_internal>(collision_override):
    CollisionVolume<native><public>:convex_volume3 = external {}

@deprecated
@experimental
# Used to make an entity collide with other scene objects, including preventing players and NPCs from passing through the entity.
# Overlap queries can only find entities with enabled `collision_components`.
# 
# Dependencies:
#   * `transform_component` on the entity positions the `collision_component`.
#   * `mesh_component` on the entity provides the collision shape for the `collision_component`.
collision_component<native><epic_internal> := class<final><final_super>(component, enableable):
    OnInitializedInternal<native><override>():void

    OnUninitializingInternal<native><override>():void

    OnAddedToSceneInternal<native><override>():void

    OnRemovingFromSceneInternal<native><override>():void

    OnBeginSimulationInternal<native><override>():void

    OnEndSimulationInternal<native><override>():void

    # Enables the `collision_component`. Scene objects will pass through this entity if collision is disabled.
    Enable<native><override>():void

    # Disables the `collision_component`. Scene objects will pass through this entity if collision is disabled.
    Disable<native><override>():void

    # Succeeds if the component is enabled, fails if it's disabled.
    IsEnabled<native><override>()<transacts><decides>:void

    var SendHitEvents<native><epic_internal>:logic = external {}

    # Event signaled when the component experiences a blocking hit.
    HitEvent<native><epic_internal>:listenable(hit_result) = external {}

    var SendOverlapEvents<native><epic_internal>:logic = external {}

    # Event signaled when something starts overlapping with the component.
    BeginOverlapEvent<native><epic_internal>:listenable(overlap_result) = external {}

    # Event signaled when something stops overlapping with the component.
    EndOverlapEvent<native><epic_internal>:listenable(overlap_result) = external {}

    SetCollisionProfile<native><epic_internal>(Profile:collision_profile):void

    GetCollisionProfile<native><epic_internal>():?collision_profile

    var CollisionOverride<epic_internal>:collision_override = external {}

@experimental
component_query_iterator_interface<native><epic_internal> := interface<epic_internal>:
    NextValue<native_callable><public>()<transacts><decides>:component

@experimental
null_component_query_iterator<native><epic_internal> := class<epic_internal>(component_query_iterator_interface):
    NextValue<native><override>()<transacts><decides>:component

@experimental
slow_component_array_copy_query_iterator<native><epic_internal> := class<epic_internal>(component_query_iterator_interface):
    NextValue<native><override>()<transacts><decides>:component

@experimental
@deprecated
# Base class for all convex volumes.
convex_volume3<native><epic_internal> := class<epic_internal>(volume3):
    # Determines if `Point` falls within the boundaries of this `convex_volume3`.
    Contains<native><public>(Point:vector3)<computes><decides><reads>:void

@experimental
entity_query_iterator_interface<native><epic_internal> := interface<epic_internal>:
    NextValue<native_callable><public>()<transacts><decides>:entity

@experimental
null_entity_query_iterator<native><epic_internal> := class<epic_internal>(entity_query_iterator_interface):
    NextValue<native><override>()<transacts><decides>:entity

@experimental
entity_query_iterator<native><epic_internal> := class<epic_internal>(entity_query_iterator_interface):
    NextValue<native><override>()<transacts><decides>:entity

@experimental
slow_entity_array_copy_query_iterator<native><epic_internal> := class<epic_internal>(entity_query_iterator_interface):
    NextValue<native><override>()<transacts><decides>:entity

@hide_in_editor
@experimental
entity_query_manager_component<native><epic_internal> := class<final_super><epic_internal>(component):
    OnAddedToSceneInternal<native><override>():void

    OnRemovingFromSceneInternal<native><override>():void

@experimental
@deprecated
# Base class for all two-dimensional shapes.
shape2<native><epic_internal> := class<epic_internal>:


@experimental
@deprecated
# Base class for all three-dimensional shapes.
shape3<native><epic_internal> := class<epic_internal>:


@experimental
@deprecated
# A sphere in three-dimensional space.
sphere3<native><epic_internal> := class<final><concrete>(convex_volume3):
    # Center point of the sphere.
    Center<native><public>:vector3 = external {}

    # Radius of the sphere.
    Radius<native><public>:float = external {}

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

    OnAddedToSceneInternal<native><override>():void

    OnRemovingFromSceneInternal<native><override>():void

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
@available {MinUploadedAtFNVersion := 2930}
@deprecated
# Finds all descendant entities including `InEntity` whose `collision_component` shape is inside `Shape`.
# When querying from the simulation entity, the simulation entity itself is not included in the results.
# The order of the returned entities is unspecified and subject to change.
(InEntity:entity).FindDescendantEntitiesInside<native><epic_internal>(Shape:convex_volume3)<transacts>:generator(entity)

@experimental
@available {MinUploadedAtFNVersion := 2930}
@deprecated
# Finds all descendant entities including `InEntity` whose `collision_component` shape overlaps with `Shape`.
# When querying from the simulation entity, the simulation entity itself is not included in the results.
# The order of the returned entities is unspecified and subject to change.
(InEntity:entity).FindDescendantEntitiesOverlapping<native><epic_internal>(Shape:convex_volume3)<transacts>:generator(entity)

@experimental
@available {MinUploadedAtFNVersion := 2930}
@deprecated
# Finds all descendant entities including `InEntity` whose `transform_component.Translation` is inside `Shape`.
# When querying from the simulation entity, the simulation entity itself is not included in the results.
# The order of the returned entities is unspecified and subject to change.
(InEntity:entity).FindDescendantEntitiesOriginInside<native><epic_internal>(Shape:convex_volume3)<transacts>:generator(entity)

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

@experimental
@available {MinUploadedAtFNVersion := 2930}
@deprecated
# Finds all ancestor entities to `InEntity` whose `collision_component` shape is inside `Shape`.
# The order of the returned components is unspecified and subject to change.
(InEntity:entity).FindAncestorEntitiesInside<native><epic_internal>(Shape:convex_volume3)<transacts>:generator(entity)

@experimental
@available {MinUploadedAtFNVersion := 2930}
@deprecated
# Finds all ancestor entities to `InEntity` whose `collision_component` shape overlaps with `Shape`.
# The order of the returned components is unspecified and subject to change.
(InEntity:entity).FindAncestorEntitiesOverlapping<native><epic_internal>(Shape:convex_volume3)<transacts>:generator(entity)

@experimental
@available {MinUploadedAtFNVersion := 2930}
@deprecated
# Finds all ancestor entities to `InEntity` whose `transform_component.Translation` is inside `Shape`.
# The order of the returned components is unspecified and subject to change.
(InEntity:entity).FindAncestorEntitiesOriginInside<native><epic_internal>(Shape:convex_volume3)<transacts>:generator(entity)

@experimental
@deprecated
# Base class for all three-dimensional volumes.
volume3<native><epic_internal> := class<epic_internal>(shape3):
