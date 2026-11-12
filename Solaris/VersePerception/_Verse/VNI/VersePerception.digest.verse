# Verse path: /Verse.org/Perception
using {/Verse.org/Simulation}
using {/Verse.org/Simulation/Tags}
using {/Verse.org/SpatialMath}
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

@available {MinUploadedAtFNVersion := 4310}
@experimental
# Hearing perception data.
hearing_data<public> := class<castable>:
    # Loudness at the source, in decibels.
    Loudness<public>:float

    # Global position the sound came from, at observation time.
    Position<public>:(/Verse.org/SpatialMath:)vector3 = external {}

    # Tags classifying this sound.
    SoundTags<public>:[]tag = external {}

@available {MinUploadedAtFNVersion := 4310}
@experimental
# Perception event for Hearing.
hearing_detection_event<public> := class(sense_detection_event):
    # The `hearing_emitter_component` that produced this detection.
    Emitter<public>:hearing_emitter_component

    # The `hearing_detector_component` that observed this detection.
    Detector<public>:hearing_detector_component

    # Active or Inactive for passive audible sources.
    # Instant for one-shot pulses fired via Emit.
    DetectionState<override>:sense_detection_state

    # Snapshot of the hearing_data at event time.
    HearingData<public>:hearing_data

@available {MinUploadedAtFNVersion := 4310}
@experimental
# Predicate invoked per `hearing_detection_event`.
# The event is delivered to the subscriber only when the filter succeeds.
hearing_filter<public> := type {_(:hearing_detection_event)<decides><reads>:void}

@available {MinUploadedAtFNVersion := 4310}
@experimental
# Marks an entity as something that can be heard.
hearing_emitter_component<native><public> := class<final_super>(component, spatial_sense_emitter):
    # Whether passive emission is active.
    # When true, this emitter is discoverable by hearing detectors via its passive channel.
    # Emit pulses are unaffected.
    var PassiveEmissionEnabled<public>:logic = external {}

    @editable
    # Passive Loudness at the source, in decibels.
    var PassiveEmissionLoudness<public>:float

    @editable
    # Passive emission Tags applied to this emitter's sound.
    var PassiveEmissionSoundTags<public>:[]tag = external {}

    ParticipatesInBroadphase<protected>()<transacts>:logic = external {}

    OnBeginSimulation<override>():void = external {}

    OnEndSimulation<override>():void = external {}

    # Returns the entity this emitter attributes perceptions to.
    # Override for dynamic attribution.
    # Defaults to the emitter's own entity.
    GetRepresentedEntity<public>()<transacts>:entity = external {}

    # Returns this emitter's passive hearing_data.
    GetPassiveHearingData<public>()<transacts>:hearing_data = external {}

    # Fires a one-shot hearing_detection_event with DetectionState = Instant to overlapping detectors, carrying the given SenseData.
    # Fires regardless of PassiveEmissionEnabled.
    Emit<public>(SenseData:hearing_data):void = external {}

@available {MinUploadedAtFNVersion := 4310}
@experimental
# Marks an entity as something that can hear.
hearing_detector_component<native><public> := class<final_super>(component, spatial_sense_detector):
    # The emitter type this detector pairs with.
    EmitterType<override>:castable_subtype(spatial_sense_emitter) = external {}

    OnSimulate<override>()<suspends>:void = external {}

    OnEndSimulation<override>():void = external {}

    OnBeginSimulation<override>():void = external {}

    # Subscribes Receiver to hearing events.
    # When a `hearing_detection_event` from this detector passes Filter, it is sent down to Receiver.
    # Cancel the returned cancelable to unsubscribe.
    Subscribe<public>(Receiver:entity, Filter:hearing_filter)<transacts>:cancelable = external {}

    OnSpatialChange<override>(Emitter:spatial_sense_emitter, State:sense_detection_state)<transacts>:void = external {}

    # Returns the current hearing_data for the given emitter as heard by this detector.
    # Fails if the detector is not currently detecting the given emitter.
    GetCurrentHearingData<public>(Emitter:hearing_emitter_component)<transacts><decides>:hearing_data = external {}

@available {MinUploadedAtFNVersion := 4310}
@experimental
# Sight perception data.
sight_data<public> := class<castable>:
    # Perceived clarity of the entity from `0.0` (invisible) to `1.0` (fully clear).
    Clarity<public>:float = external {}

    # Global position of the represented entity when the event was delivered.
    Position<public>:(/Verse.org/SpatialMath:)vector3 = external {}

    # Global position of the detector when the event was delivered.
    DetectorPosition<public>:(/Verse.org/SpatialMath:)vector3 = external {}

@available {MinUploadedAtFNVersion := 4310}
@experimental
# Perception event for Sight.
sight_detection_event<public> := class(sense_detection_event):
    # The `sight_emitter_component` that produced this detection.
    Emitter<public>:sight_emitter_component

    # The `sight_detector_component` that observed this detection.
    Detector<public>:sight_detector_component

    # The entity this perception attributes to.
    DetectedEntity<override>:entity

    # The detection state at event time.
    DetectionState<override>:sense_detection_state

    # Snapshot of the sight_data at event time.
    SightData<public>:sight_data

@available {MinUploadedAtFNVersion := 4310}
@experimental
# Predicate invoked per sight_detection_event. The event is delivered to the subscriber only when the filter succeeds.
sight_filter<public> := type {_(:sight_detection_event)<decides><reads>:void}

