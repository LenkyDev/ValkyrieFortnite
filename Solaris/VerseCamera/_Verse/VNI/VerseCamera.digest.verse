# Verse path: /Verse.org/SceneGraph
using {/Verse.org/SpatialMath}
using {/Verse.org/Simulation}
using {/Verse.org/Native}
@available {MinUploadedAtFNVersion := 4110}
@experimental
# Camera body settings, e.g. sensor/film settings, shutter speed, etc
camera_body<native><public> := class<computes>:
    # Width of camera sensor in millimeters.
    SensorWidthMillimeters<native><public>:float = external {}

    # Height of camera sensor in millimeters.
    SensorHeightMillimeters<native><public>:float = external {}

    # Horizontal offset of camera sensor.
    SensorHorizontalOffsetMillimeters<native><public>:float = external {}

    # Vertical offset of camera sensor.
    SensorVerticalOffsetMillimeters<native><public>:float = external {}

    # The camera sensor sensitivity to light.
    ISO<native><public>:float = external {}

    # Camera shutter speed.
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
    # Optionally override the near clipping plane distance. If value is <= 0.0 then use the default settings
    var NearClippingPlaneDistance<native><public>:float = external {}

    @editable
    @experimental
    # Optionally override the far clipping plane distance. If value is Inf then use the default settings
    var FarClippingPlaneDistance<native><public>:float = external {}

    @experimental
    # Get transition to use when exiting this camera mode to transition to the destination camera mode
    GetExitTransition<native_callable><public>(DestinationCamera:camera_component)<transacts><decides>:camera_transition = external {}

    @experimental
    # Get transition to use when entering this camera mode to transition to the specified camera mode
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

    # Add a camera to the director. The camera with the highest priority will be chosen to be the active camera
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
    # Returns a camera_state which is the input evaluated against each modifier in the stack, executed in position order.
    Evaluate<native><override>(InValue:camera_state)<reads>:camera_state

@available {MinUploadedAtFNVersion := 4110}
@experimental
# Base class for objects that can modify camera state. 
# You can also implement the modifier(camera_state) interface directly, but camera_modifier provides an convenient, overridable Tick function for modifiers that need to maintain state (since Evaluate is <reads>).
camera_modifier<native><public> := class(modifier(camera_state)):
    Evaluate<override><native_callable>(InValue:camera_state)<reads>:camera_state = external {}

@available {MinUploadedAtFNVersion := 4110}
@experimental
camera_projection_mode<native><public> := enum<open>:
    Perspective
    Orthographic

@available {MinUploadedAtFNVersion := 4110}
@experimental
camera_state<native><public> := class<final><computes>:
    @experimental
    # Render location of the camera. This render location can be modified by camera directions (like camera shakes), without modifying the physical location of any camera entity
    RenderLocation<native><public>:(/Verse.org/SpatialMath:)vector3

    @experimental
    # Render rotation of the camera. This render rotation can be modified by camera directions (like camera shakes), without modifying the physical location of any camera entity
    RenderRotation<native><public>:(/Verse.org/SpatialMath:)rotation

    @experimental
    # Determines how wide the camera projects in orthographic mode, in centimeters - Used only if projection mode is orthographic
    OrthographicProjectionWidth<native><public>:float = external {}

    @experimental
    # Physical camera body settings
    Body<native><public>:camera_body = external {}

    @experimental
    # Physical camera lens settings
    Lens<native><public>:camera_lens = external {}

    @experimental
    # Projection mode - perspective or orthographic
    ProjectionMode<native><public>:camera_projection_mode = external {}

    @experimental
    # How much to apply physical camera settings between 0.0 and 1.0
    PhysicalCameraWeight<native><public>:float = external {}

    @experimental
    NearClippingPlaneDistance<native><public>:float = external {}

    @experimental
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
    Blend<native><public>:camera_mode_blend = external {}

    @editable
    # Sets the duration of the camera transition
    Duration<native><public>:float = external {}

@available {MinUploadedAtFNVersion := 4110}
@experimental
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
    # Horizontal field of view in radians, specified for an aspect ratio of 16:9 /nThis is then to calculate an effective horizontal field of view for the display’s real aspect ratio /nIf for example the screen is an ultrawide (21:9, or 32:9 being common ultrawide aspect ratios) then in practice the actual field of view will be wider. This is known as the Hor+ view scaling method and is generally accepted to be the best solution for ultrawide displays.
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