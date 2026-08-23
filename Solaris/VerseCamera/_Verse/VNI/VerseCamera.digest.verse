# Verse path: /Verse.org/SceneGraph
using {/Verse.org/SpatialMath}
using {/Verse.org/Simulation}
using {/Verse.org/Native}
@available {MinUploadedAtFNVersion := 4110}
@experimental
# Camera body settings, e.g. sensor/film settings, shutter speed, etc
camera_body<final><native><public> := class<computes>:
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
# Represents the physical body, lens of the camera and other cinematographic qualities, such as sensor size, aspect ratio lock/constraint, focal length, focus distance, post-process settings, etc.
camera_component<native><public> := class<final_super><abstract>(component, has_camera_modifier):
    @editable
    @experimental
    # Optionally override the near clipping plane distance. If value is <= 0.0 then use the default settings
    var NearClippingPlaneDistance<native><public>:float = external {}

    @editable
    @experimental
    # Optionally override the far clipping plane distance. If value is Inf then use the default settings
    var FarClippingPlaneDistance<native><public>:float = external {}

@available {MinUploadedAtFNVersion := 4110}
GlobalModifierPosition<public>:rational = external {}

@available {MinUploadedAtFNVersion := 4110}
VisualModifierPosition<public>:rational = external {}

@available {MinUploadedAtFNVersion := 4110}
@experimental
# Responsible for selecting a camera and blending when the active camera changes. 
# Also allows global settings to be shared between different cameras (such as post process settings) and modifications to the final blended camera state, such as camera shakes
camera_director_component<native><public> := class<final_super>(camera_component):
    # Add a camera to the director. The camera with the highest priority will be chosen to be the active camera
    AddCamera<native><public>(Camera:camera_component, Priority:rational)<transacts><decides>:cancelable

@available {MinUploadedAtFNVersion := 4110}
@experimental
# Camera lens settings
camera_lens<final><native><public> := class<computes>:
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
# Modifier stack for camera state.
camera_modifier_stack<native><public> := class(modifier_stack(camera_state)):
    # Returns a camera_state which is the input evaluated against each modifier in the stack, executed in position order.
    Evaluate<native><override>(InValue:camera_state)<reads>:camera_state

@available {MinUploadedAtFNVersion := 4110}
@experimental
# Interface for classes that own a camera modifier stack.
has_camera_modifier<native><public> := interface:
    @editable
    @experimental
    CameraModifiers<public>:modifier_stack(camera_state) = external {}

@available {MinUploadedAtFNVersion := 4110}
@experimental
# Base class for objects that can modify camera state.
camera_modifier<native><public> := class(modifier(camera_state)):
    Evaluate<override><native_callable>(InValue:camera_state)<reads>:camera_state = external {}

@available {MinUploadedAtFNVersion := 4110}
@experimental
camera_projection_mode<native><public> := enum<open>:
    Perspective
    Orthographic

@available {MinUploadedAtFNVersion := 4110}
@experimental
camera_state<final><native><public> := class<computes><epic_internal>:
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
    # Horizontal field of view in degrees, specified for an aspect ratio of 16:9 /nThis is then to calculate an effective horizontal field of view for the display’s real aspect ratio /nIf for example the screen is an ultrawide (21:9, or 32:9 being common ultrawide aspect ratios) then in practice the actual field of view will be wider. This is known as the Hor+ view scaling method and is generally accepted to be the best solution for ultrawide displays.
    var FieldOfViewDegrees<native><public>:float = external {}

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