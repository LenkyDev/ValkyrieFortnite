using {/UnrealEngine.com/Temporary/SpatialMath}
using {/Verse.org/Temporary/EpicGamesRestricted/Network}
using {/Verse.org/Colors}
using {/Verse.org/SpatialMath}
using {/Verse.org/Simulation}
using {/Verse.org/Assets}
using {/Verse.org/Native}
# A `capsule_light_component` emits light in all directions into the scene from a capsule shaped source with a specified radius and length. A radius and length of 0 makes it a point light. You can use these
# to simulate any kind of light sources that emit in all directions and need an elongated source shape, such as a long light bulb.
capsule_light_component<native><public> := class<final>(light_component):
    OnAddedToSceneInternal<native><override>():void

    # Set the visible light intensity emitted in SI unit Candela.
    # Specified before ColorFilter (which multiplies each color component after the intensity calculation and can change the effective intensity of the light).
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
damageable_component<native><epic_internal> := class<final_super>(component):
    @experimental
    Damage<native><public>(Amount:float):void

    @experimental
    DamagedEvent<native><final><public>:listenable(float) = external {}

# Used to place a decal in the scene.
decal_component<native><epic_internal> := class<final_super>(component, property_changed_interface):
    OnInitializedInternal<native><override>():void

    OnUninitializingInternal<native><override>():void

    OnAddedToSceneInternal<native><override>():void

    OnRemovingFromSceneInternal<native><override>():void

    Material<native><epic_internal>:material = external {}

    OnPropertyChangedFromVerse<native><override>(PropertyName:string)<transacts>:void

# A `directional_light_component` simulates light that is being emitted from a source that is infinitely far away. This means that all shadows cast by this light will be parallel, making this the ideal choice for simulating sunlight.
directional_light_component<native><public> := class<final>(light_component):
    OnAddedToSceneInternal<native><override>():void

    # Intensity of the light hitting the surface. In Lux (Lumen per square meter).
    var Illuminance<public>:float = external {}

    # Angle subtended by light source in degrees (also known as angular diameter). Defaults to 0.5357 which is the angle for our sun.
    var SourceAngleDegrees<public>:float = external {}

    @editable {EpicOnly := true}
    @category("Epic Internal")
    # How far, in centimeters, cascaded shadow map dynamic shadows will cover, measured in units from the camera. A value of 0 disables the dynamic shadow
    DynamicShadowDistance<native><epic_internal>:float = external {}

    @editable_slider(int) {EpicOnly := true; MinValue := option {0}; MaxValue := option {4}}
    @category("Epic Internal")
    # Number of cascades to split the view frustum into for the whole scene dynamic shadow
    NumDynamicShadowCascades<native><epic_internal>:int = external {}

    @editable_slider(float) {EpicOnly := true; MinValue := option {1.000000}; MaxValue := option {4.000000}}
    @category("Epic Internal")
    # Controls whether the cascades are distributed closer to the camera (larger exponent) or further from the camera (smaller exponent)
    CascadeDistributionExponent<native><epic_internal>:float = external {}

    @editable_slider(float) {EpicOnly := true; MinValue := option {0.000000}; MaxValue := option {0.300000}}
    @category("Epic Internal")
    # Proportion of the fade region between cascades
    CascadeTransitionFraction<native><epic_internal>:float = external {}

    @editable_slider(float) {EpicOnly := true; MinValue := option {0.000000}; MaxValue := option {1.000000}}
    @category("Epic Internal")
    # Controls the size of the fade out region at the far extent of the dynamic shadow's influence
    CascadeDistanceFadeoutFraction<native><epic_internal>:float = external {}

    @editable_slider(int) {EpicOnly := true; MinValue := option {0}; MaxValue := option {4}}
    @category("Epic Internal")
    # The number of cascades between DynamicShadowDistance and FarShadowDistance that are covered by Far Shadow Cascades, or zero to disable far shadow cascades
    FarShadowCascadeCount<native><epic_internal>:int = external {}

    @editable {EpicOnly := true}
    @category("Epic Internal")
    # Distance, in centimeters, at which the far shadow cascade should end
    FarShadowDistance<native><epic_internal>:float = external {}

    @editable {EpicOnly := true}
    @category("Epic Internal")
    # Distance at which the far shadow cascade should end
    EnableLightShaftOcclusion<native><epic_internal>:logic = external {}

    @editable {EpicOnly := true}
    @category("Epic Internal")
    # Controls how dark the occlusion masking is
    OcclusionMaskDarkness<native><epic_internal>:float = external {}

    @editable {EpicOnly := true}
    @category("Epic Internal")
    # Everything closer to the camera than this distance, measured in centimeters, will occlude light shafts
    OcclusionDepthRange<native><epic_internal>:float = external {}

@available {MinUploadedAtFNVersion := 4100}
# Module import path: /Verse.org/SceneGraph/HasCollisionInvalids
HasCollisionInvalids<epic_internal> := module:
    InvalidCollisionMaterial<epic_internal>:collision_material = external {}

@available {MinUploadedAtFNVersion := 4100}
@experimental
has_collision<native><epic_internal> := interface<epic_internal>(has_mesh_part_support):
    # True if any associated physics objects are physically collidable
    GetCollidable<final><native_callable><epic_internal>()<reads>:logic = external {}

    # Set the physics collidability for all associated physics objects
    SetCollidable<final><native_callable><epic_internal>(In:logic):void = external {}

    GetCollisionMaterial<final><native_callable><epic_internal>()<reads>:collision_material = external {}

    SetCollisionMaterial<final><native_callable><epic_internal>(In:collision_material):void = external {}

    @experimental
    GetCollisionEnteredEvent<final><native_callable><epic_internal>():listenable(generator(collision_hit)) = external {}

    @experimental
    GetCollisionEvent<final><native_callable><epic_internal>():listenable(generator(collision_hit)) = external {}

    @experimental
    GetCollisionExitedEvent<final><native_callable><epic_internal>():listenable(generator(collision_hit)) = external {}

    @experimental
    GetOverlapEnteredEvent<final><native_callable><epic_internal>():listenable(generator(overlap_hit)) = external {}

    @experimental
    GetOverlapExitedEvent<final><native_callable><epic_internal>():listenable(generator(overlap_hit)) = external {}

@available {MinUploadedAtFNVersion := 4100}
has_collision_impl<native><final><epic_internal> := class<epic_internal>:
    GetCollidableImpl<native><epic_internal>()<reads>:logic

    SetCollidableImpl<native><epic_internal>(In:logic):void

    GetCollisionMaterialImpl<native><epic_internal>()<reads>:collision_material

    SetCollisionMaterialImpl<native><epic_internal>(In:collision_material):void

    @experimental
    @available {MinUploadedAtFNVersion := 2930}
    CollisionEnteredEventImpl<native><epic_internal>:listenable(generator(collision_hit)) = external {}

    @experimental
    @available {MinUploadedAtFNVersion := 2930}
    CollisionEventImpl<native><epic_internal>:listenable(generator(collision_hit)) = external {}

    @experimental
    @available {MinUploadedAtFNVersion := 2930}
    CollisionExitedEventImpl<native><epic_internal>:listenable(generator(collision_hit)) = external {}

    @experimental
    @available {MinUploadedAtFNVersion := 2930}
    OverlapEnteredEventImpl<native><epic_internal>:listenable(generator(overlap_hit)) = external {}

    @experimental
    @available {MinUploadedAtFNVersion := 2930}
    OverlapExitedEventImpl<native><epic_internal>:listenable(generator(overlap_hit)) = external {}

