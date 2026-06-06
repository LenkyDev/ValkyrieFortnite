using {/Verse.org/Colors}
using {/Verse.org/Temporary/EpicGamesRestricted/Network}
using {/Verse.org/Assets}
using {/Verse.org/Simulation/Tags}
using {/Verse.org/Simulation}
using {/Verse.org/Native}
using {/Verse.org/SpatialMath}
@import_as("/*.FBoundedBox")
# 3-dimensional box.
bounded_box<native><epic_internal> := struct<concrete>:
    BoxMin<native>:(/Verse.org/SpatialMath:)vector3 = external {}

    BoxMax<native>:(/Verse.org/SpatialMath:)vector3 = external {}

    Valid<native>:logic = external {}

# Implemented by classes whose instances can provide a bounds.
bounded<native><epic_internal> := interface:
    # Returns the associated bounded box for this object, in world space.
    GetBoundedGlobalBox<native_callable><epic_internal>()<transacts>:bounded_box

    # Returns the associated bounded box for this object, in local space.
    GetBoundedLocalBox<native_callable><epic_internal>()<transacts>:bounded_box

# Returns the bounds of this entity by accumulating bounded components, not including owned entities, in world space.
(InEntity:entity).GetSelfGlobalBounds<native><epic_internal>()<transacts>:bounded_box

# Returns the bounds of this entity by accumulating bounded components, including owned entities, in world space.
(InEntity:entity).GetGlobalBounds<native><epic_internal>()<transacts>:bounded_box

# Returns the bounds of this entity by accumulating bounded components, not including owned entities, in local space.
(InEntity:entity).GetSelfLocalBounds<native><epic_internal>()<transacts>:bounded_box

# Returns the bounds of this entity by accumulating bounded components, including owned entities, in local space.
(InEntity:entity).GetLocalBounds<native><epic_internal>()<transacts>:bounded_box

