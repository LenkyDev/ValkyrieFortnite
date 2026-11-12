# Verse path: /Verse.org/SceneGraph
using {/Verse.org/SpatialMath}
using {/Verse.org/Simulation}
using {/Verse.org/Native}
@available {MinUploadedAtFNVersion := 4110}
@experimental
# Camera body settings, e.g. sensor/film settings, shutter speed, etc.
camera_body<native><public> := class<computes>:
    # Width of camera sensor in millimeters.
    SensorWidthMillimeters<native><public>:float = external {}

    # Height of camera sensor in millimeters.
    SensorHeightMillimeters<native><public>:float = external {}

    # Horizontal offset of camera sensor.
    SensorHorizontalOffsetMillimeters<native><public>:float = external {}

    # Vertical offset of camera sensor.
    SensorVerticalOffsetMillimeters<native><public>:float = external {}

    # The camera sensor sensitivity to light (ISO value, unitless).
    ISO<native><public>:float = external {}

    # Camera shutter speed, in seconds.
    ShutterSpeed<native><public>:float = external {}

@available {MinUploadedAtFNVersion := 4110}
@experimental
# Constructor that clones an existing camera_body. Useful for writing camera modifiers as it makes it easier to create a camera_body that is a copy of another with some values modified.
CloneCameraBody<constructor><public>(CameraBody:camera_body)<computes>:camera_body = external {}

@available {MinUploadedAtFNVersion := 4110}
@experimental
# Represents the physical body, lens of the camera and other cinematographic qualities, such as sensor size, aspect ratio lock/constraint, focal length, focus distance, post-process settings, etc.
camera_component<native><public> := class<final_super><abstract>(component):
    @editable
    @experimental
    # Camera modifiers allow the behavior of a camera to be modified with custom logic.
    # A camera modifier has an Evaluate function that takes in the current state of the camera (taking into account all previously executed modifiers) and returns the desired output camera state
    CameraModifiers<native><public>:modifier_stack(camera_state) = external {}

    @editable
    @experimental
    # Optionally override the near clipping plane distance, in centimeters. If value is <= `0.0` then use the default settings.
    var NearClippingPlaneDistance<native><public>:float = external {}

    @editable
    @experimental
    # Optionally override the far clipping plane distance, in centimeters. If value is `Inf` then use the default settings.
    var FarClippingPlaneDistance<native><public>:float = external {}

    @experimental
    # Get transition to use when exiting this camera mode to transition to `DestinationCamera`. `GetExitTransition` of the outgoing `camera_component` will always take precedence over the `GetEnterTransition` of the incoming `camera_component`.
    # Fails if this camera does not provide an exit transition, in which case the transition returned by `GetEnterTransition` of the incoming `camera_component` is used.
    # The default implementation always fails, which is expected to be the most typical use case. Override this function to successfully return a `camera_transition` if you want to explicitly control how this camera transitions out to another.
    GetExitTransition<native_callable><public>(DestinationCamera:camera_component)<transacts><decides>:camera_transition = external {}

    @experimental
    # Get transition to use when entering this camera mode from `SourceCamera`. Only used if `GetExitTransition` of `SourceCamera` fails.
    # Fails if this camera does not provide an enter transition, in which case the camera system instantly transitions to this `camera_component` without a blend.
    # The default implementation never fails, and returns a `camera_transition` with a quick linear blend.
    GetEnterTransition<native_callable><public>(SourceCamera:camera_component)<transacts><decides>:camera_transition = external {}

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
    @experimental
    @available {MinUploadedAtFNVersion := 4230}
    # Modifier stack containing modifiers that should run on the Pre-Camera layer before any camera_components are evaluated.
    # Useful for setting default values that you want to be shared by the entire camera system.
    PreCameraModifiers<native><public>:modifier_stack(camera_state) = external {}

    @editable
    @experimental
    @available {MinUploadedAtFNVersion := 4230}
    # Modifier stack containing modifiers that should run after the Pre-Camera and Main layers (the active camera_component) have been evaluated.
    # In the case where we are blending between cameras, the Post Camera modifiers will run on the blended output state after all blending cameras have been evaluated.
    # The Post Camera layer is useful for modifiers that you don't want to run multiple times when blending. Such as collision detection, or weapon recoil.
    PostCameraModifiers<native><public>:modifier_stack(camera_state) = external {}

    @editable
    @experimental
    @available {MinUploadedAtFNVersion := 4230}
    # Modifier stack containing modifiers that should run after the Pre-Camera, Main and Post-Camera layers.
    # The Presentation layer is intended to be used for purely cosmetic effects like camera shake. In future the intention is that you can use the PostCameraModifiers layer to define the "Gameplay" state of the camera system (for uses like aiming and character movement).
    # Purely cosmetic effects that you don't want to affect the player's aim or movement direction can live in the Presentation layer.
    PresentationCameraModifiers<native><public>:modifier_stack(camera_state) = external {}

    # Add a camera to the director. The camera with the highest priority will be chosen to be the active camera.
    # Fails if:
    #  * `Camera` is not added to an entity.
    #  * The entity `Camera` is attached to is not in the scene.
    #  * Adding `Camera` would (directly or indirectly) result in this `camera_director_component` being recursively added to itself.
    # Since a `camera_director_component` is a `camera_component`, camera directors can be nested to support more complex scenarios.
    AddCamera<native><public>(Camera:camera_component, Priority:rational)<transacts><decides>:cancelable