@available {MinUploadedAtFNVersion := 4100}
@experimental
has_dynamics<native><epic_internal> := interface<epic_internal>(has_mesh_part_support):
    # By default, true if any associated physics objects are physically simulated
    GetDynamic<final><native_callable><epic_internal>()<reads>:logic = external {}

    # By default, set the dynamic state for all associated physics objects
    SetDynamic<final><native_callable><epic_internal>(In:logic):void = external {}

    ApplyLinearImpulse<final><native_callable><epic_internal>(LinearImpulse:(/Verse.org/SpatialMath:)vector3):void = external {}

    ApplyAngularImpulse<final><native_callable><epic_internal>(AngularImpulse:(/Verse.org/SpatialMath:)vector3):void = external {}

    GetLinearVelocity<final><native_callable><epic_internal>():(/Verse.org/SpatialMath:)vector3 = external {}

    SetLinearVelocity<final><native_callable><epic_internal>(LinearVelocity:(/Verse.org/SpatialMath:)vector3):void = external {}

    GetAngularVelocity<final><native_callable><epic_internal>():(/Verse.org/SpatialMath:)vector3 = external {}

    SetAngularVelocity<final><native_callable><epic_internal>(AngularVelocity:(/Verse.org/SpatialMath:)vector3):void = external {}

    ApplyForce<final><native_callable><epic_internal>(Force:(/Verse.org/SpatialMath:)vector3):void = external {}

    ApplyTorque<final><native_callable><epic_internal>(Torque:(/Verse.org/SpatialMath:)vector3):void = external {}

    GetMass<final><native_callable><epic_internal>():float = external {}

@available {MinUploadedAtFNVersion := 4100}
has_dynamics_impl<native><final><epic_internal> := class<epic_internal>:
    GetDynamicImpl<native><epic_internal>()<reads>:logic

    SetDynamicImpl<native><epic_internal>(In:logic):void

    ApplyLinearImpulseImpl<native><epic_internal>(LinearImpulse:(/Verse.org/SpatialMath:)vector3):void

    ApplyAngularImpulseImpl<native><epic_internal>(AngularImpulse:(/Verse.org/SpatialMath:)vector3):void

    GetLinearVelocityImpl<native><epic_internal>():(/Verse.org/SpatialMath:)vector3

    SetLinearVelocityImpl<native><epic_internal>(LinearVelocity:(/Verse.org/SpatialMath:)vector3):void

    GetAngularVelocityImpl<native><epic_internal>():(/Verse.org/SpatialMath:)vector3

    SetAngularVelocityImpl<native><epic_internal>(AngularVelocity:(/Verse.org/SpatialMath:)vector3):void

    ApplyForceImpl<native><epic_internal>(Force:(/Verse.org/SpatialMath:)vector3):void

    ApplyTorqueImpl<native><epic_internal>(Torque:(/Verse.org/SpatialMath:)vector3):void

    GetMassImpl<native><epic_internal>():float

@available {MinUploadedAtFNVersion := 4100}
ue_phys_sleep_type<native><epic_internal> := enum<open>:
    MaterialSleep
    NeverSleep

@available {MinUploadedAtFNVersion := 4100}
ue_collision_material<native><epic_internal> := struct<epic_internal>:
    StaticFriction<native>:float = external {}

    DynamicFriction<native>:float = external {}

    Restitution<native>:float = external {}

    FrictionCombineMode<native>:ue_phys_mat_combine_mode = external {}

    RestitutionCombineMode<native>:ue_phys_mat_combine_mode = external {}

    SleepCounterThreshold<native>:int = external {}

    SleepingAngularThreshold<native>:float = external {}

    SleepingLinearThreshold<native>:float = external {}

@available {MinUploadedAtFNVersion := 4100}
@experimental
has_ue_physics_properties<native><epic_internal> := interface<epic_internal>:
    GetGravityEnabled<native_callable><epic_internal>()<reads>:logic = external {}

    SetGravityEnabled<native_callable><epic_internal>(In:logic):void = external {}

    GetGravityGroupIndex<native_callable><epic_internal>()<reads>:int = external {}

    SetGravityGroupIndex<native_callable><epic_internal>(In:int):void = external {}

    GetCollisionProfileName<native_callable><epic_internal>()<reads>:string = external {}

    SetCollisionProfileName<native_callable><epic_internal>(In:string):void = external {}

    GetSleepType<native_callable><epic_internal>()<reads>:ue_phys_sleep_type = external {}

    SetSleepType<native_callable><epic_internal>(In:ue_phys_sleep_type):void = external {}

    GetLinearEtherDrag<native_callable><epic_internal>()<reads>:float = external {}

    SetLinearEtherDrag<native_callable><epic_internal>(In:float):void = external {}

    GetStartAwake<native_callable><epic_internal>()<reads>:logic = external {}

    SetStartAwake<native_callable><epic_internal>(In:logic):void = external {}

    GetMassOverride<native_callable><epic_internal>()<reads>:float = external {}

    SetMassOverride<native_callable><epic_internal>(In:float):void = external {}

    GetMaxAngularVelocityDegs<native_callable><epic_internal>()<reads>:float = external {}

    SetMaxAngularVelocityDegs<native_callable><epic_internal>(In:float):void = external {}

    GetOverridesMaxAngularVelocity<native_callable><epic_internal>()<reads>:logic = external {}

    SetOverridesMaxAngularVelocity<native_callable><epic_internal>(In:logic):void = external {}

    GetUseCCD<native_callable><epic_internal>()<reads>:logic = external {}

    SetUseCCD<native_callable><epic_internal>(In:logic):void = external {}

    SetUE_CollisionMaterial<native_callable><epic_internal>(In:ue_collision_material):void = external {}

    GetUE_CollisionMaterial<native_callable><epic_internal>():ue_collision_material = external {}

    UpdateMassProperties<native_callable><epic_internal>():void = external {}

@available {MinUploadedAtFNVersion := 4100}
has_ue_physics_properties_impl<native><final><epic_internal> := class:
    GetGravityEnabledImpl<native><epic_internal>()<reads>:logic

    SetGravityEnabledImpl<native><epic_internal>(In:logic):void

    GetGravityGroupIndexImpl<native><epic_internal>()<reads>:int

    SetGravityGroupIndexImpl<native><epic_internal>(In:int):void

    GetCollisionProfileNameImpl<native><epic_internal>()<reads>:string

    SetCollisionProfileNameImpl<native><epic_internal>(In:string):void

    GetSleepTypeImpl<native><epic_internal>()<reads>:ue_phys_sleep_type

    SetSleepTypeImpl<native><epic_internal>(In:ue_phys_sleep_type):void

    GetLinearEtherDragImpl<native><epic_internal>()<reads>:float

    SetLinearEtherDragImpl<native><epic_internal>(In:float):void

    GetStartAwakeImpl<native><epic_internal>()<reads>:logic

    SetStartAwakeImpl<native><epic_internal>(In:logic):void

    GetMassOverrideImpl<native><epic_internal>()<reads>:float

    SetMassOverrideImpl<native><epic_internal>(In:float):void

    GetMaxAngularVelocityDegsImpl<native><epic_internal>()<reads>:float

    SetMaxAngularVelocityDegsImpl<native><epic_internal>(In:float):void

    GetOverridesMaxAngularVelocityImpl<native><epic_internal>()<reads>:logic

    SetOverridesMaxAngularVelocityImpl<native><epic_internal>(In:logic):void

    GetUseCCDImpl<native><epic_internal>()<reads>:logic

    SetUseCCDImpl<native><epic_internal>(In:logic):void

    GetUE_CollisionMaterialImpl<native><epic_internal>():ue_collision_material

    SetUE_CollisionMaterialImpl<native><epic_internal>(In:ue_collision_material):void

    UpdateMassPropertiesImpl<native><epic_internal>():void

