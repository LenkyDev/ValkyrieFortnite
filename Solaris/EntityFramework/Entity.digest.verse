using {/Verse.org/Simulation}
using {/Verse.org/SpatialMath}
using {/Verse.org/Native}
@experimental
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
#     OnInitialized
#        OnAddedToScene
#          OnBeginSimulation -> OnSimulate<suspends>
#          OnEndSimulation
#        OnRemovingFromScene
#     OnUninitializing
# ==============================================================================
component<native><public> := class<abstract><unique><castable><final_super_base>:
    @experimental
    # The parent entity of this component.
    #   * Components must have a parent entity pointer provided when being constructed.
    #   * Components cannot be moved between parents.
    Entity<native><public>:entity

    @experimental
    # Called when the component is added to the scene by parenting it under the simulation entity or another entity already in the scene.
    #   * Querying for components in the scene is valid after this phase completes.
    #   * `OnInitialized` is guaranteed to run before `OnAddedToScene`.
    OnAddedToScene<native><native_callable><protected>():void

    @experimental
    # Called when the component begins simulating within the scene.
    #   * Use this to set up TickEvent callbacks or other setup that must be guaranteed to complete immediately.
    #   * `OnAddedToScene` is guaranteed to run before `OnBeginSimulation`.
    OnBeginSimulation<native><native_callable><protected>():void

    @experimental
    # Called when the component begins simulating within the scene.
    #   * Use this to add asynchronous/suspends update logic for a component.
    #   * `OnBeginSimulation` is guaranteed to run before `OnSimulate`.
    #   * `OnSimulate` will be cancelled before `OnEndSimulation`
    OnSimulate<native_callable><protected>()<suspends>:void = external {}

    @experimental
    # Called when the component ends simulation within the scene.
    #   * Simulation ends on a component when the experience resets, the parent entity is removed from the scene.
    #   * Cached TickEvents cancelables should be canceled in `OnEndSimulation`.
    #   * `OnSimulate` task will be canceled before `OnEndSimulation` is called.
    #   * `OnEndSimulation` is only called on components that have already had `OnBeginSimulation` called.
    OnEndSimulation<native><native_callable><protected>():void

    @experimental
    # Called when the component is about to be removed from the scene.
    #   * Components are removed from a scene when the parent entity is removed from the scene.
    #   * `OnRemovingFromScene` is only called on components that have already had `OnAddedToScene` called.
    OnRemovingFromScene<native><native_callable><protected>():void

    @experimental
    # Removes the component from the entity.
    #   * Removed components are removed from the scene and can only be added back to the same entity.
    #   * Flows through `OnEndSimulation`-> `OnRemovingFromScene`-> `OnUninitializing`.
    RemoveFromEntity<native><final><public>():void

    @experimental
    # Succeeds if the component is currently initialized with its parent entity.
    #   * After `OnInitialized` is called this call succeeds.
    #   * After `OnUninitializing` is called this call fails.
    IsInitialized<native><final><public>()<transacts><decides>:void

    @experimental
    # Succeeds if the component is currently in the scene.
    #   * After `OnAddedToScene` is called this call succeeds.
    #   * After `OnRemovingFromScene` is called this call fails.
    IsInScene<native><final><public>()<transacts><decides>:void

    @experimental
    # Succeeds if the component is currently simulating.
    #   * After `OnBeginSimulation` is called this call succeeds.
    #   * After `OnEndSimulation` is called this call fails.
    IsSimulating<native><final><public>()<transacts><decides>:void

    @experimental
    # Set callbacks to `TickEvents.PrePhysics` and `TickEvents.PostPhysics` to receive per-frame updates before and after physics is updated on your object.
    var<private> TickEvents<protected>:tick_events = external {}

    @experimental
    # Respond to an event being propagated through the scene graph. Returns if the event is consumed, in which case the event will not be passed to the next entity, depending on how the event is being sent through the hierarchy.
    OnReceive<native><native_callable><public>(SceneEvent:scene_event):logic

@experimental
# An event which can be sent through the scene graph.
scene_event<native><public> := interface:


@experimental
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
entity<native><public> := class<concrete><unique><transacts><castable>:
    @experimental
    # Returns the parent entity of this entity.
    #   * The parent entity controls the lifetime of its child entities and components. When an entity
    #     is removed from the scene, all its child entities and components will be removed as well.
    #   * Method fails if there is currently no parent entity.
    GetParent<native><final><public>()<transacts><decides>:entity

    @experimental
    # Removes this entity from its parent. This is used to remove entities from the scene.
    #   * Components on this entity and its children will run through `OnEndSimulation` -> `OnRemovingFromScene`.
    #   * Entity can be added back later by using `NewParent.AddEntities`.
    RemoveFromParent<native><final><public>():void

    @experimental
    # Adds the provided entities as children of this entity.
    #   * If child entity already has a parent, removes the entity from its current parent and adds it to the new one.
    #   * Added child entities will move through their lifetime methods until they match the state of the new parent.
    AddEntities<native><final><public>(NewChildEntities:[]entity):void

    @experimental
    # Returns the child entities belonging to this entity which are accessible from the calling context.
    #   * This method only gets the direct entity children. To query multiple levels down the entity structure use
    #     the Find* query methods instead.
    GetEntities<native><final><public>()<transacts>:[]entity

    @experimental
    @available {MinUploadedAtFNVersion := 3200}
    # Succeeds and returns the child component of type `component_type` if it exists and is accessible from the calling context.
    #   Note: When called during the Initialize, AddedToScene or BeginSimulation phase, it will make sure the returned component has achieved the corresponding phase.
    #   Fails if no component of `component_type` exists or can be accessed.
    GetComponent<native><final><public>(component_type:castable_subtype(component))<transacts><decides>:component_type

    @experimental
    # Returns the child components belonging to this entity which are accessible from the calling context.
    GetComponents<native><final><public>()<transacts>:[]component

    @experimental
    # Adds the provided components to the entity.
    #   * If a component is not allowed to be added to this entity it is skipped.
    #   Note: When called during the Initialize, AddedToScene or BeginSimulation phase, it will make sure the added component has achieved the corresponding phase.
    #   * Components are added following these rules:
    #       1. All components are added to the entity child list.
    #       2. All components have `OnInitialized` called.
    #       3. All components have `OnAddedToScene` called (if this entity is in the scene).
    #       4. All components have `OnBeginSimulation` called (if this entity is simulating).
    AddComponents<native><final><public>(Components:[]component):void

    @experimental
    # Send a scene event to only this entity. Returns true if the event was consumed.
    SendDirect<final><native><public>(SceneEvent:scene_event):logic

    @experimental
    # Send a scene event to this entity and its ancestors. Events do not propagate beyond the Simulation Entity. OnReceive will be invoked for each entity. Consuming the event will halt propagation to the next ancestor. Returns true if the event was consumed.
    SendUp<final><native><public>(SceneEvent:scene_event):logic

    @experimental
    # Send a scene event to this entity and all of its descendants. OnReceive will be invoked for each entity. Consuming the event at any entity will halt propagation down that subtree. Entities are traversed in breadth-first order, i.e. each layer is evaluated before moving deeper. Returns true if the event was consumed.
    SendDown<final><native><public>(SceneEvent:scene_event):logic

@experimental
# Reference type to editor defined prefab. Only generated digest code should reference this type.
entity_prefab<native><public> := class<computes><epic_internal>:


@experimental
# Interface to provide alternative origin to an entity which is defaulted to its parent. See `transform_component`
origin<native><public> := interface<epic_internal>:
    GetTransform<native_callable><public>()<transacts>:(/Verse.org/SpatialMath:)transform

@experimental
@available {MinUploadedAtFNVersion := 3200}
# class to provide alternative origin to the 'transform_component' as an entity
entity_origin<native><public> := class<epic_internal>(origin):
    @editable
    Entity<native><public>:entity

    GetTransform<override>()<transacts>:(/Verse.org/SpatialMath:)transform = external {}

@experimental
# Returns the simulation entity parent for this entity.
#   * The simulation entity is the rootmost entity in an experience.
#   * Fails if this entity is not currently in the scene.
(InEntity:entity).GetSimulationEntity<native><public>()<transacts><decides>:entity

@experimental
# Describes discrete phases of a frame update. Subscribe to members of the tick_events object to run code before or after the physics system has updated your object, allowing you to affect or react to these updates.
tick_events<native><public> := class<epic_internal>:
    # Listen `PrePhysics` to run your code before the physics system has updated your object this frame.
    PrePhysics<native><public>:execution_listenable = external {}

    # Listen `PostPhysics` to run your code after the physics system has updated your object this frame.
    PostPhysics<native><public>:execution_listenable = external {}

@experimental
# Stores the transforms for an entity, which are used to position the entity.
transform_component<native><public> := class<final><final_super>(component):
    # Sets the global transform of the entity.
    SetGlobalTransform<native><public>(NewGlobalTransform:(/Verse.org/SpatialMath:)transform)<transacts>:void

    # Returns the global transform of the entity.
    GetGlobalTransform<native><public>()<transacts>:(/Verse.org/SpatialMath:)transform

    # Sets the local transform of the entity.
    SetLocalTransform<native><public>(NewLocalTransform:(/Verse.org/SpatialMath:)transform)<transacts>:void

    @editable
    # LocalTransform to its parent
    var<private> LocalTransform<native><public>:(/Verse.org/SpatialMath:)transform = external {}

    # alternate origin than the default parent
    var<private> Origin<native><public>:?origin = external {}

@experimental
# Returns the global transform of this entity, in the case the entity does not have a transform_component it will return the transform of the first parent that has a transform
(InEntity:entity).GetGlobalTransform<native><public>()<transacts>:(/Verse.org/SpatialMath:)transform

@experimental
# Returns the local transform of this entity, in the case the entity does not have a transform_component it will return identity
(InEntity:entity).GetLocalTransform<native><public>()<transacts>:(/Verse.org/SpatialMath:)transform

@experimental
# Returns the origin of the entity in any, in the case the entity does not have a transform_component the method will fail
(InEntity:entity).GetOrigin<native><public>()<transacts><decides>:origin

@experimental
# Sets the global transform of this entity, in the case the entity does not have a transform_component it will create one and set its global transform
(InEntity:entity).SetGlobalTransform<native><public>(NewGlobalTransform:(/Verse.org/SpatialMath:)transform)<transacts>:void

@experimental
# Sets the local transform of this entity, in the case the entity does not have a transform_component it will create one and set its local transform
(InEntity:entity).SetLocalTransform<native><public>(NewLocalTransform:(/Verse.org/SpatialMath:)transform)<transacts>:void

@experimental
# Sets the origin of this entity, in the case the entity does not have a transform_component it will create one and set its origin. This method fails if it recognized dependency recursion.
(InEntity:entity).SetOrigin<native><public>(NewOrigin:origin)<transacts><decides>:void

@experimental
# Resets the origin of this entity, which will now default to its parent
(InEntity:entity).ResetOrigin<native><public>()<transacts>:void