# Base class for authoring logic and data in the SceneGraph. Using components you
# can author re-usable building blocks of logic and data which can then be added to
# entities in the scene.
# 
# Components are a very low level building block which can be used in many ways.
# For example:
#   * Exposing engine level concepts like mesh or sound
#   * Adding gameplay capabilities like damage or interaction
#   * Storing an inventory for a character in the game
# 
# As components are generic there is no specific way that they must be used.
# It is up to the needs of your experience if you use one big game component
# or if you break up logic into many small components.
# 
# Classes deriving from component must also specify `<final_super>` to be added
# to entities. This ensures the class will always derive directly from `component`.
# Further subclassing of the initial derived component is allowed and does not require
# specifying `<final_super>` on the derived classes.
# 
# Only one instance of a component from each subclass group can be added to an entity
# at a time. For example, given this group of components, only one light_component can
# exist on a single entity. To create multiple lights you should use multiple entities.
# 
#   light_component             := class<final_super>(component){}
#   capsule_light_component     := class<final>(light_component){}
#   directional_light_component := class<final>(light_component){}
#   spot_light_component        := class<final>(light_component){}
#   sphere_light_component      := class<final>(light_component){}
#   rect_light_component        := class<final>(light_component){}
# 
# ==============================================================================
# Component Lifetime
# 
#   Components move through a series of lifetime functions as they are added
#   to entities, added to the scene, and begin running in the simulation. Components
#   should override these methods to perform setup and run their simulation.
# 
#   As a component shuts down it will then move through shutdown version of these
#   functions, giving users the opportunity to clean up any retained state on the
#   component before it is disposed
# .
#   Lifetime Methods:
#      OnAddedToScene
#        OnBeginSimulation -> OnSimulate<suspends>
#        OnEndSimulation
#      OnRemovingFromScene
# ==============================================================================
component<native><public> := class<abstract><unique><castable><final_super_base>(diagnosable):
    @allow_self_reference
    @experimental_always_overridden
    # The parent entity of this component.
    #   * Components must have a parent entity pointer provided when being constructed.
    #   * Components cannot be moved between parents.
    Entity<native><public>:entity

    # Called when the component is added to an entity using `entity.AddComponents`.
    #   * Components can check for dependent sibling components at this stage through `entity.GetComponents`.
    #   * Components can add additional components at this stage using `entity.AddComponents`
    OnInitialized<native><native_callable><epic_internal>():void

    # Called when the component is added to the scene by parenting it under the simulation entity or another entity already in the scene.
    #   * Querying for components in the scene is valid after this phase completes.
    OnAddedToScene<native><native_callable><protected>():void

    # Called when the component begins simulating within the scene.
    #   * Use this to set up TickEvent callbacks or other setup that must be guaranteed to complete immediately.
    #   * `OnAddedToScene` is guaranteed to run before `OnBeginSimulation`.
    OnBeginSimulation<native><native_callable><protected>():void

    # Called when the component begins simulating within the scene.
    #   * Use this to add asynchronous/suspends update logic for a component.
    #   * `OnBeginSimulation` is guaranteed to run before `OnSimulate`.
    #   * `OnSimulate` will be cancelled before `OnEndSimulation`
    OnSimulate<native_callable><protected>()<suspends>:void = external {}

    # Called when the component ends simulation within the scene.
    #   * Simulation ends on a component when the experience resets, the parent entity is removed from the scene.
    #   * Cached TickEvents cancelables should be canceled in `OnEndSimulation`.
    #   * `OnSimulate` task will be canceled before `OnEndSimulation` is called.
    #   * `OnEndSimulation` is only called on components that have already had `OnBeginSimulation` called.
    OnEndSimulation<native><native_callable><protected>():void

    # Called when the component is about to be removed from the scene.
    #   * Components are removed from a scene when the parent entity is removed from the scene.
    #   * `OnRemovingFromScene` is only called on components that have already had `OnAddedToScene` called.
    OnRemovingFromScene<native><native_callable><protected>():void

    # Called when the component is about to be removed from the parent entity.
    #   * `OnUninitializing` is only called on components that have already had `OnInitialized` called.
    OnUninitializing<native><native_callable><epic_internal>():void

    # Removes the component from the entity.
    #   * Removed components are removed from the scene and can only be added back to the same entity.
    #   * Flows through `OnEndSimulation`-> `OnRemovingFromScene`.
    RemoveFromEntity<native><final><public>():void

    # Succeeds if the component is currently initialized with its parent entity.
    #   * After `OnInitialized` is called this call succeeds.
    #   * After `OnUninitializing` is called this call fails.
    IsInitialized<native><final><epic_internal>()<reads><decides>:void

    # Succeeds if the component is currently in the scene.
    #   * After `OnAddedToScene` is called this call succeeds.
    #   * After `OnRemovingFromScene` is called this call fails.
    IsInScene<native><final><public>()<reads><decides>:void

    # Succeeds if the component is currently simulating.
    #   * After `OnBeginSimulation` is called this call succeeds.
    #   * After `OnEndSimulation` is called this call fails.
    IsSimulating<native><final><public>()<reads><decides>:void

    # Set callbacks to `TickEvents.PrePhysics` and `TickEvents.PostPhysics` to receive per-frame updates before and after physics is updated on your object.
    var<private> TickEvents<protected>:tick_events = external {}

    # Send a scene event to this component, invoking OnReceive.  Returns true if any participant consumed the event.
    SendDown<native><native_callable><final><public>(SceneEvent:scene_event):logic

    @available {MinUploadedAtFNVersion := 4000}
    # Respond to a scene event. Return true to consume the event and halt propagation to the next entity.
    OnReceive<native_callable><protected>(SceneEvent:scene_event):logic = external {}

    OnInitializedInternal<native><native_callable><epic_internal>():void

    OnAddedToSceneInternal<native><native_callable><epic_internal>():void

    OnBeginSimulationInternal<native><native_callable><epic_internal>():void

    OnEndSimulationInternal<native><native_callable><epic_internal>():void

    OnRemovingFromSceneInternal<native><native_callable><epic_internal>():void

    OnUninitializingInternal<native><native_callable><epic_internal>():void

    GetDiagnostic<override><native>()<reads>:diagnostic