@available {MinUploadedAtFNVersion := 4100}
ue_phys_mat_combine_mode<native><epic_internal> := enum<open>:
    EAvg
    EMin
    EMultiply
    EMax

# Module import path: /Verse.org/SceneGraph/KeyframedMovement
# Animate Scene Graph entities with keyframes.
KeyframedMovement<public> := module:
    using {/Verse.org/Temporary/EpicGamesRestricted/Network}
    using {/Verse.org/Simulation}
    using {/Verse.org/SpatialMath}
    # Base class for an animation easing function.
    easing_function<native><public> := class<abstract><computes><epic_internal>:
        Evaluate<native><public>(Input:float):float

    # Cubic bezier easing function. See CubicBezierEasingFunctions for some basic easing values.
    cubic_bezier_easing_function<native><public> := class<concrete><computes><epic_internal>(easing_function):
        X0<native><public>:float = external {}

        Y0<native><public>:float = external {}

        X1<native><public>:float = external {}

        Y1<native><public>:float = external {}

        Evaluate<native><override>(Input:float):float

    # `Linear` animations move at a constant speed.
    linear_easing_function<native><public> := class<final><concrete><computes>(cubic_bezier_easing_function):
        X0<override>:float = external {}

        Y0<override>:float = external {}

        X1<override>:float = external {}

        Y1<override>:float = external {}

    # `Ease` animations start slowly, speed up, then end slowly. The speed of the animation is slightly slower at the end than the start.
    ease_cubic_bezier_easing_function<native><public> := class<final><concrete><computes>(cubic_bezier_easing_function):
        X0<override>:float = external {}

        Y0<override>:float = external {}

        X1<override>:float = external {}

        Y1<override>:float = external {}

    # `EaseIn` animations start slow, then speed up towards the end.
    ease_in_cubic_bezier_easing_function<native><public> := class<final><concrete><computes>(cubic_bezier_easing_function):
        X0<override>:float = external {}

        Y0<override>:float = external {}

        X1<override>:float = external {}

        Y1<override>:float = external {}

    # `EaseOut` animations start fast, then slow down towards the end.
    ease_out_cubic_bezier_easing_function<native><public> := class<final><concrete><computes>(cubic_bezier_easing_function):
        X0<override>:float = external {}

        Y0<override>:float = external {}

        X1<override>:float = external {}

        Y1<override>:float = external {}

    # `EaseInOut` animations are similar to `Ease` but the start and end animation speed is symmetric.
    ease_in_out_cubic_bezier_easing_function<native><public> := class<final><concrete><computes>(cubic_bezier_easing_function):
        X0<override>:float = external {}

        Y0<override>:float = external {}

        X1<override>:float = external {}

        Y1<override>:float = external {}

    # Control how the animation plays back.
    keyframed_movement_playback_mode_native<native><epic_internal> := enum:
        OneShot
        Loop
        PingPong

    # Controls how the animation plays back.
    keyframed_movement_playback_mode<native><public> := class<abstract><computes><epic_internal>:


    # Play once and stop.
    oneshot_keyframed_movement_playback_mode<native><public> := class<final><concrete><computes>(keyframed_movement_playback_mode):


    # Play once and repeat indefinitely.
    loop_keyframed_movement_playback_mode<native><public> := class<final><concrete><computes>(keyframed_movement_playback_mode):


    # Play continuously reversing direction at each end.
    pingpong_keyframed_movement_playback_mode<native><public> := class<final><concrete><computes>(keyframed_movement_playback_mode):


    # Represents a change in pose and scale over a duration.
    keyframed_movement_delta<native><public> := class<final><concrete>:
        @editable
        # Represents a change in the transform relative to the previous keyframe or initial animation position. Translation and Scale are interpreted additively.
        Transform<native><public>:(/Verse.org/SpatialMath:)transform = external {}

        @editable_number(float) {MinValue := option {0.000000}}
        # Duration of this keyframe in seconds.
        Duration<native><public>:float = external {}

        @editable
        # Easing function to use for playback.
        (/Verse.org/SceneGraph/KeyframedMovement/keyframed_movement_delta:)Easing<native><public>:easing_function = external {}

    # Play Command sent to clients to reconstruct the playback command
    keyframed_movement_net_command<native><epic_internal> := enum:
        PlayFrom
        HaltAt

    # Cubic Bezier function sent to clients to reconstruct the animation curves.
    cubic_bezier_easing_function_native<native><epic_internal> := struct<concrete>:
        X0<native><public>:float = external {}

        Y0<native><public>:float = external {}

        X1<native><public>:float = external {}

        Y1<native><public>:float = external {}

    # Keyframe delta sent to clients to reconstruct the animation frames.
    keyframed_movement_delta_native<native><epic_internal> := struct<concrete>:
        Transform<native><public>:(/Verse.org/SpatialMath:)transform = external {}

        Duration<native><public>:float = external {}

        (/Verse.org/SceneGraph/KeyframedMovement/keyframed_movement_delta_native:)Easing<native><public>:cubic_bezier_easing_function_native = external {}

    # Contains all the information needed for the client to reconstruct the entire animation command.
    keyframed_movement_command_data<native><epic_internal> := struct<concrete>:
        Command<native>:keyframed_movement_net_command = external {}

        CommandServerTime<native>:float = external {}

        StartTimeForPlay<native>:float = external {}

        ServerStartTimeForBlendOut<native>:?float = external {}

        BlendOutDuration<native>:float = external {}

        HaltTransform<native>:(/Verse.org/SpatialMath:)transform = external {}

        Keyframes<native>:[]keyframed_movement_delta_native = external {}

        PlaybackMode<native>:keyframed_movement_playback_mode_native = external {}

    # Provides teleportation and simple keyframe-based animation for an entity. Animations play back in the Pre-Physics tick phase. When animating an entity with a parent_constraint, animation will be relative to the parent entity.
    keyframed_movement_component<native><public> := class<final><final_super>(component):
        # Pause movement. Subsequently calling Play() will resume from the point in the animation when it was paused.
        Pause<native><public>():void

        # Begin or resume playback.
        Play<native><public>():void

        # Stop and reset transform to the initial state. Subsequently calling Play() will begin the animation anew.
        Stop<public>():void = external {}

        # Stop and reset transform to the initial state. Subsequently calling Play() will begin the animation anew.
        Stop<native><public>(BlendOutTime:float):void

        # Get the event that fires when the animation is Stopped.
        StoppedEvent<native><public>:listenable(tuple()) = external {}

        # Get the event that fires when the animation begins or resumes Playing.
        PlayedEvent<native><public>:listenable(tuple()) = external {}

        # Get the event that fires when the animation is Paused.
        PausedEvent<native><public>:listenable(tuple()) = external {}

        # Is the animation currently playing?
        IsPlaying<native><public>()<reads><decides>:void

        # Is the animation paused?
        IsPaused<native><public>()<reads><decides>:void

        # Gets the duration in seconds this keyframed movement will take. Fails if a fixed duration is not known (ex: looping animations).
        var<private> Duration<native><public>:?float = external {}

        # Get the event that fires when the animations ends, failing if the animation is of infinite duration
        FinishedEvent<native><public>:listenable(tuple()) = external {}

        # Stop any ongoing animation, sets the animation path and rebases it relative to the actor's current transform. Does not start playing until you call Play().
        SetKeyframes<native><public>(RelativeKeyframes:[]keyframed_movement_delta, PlaybackMode:keyframed_movement_playback_mode):void

        # Is there a valid set of playable keyframes?
        HasValidAnimation<native><public>()<reads><decides>:void

        # Signaled when any keyframe is reached. (Keyframe:int, IsReversed:logic).
        KeyframeReachedEvent<native><public>:listenable(tuple(int, logic)) = external {}

        OnInitializedInternal<native><override>():void

        OnEndSimulationInternal<native><override>():void

        OnRep__PendingCommand<native><epic_internal>():void

        @replicated("RepNotify")
        var _PendingCommand<native><epic_internal>:keyframed_movement_command_data = external {}

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
    OnInitializedInternal<native><override>():void

    OnUninitializingInternal<native><override>():void

    OnAddedToSceneInternal<native><override>():void

    OnRemovingFromSceneInternal<native><override>():void

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

    @editable {EpicOnly := true}
    @category("Epic Internal")
    # Whether to enable lighting on the default channel for all primitives and lights
    EnableLightingChannel0<native><epic_internal>:logic = external {}

    @editable {EpicOnly := true}
    @category("Epic Internal")
    # Whether to enable lighting on the first custom channel
    EnableLightingChannel1<native><epic_internal>:logic = external {}

    @editable {EpicOnly := true}
    @category("Epic Internal")
    # Whether to enable lighting on the second custom channel
    EnableLightingChannel2<native><epic_internal>:logic = external {}

    @editable {EpicOnly := true}
    @category("Epic Internal")
    # Whether the light affects global illumination, when ray-traced global illumination is enabled
    AffectGlobalIllumination<native><epic_internal>:logic = external {}

    @editable_slider(float) {EpicOnly := true; MinValue := option {0.000000}; MaxValue := option {6.000000}}
    @category("Epic Internal")
    # Scales the indirect lighting contribution from this light
    IndirectLightingIntensity<native><epic_internal>:float = external {}

    @editable_slider(float) {EpicOnly := true; MinValue := option {0.000000}; MaxValue := option {4.000000}}
    @category("Epic Internal")
    # Intensity of the volumetric scattering from this light
    VolumetricScatteringIntensity<native><epic_internal>:float = external {}

    @editable {EpicOnly := true}
    @category("Epic Internal")
    # Whether the light shadows volumetric fog
    CastVolumetricShadow<native><epic_internal>:logic = external {}

    @editable {EpicOnly := true}
    @category("Epic Internal")
    # Whether to render light shaft bloom from this light
    EnableLightShaftBloom<native><epic_internal>:logic = external {}

    @editable {EpicOnly := true}
    @category("Epic Internal")
    # Scales the additive color
    BloomScale<native><epic_internal>:float = external {}

    @editable {EpicOnly := true}
    @category("Epic Internal")
    # Scene color must be larger than this to create bloom in the light shafts
    BloomThreshold<native><epic_internal>:float = external {}

    @editable {EpicOnly := true}
    @category("Epic Internal")
    # After exposure is applied, scene color brightness larger than the max brightness will be rescaled down to the max brightness
    BloomMaxBrightness<native><epic_internal>:float = external {}

    @editable {EpicOnly := true}
    @category("Epic Internal")
    # Multiplies against scene color to create the bloom color
    BloomTint<native><epic_internal>:color = external {}

    @editable {EpicOnly := true}
    @category("Epic Internal")
    # The light function material to be applied to this light
    LightFunctionMaterial<native><epic_internal>:?material = external {}

    @editable {EpicOnly := true}
    @category("Epic Internal")
    # Scales the light function projection. X and Y scale in the directions perpendicular to the light's direction, Z scales along the light direction.
    LightFunctionScale<native><epic_internal>:(/Verse.org/SpatialMath:)vector3 = external {}

    @editable {EpicOnly := true}
    @category("Epic Internal")
    # Distance, in centimeters, at which the light function should be completely faded to the configured disabled brightness
    LightFunctionFadeDistance<native><epic_internal>:float = external {}

    @editable_slider(float) {EpicOnly := true; MinValue := option {0.000000}; MaxValue := option {1.000000}}
    @category("Epic Internal")
    # Brightness factor applied to the light when the light function is specified but disabled
    LightFunctionDisabledBrightness<native><epic_internal>:float = external {}

    @editable {EpicOnly := true}
    @display_name("IES Profile Texture")
    @category("Epic Internal")
    # If true, take light brightness from IES profile texture. If false, use the light brightness. The maximum light in one direction is used to define no masking. Will be disabled if a valid IES profile texture is not supplied.
    IESProfileTexture<native><epic_internal>:?texture = external {}

    @editable {EpicOnly := true}
    @display_name("Use IES Intensity")
    @category("Epic Internal")
    # If true, take light brightness from IES profile texture. If false, use the light brightness. The maximum light in one direction is used to define no masking. Will be disabled if a valid IES profile texture is not supplied.
    UseIESIntensity<native><epic_internal>:logic = external {}

    @editable_slider(float) {EpicOnly := true; MinValue := option {0.000000}; MaxValue := option {10.000000}}
    @display_name("IES Intensity Scale")
    @category("Epic Internal")
    # Global scale for IES brightness contribution. Only available when "Use IES Intensity" is selected, and a valid IES profile texture is set.
    IESIntensityScale<native><epic_internal>:float = external {}

