using {/Verse.org/Simulation/Tags}
using {/Verse.org/Native}
using {/Verse.org/Colors}
using {/Verse.org/Simulation}
using {/Verse.org/SpatialMath}
@experimental
# A `capsule_light_component` emits light in all directions into the scene from a capsule shaped source with a specified radius and length. A radius and length of 0 makes it a point light. You can use these
# to simulate any kind of light sources that emit in all directions and need an elongated source shape, such as a long light bulb.
capsule_light_component<native><public> := class<final>(light_component):
    # Set the visible light intensity emitted in SI unit Candela./nSpecified before ColorFilter (which multiplies each color component after the intensity calculation and can change the effective intensity of the light).
    var Intensity<public>:float = external {}

    # The bounds of the light's visible influence. This clamping of the light's influence is not physically correct but very important for performance,
    # larger lights cost more. The light falloff is based on Inverse Square law. Towards the tail end of the AttenuationRadius,
    # there is an additional smoothing factor to fade out the light contribution to 0 to avoid a hard cutoff.
    var AttenuationRadius<public>:?float = external {}

    # Radius of the source capsule shape in centimeters around the local Z axis. Note that light shapes which intersect shadow casting geometry can cause shadowing artifacts.
    var SourceRadius<public>:float = external {}

    # Length of the source capsule shape in centimeters along the local Z axis. Note that light shapes which intersect shadow casting geometry can cause shadowing artifacts.
    var SourceLength<public>:float = external {}

@experimental
# A `directional_light_component` simulates light that is being emitted from a source that is infinitely far away. This means that all shadows cast by this light will be parallel, making this the ideal choice for simulating sunlight.
directional_light_component<native><public> := class<final>(light_component):
    # Intensity of the light hitting the surface. In Lux (Lumen per square meter).
    var Illuminance<public>:float = external {}

    # Angle subtended by light source in degrees (also known as angular diameter). Defaults to 0.5357 which is the angle for our sun.
    var SourceAngleDegrees<public>:float = external {}