@available {MinUploadedAtFNVersion := 4110}
@experimental
# Camera lens settings
camera_lens<native><public> := class<computes>:
    # Focal length of the lens in millimeters.
    FocalLengthMillimeters<native><public>:float = external {}

    # Aperture of the lens in FStop.
    FStop<native><public>:float = external {}

    # Squeeze factor for anamorphic lenses.
    SqueezeFactor<native><public>:float = external {}

    # Number of blades of diaphragm.
    BladeCount<native><public>:int = external {}

@available {MinUploadedAtFNVersion := 4110}
@experimental
# Constructor that clones an existing camera_lens. Useful for writing camera modifiers as it makes it easier to create a camera_lens that is a copy of another with some values modified.
CloneCameraLens<constructor><public>(CameraLens:camera_lens)<computes>:camera_lens = external {}

@available {MinUploadedAtFNVersion := 4110}
@experimental
# Modifier stack for camera state.
camera_modifier_stack<native><public> := class(modifier_stack(camera_state)):
    # Returns a camera_state which is the input evaluated against each modifier in the stack, executed in stack order.
    Evaluate<native><override>(InValue:camera_state)<reads>:camera_state

@available {MinUploadedAtFNVersion := 4110}
@experimental
# Base class for objects that can modify the output state of a camera.
camera_modifier<native><public> := class(modifier(camera_state)):
    Evaluate<override><native_callable>(InValue:camera_state)<reads>:camera_state = external {}

@available {MinUploadedAtFNVersion := 4110}
@experimental
# Describes the projection mode of a camera: Perspective, or Orthographic.
camera_projection_mode<native><public> := enum<open>:
    # Perspective projection, where objects further from the camera appear smaller. Field of view is controlled by `perspective_camera_component.FieldOfView`.
    Perspective
    # Orthographic projection, where objects appear the same size regardless of their distance from the camera. Visible width is controlled by `orthographic_camera_component.OrthographicProjectionWidth`.
    Orthographic

@available {MinUploadedAtFNVersion := 4110}
@experimental
# Represents the entire state of a camera. It is used by the camera modifier API to allow modification of the output state of a camera.
camera_state<native><public> := class<final><computes>:
    @experimental
    # Render location of the camera. This render location can be modified by camera directions (like camera shakes), without modifying the physical location of any camera entity.
    RenderLocation<native><public>:(/Verse.org/SpatialMath:)vector3

    @experimental
    # Render rotation of the camera. This render rotation can be modified by camera directions (like camera shakes), without modifying the physical location of any camera entity.
    RenderRotation<native><public>:(/Verse.org/SpatialMath:)rotation

    @experimental
    # Determines how wide the camera projects in orthographic mode, in centimeters - Used only if projection mode is orthographic.
    OrthographicProjectionWidth<native><public>:float = external {}

    @experimental
    # Physical camera body settings.
    Body<native><public>:camera_body = external {}

    @experimental
    # Physical camera lens settings.
    Lens<native><public>:camera_lens = external {}

    @experimental
    # Projection mode - perspective or orthographic.
    ProjectionMode<native><public>:camera_projection_mode = external {}

    @experimental
    # How much to apply physical camera settings, from `0.0` (not applied) to `1.0` (fully applied). Values outside this range are clamped.
    PhysicalCameraWeight<native><public>:float = external {}

    @experimental
    # Near clipping plane distance override, in centimeters. If value is <= `0.0` then use the default settings.
    NearClippingPlaneDistance<native><public>:float = external {}

    @experimental
    # Far clipping plane distance override, in centimeters. If value is `Inf` then use the default settings.
    FarClippingPlaneDistance<native><public>:float = external {}