# Used to render a `mesh` at the location of this entity. A mesh is a set of polygons that can be used to represent shapes in the world such as:
#   * foliage and terrain decorations
#   * movers (for example, doors and lifts)
#   * procedurally created buildings
# 
# Dependencies:
#   * `transform_component` on the entity positions the mesh.
mesh_component<native><public> := class<final_super><epic_internal>(component, enableable, bounded, property_changed_interface):
    OnInitializedInternal<native><override>():void

    OnUninitializingInternal<native><override>():void

    OnAddedToSceneInternal<native><override>():void

    OnRemovingFromSceneInternal<native><override>():void

    OnBeginSimulationInternal<native><override>():void

    OnEndSimulationInternal<native><override>():void

    # The `mesh` to be rendered by this `mesh_component`.
    Mesh<native><epic_internal>:mesh = external {}

    @available {MinUploadedAtFNVersion := 2930}
    # Get an array of the materials assigned to this mesh's slots.
    GetMaterials<native><epic_internal>()<transacts>:generator(material)

    # Enables rendering of this mesh.
    Enable<native><override>():void

    # Disables rendering of this mesh.
    Disable<native><override>():void

    # Succeeds if the component is enabled, fails if it's disabled.
    IsEnabled<native><override>()<transacts><decides>:void

    # Enable/disable collision on this mesh. If enabled, meshes may collide in the physics simulation.
    var Collidable<public>:logic = external {}

    # Enable/disable spatial queries against this mesh. Disabling this field will also disable EntityEnteredEvent/EntityExitedEvent.
    var Queryable<public>:logic = external {}

    # Enable/disable visibility of this mesh.
    var Visible<public>:logic = external {}

    @transient
    # Triggered at the beginning of each tick when another entity first overlaps this entity.
    EntityEnteredEvent<native><public>:listenable(entity) = external {}

    @transient
    # Triggered at the beginning of each tick when another entity is no longer overlapping this entity
    EntityExitedEvent<native><public>:listenable(entity) = external {}

    @experimental
    @transient
    @available {MinUploadedAtFNVersion := 4100}
    CollisionEnteredEvent<native><epic_internal>:listenable(generator(collision_hit)) = external {}

    @experimental
    @transient
    @available {MinUploadedAtFNVersion := 4100}
    CollisionEvent<native><epic_internal>:listenable(generator(collision_hit)) = external {}

    @experimental
    @transient
    @available {MinUploadedAtFNVersion := 4100}
    CollisionExitedEvent<native><epic_internal>:listenable(generator(collision_volume_pair)) = external {}

    @experimental
    GetRigidBody<native><epic_internal>()<transacts>:rigid_body

    @available {MinUploadedAtFNVersion := 4110}
    @experimental
    # Get mesh_part's on this mesh_component.
    GetMeshParts<native><epic_internal>():[]mesh_part

    OnPropertyChangedFromVerse<native><override>(PropertyName:string)<transacts>:void

    @editable {EpicOnly := true}
    @category("Epic Internal")
    @experimental
    # Whether to hide this mesh in game, if the mesh is Visible.
    var HiddenInGame<native><epic_internal>:logic = external {}

    @editable {EpicOnly := true}
    @category("Epic Internal")
    # Controls whether this mesh should cast a shadow or not.
    var CastShadow<native><epic_internal>:logic = external {}

    @editable {EpicOnly := true}
    @category("Epic Internal")
    # Whether this mesh should cast dynamic shadows as if it were a two sided material.
    var CastShadowAsTwoSided<native><epic_internal>:logic = external {}

    @editable {EpicOnly := true}
    @category("Epic Internal")
    # If true, the mesh will cast shadows even if HiddenInGame is true.
    var CastHiddenShadow<native><epic_internal>:logic = external {}

    @editable {EpicOnly := true}
    @category("Epic Internal")
    # Controls whether the mesh should influence indirect lighting.
    var AffectDynamicIndirectLighting<native><epic_internal>:logic = external {}

    @editable {EpicOnly := true}
    @category("Epic Internal")
    # Controls whether the mesh should affect indirect lighting when hidden.
    var AffectIndirectLightingWhileHidden<native><epic_internal>:logic = external {}

    @editable {EpicOnly := true}
    @category("Epic Internal")
    @experimental
    # Whether this mesh should allow decals.
    var ReceivesDecals<native><epic_internal>:logic = external {}

    @editable {EpicOnly := true}
    @category("Epic Internal")
    # Controls the sort priority of this mesh if it is translucent.
    var TranslucencySortPriority<native><epic_internal>:int = external {}

    @editable {EpicOnly := true}
    @category("Epic Internal")
    @experimental
    # When enabled this mesh will never be culled by distance.
    var NeverDistanceCull<native><epic_internal>:logic = external {}

    @editable {EpicOnly := true}
    @category("Epic Internal")
    # When enabled, the component will be rendering into the far shadow cascades (only for directional lights).
    var CastFarShadow<native><epic_internal>:logic = external {}

    @editable {EpicOnly := true}
    @category("Epic Internal")
    # Whether this component should create a per-object shadow that gives higher effective shadow resolution.
    var CastInsetShadow<native><epic_internal>:logic = external {}

    @editable {EpicOnly := true}
    @category("Epic Internal")
    # Whether this component should cast contact shadows.
    var CastContactShadow<native><epic_internal>:logic = external {}

    @editable {EpicOnly := true}
    @category("Epic Internal")
    # Whether this component should be affected by lighting in channel 0.
    var AffectedByLightingChannel0<native><epic_internal>:logic = external {}

    @editable {EpicOnly := true}
    @category("Epic Internal")
    # Whether this component should be affected by lighting in channel 1.
    var AffectedByLightingChannel1<native><epic_internal>:logic = external {}

    @editable {EpicOnly := true}
    @category("Epic Internal")
    # Whether this component should be affected by lighting in channel 2.
    var AffectedByLightingChannel2<native><epic_internal>:logic = external {}

    # Returns the bounded box of this component, in world space.
    GetBoundedGlobalBox<override><native>()<reads>:bounded_box

    # Returns the bounded box of this component, in local space.
    GetBoundedLocalBox<override><native>()<reads>:bounded_box

    @experimental
    @experimental_always_overridden
    # Cached bounds used when the owning entity is not initialized.
    CachedLocalBounds<native><epic_internal>:bounded_box = external {}

    ___PropertyInterface_On_Collidable_Changed<epic_internal>():void = external {}

    ___PropertyInterface_On_Queryable_Changed<epic_internal>():void = external {}

    ___PropertyInterface_On_Visible_Changed<epic_internal>():void = external {}

