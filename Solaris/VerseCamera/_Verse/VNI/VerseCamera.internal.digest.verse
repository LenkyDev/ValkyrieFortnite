# Verse path: /Verse.org/SceneGraph
using {/Verse.org/Assets}
using {/Verse.org/SpatialMath}
using {/Verse.org/Simulation}
using {/Verse.org/Native}
using {/Verse.org/Temporary/EpicGamesRestricted/Network}
@available {MinUploadedAtFNVersion := 4300}
@experimental
@hide_in_editor
# Camera modifier that attaches the camera to a target entity
attach_to_entity_camera_modifier<native><epic_internal> := class<concrete>(camera_modifier):
    @experimental
    @replicated("")
    # Entity to attach to.
    var TargetEntity<native><public>:entity = external {}

    @experimental
    @replicated("")
    # Modify the render location to attach to the target's location?'
    var AttachToLocation<native><public>:logic = external {}

    @experimental
    @replicated("")
    # Modify the render rotation to attach to the target's rotation?'
    var AttachToRotation<native><public>:logic = external {}

@available {MinUploadedAtFNVersion := 4300}
@experimental
@hide_in_editor
# Base class for nodes that frame a target
base_framing_camera_modifier<native><epic_internal> := class<abstract>(camera_modifier):
    @experimental
    # Targets to frame, mapping each target entity to the weight it contributes to the framing calculation.
    var TargetEntities<public>:[entity]float = external {}

    @experimental
    @replicated("")
    @display_name("TargetEntities")
    var WeightedTargets<native><protected>:[]weighted_target_entity = external {}

    @experimental
    @replicated("")
    # Whether to frame the target with the ideal framing immediately on the first frame.
    InitializeWithIdealFraming<native><public>:logic = external {}

    @experimental
    @replicated("")
    # The ideal horizontal screen-space position of the target.
    var IdealFramingLocationScreenSpaceLeft<native><public>:float = external {}

    @experimental
    @replicated("")
    # The ideal vertical screen-space position of the target.
    var IdealFramingLocationScreenSpaceUp<native><public>:float = external {}

    @experimental
    @replicated("")
    # The damping factor for how fast the framing recenters on the target.
    var ReframeDampingFactor<native><public>:float = external {}

    @experimental
    @replicated("")
    # If valid, the recentering damping factor will interpolate between LowReframeDampingFactor and ReframeDampingFactor as the target moves between the ideal target position and the boundaries of the hard-zone. 
    # If invalid, no interpolation occurs and the damping factor is always equal to ReframeDampingFactor.
    var LowReframeDampingFactor<native><public>:?float = external {}

    @experimental
    @replicated("")
    # The time spent ramping up the reframing after exiting the dead zone. If set to zero or a negative value, reframing will immediately restart once the target has exited the dead zone. Otherwise the ReframeDampingFactor will interpolate from zero to its desired value over the specified amount of seconds.
    var ReengageTimeSeconds<native><public>:float = external {}

    @experimental
    @replicated("")
    # The time spent ramping down the reframing after entering the dead zone. If set to zero or a negative value, reframing will immediately stop once the target has entered the dead zone. Otherwise, the ReframeDampingFactor will interpolate towards zero over the specified amount of seconds.
    var DisengageTimeSeconds<native><public>:float = external {}

    @experimental
    @replicated("")
    # How far ahead to look in time when attempting to anticipate the movement of the target.
    var TargetMovementAnticipationTimeSeconds<native><public>:float = external {}

    @experimental
    @replicated("")
    # The size of the dead zone, i.e. the zone inside which the target can freely move.
    # Sizes are expressed screen percentages around the desired framing location.
    var DeadZoneScreenSpaceLeft<native><public>:float = external {}

    @experimental
    @replicated("")
    # The size of the dead zone, i.e. the zone inside which the target can freely move.
    # Sizes are expressed screen percentages around the desired framing location.
    var DeadZoneScreenSpaceRight<native><public>:float = external {}

    @experimental
    @replicated("")
    # The size of the dead zone, i.e. the zone inside which the target can freely move.
    # Sizes are expressed screen percentages around the desired framing location.
    var DeadZoneScreenSpaceTop<native><public>:float = external {}

    @experimental
    @replicated("")
    # The size of the dead zone, i.e. the zone inside which the target can freely move.
    # Sizes are expressed screen percentages around the desired framing location.
    var DeadZoneScreenSpaceBottom<native><public>:float = external {}

    @experimental
    @replicated("")
    # The margins of the soft zone, i.e. the zone inside which the reframing will engage, in order to bring the target back towards the ideal framing position. If the target is outside of the soft zone, it will be forcibly and immedialy brought back to its edges, so this zone also defines the "hard" or "safe" zone of framing. Sizes are expressed in screen percentages from the edges.
    var SoftZoneScreenSpaceLeft<native><public>:float = external {}

    @experimental
    @replicated("")
    # The margins of the soft zone, i.e. the zone inside which the reframing will engage, in order to bring the target back towards the ideal framing position. If the target is outside of the soft zone, it will be forcibly and immedialy brought back to its edges, so this zone also defines the "hard" or "safe" zone of framing. Sizes are expressed in screen percentages from the edges.
    var SoftZoneScreenSpaceRight<native><public>:float = external {}

    @experimental
    @replicated("")
    # The margins of the soft zone, i.e. the zone inside which the reframing will engage, in order to bring the target back towards the ideal framing position. If the target is outside of the soft zone, it will be forcibly and immedialy brought back to its edges, so this zone also defines the "hard" or "safe" zone of framing. Sizes are expressed in screen percentages from the edges.
    var SoftZoneScreenSpaceTop<native><public>:float = external {}

    @experimental
    @replicated("")
    # The margins of the soft zone, i.e. the zone inside which the reframing will engage, in order to bring the target back towards the ideal framing position. If the target is outside of the soft zone, it will be forcibly and immedialy brought back to its edges, so this zone also defines the "hard" or "safe" zone of framing. Sizes are expressed in screen percentages from the edges.
    var SoftZoneScreenSpaceBottom<native><public>:float = external {}