@available {MinUploadedAtFNVersion := 4110}
@experimental
# Constructor that clones an existing camera_state. Useful for writing camera modifiers as it makes it easier to create a camera_state that is a copy of another with some values modified.
CloneCameraState<constructor><public>(CameraState:camera_state)<computes>:camera_state = external {}

@available {MinUploadedAtFNVersion := 4110}
@experimental
# Controls the initial orientation of the incoming camera when a `camera_transition` starts.
camera_transition_initial_orientation<native><public> := enum<open>:
    # Orient the incoming camera in the same direction as the outgoing camera.
    PreviousYawPitch
    # Make the incoming camera point at the same target as the outgoing camera's target on its last frame.
    PreviousAbsoluteTarget
    # Make the incoming camera point at the outgoing camera's target on its last frame, offset by how much the camera's context has moved and turned since that frame.
    PreviousRelativeTarget

@available {MinUploadedAtFNVersion := 4110}
@experimental
# Controls how a camera mode transitions to another.
camera_transition<native><public> := class<concrete>:
    @editable
    # Controls how the camera transition blends between the outgoing camera and incoming camera.
    Blend<native><public>:camera_mode_blend = external {}

    @editable
    # Sets the duration of the camera transition, in seconds.
    Duration<native><public>:float = external {}

@available {MinUploadedAtFNVersion := 4110}
@experimental
# Configurable blend between two camera modes.
camera_mode_blend<native><public> := class<concrete>:


@available {MinUploadedAtFNVersion := 4110}
@experimental
# Instantly snap to target mode.
camera_mode_blend_pop<native><public> := class<concrete>(camera_mode_blend):


@available {MinUploadedAtFNVersion := 4110}
@experimental
# Linear blend between camera modes.
camera_mode_blend_linear<native><public> := class<concrete>(camera_mode_blend):


@available {MinUploadedAtFNVersion := 4110}
@experimental
# Camera mode blend that uses the smoothstep function to blend between the two camera modes.
camera_mode_blend_smoothstep<native><public> := class<concrete>(camera_mode_blend):


@available {MinUploadedAtFNVersion := 4110}
@experimental
# Camera mode blend that uses the smootherstep function to blend between the two camera modes.
camera_mode_blend_smootherstep<native><public> := class<concrete>(camera_mode_blend):


@available {MinUploadedAtFNVersion := 4110}
@experimental
# Camera mode blend that attempts to orbit around the camera's pivot point.
camera_mode_blend_orbit<native><public> := class<concrete>(camera_mode_blend):
    # The underlying blend used by the orbit blend. This controls how the interpolation is performed during the orbit blend.
    DrivingBlend<native><public>:camera_mode_blend = external {}

@available {MinUploadedAtFNVersion := 4110}
@experimental
# Simple orthographic camera.
orthographic_camera_component<native><public> := class<final_super>(camera_component):
    @editable
    @experimental
    # Determines how wide the camera projects in orthographic mode, in centimeters
    var OrthographicProjectionWidth<native><public>:float = external {}

@available {MinUploadedAtFNVersion := 4110}
@experimental
# Simple perspective camera.
perspective_camera_component<native><public> := class<final_super>(camera_component):
    @editable
    @experimental
    # Horizontal field of view in radians, specified for an aspect ratio of 16:9. This is then used to calculate an effective horizontal field of view for the display’s real aspect ratio. 
    # If for example the screen is an ultrawide (21:9, or 32:9 being common ultrawide aspect ratios), then in practice the actual horizontal field of view will be wider. 
    # This is known as the Hor+ view scaling method and is generally accepted to be the best solution for ultrawide displays.
    var FieldOfView<native><public>:float = external {}

@available {MinUploadedAtFNVersion := 4110}
@experimental
# Camera that is physically based, determining its view properties in a manner more consistent with a physical camera
physical_camera_component<native><public> := class<final_super>(camera_component):
    @experimental
    # Camera’s body settings.
    #  This contains sensor settings, e.g. film or digital camera sensor, shutter speed, etc
    var Body<public>:camera_body = external {}

    @experimental
    # Lens of the camera
    var Lens<public>:camera_lens = external {}