# Module import path: /Verse.org/SceneGraph/KeyframedMovement
# Animate Scene Graph entities with keyframes.
KeyframedMovement<public> := module:
    @experimental
    # Base class for an animation easing function.
    easing_function<native><public> := class<abstract><computes><epic_internal>:
        Evaluate<native><public>(Input:float):float

    @experimental
    # Cubic bezier easing function. See CubicBezierEasingFunctions for some basic easing values.
    cubic_bezier_easing_function<native><public> := class<concrete><computes><epic_internal>(easing_function):
        X0<native><public>:float = external {}

        Y0<native><public>:float = external {}

        X1<native><public>:float = external {}

        Y1<native><public>:float = external {}

        Evaluate<native><override>(Input:float):float

    @experimental
    # `Linear` animations move at a constant speed.
    linear_easing_function<native><public> := class<final><concrete><computes>(cubic_bezier_easing_function):
        X0<override>:float = external {}

        Y0<override>:float = external {}

        X1<override>:float = external {}

        Y1<override>:float = external {}

    @experimental
    # `Ease` animations start slowly, speed up, then end slowly. The speed of the animation is slightly slower at the end than the start.
    ease_cubic_bezier_easing_function<native><public> := class<final><concrete><computes>(cubic_bezier_easing_function):
        X0<override>:float = external {}

        Y0<override>:float = external {}

        X1<override>:float = external {}

        Y1<override>:float = external {}

    @experimental
    # `EaseIn` animations start slow, then speed up towards the end.
    ease_in_cubic_bezier_easing_function<native><public> := class<final><concrete><computes>(cubic_bezier_easing_function):
        X0<override>:float = external {}

        Y0<override>:float = external {}

        X1<override>:float = external {}

        Y1<override>:float = external {}

    @experimental
    # `EaseOut` animations start fast, then slow down towards the end.
    ease_out_cubic_bezier_easing_function<native><public> := class<final><concrete><computes>(cubic_bezier_easing_function):
        X0<override>:float = external {}

        Y0<override>:float = external {}

        X1<override>:float = external {}

        Y1<override>:float = external {}

    @experimental
    # `EaseInOut` animations are similar to `Ease` but the start and end animation speed is symmetric.
    ease_in_out_cubic_bezier_easing_function<native><public> := class<final><concrete><computes>(cubic_bezier_easing_function):
        X0<override>:float = external {}

        Y0<override>:float = external {}

        X1<override>:float = external {}

        Y1<override>:float = external {}

    @experimental
    # Controls how the animation plays back.
    keyframed_movement_playback_mode<native><public> := class<abstract><computes><epic_internal>:


    @experimental
    # Play once and stop.
    oneshot_keyframed_movement_playback_mode<native><public> := class<final><concrete><computes>(keyframed_movement_playback_mode):


    @experimental
    # Play once and repeat indefinitely.
    loop_keyframed_movement_playback_mode<native><public> := class<final><concrete><computes>(keyframed_movement_playback_mode):


    @experimental
    # Play continuously reversing direction at each end.
    pingpong_keyframed_movement_playback_mode<native><public> := class<final><concrete><computes>(keyframed_movement_playback_mode):


    @experimental
    # Represents a change in pose and scale over a duration.
    keyframed_movement_delta<native><public> := class<final><concrete>:
        @editable
        # Represents a change in the transform relative to the previous keyframe or initial animation position.
        Transform<native><public>:(/Verse.org/SpatialMath:)transform = external {}

        @editable_number(float) {MinValue := option {0.000000}}
        # Duration of this keyframe in seconds.
        Duration<native><public>:float = external {}

        @editable
        # Easing function to use for playback.
        Easing<native><public>:easing_function = external {}

    @experimental
    # Provides teleportation and simple keyframe-based animation for an entity. Animations play back in the Pre-Physics tick phase. When animating an entity with a parent_constraint, animation will be relative to the parent entity.
    keyframed_movement_component<native><public> := class<final><final_super>(component):
        @experimental
        # Pause movement. Subsequently calling Play() will resume from the point in the animation when it was paused.
        Pause<native><public>():void

        @experimental
        # Begin or resume playback.
        Play<native><public>():void

        @experimental
        # Stop and reset transform to the initial state. Subsequently calling Play() will begin the animation anew.
        Stop<native><public>(?BlendOutTime:float = external {}):void

        @experimental
        # Stop any ongoing animation, sets the animation path and rebases it relative to the actor's current transform. Does not start playing until you call Play().
        SetKeyframes<native><public>(RelativeKeyframes:[]keyframed_movement_delta, PlaybackMode:keyframed_movement_playback_mode):void

        @experimental
        # Is the animation currently playing?
        IsPlaying<native><public>()<computes><decides><reads>:void

        @experimental
        # Is the animation paused?
        IsPaused<native><public>()<computes><decides><reads>:void

        @experimental
        # Is there a valid set of playable keyframes?
        HasValidAnimation<native><public>()<computes><decides><reads>:void

        @experimental
        GetDuration<native><public>()<computes><decides><reads>:float

        @experimental
        # Signaled when any keyframe is reached. (Keyframe:int, IsReversed:logic).
        KeyframeReachedEvent<native><public>:listenable(tuple(int, logic)) = external {}

        @experimental
        # Signaled when the entire animation is complete. This will only fire for `OneShot` animations.
        MovementCompleteEvent<native><public>:listenable(tuple()) = external {}

        @experimental
        # Get the event that fires when the animations ends, failing if the animation is of infinite duration
        GetOnFinishedEvent<public>()<computes><decides><reads>:listenable(tuple()) = external {}

        @experimental
        # Get the event that fires when the animation is Stopped.
        GetOnStoppedEvent<public>():listenable(tuple()) = external {}

        @experimental
        # Get the event that fires when the animation begins or resumes Playing.
        GetOnPlayedEvent<public>():listenable(tuple()) = external {}

        @experimental
        # Get the event that fires when the animation is Paused.
        GetOnPausedEvent<public>():listenable(tuple()) = external {}