@available {MinUploadedAtFNVersion := 4300}
@experimental
camera_auto_rotate_direction<native><epic_internal> := enum<open>:
    Facing
    Movement
    MovementOrFacing
    ZeroDirection

@available {MinUploadedAtFNVersion := 4300}
@experimental
@hide_in_editor
# A camera node that can rotate the camera in yaw and pitch based on player input.
auto_rotate_camera_modifier_settings<native><epic_internal> := class<concrete>:
    @experimental
    @replicated("")
    # Whether to enable auto-rotation
    var Enable<native><public>:logic = external {}

    @experimental
    @replicated("")
    # The direction to re-align towards
    Direction<native><public>:camera_auto_rotate_direction = external {}

    @experimental
    @replicated("")
    # The time in seconds, to wait before re-aligning.
    WaitTime<native><public>:float = external {}

    @experimental
    @replicated("")
    @units("Radians")
    # The minimum player-induced/manual rotation in radians, to deactivate auto-rotation.
    DeactivationThreshold<native><public>:float = external {}

    @experimental
    @replicated("")
    # Whether to auto-rotate yaw.
    AutoRotateYaw<native><public>:logic = external {}

    @experimental
    @replicated("")
    # Whether to auto-rotate pitch.
    AutoRotatePitch<native><public>:logic = external {}

@available {MinUploadedAtFNVersion := 4300}
@experimental
@hide_in_editor
# A camera node that can rotate the camera in yaw and pitch based on player input.
boom_arm_camera_modifier<native><epic_internal> := class<concrete>(camera_modifier):
    @experimental
    @replicated("")
    # The offset of the boom. Rotation occurs at the base (i.e. before the offset).
    var BoomOffset<native><public>:(/Verse.org/SpatialMath:)vector3 = external {}

    @experimental
    @replicated("")
    # The maximum amount of forward movement the interpolator can introduce, expressed as a factor of the default boom length. If the value is less than 0.0 then there is no limit.
    var MaxForwardInterpolationFactor<native><public>:float = external {}

    @experimental
    @replicated("")
    # The maximum amount of backward movement the interpolator can introduce, expressed as a factor of the default boom length. If the value is less than 0.0 then there is no limit.
    var MaxBackwardInterpolationFactor<native><public>:float = external {}

    @experimental
    @replicated("")
    # If true, the boom arm's rotation will add to the existing rotation instead of being absolute.
    IsRotationAdditive<native><public>:logic = external {}

    @experimental
    @replicated("")
    # Optional auto rotation settings
    AutoRotateSettings<native><public>:?auto_rotate_camera_modifier_settings = external {}

    @experimental
    @replicated("")
    # Interpolation settings to use for changing the boom length based on its pivot's movements.
    BoomLengthInterpolationSettings<native><public>:camera_value_interpolation_settings = external {}