@available {MinUploadedAtFNVersion := 4000}
# Use this method to create a component without the need of providing an entity.
# This is an internal method and should only be used to initialize a component field inside a verse class
InitializeComponentField<native><epic_internal>(component_type:castable_subtype(component))<converges>:component_type

@available {MinUploadedAtFNVersion := 4100}
# Helper function to aide in initializing the Entity pointer for components during component field construction inside a verse class
GetSelfEntityForComponentInitialization<native><epic_internal>()<converges>:entity

# Internal component used to flag an entity as the source of a Content Scope
content_scope_component<native><epic_internal> := class<final><final_super>(component):


# An event which can be sent through the scene graph.
scene_event<native><public> := interface:


@import_as("/Script/Entity.UBaseEntity")
base_entity<native><epic_internal> := class<abstract>:


# Entities are the base object in the SceneGraph.
#   * Objects in experiences are constructed of one or more entities.
#   * Entities are hierarchical. You can query your parent using `GetParent` and add child entities using `AddEntities`.
#   * Behavior is added to entities through `component`s. You can add new components using `AddComponents`.
#   * The structure and content of entities is dynamic and be changed at any time through your experience
# .
# ==============================================================================
# Deriving from entity
# 
#   In the SceneGraph system a class that derives from `entity` is also known as a prefab. Prefabs are useful when you
#   want to spawn/re-use a collection of entities and components many times within your game. Primarily prefabs are
#   authored through the editor, with their Verse classes generated as part of the build into the projects
#   Assets.digest.verse file.
# 
#   While you can create base prefabs for common game object types like a vehicle or character, we highly recommended
#   that you do not add code directly to the entity class, and instead keep logic in components. Keeping logic and data in
#   components allows you to restructure your prefabs throughout production of your experience, without needing to massively
#   refactor your class structure.
entity<native><public> := class<concrete><unique><transacts><castable>(base_entity, diagnosable, has_tags):
    # Returns the parent entity of this entity.
    #   * The parent entity controls the lifetime of its child entities and components. When an entity
    #     is removed from the scene, all its child entities and components will be removed as well.
    #   * Method fails if there is currently no parent entity.
    GetParent<native><final><public>()<reads><decides>:entity

    # Removes this entity from its parent. This is used to remove entities from the scene.
    #   * Components on this entity and its children will run through `OnEndSimulation` -> `OnRemovingFromScene`.
    #   * Entity can be added back later by using `NewParent.AddEntities`.
    RemoveFromParent<native><final><public>():void

    # Adds the provided entities as children of this entity.
    #   * If child entity already has a parent, removes the entity from its current parent and adds it to the new one.
    #   * Added child entities will move through their lifetime methods until they match the state of the new parent.
    AddEntities<native><final><public>(NewChildEntities:[]entity):void

    # Returns the child entities belonging to this entity which are accessible from the calling context.
    #   * This method only gets the direct entity children. To query multiple levels down the entity structure use
    #     the Find* query methods instead.
    GetEntities<native><final><public>()<reads>:[]entity

    @available {MinUploadedAtFNVersion := 3200}
    # Succeeds and returns the child component of type `component_type` if it exists and is accessible from the calling context.
    #   Note: When called during the AddedToScene or BeginSimulation phase, it will make sure the returned component has achieved the corresponding phase.
    #   Fails if no component of `component_type` exists or can be accessed.
    GetComponent<native><final><public>(component_type:castable_subtype(component))<reads><decides>:component_type

    # Returns the child components belonging to this entity which are accessible from the calling context.
    GetComponents<native><final><public>()<reads>:[]component

    # Adds the provided components to the entity.
    #   * If a component is not allowed to be added to this entity it is skipped.
    #   Note: When called during the AddedToScene or BeginSimulation phase, it will make sure the added component has achieved the corresponding phase.
    #   * Components are added following these rules:
    #       1. All components are added to the entity child list.
    #       2. All components have `OnAddedToScene` called (if this entity is in the scene).
    #       3. All components have `OnBeginSimulation` called (if this entity is simulating).
    AddComponents<native><final><public>(Components:[]component):void

    GetDiagnostic<override><native>()<reads>:diagnostic

    # Send a scene event to this entity and then up the hierarchy. First, SendDown/OnReceive will be invoked on each component on this entity. Next, SendUp will be invoked on this entity's parent. Consuming the event at any point will halt propagation. Returns true if any participant consumed the event.
    SendUp<native><native_callable><final><public>(SceneEvent:scene_event):logic

    # Send a scene event to this entity and then down the hierarchy. First, SendDown/OnReceive will be invoked on each component on this entity. Next, SendDown will be invoked on each child entity.  Consuming the event at any point will halt propagation. Returns true if any participant consumed the event.
    SendDown<native><native_callable><final><public>(SceneEvent:scene_event):logic

    # Adds a `tag` instance to this entity. Returns a `tag_key` that is uniquely associated with the added instance.
    AddTag<override><native><final>(Tag:tag)<transacts>:tag_key

    # Removes the tag instance associated with the `tag_key`, succeeds if an instance was removed, fails otherwise.
    RemoveTag<override><native><final>(Key:tag_key)<transacts><decides>:void

    @available {MinUploadedAtFNVersion := 3200}
    # Removes all tag instances of type `tag_type`, succeeds if at least one instance was removed, fails otherwise.
    RemoveAllTags<override><native><final>(tag_type:castable_subtype(tag))<transacts><decides>:void

    @available {MinUploadedAtFNVersion := 3200}
    # Removes all tag instances that are not of type `tag_type`, succeeds if at least one instance was removed, fails otherwise.
    RemoveAllTagsExcept<override><native><final>(tag_type:castable_subtype(tag))<transacts><decides>:void

    @available {MinUploadedAtFNVersion := 3200}
    # Removes all tag instances that are not of any of the types in `tag_types`, succeeds if at least one instance was removed, fails otherwise.
    RemoveAllTagsExcept<override><native><final>(tag_types:[]castable_subtype(tag))<transacts><decides>:void

    @available {MinUploadedAtFNVersion := 3200}
    # Succeeds if at least one tag of type `tag_type` is found in this container, fails otherwise.
    ContainsTag<override><native><final>(tag_type:castable_subtype(tag))<reads><decides>:void

    @available {MinUploadedAtFNVersion := 3200}
    # Fails if at least one type in `tag_types` cannot be found in this container, succeeds otherwise. Note that this means that if `tag_types` is empty this call succeeds.
    ContainsAllTags<override><native><final>(tag_types:[]castable_subtype(tag))<reads><decides>:void

    @available {MinUploadedAtFNVersion := 3200}
    # Succeeds if at least of the types in `tag_types` is found in this container, fails otherwise. Note that this means that if `tag_types` is empty this call fails.
    ContainsAnyTag<override><native><final>(tag_types:[]castable_subtype(tag))<reads><decides>:void