@experimental
# Base class for light components in the SceneGraph.
# 
# Dependencies:
#   * `transform_component` on the entity positions the light.
# 
# Examples of components implementing `light_component`:
#   * `directional_light_component`
#   * `capsule_light_component`
#   * `sphere_light_component`
#   * `rect_light_component`
#   * `spot_light_component`
light_component<native><public> := class<abstract><final_super><epic_internal>(component, enableable):
    # Whether the light should cast any shadows.
    var CastShadows<public>:logic = external {}

    # Set the filter color of the light. This acts as a colored filter in front of the light source. Note that this can change the light's effective intensity. In normalized range 0-1.
    var ColorFilter<public>:color = external {}

    # Multiplier on specular highlights. Can be used to artistically remove highlights mimicking polarizing filters or photo touch up. Any value besides 1.0 is not physical. 0.0 means no specular contribution from this light.
    var SpecularScale<public>:float = external {}

    # Multiplier on diffuse lighting. Any value besides 1.0 is not physical. 0.0 means no diffuse contribution from this light.
    var DiffuseScale<public>:float = external {}

    # Enables rendering of this light.
    Enable<native><override>():void

    # Disables rendering of this light.
    Disable<native><override>():void

    # Succeeds if the component is enabled, fails if it's disabled.
    IsEnabled<native><override>()<transacts><decides>:void

@experimental
# Used to render a `mesh` at the location of this entity. A mesh is a set of polygons that can be used to represent shapes in the world such as:
#   * foliage and terrain decorations
#   * movers (for example, doors and lifts)
#   * procedurally created buildings
# 
# Dependencies:
#   * `transform_component` on the entity positions the mesh.
mesh_component<native><public> := class<final_super><epic_internal>(component, enableable):
    @experimental
    # Enables rendering of this mesh.
    Enable<native><override>():void

    @experimental
    # Disables rendering of this mesh.
    Disable<native><override>():void

    @experimental
    # Succeeds if the component is enabled, fails if it's disabled.
    IsEnabled<native><override>()<transacts><decides>:void

    @experimental
    # Enable/disable collision on this mesh. If enabled, meshes may collide in the physics simulation.
    var Collideable<public>:logic = external {}

    @experimental
    # Enable/disable spatial queries against this mesh. Disabling this field will also disable EntityEnteredEvent/EntityExitedEvent.
    var Queryable<public>:logic = external {}

    # Enable/disable visibility of this mesh.
    var Visible<public>:logic = external {}

    @experimental
    # Triggered at the beginning of each tick when another entity first overlaps this entity.
    EntityEnteredEvent<native><public>:listenable(entity) = external {}

    @experimental
    # Triggered at the beginning of each tick when another entity is no longer overlapping this entity
    EntityExitedEvent<native><public>:listenable(entity) = external {}

@experimental
# Used to spawn a `particle_system` at the location of this entity. The `particle_system` will simulate while the `particle_system_component` is in the scene.
# 
# Dependencies:
#   * `transform_component` on the entity positions the `particle_system`.
particle_system_component<native><public> := class<final_super><epic_internal>(component, enableable):
    # Enables the simulation and rendering of this `particle_system`.
    Enable<override><native>():void

    # Disables the simulation and rendering of this `particle_system`.
    Disable<override><native>():void

    # Succeeds if the component is enabled, fails if itâs disabled.
    IsEnabled<override><native>()<transacts><decides>:void

    @editable
    # Controls if the `particle_system_component` should start enabled.
    var<private> Enabled<native><public>:logic = external {}

    Play<native><public>():void

    Stop<native><public>():void

    @editable
    # Controls if the `particle_system_component` should play the simulation automatically when added to the scene, or when enabled from a disabled state.
    var<private> AutoPlay<native><public>:logic = external {}

@experimental
@available {MinUploadedAtFNVersion := 2930}
# Find all objects in the scene that currently overlap this entity.
(Entity:entity).FindOverlapHits<public>()<transacts>:generator(overlap_hit) = external {}