@available {MinUploadedAtFNVersion := 4110}
@experimental
# Camera body settings, e.g. sensor/film settings, shutter speed, etc
camera_body<native><public> := class<computes>:
    @replicated("")
    # Width of camera sensor in millimeters.
    SensorWidthMillimeters<native><public>:float = external {}

    @replicated("")
    # Height of camera sensor in millimeters.
    SensorHeightMillimeters<native><public>:float = external {}

    @replicated("")
    # Horizontal offset of camera sensor.
    SensorHorizontalOffsetMillimeters<native><public>:float = external {}

    @replicated("")
    # Vertical offset of camera sensor.
    SensorVerticalOffsetMillimeters<native><public>:float = external {}

    @replicated("")
    # The camera sensor sensitivity to light.
    ISO<native><public>:float = external {}

    @replicated("")
    # Camera shutter speed.
    ShutterSpeed<native><public>:float = external {}

@available {MinUploadedAtFNVersion := 4110}
@experimental
# Constructor that clones an existing camera_body. Useful for writing camera modifiers as it makes it easier to create a camera_body that is a copy of another with some values modified.
CloneCameraBody<constructor><public>(CameraBody:camera_body)<computes>:camera_body = external {}

@available {MinUploadedAtFNVersion := 4110}
@experimental
@hide_in_editor
camera_component_impl_modifier<native><epic_internal> := class(camera_modifier):
    Evaluate<override>(InValue:camera_state)<reads>:camera_state = external {}

    NativeEvaluate<native><epic_internal>(InValue:camera_state)<reads>:camera_state

@available {MinUploadedAtFNVersion := 4110}
@experimental
# Represents the physical body, lens of the camera and other cinematographic qualities, such as sensor size, aspect ratio lock/constraint, focal length, focus distance, post-process settings, etc.
camera_component<native><public> := class<final_super><abstract>(component):
    @editable
    @replicated("")
    @experimental
    # Camera modifiers allow the behavior of a camera to be modified with custom logic.
    # A camera modifier has an Evaluate function that takes in the current state of the camera (taking into account all previously executed modifiers) and returns the desired output camera state
    CameraModifiers<native><public>:modifier_stack(camera_state) = external {}

    AddCameraModifier<native_callable><epic_internal>(Modifier:camera_modifier, Priority:rational):cancelable = external {}

    @editable
    @replicated("")
    @experimental
    # Optionally override the near clipping plane distance. If value is <= 0.0 then use the default settings
    var NearClippingPlaneDistance<native><public>:float = external {}

    @editable
    @replicated("")
    @experimental
    # Optionally override the far clipping plane distance. If value is Inf then use the default settings
    var FarClippingPlaneDistance<native><public>:float = external {}

    @experimental
    # Get transition to use when exiting this camera mode to transition to the destination camera mode
    GetExitTransition<native_callable><public>(DestinationCamera:camera_component)<transacts><decides>:camera_transition = external {}

    @experimental
    # Get transition to use when entering this camera mode to transition to the specified camera mode
    GetEnterTransition<native_callable><public>(SourceCamera:camera_component)<transacts><decides>:camera_transition = external {}

    @experimental
    GetEnterTransition_Internal<native_callable><epic_internal>(SourceCamera:camera_component)<transacts><decides>:camera_transition = external {}

@available {MinUploadedAtFNVersion := 4110}
@experimental
camera_director_camera_entry<native><epic_internal> := class<epic_internal>(cancelable):
    Cancel<native><override>()<transacts>:void

    @experimental
    @replicated("")
    DirectorComponent<native><public>:camera_director_component

    @experimental
    @replicated("")
    CameraComponent<native><public>:camera_component

    @experimental
    @replicated("")
    Priority<native><public>:rational

    @experimental
    @replicated("")
    var Transition<native><public>:camera_transition = external {}