# Reference type to editor defined prefab. Only generated digest code should reference this type.
entity_prefab<native><public> := class<computes><epic_internal>(asset):


@available {MinUploadedAtFNVersion := 3200}
# Finds all descendant entities including `InEntity` that has any tags of type `tag_type`.
# When querying from the simulation entity, the simulation entity itself is not included in the results.
# The order of the returned entities is unspecified and subject to change.
(InEntity:entity).FindDescendantEntitiesWithTag<native><public>(tag_type:castable_subtype(tag))<transacts>:generator(entity)

@available {MinUploadedAtFNVersion := 3200}
# Finds all ancestor entities to `InEntity` that has any tags of type `tag_type`.
# The order of the returned entities is unspecified and subject to change.
(InEntity:entity).FindAncestorEntitiesWithTag<native><public>(tag_type:castable_subtype(tag))<transacts>:generator(entity)

change_icon_component_event<epic_internal> := class(scene_event):
    Entity<public>:entity

    IconComponent<public>:?icon_component = external {}

# Component that holds an icon for an entity.
icon_component<native><public> := class<final_super>(component, has_icon):
    var Icon<override>:texture = external {}

    var<private> HasChangedFields<native><epic_internal>:logic = external {}

    OnIconChanged<native><epic_internal>()<transacts>:void

    OnBeginSimulation<override>():void = external {}

    OnEndSimulation<override>():void = external {}