has_mesh_part_support<native><epic_internal> := interface<epic_internal>:


@available {MinUploadedAtFNVersion := 4100}
@experimental
mesh_part<native><epic_internal> := class<abstract><epic_internal>(diagnosable):
    HasCollisionImpl<native><epic_internal>:has_collision_impl = external {}

    HasDynamicsImpl<native><epic_internal>:has_dynamics_impl = external {}

    HasUEPhysicsPropertiesImpl<native><epic_internal>:has_ue_physics_properties_impl = external {}

    GetDiagnostic<override><native>()<reads>:diagnostic

@available {MinUploadedAtFNVersion := 4100}
@experimental
mesh_part_collision_element<native><epic_internal> := class<concrete><epic_internal>(collision_element):
    @experimental
    MeshParts<native><epic_internal>:[]mesh_part = external {}

network_physics_settings_component<native><epic_internal> := class<final_super><epic_internal>(component):
    @editable {}
    # The NetworkPhysicsSettingsData Asset to use for this entity
    var NetworkedPhysicsSettingsData<native><epic_internal>:network_physics_settings_data = external {}

# Used to spawn a `particle_system` at the location of this entity. The `particle_system` will simulate while the `particle_system_component` is in the scene.
# 
# Dependencies:
#   * `transform_component` on the entity positions the `particle_system`.
particle_system_component<native><public> := class<final_super><epic_internal>(component, enableable, property_changed_interface):
    OnInitializedInternal<native><override>():void

    OnUninitializingInternal<native><override>():void

    OnAddedToSceneInternal<native><override>():void

    OnRemovingFromSceneInternal<native><override>():void

    OnBeginSimulationInternal<native><override>():void

    # Enables the simulation and rendering of this `particle_system`.
    Enable<override><native>():void

    # Disables the simulation and rendering of this `particle_system`.
    Disable<override><native>():void

    # Succeeds if the component is enabled, fails if it’s disabled.
    IsEnabled<override><native>()<transacts><decides>:void

    @editable
    @replicated("RepNotify")
    # Controls if the `particle_system_component` should start enabled.
    var<private> Enabled<native><public>:logic = external {}

    Play<native><public>():void

    Stop<native><public>():void

    @editable
    @replicated("")
    # Controls if the `particle_system_component` should play the simulation automatically when added to the scene, or when enabled from a disabled state.
    var<private> AutoPlay<native><public>:logic = external {}

    ParticleSystem<native><epic_internal>:particle_system = external {}

    @editable {EpicOnly := true}
    @category("Epic Internal")
    # Should the niagara component tick pre (default) or post physics?
    TickPostPhysicsInternal<native><epic_internal>:logic = external {}

    SetVariableBool<native><epic_internal>(PropertyName:string, Value:logic, MarkDirty:logic)<transacts>:void

    SetVariableInt32<native><epic_internal>(PropertyName:string, Value:int, MarkDirty:logic)<transacts>:void

    SetVariableFloat<native><epic_internal>(PropertyName:string, Value:float, MarkDirty:logic)<transacts>:void

    SetVariableVec2<native><epic_internal>(PropertyName:string, Value:vector2, MarkDirty:logic)<transacts>:void

    SetVariableVec3<native><epic_internal>(PropertyName:string, Value:(/Verse.org/SpatialMath:)vector3, MarkDirty:logic)<transacts>:void

    SetVariablePosition<native><epic_internal>(PropertyName:string, Value:(/Verse.org/SpatialMath:)vector3, MarkDirty:logic)<transacts>:void

    SetVariableColor<native><epic_internal>(PropertyName:string, Value:color, MarkDirty:logic)<transacts>:void

    SetVariableMaterial<native><epic_internal>(PropertyName:string, Value:?material, MarkDirty:logic)<transacts>:void

    SetVariableTexture<native><epic_internal>(PropertyName:string, Value:?texture, MarkDirty:logic)<transacts>:void

    SetVariableEntity<native><epic_internal>(PropertyName:string, Value:?entity, MarkDirty:logic)<transacts>:void

    SetVariableArrayBool<native><epic_internal>(PropertyName:string, Values:[]logic, MarkDirty:logic)<transacts>:void

    SetVariableArrayInt32<native><epic_internal>(PropertyName:string, Values:[]int, MarkDirty:logic)<transacts>:void

    SetVariableArrayFloat<native><epic_internal>(PropertyName:string, Values:[]float, MarkDirty:logic)<transacts>:void

    SetVariableArrayVec2<native><epic_internal>(PropertyName:string, Values:[]vector2, MarkDirty:logic)<transacts>:void

    SetVariableArrayVec3<native><epic_internal>(PropertyName:string, Values:[](/Verse.org/SpatialMath:)vector3, MarkDirty:logic)<transacts>:void

    SetVariableArrayPosition<native><epic_internal>(PropertyName:string, Values:[](/Verse.org/SpatialMath:)vector3, MarkDirty:logic)<transacts>:void

    SetVariableArrayColor<native><epic_internal>(PropertyName:string, Values:[]color, MarkDirty:logic)<transacts>:void

    OnPropertyChangedFromVerse<native><override>(PropertyName:string)<transacts>:void