@available {MinUploadedAtFNVersion := 4110}
@experimental
# Responsible for selecting a camera and blending when the active camera changes. 
# The execution of the camera director is split into multiple layers. 
#  
#  * The Pre-Camera layer - These modifiers run before everything else and allow default values to be set before the rest of the camera system evaluates. 
#  * The Main layer - The camera_component with the highest priority (defined by the priority given to AddCamera) executes here. 
#  * The Post-Camera layer - These modifiers run on the accumulated result of the PreCamera and Main layers. This layer runs after any blending that may occur between active cameras, if we are currently transitioning between active camera_components. Intended to be the final Gameplay state of the camera system. 
#  * The Presentation layer - These modifiers run on the accumulated result of the PreCamera, Main layer and Post-Camera layers. Intended for cosmetic effects like camera shake, that don't affect gameplay. '
# 
# Since a camera_director_component is a camera_component, camera directors can be nested. 
# If the active camera is a camera director, then each layer of the entire active camera system will be evaluated in order. 
# The entire Pre-Camera layer of all directors will evaluate, starting with the outermost director.
# The active camera of the innermost director will then evaluate, followed by any modifiers on the Main layer of the camera_director_component (the CameraModifiers modifier stack we inherit from camera_component).
# The entire Post-Camera layer of all directors will evaluate, starting with the outermost director.
# The entire Presentation layer of all directors will evaluate, starting with the outermost director.
camera_director_component<native><public> := class<final_super>(camera_component):
    @editable
    @replicated("")
    @experimental
    @available {MinUploadedAtFNVersion := 4230}
    # Modifier stack containing modifiers that should run on the Pre-Camera layer before any camera_components are evaluated.
    # Useful for setting default values that you want to be shared by the entire camera system.
    PreCameraModifiers<native><public>:modifier_stack(camera_state) = external {}

    @editable
    @replicated("")
    @experimental
    @available {MinUploadedAtFNVersion := 4230}
    # Modifier stack containing modifiers that should run after the Pre-Camera and Main layers (the active camera_component) have been evaluated.
    # In the case where we are blending between cameras, the Post Camera modifiers will run on the blended output state after all blending cameras have been evaluated.
    # The Post Camera layer is useful for modifiers that you don't want to run multiple times when blending. Such as collision detection, or weapon recoil.
    PostCameraModifiers<native><public>:modifier_stack(camera_state) = external {}

    @editable
    @replicated("")
    @experimental
    @available {MinUploadedAtFNVersion := 4230}
    # Modifier stack containing modifiers that should run after the Pre-Camera, Main and Post-Camera layers.
    # The Presentation layer is intended to be used for purely cosmetic effects like camera shake. In future the intention is that you can use the PostCameraModifiers layer to define the "Gameplay" state of the camera system (for uses like aiming and character movement).
    # Purely cosmetic effects that you don't want to affect the player's aim or movement direction can live in the Presentation layer.
    PresentationCameraModifiers<native><public>:modifier_stack(camera_state) = external {}

    # Add a camera to the director. The camera with the highest priority will be chosen to be the active camera
    AddCamera<native><public>(Camera:camera_component, Priority:rational)<transacts><decides>:cancelable

    # Returns the current camera transform if available.
    GetActiveCameraTransform<native><epic_internal>()<decides><reads>:(/Verse.org/SpatialMath:)transform

    @available {MinUploadedAtFNVersion := 4230}
    @experimental
    AddPreCameraLayerModifier<native_callable><epic_internal>(Modifier:camera_modifier, Priority:rational):cancelable = external {}

    @available {MinUploadedAtFNVersion := 4230}
    @experimental
    AddPostCameraLayerModifier<native_callable><epic_internal>(Modifier:camera_modifier, Priority:rational):cancelable = external {}

    @available {MinUploadedAtFNVersion := 4230}
    @experimental
    AddPresentationLayerModifier<native_callable><epic_internal>(Modifier:camera_modifier, Priority:rational):cancelable = external {}

    @replicated("")
    @experimental
    @available {MinUploadedAtFNVersion := 4230}
    var UseCameraLocationAsAudioListenerPosition<native><epic_internal>:logic = external {}

@available {MinUploadedAtFNVersion := 4110}
@experimental
# Camera lens settings
camera_lens<native><public> := class<computes>:
    @replicated("")
    # Focal length of the lens in millimeters.
    FocalLengthMillimeters<native><public>:float = external {}

    @replicated("")
    # Aperture of the lens in FStop.
    FStop<native><public>:float = external {}

    @replicated("")
    # Squeeze factor for anamorphic lenses.
    SqueezeFactor<native><public>:float = external {}

    @replicated("")
    # Number of blades of diaphragm.
    BladeCount<native><public>:int = external {}

    @replicated("")
    # Focus distance in centimeters.
    FocusDistance<native><epic_internal>:?float = external {}