@hide_in_editor
mass_component<native><epic_internal> := class<final_super><epic_internal>(component):
    OnUninitializingInternal<native><override>():void

    OnAddedToSceneInternal<native><override>():void

    OnRemovingFromSceneInternal<native><override>():void

# Interface to provide alternative origin to an entity which is defaulted to its parent. See `transform_component`
origin<native><public> := interface<epic_internal>:
    GetTransform<native_callable><public>()<transacts>:(/Verse.org/SpatialMath:)transform

@available {MinUploadedAtFNVersion := 3200}
# class to provide alternative origin to the 'transform_component' as an entity
entity_origin<native><public> := class<final>(origin):
    @editable
    @replicated("RepNotify")
    Entity<native><public>:entity

    OnRep_Entity<native><epic_internal>():void

    @replicated("RepNotify")
    @transient
    var EntityOriginTransform<native><epic_internal>:(/Verse.org/SpatialMath:)transform = external {}

    OnRep_EntityOriginTransform<native><epic_internal>():void

    GetTransform<override>()<transacts>:(/Verse.org/SpatialMath:)transform = external {}

@import_as("/Script/CoreUObject.UObject")
actor<native><epic_internal> := class:


# class to provide alternative origin to the 'transform_component' as an actor. This class should never be public and is intended for internal use only.
actor_origin<native><epic_internal> := class(origin):
    @editable
    @replicated("RepNotify")
    Actor<native><epic_internal>:actor

    GetTransform<native><override>()<transacts>:(/Verse.org/SpatialMath:)transform

@experimental
# Used to attach entities to a socket on an actor.
socket_origin<native><epic_internal> := class(actor_origin):
    @editable
    @replicated("")
    var SocketName<native><public>:string

@available {MinUploadedAtFNVersion := 4000}
# Rarity may be used by gameplay and presentation systems to classify and rank things.
rarity<native><public> := class<castable><concrete><unique><allocates>:
    @editable
    Color<native><public>:color = external {}

@available {MinUploadedAtFNVersion := 4000}
common_rarity<public> := class<allocates>(rarity):


@available {MinUploadedAtFNVersion := 4000}
uncommon_rarity<public> := class<allocates>(common_rarity):
    Color<override>:color = external {}

@available {MinUploadedAtFNVersion := 4000}
rare_rarity<public> := class<allocates>(uncommon_rarity):
    Color<override>:color = external {}

@available {MinUploadedAtFNVersion := 4000}
epic_rarity<public> := class<allocates>(rare_rarity):
    Color<override>:color = external {}

@available {MinUploadedAtFNVersion := 4000}
legendary_rarity<public> := class<allocates>(epic_rarity):
    Color<override>:color = external {}

@available {MinUploadedAtFNVersion := 4000}
mythic_rarity<epic_internal> := class<allocates>(legendary_rarity):
    Color<override>:color = external {}

@available {MinUploadedAtFNVersion := 4000}
exotic_rarity<epic_internal> := class<allocates>(mythic_rarity):
    Color<override>:color = external {}

@available {MinUploadedAtFNVersion := 4000}
@experimental
impossible_rarity<epic_internal> := class<allocates>(exotic_rarity):
    Color<override>:color = external {}

@available {MinUploadedAtFNVersion := 4000}
change_rarity_component_event<epic_internal> := class(scene_event):
    Entity<public>:entity

    RarityComponent<public>:?rarity_component = external {}

@available {MinUploadedAtFNVersion := 4000}
# Component that denotes the rarity of an entity.
rarity_component<native><public> := class<final_super>(component):
    # The rarity of this entity. An entity can have only one rarity.
    var Rarity<public>:rarity = external {}

    var<private> HasChangedFields<native><epic_internal>:logic = external {}

    GetRarity<native><epic_internal>(__dupe___unnamed_parameter_0:accessor)<transacts>:rarity

    SetRarity<native><epic_internal>(__dupe___unnamed_parameter_0:accessor, InRarity:rarity)<transacts>:void

    OnBeginSimulation<override>():void = external {}

    OnEndSimulation<override>():void = external {}