@experimental
hit_result<native><epic_internal> := struct:
    @experimental
    ThisEntity<native><public>:?entity

    @experimental
    ThisComponent<native><public>:?component

    @experimental
    OtherEntity<native><public>:?entity

    @experimental
    OtherComponent<native><public>:?component

    @experimental
    HitNormal<native><public>:(/Verse.org/SpatialMath:)vector3

    @experimental
    HitLocation<native><public>:(/Verse.org/SpatialMath:)vector3

@experimental
physics_component<native><epic_internal> := class<final><final_super>(component, enableable):
    OnInitializedInternal<native><override>():void

    OnUninitializingInternal<native><override>():void

    OnAddedToSceneInternal<native><override>():void

    OnRemovingFromSceneInternal<native><override>():void

    # Enable this object.
    Enable<native><override>():void

    # Disable this object.
    Disable<native><override>():void

    # Succeeds if the component is enabled, fails if it’s disabled.
    IsEnabled<native><override>()<transacts><decides>:void

    @experimental
    # Event signaled when the component experiences a blocking hit
    HitEvent<native><public>:listenable(hit_result) = external {}

# The component responsible for managing Networked Physics Replication for entities.
vector_quantization<native><epic_internal> := enum<open>:
    RoundWholeNumber
    RoundOneDecimal
    RoundTwoDecimals

rotator_quantization<native><epic_internal> := enum<open>:
    ShortComponents
    ByteComponents

VerseRepMovement<native><epic_internal> := struct:
    LinearVelocity<native>:(/Verse.org/SpatialMath:)vector3 = external {}

    AngularVelocity<native>:(/Verse.org/SpatialMath:)vector3 = external {}

    Location<native>:(/Verse.org/SpatialMath:)vector3 = external {}

    Rotation<native>:(/Verse.org/SpatialMath:)rotation = external {}

    Acceleration<native>:(/Verse.org/SpatialMath:)vector3 = external {}

    bSimulatedPhysicSleep<native>:logic = external {}

    bRepPhysics<native>:logic = external {}

    bRepAcceleration<native>:logic = external {}

    ServerFrame<native>:int = external {}

    ServerPhysicsHandle<native>:int = external {}

    LocationQuantizationLevel<native>:vector_quantization = external {}

    VelocityQuantizationLevel<native>:vector_quantization = external {}

    RotationQuantizationLevel<native>:rotator_quantization = external {}

@hide_in_editor
physics_replication_component<native><epic_internal> := class<final_super><epic_internal>(component):
    OnInitializedInternal<native><override>():void

    OnUninitializingInternal<native><override>():void

    OnAddedToSceneInternal<native><override>():void

    OnRemovingFromSceneInternal<native><override>():void

    OnBeginSimulationInternal<native><override>():void

    OnEndSimulationInternal<native><override>():void

    @replicated("RepNotify")
    var VerseReplicatedMovement<native><epic_internal>:VerseRepMovement = external {}

GetPhysicsSceneForEntity<native><epic_internal>(Entity:entity)<transacts><decides>:physics_scene_component

@available {MinUploadedAtFNVersion := 2930}
EmptyOverlapHitsGenerator<native><epic_internal>()<transacts>:generator(overlap_hit)

@available {MinUploadedAtFNVersion := 2930}
EmptySweepHitsGenerator<native><epic_internal>()<transacts>:generator(sweep_hit)

@available {MinUploadedAtFNVersion := 2930}
# Find all objects in the scene that currently overlap this entity.
(Entity:entity).FindOverlapHits<public>()<transacts>:generator(overlap_hit) = external {}

@available {MinUploadedAtFNVersion := 2930}
# Find all objects in the scene that would overlap this entity if it were placed at GlobalTransform.
(Entity:entity).FindOverlapHits<public>(GlobalTransform:(/Verse.org/SpatialMath:)transform)<transacts>:generator(overlap_hit) = external {}