@available {MinUploadedAtFNVersion := 4110}
@experimental
# Constructor that clones an existing camera_lens. Useful for writing camera modifiers as it makes it easier to create a camera_lens that is a copy of another with some values modified.
CloneCameraLens<constructor><public>(CameraLens:camera_lens)<computes>:camera_lens = external {}

@available {MinUploadedAtFNVersion := 4230}
@experimental
MakeCameraModifierStack<native><epic_internal>()<converges>:modifier_stack(camera_state)

@available {MinUploadedAtFNVersion := 4110}
@experimental
# Modifier stack for camera state.
camera_modifier_stack<native><public> := class(modifier_stack(camera_state)):
    # Returns a camera_state which is the input evaluated against each modifier in the stack, executed in position order.
    Evaluate<native><override>(InValue:camera_state)<reads>:camera_state

@available {MinUploadedAtFNVersion := 4110}
@experimental
# Base class for objects that can modify camera state. 
# You can also implement the modifier(camera_state) interface directly, but camera_modifier provides an convenient, overridable Tick function for modifiers that need to maintain state (since Evaluate is <reads>).
camera_modifier<native><public> := class(modifier(camera_state)):
    @experimental
    Tick<native_callable><epic_internal>(DeltaTime:float)<transacts>:void = external {}

    Evaluate<override><native_callable>(InValue:camera_state)<reads>:camera_state = external {}

    @experimental
    NativeCameraRigAsset<native><epic_internal>:camera_rig_asset = external {}

@available {MinUploadedAtFNVersion := 4110}
@experimental
# Epic internal-only camera_modifier class that is free of the restrictions temporarily in place on camera_modifier until we have full <predicts> support
internal_camera_modifier<native><epic_internal> := class(camera_modifier):


@available {MinUploadedAtFNVersion := 4110}
@experimental
camera_projection_mode<native><public> := enum<open>:
    Perspective
    Orthographic

@available {MinUploadedAtFNVersion := 4110}
@experimental
camera_state<native><public> := class<final><computes>:
    @experimental
    @replicated("")
    # Render location of the camera. This render location can be modified by camera directions (like camera shakes), without modifying the physical location of any camera entity
    RenderLocation<native><public>:(/Verse.org/SpatialMath:)vector3

    @experimental
    @replicated("")
    # Render rotation of the camera. This render rotation can be modified by camera directions (like camera shakes), without modifying the physical location of any camera entity
    RenderRotation<native><public>:(/Verse.org/SpatialMath:)rotation

    @experimental
    @replicated("")
    # Determines how wide the camera projects in orthographic mode, in centimeters - Used only if projection mode is orthographic
    OrthographicProjectionWidth<native><public>:float = external {}

    @experimental
    @replicated("")
    # Physical camera body settings
    Body<native><public>:camera_body = external {}

    @experimental
    @replicated("")
    # Physical camera lens settings
    Lens<native><public>:camera_lens = external {}

    @experimental
    @replicated("")
    # Projection mode - perspective or orthographic
    ProjectionMode<native><public>:camera_projection_mode = external {}

    @experimental
    @replicated("")
    # How much to apply physical camera settings between 0.0 and 1.0
    PhysicalCameraWeight<native><public>:float = external {}

    @experimental
    @replicated("")
    NearClippingPlaneDistance<native><public>:float = external {}

    @experimental
    @replicated("")
    FarClippingPlaneDistance<native><public>:float = external {}

@available {MinUploadedAtFNVersion := 4110}
@experimental
# Constructor that clones an existing camera_state. Useful for writing camera modifiers as it makes it easier to create a camera_state that is a copy of another with some values modified.
CloneCameraState<constructor><public>(CameraState:camera_state)<computes>:camera_state = external {}

@available {MinUploadedAtFNVersion := 4110}
@experimental
# Controls how a camera mode transitions to another
camera_transition_initial_orientation<native><public> := enum:
    PreviousYawPitch
    PreviousAbsoluteTarget
    PreviousRelativeTarget

@available {MinUploadedAtFNVersion := 4110}
@experimental
# Controls how a camera mode transitions to another
camera_transition<native><public> := class<concrete>:
    @editable
    @replicated("")
    Blend<native><public>:camera_mode_blend = external {}

    @editable
    @replicated("")
    # Sets the duration of the camera transition
    Duration<native><public>:float = external {}

    @editable
    @replicated("")
    InitialTargetOrientation<native><epic_internal>:?camera_transition_initial_orientation = external {}