replication_component<native><epic_internal> := class<final_super>(component):
    OnAddedToSceneInternal<native><override>():void

    OnRemovingFromSceneInternal<native><override>():void

    OnBeginSimulationInternal<native><override>():void

    OnEndSimulationInternal<native><override>():void

    @category("Epic Internal")
    @editable
    # Internal only - Flag to enable or disable replication
    EnableReplication<native><epic_internal>:logic = external {}

    @category("Epic Internal")
    @editable
    # Internal only - Flag to make this entity always relevant for replication to clients
    AlwaysRelevant<native><epic_internal>:logic = external {}

    var NetCullDistance<epic_internal>:float = external {}

    SetNetCullDistanceOverride<native><epic_internal>(Override:float)<transacts>:void

    ClearNetCullDistanceOverride<native><epic_internal>()<transacts>:void

@hide_in_editor {CVar := "SimulationEntity.AllowCustomSimulationEntities"; Hidden := false}
simulation_entity<native><epic_internal> := class<concrete><unique><transacts>(entity):


# Returns the simulation entity parent for this entity.
#   * The simulation entity is the rootmost entity in an experience.
#   * Fails if this entity is not currently in the scene.
(InEntity:entity).GetSimulationEntity<native><public>()<transacts><decides>:entity

@available {MinUploadedAtFNVersion := 4000}
# A component that when attached to an entity allows for it to merge or 'stack' with other entities with compatible components.
stackable_component<native><public> := class<abstract><final_super>(component):
    @editable_number(int) {MinValue := option {1}}
    # The current amount of this entity held in the stack.
    var<private> StackSize<native><public>:int = external {}

    @editable
    # The maximum amount this component can hold. If unset, it holds an unlimited amount.
    var<private> MaxStackSize<native><public>:?int = external {}

    var<private> HasChangedFields<native><epic_internal>:logic = external {}

    # Sets the stack size of this component. If the provided stack size is invalid, e.g. negative or exceeding MaxStackSize, stack size will not change.
    SetStackSize<final><native><public>(NewStackSize:int)<transacts>:void

    # Sets the maximum stack size for this component. If NewMaxStackSize is false, stack size is unlimited. If ClampStackSize is true, StackSize will be clamped to NewMaxStackSize.
    SetMaxStackSize<final><native><public>(NewMaxStackSize:?int, ?ClampStackSize:logic = external {})<transacts>:void

    Split<native_callable><public>(Amount:int)<transacts><decides>:entity

    # Succeeds if this entity can be merged into the target entity. Merging an entity with itself will always fail. Note that merging should be checked in both directions!
    CanMergeInto<native_callable><public>(TargetEntity:entity)<reads><decides>:void = external {}

    CanMergeIntoInternal<final><native><epic_internal>(TargetEntity:entity)<reads>:?logic

    # Attempts to merge this entity into the specified entity. Fails if entities cannot be merged.
    #  If TargetAmount is specified, only that amount will try to be merged into this entity. By default, the entire stack will try to merge.
    #  If the specified amount is invalid, the merge will fail.
    MergeInto<native_callable><public>(TargetEntity:entity, ?TargetAmount:?int = external {})<transacts><decides>:void = external {}

    MergeIntoInternal<final><native><epic_internal>(TargetEntity:entity, TargetAmount:int)<transacts><decides>:int

    ChangeStackSizeEvent<native><final><public>:listenable(change_stack_size_result) = external {}

    ChangeMaxStackSizeEvent<native><final><public>:listenable(change_max_stack_size_result) = external {}

    OnBeginSimulation<override>():void = external {}

    OnEndSimulation<override>():void = external {}

@available {MinUploadedAtFNVersion := 4000}
change_stack_size_result<native><public> := class<epic_internal>:
    StackableComponent<native><public>:stackable_component

    PreviousStackSize<native><public>:int

    CurrentStackSize<native><public>:int