@experimental
@available {MinUploadedAtFNVersion := 2930}
# Find all objects in the scene that would overlap this entity if it were placed at GlobalTransform.
(Entity:entity).FindOverlapHits<public>(GlobalTransform:(/Verse.org/SpatialMath:)transform)<transacts>:generator(overlap_hit) = external {}

@experimental
@available {MinUploadedAtFNVersion := 2930}
# Find all objects in the scene that would overlap Volume if they were placed at GlobalTransform. NOTE: This entity defines the context(scene) for the query but does not otherwise take part in the sweep.
(Entity:entity).FindOverlapHits<public>(GlobalTransform:(/Verse.org/SpatialMath:)transform, Volume:collision_volume)<transacts>:generator(overlap_hit) = external {}

@experimental
@available {MinUploadedAtFNVersion := 2930}
# Find all objects in the scene that would intersect this entity if it were swept from its location along the Displacement vector.
(Entity:entity).FindSweepHits<public>(Displacement:(/Verse.org/SpatialMath:)vector3)<transacts>:generator(sweep_hit) = external {}

@experimental
@available {MinUploadedAtFNVersion := 2930}
# Find all objects in the scene that would intersect this entity if it were swept from GlobalTransform along the Displacement vector.
(Entity:entity).FindSweepHits<public>(Displacement:(/Verse.org/SpatialMath:)vector3, StartGlobalTransform:(/Verse.org/SpatialMath:)transform)<transacts>:generator(sweep_hit) = external {}

@experimental
@available {MinUploadedAtFNVersion := 2930}
# Find all objects in the scene that would intersect Volume if they were swept from GlobalTransform along the Displacement vector NOTE: This entity defines the context(scene) for the query but does not otherwise take part in the sweep.
(Entity:entity).FindSweepHits<public>(Displacement:(/Verse.org/SpatialMath:)vector3, StartGlobalTransform:(/Verse.org/SpatialMath:)transform, Volume:collision_volume)<transacts>:generator(sweep_hit) = external {}

@experimental
# A `rect_light_component` emits light into the scene from a rectangular plane with a specified width and height. You can use these
# to simulate any kind of light sources that have rectangular areas, such as televisions or monitor screens, overhead lighting
# fixtures, or wall sconces.
rect_light_component<native><public> := class<final>(light_component):
    # Set the visible light intensity emitted in SI unit Candela./nSpecified before ColorFilter (which multiplies each color component after the intensity calculation and can change the effective intensity of the light).
    var Intensity<public>:float = external {}

    # The bounds of the light's visible influence, in centimeters. This clamping of the light's influence is not physically correct but very important for performance,
    # larger lights cost more. The light falloff is based on Inverse Square law. Towards the tail end of the AttenuationRadius,
    # there is an additional smoothing factor to fade out the light contribution to 0 to avoid a hard cutoff.
    var AttenuationRadius<public>:?float = external {}

    # The width of the light source rect, in centimeters. Note that light source shapes which intersect shadow casting geometry can cause shadowing artifacts.
    var SourceWidth<public>:float = external {}

    # The height of the light source rect, in centimeters. Note that light source's shapes which intersect shadow casting geometry can cause shadowing artifacts.
    var SourceHeight<public>:float = external {}

    # The angle of the barn door in degrees attached to the light source rect. Clamped between 0.0 and 90.0 degrees.
    var BarnDoorAngleDegrees<public>:float = external {}

    # The length of the barn door attached to the light source rect, in centimeters.
    var BarnDoorLength<public>:float = external {}

@experimental
sound_component<native><public> := class<abstract><final_super><epic_internal>(component, enableable):
    @editable
    var<private> AutoPlay<native><public>:logic = external {}

    # Play the sound asset
    Play<native><public>():void

    # Stop the sound asset
    Stop<native><public>():void

    # Enable the sound component.
    Enable<override><native>():void

    # Disable the sound component.
    Disable<override><native>():void

    # Succeeds if the sound component is enabled, fails if it is disabled.
    IsEnabled<override><native>()<transacts><decides>:void

    @editable
    var<private> Enabled<native><public>:logic = external {}