@available {MinUploadedAtFNVersion := 4110}
@experimental
@hide_in_editor
# Configurable blend between two camera modes
camera_mode_blend<native><public> := class<concrete>:


@available {MinUploadedAtFNVersion := 4110}
@experimental
# Instantly snap to target mode
camera_mode_blend_pop<native><public> := class<concrete>(camera_mode_blend):


@available {MinUploadedAtFNVersion := 4110}
@experimental
# Linear blend between camera modes
camera_mode_blend_linear<native><public> := class<concrete>(camera_mode_blend):


@available {MinUploadedAtFNVersion := 4110}
@experimental
# Camera mode blend that uses the smoothstep function to blend between the two camera modes
camera_mode_blend_smoothstep<native><public> := class<concrete>(camera_mode_blend):


@available {MinUploadedAtFNVersion := 4110}
@experimental
# Camera mode blend that uses the smootherstep function to blend between the two camera modes
camera_mode_blend_smootherstep<native><public> := class<concrete>(camera_mode_blend):


@available {MinUploadedAtFNVersion := 4110}
@experimental
# Configurable blend between two camera modes
camera_mode_blend_orbit<native><public> := class<concrete>(camera_mode_blend):
    @replicated("")
    DrivingBlend<native><public>:camera_mode_blend = external {}

@available {MinUploadedAtFNVersion := 4300}
@experimental
@hide_in_editor
# A camera value interpolator allows a camera modifier to control how a given value is interpolated to a given target.
camera_value_interpolation_settings<native><epic_internal> := class<concrete>:


@available {MinUploadedAtFNVersion := 4300}
@experimental
@hide_in_editor
# A simple value interpolator that immediately "pops" to the target value.
pop_value_camera_value_interpolation_settings<native><epic_internal> := class<concrete>(camera_value_interpolation_settings):


@available {MinUploadedAtFNVersion := 4300}
@experimental
@hide_in_editor
# A value interpolator that first accelerates up to a maximum speed, and then decelerates before reaching the target value.
acceleration_deceleration_camera_value_interpolation_settings<native><epic_internal> := class<concrete>(camera_value_interpolation_settings):
    @experimental
    @replicated("")
    # The acceleration rate at the start of interpolation.
    Acceleration<native><public>:float = external {}

    @experimental
    @replicated("")
    # The deceleration rate at the end of interpolation.
    Deceleration<native><public>:float = external {}

    @experimental
    @replicated("")
    # The maximum speed reachable during interpolation.
    MaxSpeed<native><public>:float = external {}

@available {MinUploadedAtFNVersion := 4300}
@experimental
@hide_in_editor
# A value interpolator that uses a spring-mass system to converge towards the target value.
critical_damper_camera_value_interpolation_settings<native><epic_internal> := class<concrete>(camera_value_interpolation_settings):
    @experimental
    @replicated("")
    # The damping factor of the spring-mass system.
    DampingFactor<native><public>:float = external {}

@available {MinUploadedAtFNVersion := 4300}
@experimental
@hide_in_editor
# Infinite impulse response filter interpolator.
infinite_impulse_response_camera_value_interpolation_settings<native><epic_internal> := class<concrete>(camera_value_interpolation_settings):
    @experimental
    @replicated("")
    # The speed of interpolation.
    Speed<native><public>:float = external {}

    @experimental
    @replicated("")
    # Whether to use fixed-step evaluation.
    UseFixedStep<native><public>:logic = external {}

@available {MinUploadedAtFNVersion := 4300}
@experimental
@hide_in_editor
#  Double infinite impulse response filter interpolator.
double_infinite_impulse_response_camera_value_interpolation_settings<native><epic_internal> := class<concrete>(camera_value_interpolation_settings):
    @experimental
    @replicated("")
    # The primary speed of interpolation.
    PrimarySpeed<native><public>:float = external {}

    @experimental
    @replicated("")
    # The intermediate speed of interpolation.
    IntermediateSpeed<native><public>:float = external {}

    @experimental
    @replicated("")
    # Whether to use fixed-step evaluation.
    UseFixedStep<native><public>:logic = external {}