@available {MinUploadedAtFNVersion := 2930}
# Find all objects in the scene that would overlap Volume if they were placed at GlobalTransform. NOTE: This entity defines the context(scene) for the query but does not otherwise take part in the sweep.
(Entity:entity).FindOverlapHits<public>(GlobalTransform:(/Verse.org/SpatialMath:)transform, Volume:collision_volume)<transacts>:generator(overlap_hit) = external {}

@available {MinUploadedAtFNVersion := 2930}
# Find objects in the scene that would intersect this entity if it were swept from its location along the Displacement vector. Returns the first object interacting as collision_interaction.Block, and all objects interacting as collision_interaction.Overlap encountered before the first block. Hits are sorted by hit distance, so the blocking hit will be last.
(Entity:entity).FindSweepHits<public>(Displacement:(/Verse.org/SpatialMath:)vector3)<transacts>:generator(sweep_hit) = external {}

@available {MinUploadedAtFNVersion := 2930}
# Find objects in the scene that would intersect this entity if it were swept from GlobalTransform along the Displacement vector. Returns the first object interacting as collision_interaction.Block, and all objects interacting as collision_interaction.Overlap encountered before the first block. Hits are sorted by hit distance, so the blocking hit will be last.
(Entity:entity).FindSweepHits<public>(Displacement:(/Verse.org/SpatialMath:)vector3, StartGlobalTransform:(/Verse.org/SpatialMath:)transform)<transacts>:generator(sweep_hit) = external {}

@available {MinUploadedAtFNVersion := 2930}
# Find all objects in the scene that would intersect Volume if they were swept from GlobalTransform along the Displacement vector Hits are sorted by hit distance. NOTE: This entity defines the context(scene) for the query but does not otherwise take part in the sweep.
(Entity:entity).FindSweepHits<public>(Displacement:(/Verse.org/SpatialMath:)vector3, StartGlobalTransform:(/Verse.org/SpatialMath:)transform, Volume:collision_volume)<transacts>:generator(sweep_hit) = external {}

physics_scene_component<native><epic_internal> := class<final><final_super><epic_internal>(component):
    OnInitializedInternal<native><override>():void

    OnUninitializingInternal<native><override>():void

    OnAddedToSceneInternal<native><override>():void

    OnRemovingFromSceneInternal<native><override>():void

    @available {MinUploadedAtFNVersion := 2930}
    FindShapeOverlaps<native><public>(QueryShape:collision_volume, QueryTransform:(/Verse.org/SpatialMath:)transform)<transacts>:generator(overlap_hit)

    @available {MinUploadedAtFNVersion := 2930}
    FindShapeSweepHits<native><public>(QueryShape:collision_volume, QueryTransform:(/Verse.org/SpatialMath:)transform, QueryTraceVector:(/Verse.org/SpatialMath:)vector3)<transacts>:generator(sweep_hit)

    @available {MinUploadedAtFNVersion := 2930}
    FindEntityOverlaps<native><public>(QueryEntity:entity, QueryTransform:(/Verse.org/SpatialMath:)transform)<transacts>:generator(overlap_hit)

    @available {MinUploadedAtFNVersion := 2930}
    FindEntitySweepHits<native><public>(QueryEntity:entity, QueryTransform:(/Verse.org/SpatialMath:)transform, QueryTraceVector:(/Verse.org/SpatialMath:)vector3)<transacts>:generator(sweep_hit)

# Payload of the AgentChangeEvent. Contains the previous and the current possessing agent.
agent_changed_result<native><epic_internal> := struct:
    PreviousAgent<native>:?agent = external {}

    CurrentAgent<native>:?agent = external {}

# Marks an entity that can be possessed by an agent.
possessable_component<native><public> := class<final_super><epic_internal>(component):
    # Which agent is this entity currently possessed by.
    var<private> Agent<native><final><public>:?agent = external {}

    OnEndSimulation<override>():void = external {}

    # Notify when the possessing agent changes.
    AgentChangeEvent<native><final><epic_internal>:listenable(agent_changed_result) = external {}

    # Entity's opinion on whether it can be possessed by a specific agent.
    #  By default it fails if the entity is already possessed.
    CanBePossessedBy<native_callable><epic_internal>(AgentToCheck:agent)<reads><decides>:void = external {}

    # Internal function to call when possessing for updating status and triggering the AgentChangeEvent.
    BeginPossess<final><epic_internal>(NewPossessingAgent:agent)<transacts>:void = external {}

    # Internal function to call when unpossessing for updating status and triggering the AgentChangeEvent.
    EndPossess<final><epic_internal>()<transacts>:void = external {}

    # Signals the AgentChangeEvent.
    SignalAgentChangeEvent<final><epic_internal>(PreviousAgent:?agent)<transacts>:void = external {}

    # Internal function that signals the AgentChangeEvent.
    SignalAgentChangeEventInternal<native><final><epic_internal>(AgentChangedResult:agent_changed_result)<transacts>:void

# All entities possessed by this agent.
(InAgent:agent).GetPossessedEntities<public>()<reads>:[]possessable_component = external {}

# Checks if an entity is possessed.
(InAgent:agent).IsEntityPossessed<public>(PossessableComponent:possessable_component)<reads><decides>:void = external {}

# Possess an entity. Fails if PossessableComponent.CanBePossessedBy[Self] fails.
(InAgent:agent).BeginPossess<epic_internal>(PossessableComponent:possessable_component)<transacts><decides>:void = external {}

# Unpossess an entity.
(InAgent:agent).EndPossess<epic_internal>(PossessableComponent:possessable_component)<transacts>:void = external {}

# Event that will fire when a new entity is possessed.
(InAgent:agent).GetBeginPossessEvent<epic_internal>():listenable(possessable_component) = external {}

# Event that will fire when an entity is unpossessed.
#  Entities are automatically unpossessed when removed from the scene
(InAgent:agent).GetEndPossessEvent<epic_internal>():listenable(possessable_component) = external {}

presentation_component<native><epic_internal> := class<final_super>(component):


@available {MinUploadedAtFNVersion := 3800}
# Assign the players that this entity will be presented to. False = presentable to everyone, array = presentable to no one.
(Entity:entity).SetPresentableToPlayers<native><public>(Players:?[]player):void

@available {MinUploadedAtFNVersion := 3800}
# Get the players that this entity is currently be presented to. False = presentable to everyone, array = presentable to no one.
(Entity:entity).GetPresentableToPlayers<native><public>()<transacts>:?[]player

# A `rect_light_component` emits light into the scene from a rectangular plane with a specified width and height. You can use these
# to simulate any kind of light sources that have rectangular areas, such as televisions or monitor screens, overhead lighting
# fixtures, or wall sconces.
rect_light_component<native><public> := class<final>(light_component, bounded):
    OnAddedToSceneInternal<native><override>():void

    # Set the visible light intensity emitted in SI unit Candela.
    # Specified before ColorFilter (which multiplies each color component after the intensity calculation and can change the effective intensity of the light).
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

    # Returns the bounded box of this component, in world space.
    GetBoundedGlobalBox<override><native>()<reads>:bounded_box

    # Returns the bounded box of this component, in local space.
    GetBoundedLocalBox<override><native>()<reads>:bounded_box