@available {MinUploadedAtFNVersion := 4000}
change_max_stack_size_result<native><public> := class<epic_internal>:
    StackableComponent<native><public>:stackable_component

    PreviousMaxStackSize<native><public>:?int

    CurrentMaxStackSize<native><public>:?int

@available {MinUploadedAtFNVersion := 4000}
change_stackable_component_event<epic_internal> := class(scene_event):
    Entity<public>:entity

    StackableComponent<public>:?stackable_component = external {}

# Merge Rules Interface. Implemented by components that want to participate in entity mergeability checks.
has_merge_rules<public> := interface<unique>:
    AllowMergeInto<public>(TargetEntity:entity)<reads><decides>:void = external {}

    OnMergeInto<public>(TargetEntity:entity, MergeAmount:int)<transacts>:void = external {}

@available {MinUploadedAtFNVersion := 4000}
basic_stackable_component<native><public> := class(stackable_component):
    @editable
    # The prefab used when this entity merges with another or when it is split into a new instance.
    split_prefab_type<native><public>:castable_concrete_subtype(entity) = external {}

    Split<override>(Amount:int)<transacts><decides>:entity = external {}

    # Succeeds if this entity can be merged into the target entity. Merging an entity with itself will always fail.
    CanMergeInto<override>(TargetEntity:entity)<reads><decides>:void = external {}

# Describes discrete phases of a frame update. Subscribe to members of the tick_events object to run code before or after the physics system has updated your object, allowing you to affect or react to these updates.
tick_events<native><public> := class<epic_internal>:
    # Listen `PrePhysics` to run your code before the physics system has updated your object this frame.
    PrePhysics<native><public>:execution_listenable = external {}

    StartPhysics<native><epic_internal>:execution_listenable = external {}

    DuringPhysics<native><epic_internal>:execution_listenable = external {}

    EndPhysics<native><epic_internal>:execution_listenable = external {}

    # Listen `PostPhysics` to run your code after the physics system has updated your object this frame.
    PostPhysics<native><public>:execution_listenable = external {}

    EndFrame<native><epic_internal>:execution_listenable = external {}

# Stores the transforms for an entity, which are used to position the entity.
transform_component<native><public> := class<final><final_super>(component):
    OnInitializedInternal<native><override>():void

    OnUninitializingInternal<native><override>():void

    # Current transform of the entity, globally referenced. Any value set at construction will be overrridden with the calculation from the Local Transform
    var GlobalTransform<public>:(/Verse.org/SpatialMath:)transform = external {}

    # LocalTransform to its parent/origin
    var LocalTransform<public>:(/Verse.org/SpatialMath:)transform = external {}

    # alternate origin than the default parent entity
    var Origin<public>:?origin = external {}

# Returns the global transform of this entity, in the case the entity does not have a transform_component it will return the transform of the first parent that has a transform
(InEntity:entity).GetGlobalTransform<native><public>()<transacts>:(/Verse.org/SpatialMath:)transform

# Returns the local transform of this entity, in the case the entity does not have a transform_component it will return identity
(InEntity:entity).GetLocalTransform<native><public>()<transacts>:(/Verse.org/SpatialMath:)transform

# Returns the origin of the entity in any, in the case the entity does not have a transform_component the method will fail
(InEntity:entity).GetOrigin<native><public>()<transacts><decides>:origin

# Sets the global transform of this entity, in the case the entity does not have a transform_component it will create one and set its global transform
(InEntity:entity).SetGlobalTransform<native><public>(NewGlobalTransform:(/Verse.org/SpatialMath:)transform)<transacts>:void

# Sets the local transform of this entity, in the case the entity does not have a transform_component it will create one and set its local transform
(InEntity:entity).SetLocalTransform<native><public>(NewLocalTransform:(/Verse.org/SpatialMath:)transform)<transacts>:void

# Sets the origin of this entity, in the case the entity does not have a transform_component it will create one and set its origin. This method fails if it recognized dependency recursion.
(InEntity:entity).SetOrigin<native><public>(NewOrigin:origin)<transacts>:void

# Resets the origin of this entity, which will now default to its parent
(InEntity:entity).ResetOrigin<native><public>()<transacts>:void