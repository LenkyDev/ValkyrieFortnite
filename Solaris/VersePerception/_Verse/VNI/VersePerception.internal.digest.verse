# Verse path: /Verse.org/Perception
using {/Verse.org/Simulation}
using {/Verse.org/Native}
using {/Verse.org/SceneGraph}
@available {MinUploadedAtFNVersion := 4300}
@experimental
# Common fields on every sense detection event.
sense_detection_event<public> := class(scene_event):
    # The entity this perception attributes to.
    DetectedEntity<public>:entity

    # Whether this event begins, ends, or is a single instant detection.
    DetectionState<public>:sense_detection_state

@available {MinUploadedAtFNVersion := 4300}
@experimental
# Detection lifecycle stage carried on every perception event.
sense_detection_state<native><public> := enum<open>:
    # Continuous detection begins.
    Active
    # Continuous detection ends.
    Inactive
    # A single fire-and-done detection with no begin/end pairing.
    Instant

@available {MinUploadedAtFNVersion := 4300}
@experimental
# Touch perception data. Carries the underlying collision_hit verbatim so consumers get impulse, contact location, normal, other-entity reference, and any other collision fields the platform exposes.
touch_data<epic_internal> := class<castable>:
    # The collision hit that produced this detection.
    Hit<epic_internal>:collision_hit

@available {MinUploadedAtFNVersion := 4300}
@experimental
# Touch perception event. DetectionState is Active on the first mesh_part contact with an emitter, Inactive when the last separates. TouchData is a snapshot fixed at the transition; for values tracking the ongoing contact call Detector.GetCurrentTouchData during Active. Cast an incoming scene_event via touch_detection_event[E] for typed access.
touch_detection_event<public> := class<epic_internal>(sense_detection_event):
    # The emitter that was touched.
    Emitter<public>:touch_emitter_component

    # The detector that felt the touch.
    Detector<public>:touch_detector_component

    # Active or Inactive; touch is continuous and never emits Instant.
    DetectionState<override>:sense_detection_state

    # Snapshot of the contact for this transition.
    TouchData<epic_internal>:touch_data

@available {MinUploadedAtFNVersion := 4300}
@experimental
# Predicate invoked per touch_detection_event; deciding delivers the event to the subscriber.
touch_filter<public> := type {_(:touch_detection_event)<decides><reads>:void}

@available {MinUploadedAtFNVersion := 4300}
@experimental
# Marks an entity as something that can be touched. Placement matters: collisions look upward through the scene graph from the colliding entity to find the nearest ancestor bearing a touch_emitter_component; a collision with no touch_emitter anywhere in the ancestry fires no event.
touch_emitter_component<public> := class<final_super>(component):
    # The entity this emitter attributes perceptions to. Defaults to the emitter's own entity; override for dynamic attribution.
    GetRepresentedEntity<public>()<transacts>:entity = external {}

    OnRemovingFromScene<override>():void = external {}

@available {MinUploadedAtFNVersion := 4300}
@experimental
# Marks an entity as something that perceives touch. Sources collision events from its Meshes. The detector defers subscribing to those mesh events until it has at least one subscriber, and tears the subscriptions down when the last subscriber cancels.
touch_detector_component<public> := class<final_super>(component):
    @editable
    # Mesh components whose collision events feed this detector. Multiple meshes suit entities like vehicles with many collision-participating meshes but one touch listener. Left empty, the detector uses a mesh_component on its own entity at simulation start.
    var<private> Meshes<public>:[]mesh_component = external {}

    # Live collide listeners: three per collidable mesh_part while subscribed, zero otherwise.
    var DebugListenerCount<epic_internal>:int = external {}

    # Begin-collide callbacks received.
    var DebugEnterFires<epic_internal>:int = external {}

    # End-collide callbacks received.
    var DebugExitFires<epic_internal>:int = external {}

    # Continuing-collide callbacks received; steady while a contact is live.
    var DebugContinuedFires<epic_internal>:int = external {}

    # Hits with no identifiable mesh_part, where residency falls back to closing on the first end-collide.
    var DebugPartUnresolved<epic_internal>:int = external {}

    # Contacts closed by an emitter announcing its removal rather than by an end-collide.
    var DebugEmitterClosed<epic_internal>:int = external {}

    # Begin-collide hits whose other party resolved to a touch_emitter_component up the ancestry.
    var DebugEmitterResolved<epic_internal>:int = external {}

    # Begin-collide hits with no touch_emitter_component anywhere up the ancestry.
    var DebugEmitterMissed<epic_internal>:int = external {}

    # Events handed to the dispatch queue: one per accepting subscriber per event.
    var DebugEnqueued<epic_internal>:int = external {}

    OnBeginSimulation<override>():void = external {}

    OnSimulate<override>()<suspends>:void = external {}

    OnEndSimulation<override>():void = external {}

    # Subscribe Receiver to touch events from this detector. Filter runs against each event; deciding delivers to Receiver.OnReceive (via SendDown). Cancel the returned cancelable to unsubscribe. On the first subscriber the detector wires up its mesh collision listeners.
    Subscribe<public>(Receiver:entity, Filter:touch_filter)<transacts>:cancelable = external {}

    # Add mesh components to the detector's collision-event sources. If the detector currently has active subscribers, the collision listeners are re-wired immediately to include the new meshes.
    AddMeshComponents<public>(NewMeshes:[]mesh_component)<transacts>:void = external {}

    # Remove mesh components from the detector's collision-event sources. If the detector currently has active subscribers, the collision listeners are re-wired to drop the removed meshes.
    RemoveMeshComponents<public>(TargetMeshes:[]mesh_component)<transacts>:void = external {}

    # Return the latest touch_data cached for Emitter. Succeeds while this detector has an open contact with it, fails otherwise. Refreshed on every continuing-collide signal.
    GetCurrentTouchData<epic_internal>(Emitter:touch_emitter_component)<transacts><decides>:touch_data = external {}