rigid_body<native><epic_internal> := class<final>:
    var Mass<public>:float = external {}

    var Inertia<public>:(/Verse.org/SpatialMath:)vector3 = external {}

    var LocalMassTranslation<public>:(/Verse.org/SpatialMath:)vector3 = external {}

    var LocalMassRotation<public>:(/Verse.org/SpatialMath:)rotation = external {}

    var GlobalMassTranslation<public>:(/Verse.org/SpatialMath:)vector3 = external {}

    var GlobalTranslation<public>:(/Verse.org/SpatialMath:)vector3 = external {}

    var GlobalRotation<public>:(/Verse.org/SpatialMath:)rotation = external {}

    var LinearVelocity<public>:(/Verse.org/SpatialMath:)vector3 = external {}

    var AngularVelocity<public>:(/Verse.org/SpatialMath:)vector3 = external {}

    var IsDynamic<public>:logic = external {}

    AddLinearImpulse<native><public>(LinearImpulseVector:(/Verse.org/SpatialMath:)vector3)<transacts>:void

    AddAngularImpulse<native><public>(AngularImpulseVector:(/Verse.org/SpatialMath:)vector3)<transacts>:void

@hide_in_editor
@experimental
rigid_body_component<native><epic_internal> := class<final><final_super><epic_internal>(component):
    OnInitializedInternal<native><override>():void

    OnUninitializingInternal<native><override>():void

    OnAddedToSceneInternal<native><override>():void

    OnRemovingFromSceneInternal<native><override>():void

    OnBeginSimulationInternal<native><override>():void

    OnEndSimulationInternal<native><override>():void

    @experimental
    # Enable/Disable simulation of this body.
    var Dynamic<public>:logic = external {}

    @experimental
    @editable
    # The mass to use for component.
    var MassInKg<public>:float = external {}

    @experimental
    @editable
    # The gravity group index to use for component.
    var GravityGroupIndex<public>:int = external {}

    @experimental
    @editable
    # The max angular velocity to use for component.
    var MaxAngularVelocityInRadians<public>:float = external {}

sound_component<native><public> := class<abstract><final_super><epic_internal>(component, property_changed_interface, enableable):
    OnInitializedInternal<native><override>():void

    OnUninitializingInternal<native><override>():void

    OnAddedToSceneInternal<native><override>():void

    OnRemovingFromSceneInternal<native><override>():void

    OnBeginSimulationInternal<native><override>():void

    @editable
    @replicated("")
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
    @replicated("RepNotify")
    var<private> Enabled<native><public>:logic = external {}

    # The path to the sound asset
    InternalMetaSoundAssetPath<native><epic_internal>:metasound = external {}

    OnPropertyChangedFromVerse<native><override>(PropertyName:string)<transacts>:void

# A `sphere_light_component` emits light in all directions into the scene from a spherical source shape with a specified radius. A radius of 0 makes it a point light. You can use these
# to simulate any kind of light sources that emit in all directions, such as a light bulb.
sphere_light_component<native><public> := class<final>(light_component, bounded):
    OnAddedToSceneInternal<native><override>():void

    # Set the visible light intensity emitted in SI unit Candela.
    # Specified before ColorFilter (which multiplies each color component after the intensity calculation and can change the effective intensity of the light).
    var Intensity<public>:float = external {}

    # The bounds of the light's visible influence, in centimeters. This clamping of the light's influence is not physically correct but very important for performance,
    # larger lights cost more. The light falloff is based on Inverse Square law. Towards the tail end of the AttenuationRadius,
    # there is an additional smoothing factor to fade out the light contribution to 0 to avoid a hard cutoff.
    var AttenuationRadius<public>:?float = external {}

    # Radius of the source shape, in centimeters. Note that light shapes which intersect shadow casting geometry can cause shadowing artifacts.
    var SourceRadius<public>:float = external {}

    # Returns the bounded box of this component, in world space.
    GetBoundedGlobalBox<override><native>()<reads>:bounded_box

    # Returns the bounded box of this component, in local space.
    GetBoundedLocalBox<override><native>()<reads>:bounded_box

    @editable {EpicOnly := true}
    @category("Epic Internal")
    # Whether to use physically based inverse squared distance falloff
    UseInverseSquaredFalloff<native><epic_internal>:logic = external {}

    @editable_slider(float) {EpicOnly := true; MinValue := option {2.000000}; MaxValue := option {16.000000}}
    @category("Epic Internal")
    # Controls the radial falloff of the light when UseInverseSquaredFalloff is disabled
    LightFalloffExponent<native><epic_internal>:float = external {}

# A `spot_light_component` emits light from a single point in a cone shape. The shape of the light is defined by two cones: the `InnerConeAngleDegrees`
# and `OuterConeAngleDegrees`. Within the `InnerConeAngleDegrees` the light achieves full brightness. As you go from the extent of the inner radius to the
# extents of the `OuterConeAngleDegrees` a falloff takes place, creating a penumbra, or softening around the `spot_light_component`'s disc of
# illumination. The Radius of the light defines the length of the cones. More simply, this will work like a flash light or stage can light.
spot_light_component<native><public> := class<final>(light_component, bounded):
    OnAddedToSceneInternal<native><override>():void

    # Set the visible light intensity emitted in SI unit Candela.
    # Specified before ColorFilter (which multiplies each color component after the intensity calculation and can change the effective intensity of the light).
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

    # Returns the bounded box of this component, in world space.
    GetBoundedGlobalBox<override><native>()<reads>:bounded_box

    # Returns the bounded box of this component, in local space.
    GetBoundedLocalBox<override><native>()<reads>:bounded_box

    @editable {EpicOnly := true}
    @category("Epic Internal")
    # Whether to use physically based inverse squared distance falloff
    UseInverseSquaredFalloff<native><epic_internal>:logic = external {}

    @editable_slider(float) {EpicOnly := true; MinValue := option {2.000000}; MaxValue := option {16.000000}}
    @category("Epic Internal")
    # Controls the radial falloff of the light when UseInverseSquaredFalloff is disabled
    LightFalloffExponent<native><epic_internal>:float = external {}

@experimental
# A range with a minimum and maximum value. For a value to fall inside of this range, the min value must be less than or equal to the max value.
float_range<native><public> := struct<concrete>:
    Minimum<native><public>:float = external {}

    @editable
    Maximum<native><public>:float = external {}

@experimental
# Used to render a string at the location of this entity.
# 
# Dependencies:
#   * `transform_component` on the entity positions the `text_display_component`.
text_display_component<native><epic_internal> := class<final_super>(component, enableable):
    OnInitializedInternal<native><override>():void

    OnAddedToSceneInternal<native><override>():void

    OnRemovingFromSceneInternal<native><override>():void

    # Enable this object.
    Enable<native><override>():void

    # Disable this object.
    Disable<native><override>():void

    # Succeeds if the component is enabled, fails if it is disabled.
    IsEnabled<native><override>()<transacts><decides>:void

    @experimental
    @editable
    @replicated("RepNotify")
    # Message to be displayed on the entity.
    var Message<native><public>:message = external {}

    @editable
    @replicated("RepNotify")
    # The color with which to display the text.
    var Color<native><public>:color = external {}

    @editable
    @replicated("RepNotify")
    # The time in seconds for the text to fully fade in.
    var FadeInTime<native><epic_internal>:float = external {}

    @editable
    @replicated("RepNotify")
    # The time in seconds for the text to fully fade out.
    var FadeOutTime<native><epic_internal>:float = external {}