@available {MinUploadedAtFNVersion := 4300}
@experimental
@hide_in_editor
# Camera modifier that pushes the camera out of world collision.
collision_push_camera_modifier<native><epic_internal> := class<concrete>(camera_modifier):
    @experimental
    @replicated("")
    # Collision will ignore the specified entities only.
    var IgnoreEntities<native><public>:[]entity = external {}

    @experimental
    @replicated("")
    # Collision will ignore the specified entities and all their descendants. If an entity is in both arrays, then this one takes precedence as being in IgnoreEntities doesn't specifically exclude an entity's descendants from being included, it just doesn't add them'.
    var IgnoreEntitiesAndDescendants<native><public>:[]entity = external {}

    @experimental
    @replicated("")
    # World-space offset from the target to the line trace's end..
    var SafePositionOffset<native><public>:(/Verse.org/SpatialMath:)vector3 = external {}

    @experimental
    @replicated("")
    # Sphere radius to use for collision shape cast.
    var CollisionSphereRadius<native><public>:float = external {}

    @experimental
    @replicated("")
    # Interpolation settings to use when pushing camera out, away from the pivot point.
    PushInterpolationSettings<native><public>:camera_value_interpolation_settings = external {}

    @experimental
    @replicated("")
    # Interpolation settings to use when pulling camera in, towards the pivot point.
    PullInterpolationSettings<native><public>:camera_value_interpolation_settings = external {}

@available {MinUploadedAtFNVersion := 4300}
@experimental
@hide_in_editor
# Camera modifier that smooths the camera's rotation. Each axis is damped independently, so a camera can ease into a new yaw while pitching immediately. A damping factor of zero leaves that axis undamped.
dampen_rotation_camera_modifier<native><epic_internal> := class<concrete>(camera_modifier):
    @experimental
    @replicated("")
    # Damping factor for the camera yaw.
    var YawDampingFactor<native><public>:float = external {}

    @experimental
    @replicated("")
    # Damping factor for the camera pitch.
    var PitchDampingFactor<native><public>:float = external {}

    @experimental
    @replicated("")
    # Damping factor for the camera roll.
    var RollDampingFactor<native><public>:float = external {}

@available {MinUploadedAtFNVersion := 4300}
@experimental
@hide_in_editor
# Camera modifier that smooths the camera's movement. Each axis is damped independently, so a camera can lag behind vertically while tracking laterally without delay. A damping factor of zero leaves that axis undamped.
dampen_translation_camera_modifier<native><epic_internal> := class<concrete>(camera_modifier):
    @experimental
    @replicated("")
    # Damping factor for camera movement along the Forward axis.
    var ForwardDampingFactor<native><public>:float = external {}

    @experimental
    @replicated("")
    # Damping factor for camera movement along the Left axis.
    var LeftDampingFactor<native><public>:float = external {}

    @experimental
    @replicated("")
    # Damping factor for camera movement along the Up axis.
    var UpDampingFactor<native><public>:float = external {}

    @experimental
    @replicated("")
    # The space the damping axes are measured in.
    DampenSpace<native><public>:camera_offset_space = external {}

@available {MinUploadedAtFNVersion := 4300}
@experimental
@hide_in_editor
# Camera modifier that frames a target by moving along a sideways rail (left/right relative to the camera transform) and optionally also up and down..
dolly_framing_camera_modifier<native><epic_internal> := class<concrete>(base_framing_camera_modifier):
    @experimental
    @replicated("")
    # Whether the dolly can move horizontally.
    CanMoveHorizontally<native><public>:logic = external {}

    @experimental
    @replicated("")
    # Whether the dolly can move vertically.
    CanMoveVertically<native><public>:logic = external {}

@available {MinUploadedAtFNVersion := 4300}
@experimental
camera_offset_space<native><epic_internal> := enum<open>:
    CameraSpace
    PivotSpace
    WorldSpace

@available {MinUploadedAtFNVersion := 4300}
@experimental
@hide_in_editor
# Camera modifier that offsets the camera in the specified space.
offset_camera_modifier<native><epic_internal> := class<concrete>(camera_modifier):
    @experimental
    @replicated("")
    # The translation offset to apply to the camera.
    var TranslationOffset<native><public>:(/Verse.org/SpatialMath:)vector3 = external {}

    @experimental
    @replicated("")
    # The rotation offset to apply to the camera.
    var RotationOffset<native><public>:(/Verse.org/SpatialMath:)rotation = external {}

    @experimental
    @replicated("")
    # The space in which to apply the offset. Constant - baked in when the camera node is created.
    OffsetSpace<native><public>:camera_offset_space = external {}