@available {MinUploadedAtFNVersion := 4310}
@experimental
# Marks an entity as something that can be seen.
sight_emitter_component<native><public> := class<final_super>(component):
    # Points on the entity whose visibility determines the entity's visibility.
    # The entity is perceived while any of these points are visible and its transform is inside the detector's cone.
    # An empty array defaults to a single point at the attached entity's transform.
    var VisibilityPoints<public>:[]origin = external {}

    # Whether this emitter is currently perceivable by sight detectors. Set to false to suppress passive detection.
    var PassiveEmissionEnabled<public>:logic = external {}

    OnBeginSimulation<override>():void = external {}

    OnEndSimulation<override>():void = external {}

    # Returns the entity this emitter attributes perceptions to.
    # Override for dynamic attribution, e.g. a held weapon attributing to its wielder.
    # Defaults to the entity this emitter is attached to.
    GetRepresentedEntity<public>()<transacts>:entity = external {}

    # Returns this emitter's current sight_data, evaluated from the given detector position.
    GetSightData<public>(DetectorPosition:(/Verse.org/SpatialMath:)vector3)<transacts>:sight_data = external {}

@available {MinUploadedAtFNVersion := 4310}
@experimental
# Marks an entity as something that can see.
# HalfAngle, Range, and NearClipRadius together define the sight cone, aligned along the entity's Forward axis.
sight_detector_component<native><public> := class<final_super>(component):
    @editable
    # Cone half-angle in radians. Clamped between `0.0` and `pi/2`.
    var HalfAngle<native><public>:float

    @editable
    # Cone length in centimeters.
    var Range<native><public>:float

    @editable
    # Additional radians beyond HalfAngle before an Active detection transitions to Inactive.
    var HysteresisAngle<native><public>:float = external {}

    @editable
    # Additional centimeters beyond Range before an Active detection transitions to Inactive.
    var HysteresisRange<native><public>:float = external {}

    @editable
    # Radius in centimeters around the sensor within which emitters are not perceived.
    var NearClipRadius<native><public>:float = external {}

    OnBeginSimulation<override>():void = external {}

    OnSimulate<override>()<suspends>:void = external {}

    OnEndSimulation<override>():void = external {}

    # Subscribes Receiver to sight events.
    # When a `sight_detection_event` from this detector passes Filter, it is sent down to Receiver.
    # Cancel the returned cancelable to unsubscribe.
    Subscribe<public>(Receiver:entity, Filter:sight_filter)<transacts>:cancelable = external {}

    # Returns the current sight_data for the given emitter as seen by this detector.
    # Fails if the detector is not currently detecting the given emitter.
    GetCurrentSightData<public>(Emitter:sight_emitter_component)<transacts><decides>:sight_data = external {}

@available {MinUploadedAtFNVersion := 4310}
@experimental
# Paired with a `spatial_sense_detector`, implement this interface on a `component` to mark it as a sense emitter.
# Emits as a point at the entity's transform. A `mesh_component` can be added to the entity to define an emission volume.
# An emitter is detected when either an emitter is inside a detector's volume or a detector is inside an emitter's volume.
spatial_sense_emitter<native><public> := interface:
    # Enrolls this emitter in the spatial perception system so detectors can find it. Fails if the implementer is not a `component`, or is already enrolled. Cancel the returned cancelable to unenroll.
    RegisterEmitter<final><public>()<transacts><decides>:cancelable = external {}

@available {MinUploadedAtFNVersion := 4310}
@experimental
# Paired with a `spatial_sense_emitter`, implement this interface on a `component` to mark it as a sense detector. Detects from a point at the entity's transform.
# A `mesh_component` can be added to the entity to define a detection volume.
# A detector detects a sense when either an emitter is inside a detector's volume or a detector is inside an emitter's volume.
# On detection, `OnSpatialChange` is invoked.
spatial_sense_detector<native><public> := interface:
    # The emitter type this detector pairs with.
    EmitterType<public>:castable_subtype(spatial_sense_emitter)

    # Enrolls this detector in the perception system so it can perceive emitters. Fails if the implementer is not a `component`, or is already enrolled. Cancel the returned cancelable to unenroll.
    RegisterDetector<final><public>()<transacts><decides>:cancelable = external {}

    # Fires on overlap changes between this detector and a paired emitter.
    OnSpatialChange<native_callable><protected>(Emitter:spatial_sense_emitter, State:sense_detection_state)<transacts>:void = external {}

@available {MinUploadedAtFNVersion := 4300}
@experimental
# Touch perception data. Carries the underlying collision_hit verbatim so consumers get impulse, contact location, normal, other-entity reference, and any other collision fields the platform exposes.
touch_data<public> := class<castable>:
    # The collision hit that produced this detection.
    Hit<public>:collision_hit

@available {MinUploadedAtFNVersion := 4300}
@experimental
# Touch perception event. DetectionState is Active on the first mesh_part contact with an emitter, Inactive when the last separates. TouchData is a snapshot fixed at the transition; for values tracking the ongoing contact call Detector.GetCurrentTouchData during Active. Cast an incoming scene_event via touch_detection_event[E] for typed access.
touch_detection_event<public> := class(sense_detection_event):
    # The emitter that was touched.
    Emitter<public>:touch_emitter_component

    # The detector that felt the touch.
    Detector<public>:touch_detector_component

    # Active or Inactive; touch is continuous and never emits Instant.
    DetectionState<override>:sense_detection_state

    # Snapshot of the contact for this transition.
    TouchData<public>:touch_data

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
    GetCurrentTouchData<public>(Emitter:touch_emitter_component)<transacts><decides>:touch_data = external {}