@experimental
# A `sphere_light_component` emits light in all directions into the scene from a spherical source shape with a specified radius. A radius of 0 makes it a point light. You can use these
# to simulate any kind of light sources that emit in all directions, such as a light bulb.
sphere_light_component<native><public> := class<final>(light_component):
    # Set the visible light intensity emitted in SI unit Candela./nSpecified before ColorFilter (which multiplies each color component after the intensity calculation and can change the effective intensity of the light).
    var Intensity<public>:float = external {}

    # The bounds of the light's visible influence, in centimeters. This clamping of the light's influence is not physically correct but very important for performance,
    # larger lights cost more. The light falloff is based on Inverse Square law. Towards the tail end of the AttenuationRadius,
    # there is an additional smoothing factor to fade out the light contribution to 0 to avoid a hard cutoff.
    var AttenuationRadius<public>:?float = external {}

    # Radius of the source shape, in centimeters. Note that light shapes which intersect shadow casting geometry can cause shadowing artifacts.
    var SourceRadius<public>:float = external {}

@experimental
# A `spot_light_component` emits light from a single point in a cone shape. The shape of the light is defined by two cones: the `InnerConeAngleDegrees`
# and `OuterConeAngleDegrees`. Within the `InnerConeAngleDegrees` the light achieves full brightness. As you go from the extent of the inner radius to the
# extents of the `OuterConeAngleDegrees` a falloff takes place, creating a penumbra, or softening around the `spot_light_component`'s disc of
# illumination. The Radius of the light defines the length of the cones. More simply, this will work like a flash light or stage can light.
spot_light_component<native><public> := class<final>(light_component):
    # Set the visible light intensity emitted in SI unit Candela./nSpecified before ColorFilter (which multiplies each color component after the intensity calculation and can change the effective intensity of the light).
    var Intensity<public>:float = external {}

    # The bounds of the light's visible influence, in centimeters. This clamping of the light's influence is not physically correct but very important for performance,
    # larger lights cost more. The light falloff is based on Inverse Square law. Towards the tail end of the AttenuationRadius,
    # there is an additional smoothing factor to fade out the light contribution to 0 to avoid a hard cutoff.
    var AttenuationRadius<public>:?float = external {}

    # Radius of the source shape, in centimeters. Note that light shapes which intersect shadow casting geometry can cause shadowing artifacts.
    var SourceRadius<public>:float = external {}

    # The light's inner cone shaped angle in degrees. Clamped between 0.0 and 80.0.
    var InnerConeAngleDegrees<public>:float = external {}

    # The light's outer cone shaped angle in degrees. Clamped between 1.0 and 80.0.
    var OuterConeAngleDegrees<public>:float = external {}

@experimental
# Used to add tags to an entity. Tagged entities can then be queried using `entity.FindDescendantEntitiesWithTag` and `entity.FindAncestorEntitiesWithTag`.
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
@available {MinUploadedAtFNVersion := 2930}
# Finds all descendant entities including `InEntity` with `Tag` present in their `tag_component`.
# When querying from the simulation entity, the simulation entity itself is not included in the results.
# The order of the returned entities is unspecified and subject to change.
(InEntity:entity).FindDescendantEntitiesWithTag<native><public>(Tag:tag)<transacts>:generator(entity)

@experimental
@available {MinUploadedAtFNVersion := 2930}
# Finds all ancestor entities to `InEntity` with `Tag` present in their `tag_component`.
# The order of the returned entities is unspecified and subject to change.
(InEntity:entity).FindAncestorEntitiesWithTag<native><public>(Tag:tag)<transacts>:generator(entity)

@experimental
# A range with a minimum and maximum value. For a value to fall inside of this range, the min value must be less than or equal to the max value.
float_range<native><public> := struct<concrete>:
    Minimum<native><public>:float = external {}

    @editable
    Maximum<native><public>:float = external {}