@available {MinUploadedAtFNVersion := 4110}
@experimental
@hide_in_editor
orthographic_camera_component_impl_modifier<native><epic_internal> := class<final>(camera_component_impl_modifier):
    NativeEvaluate<override><native>(InValue:camera_state)<reads>:camera_state

@available {MinUploadedAtFNVersion := 4110}
@experimental
# Simple orthographic camera.
orthographic_camera_component<native><public> := class<final_super>(camera_component):
    @editable
    @replicated("")
    @experimental
    # Determines how wide the camera projects in orthographic mode, in centimeters
    var OrthographicProjectionWidth<native><public>:float = external {}

@available {MinUploadedAtFNVersion := 4300}
@experimental
@hide_in_editor
# Camera modifier that frames a target by rotating in place.
panning_framing_camera_modifier<native><epic_internal> := class<concrete>(base_framing_camera_modifier):
    @experimental
    @replicated("")
    # Whether the camera can rotate laterally (yaw).
    CanYaw<native><public>:logic = external {}

    @experimental
    @replicated("")
    # Whether the camera can rotate vertically (pitch).
    CanPitch<native><public>:logic = external {}

@available {MinUploadedAtFNVersion := 4110}
@experimental
@hide_in_editor
perspective_camera_component_impl_modifier<native><epic_internal> := class<final>(camera_component_impl_modifier):
    NativeEvaluate<override><native>(InValue:camera_state)<reads>:camera_state

@available {MinUploadedAtFNVersion := 4110}
@experimental
# Simple perspective camera.
perspective_camera_component<native><public> := class<final_super>(camera_component):
    @editable
    @replicated("")
    @experimental
    @units("Radians")
    # Horizontal field of view in radians, specified for an aspect ratio of 16:9 /nThis is then to calculate an effective horizontal field of view for the display’s real aspect ratio /nIf for example the screen is an ultrawide (21:9, or 32:9 being common ultrawide aspect ratios) then in practice the actual field of view will be wider. This is known as the Hor+ view scaling method and is generally accepted to be the best solution for ultrawide displays.
    var FieldOfView<native><public>:float = external {}

@available {MinUploadedAtFNVersion := 4110}
@experimental
@hide_in_editor
physical_camera_component_impl_modifier<native><epic_internal> := class<final>(camera_component_impl_modifier):
    NativeEvaluate<override><native>(InValue:camera_state)<reads>:camera_state

@available {MinUploadedAtFNVersion := 4110}
@experimental
# Camera that is physically based, determining its view properties in a manner more consistent with a physical camera
physical_camera_component<native><public> := class<final_super>(camera_component):
    OnInitializedInternal<native><override>():void

    OnUninitializingInternal<native><override>():void

    @experimental
    # Camera’s body settings.
    #  This contains sensor settings, e.g. film or digital camera sensor, shutter speed, etc
    var Body<public>:camera_body = external {}

    @experimental
    # Lens of the camera
    var Lens<public>:camera_lens = external {}

@available {MinUploadedAtFNVersion := 4300}
@experimental
@hide_in_editor
# Camera modifier that sets the camera's rotation, replacing whatever the camera state arrived with rather than offsetting it. The rotation is always in world space.
set_rotation_camera_modifier<native><epic_internal> := class<concrete>(camera_modifier):
    @experimental
    @replicated("")
    # The world-space rotation to set on the camera.
    var Rotation<native><public>:(/Verse.org/SpatialMath:)rotation = external {}

@available {MinUploadedAtFNVersion := 4300}
@experimental
@hide_in_editor
# Camera modifier that sets the camera's translation, replacing whatever the camera state arrived with rather than offsetting it. The translation is always in world space.
set_translation_camera_modifier<native><epic_internal> := class<concrete>(camera_modifier):
    @experimental
    @replicated("")
    # The world-space translation to set on the camera.
    var Translation<native><public>:(/Verse.org/SpatialMath:)vector3 = external {}

@available {MinUploadedAtFNVersion := 4300}
@experimental
@replicatable
# A target entity paired with the weight it contributes to a framing calculation.
weighted_target_entity<native><epic_internal> := struct<concrete>:
    @editable
    Entity<native><public>:entity = external {}

    @editable
    Weight<native><public>:float = external {}