using {/Verse.org/SpatialMath}
using {/Verse.org/Native}
using {/Verse.org/Simulation/Tags}
using {/Verse.org/Assets}
using {/Verse.org/Temporary/EpicGamesRestricted/Network}
using {/Verse.org/Simulation}
# Module import path: /Verse.org/SceneGraph/VerseCamera
VerseCamera<public> := module:
    @experimental
    # Camera body settings, e.g. sensor/film settings, shutter speed, etc
    camera_body<native><epic_internal> := class:
        @editable
        @replicated("")
        @experimental
        # Width of camera sensor in millimeters.
        var SensorWidthMillimeters<native><public>:float = external {}

        @editable
        @replicated("")
        @experimental
        # Height of camera sensor in millimeters.
        var SensorHeightMillimeters<native><public>:float = external {}

        @editable
        @replicated("")
        @experimental
        # Horizontal offset of camera sensor.
        var SensorHorizontalOffsetMillimeters<native><public>:float = external {}

        @editable
        @replicated("")
        @experimental
        # Vertical offset of camera sensor.
        var SensorVerticalOffsetMillimeters<native><public>:float = external {}

        @editable
        @replicated("")
        @experimental
        # The camera sensor sensitivity to light.
        var ISO<native><public>:float = external {}

        @editable
        @replicated("")
        @experimental
        # Camera shutter speed.
        var ShutterSpeed<native><public>:float = external {}

    @experimental
    # Represents the physical body, lens of the camera and other cinematographic qualities, such as sensor size, aspect ratio lock/constraint, focal length, focus distance, post-process settings, etc.
    camera_component<native><epic_internal> := class(basic_camera_component):
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
    # Component that owns higher level camera behavior. 
    # Responsible for selecting the best camera mode every update.
    # Owns a default EvaluationContext, which is responsible for setting the default camera transform, before camera logic is applied
    camera_director_component<native><epic_internal> := class<final_super>(camera_component):
        @experimental
        # Determine which camera mode should be active
        SelectActiveCameraMode<native_callable><public>()<transacts><decides>:camera_mode = external {}

        @experimental
        # Add a camera component to the list for consideration
        AddCameraMode<native><public>(CameraMode:camera_mode):void

        @experimental
        # Remove a camera component from the list for consideration
        RemoveCameraMode<native><public>(CameraMode:camera_mode):void

        @experimental
        # Select a camera transition. Override this function to define camera transition behavior globally for the entire camera director. 
        # The default behavior is to call SourceCameraMode.GetExitTransition[DestinationCameraMode], if this function fails, then we call DestinationCameraMode.GetEnterTransition[SourceCameraMode]. If both failed then we default to an instant pop transition
        SelectCameraTransition<native_callable><public>(SourceCameraMode:camera_mode, DestinationCameraMode:camera_mode)<transacts><decides>:camera_transition = external {}

        @replicated("")
        @editable
        var<protected> CameraModes<native><public>:[]camera_mode = external {}

        @replicated("")
        @experimental
        # Parameters that can be used as input to all camera modes being run by this camera behavior component
        var<private> CameraParameters<native><epic_internal>:[]parameterized_property_interface = external {}

        # Get camera parameters for a specific player
        GetCameraParametersForPlayer<native><epic_internal>(Player:player)<transacts><decides>:[]parameterized_property_interface

    @experimental
    # Camera lens settings
    camera_lens<native><epic_internal> := class:
        @editable
        @replicated("")
        @experimental
        # Focal length of the lens in millimeters.
        var FocalLengthMillimeters<native><public>:float = external {}

        @editable
        @replicated("")
        @experimental
        # Aperture of the lens in FStop.
        var FStop<native><public>:float = external {}

        @editable
        @replicated("")
        @experimental
        # Squeeze factor for anamorphic lenses.
        var SqueezeFactor<native><public>:float = external {}

        @editable
        @replicated("")
        @experimental
        # Number of blades of diaphragm.
        var BladeCount<native><public>:int = external {}

    @experimental
    verse_camera_mode_tag<native><epic_internal> := class(tag):


    @import_as("/Script/VerseCamera.UVerseCameraMode")
    @experimental
    camera_mode_base<native><epic_internal> := class<abstract>:


    @experimental
    # A camera mode builds up a camera transform piece by piece by executing a camera rig asset
    camera_mode<native><epic_internal> := class<concrete>:
        @editable
        @experimental
        @replicated("")
        CameraModeTag<native><public>:tag_selector = external {}

        @experimental
        # Get transition to use when exiting this camera mode to transition to the destination camera mode
        GetExitTransition<native_callable><public>(DestinationCameraMode:camera_mode)<transacts><decides>:camera_transition = external {}

        @experimental
        # Get transition to use when entering this camera mode to transition to the specified camera mode
        GetEnterTransition<native_callable><public>(SourceCameraMode:camera_mode)<transacts><decides>:camera_transition = external {}

        @experimental
        GetEnterTransition_Internal<native_callable><epic_internal>(SourceCameraMode:camera_mode)<transacts><decides>:camera_transition = external {}

        @experimental
        # Update camera mode
        Update<native_callable><public>(UpdateParameters:camera_update_parameters):camera_mode_result = external {}

    @experimental
    # Get the transform of the player pawn
    (CameraMode:camera_mode).GetViewTargetTransform<native><epic_internal>(UpdateParameters:camera_update_parameters)<transacts><decides>:(/Verse.org/SpatialMath:)transform

    @experimental
    # Get the player's control rotation
    (CameraMode:camera_mode).GetControlRotation<native><epic_internal>(UpdateParameters:camera_update_parameters)<transacts><decides>:(/Verse.org/SpatialMath:)rotation

    @experimental
    # Get the transform of the player's camera bone for first person
    (CameraMode:camera_mode).GetFirstPersonCameraBoneTransform<native><epic_internal>(UpdateParameters:camera_update_parameters)<transacts><decides>:(/Verse.org/SpatialMath:)transform

    camera_projection_mode<native><epic_internal> := enum:
        Perspective
        Orthographic

    @experimental
    # Result of executing a camera mode
    camera_mode_result<native><epic_internal> := class<final>:
        @experimental
        # Output camera render location
        var CameraRenderLocation<native><public>:(/Verse.org/SpatialMath:)vector3 = external {}

        @experimental
        # Output camera render rotation
        var CameraRenderRotation<native><public>:(/Verse.org/SpatialMath:)rotation = external {}

        @experimental
        # Lens settings
        var CameraLens<native><public>:camera_lens = external {}

        @experimental
        # Lens settings
        var CameraBody<native><public>:camera_body = external {}

        @experimental
        # Camera projection mode
        var CameraProjectionMode<native><public>:camera_projection_mode = external {}

        @experimental
        # Width of orthographic projection - Only used if CameraProjectionType is Orthographic
        OrthographicProjectionWidthCentimeters<native><public>:float = external {}

    @experimental
    # Set field of view
    (Result:camera_mode_result).SetFieldOfView<native><epic_internal>(FieldOfView:float):void

    @experimental
    # Get field of view
    (Result:camera_mode_result).GetFieldOfView<native><epic_internal>():float

    @import_as("/Script/VerseCamera.UVerseCameraNode")
    @experimental
    camera_operation_base<native><epic_internal> := class<abstract>:


    @experimental
    # A camera operation is a primitive operation that is used to build up a camera transform piece by piece
    camera_operation<native><epic_internal> := class<concrete><unique>(camera_operation_base):
        @experimental
        # Called by the camera mode to build up the camera settings
        Update<native_callable><public>(UpdateParameters:camera_update_parameters):camera_mode_result = external {}

    @experimental
    # Controls how a camera mode transitions to another
    camera_transition_initial_orientation<native><epic_internal> := enum:
        PreviousYawPitch
        PreviousAbsoluteTarget
        PreviousRelativeTarget

    @experimental
    # Controls how a camera mode transitions to another
    camera_transition<native><epic_internal> := class<concrete>:
        @editable
        Blend<native><public>:camera_mode_blend = external {}

        @editable
        # Sets the duration of the camera transition
        Duration<native><public>:float = external {}

        @editable
        InitialTargetOrientation<native><epic_internal>:?camera_transition_initial_orientation = external {}

    @experimental
    @hide_in_editor
    # Configurable blend between two camera modes
    camera_mode_blend<native><epic_internal> := class<concrete>:


    @experimental
    # Instantly snap to target mode
    camera_mode_blend_pop<native><epic_internal> := class<concrete>(camera_mode_blend):


    @experimental
    # Linear blend between camera modes
    camera_mode_blend_linear<native><epic_internal> := class<concrete>(camera_mode_blend):


    @experimental
    # Camera mode blend that uses the smoothstep function to blend between the two camera modes
    camera_mode_blend_smoothstep<native><epic_internal> := class<concrete>(camera_mode_blend):


    @experimental
    # Camera mode blend that uses the smootherstep function to blend between the two camera modes
    camera_mode_blend_smootherstep<native><epic_internal> := class<concrete>(camera_mode_blend):


    @experimental
    # Configurable blend between two camera modes
    camera_mode_blend_orbit<native><epic_internal> := class<concrete>(camera_mode_blend):
        DrivingBlend<native><public>:camera_mode_blend = external {}

    @experimental
    # Input parameters to a camera mode update
    camera_update_parameters<native><epic_internal> := class<final>:
        @experimental
        # Camera director component that this camera_mode is running in
        var<private> CameraDirectorComponent<native><public>:camera_director_component

        @experimental
        # Player that the camera director is active for (if any)
        var<private> Player<native><public>:?player = external {}

        @experimental
        # Delta time since last update
        var<private> DeltaTime<native><public>:float = external {}

        @experimental
        # Initial camera location. By default this is the location of the entity with the active camera_director_component
        var<private> InitialCameraLocation<native><public>:(/Verse.org/SpatialMath:)vector3 = external {}

        @experimental
        # Initial camera rotation. By default this is the rotation of the entity with the active camera_director_component
        var<private> InitialCameraRotation<native><public>:(/Verse.org/SpatialMath:)rotation = external {}

    @experimental
    # A camera mode implemented using a native CameraRig asset
    native_camera_mode<native><epic_internal> := class<concrete>(camera_mode):
        @editable
        @display_name("CameraRig")
        @experimental
        CameraRig<native><epic_internal>:camera_rig_asset = external {}

    @experimental
    # Simple orthographic camera.
    orthographic_camera_component<native><epic_internal> := class<final_super>(camera_component):
        @editable
        @replicated("")
        @experimental
        # Determines how wide the camera projects in orthographic mode, in centimeters
        var OrthographicProjectionWidth<native><public>:float = external {}

    @experimental
    # Simple perspective camera.
    perspective_camera_component<native><epic_internal> := class<final_super>(camera_component):
        @editable
        @replicated("")
        @experimental
        # Horizontal field of view in degrees, specified for an aspect ratio of 16:9 /nThis is then to calculate an effective horizontal field of view for the displayâs real aspect ratio /nIf for example the screen is an ultrawide (21:9, or 32:9 being common ultrawide aspect ratios) then in practice the actual field of view will be wider. This is known as the Hor+ view scaling method and is generally accepted to be the best solution for ultrawide displays.
        var FieldOfViewDegrees<native><public>:float = external {}

    @experimental
    # Camera that is physically based, determining its view properties in a manner more consistent with a physical camera
    physical_camera_component<native><epic_internal> := class<final_super>(camera_component):
        @experimental
        # Cameraâs body settings.
        #  This contains sensor settings, e.g. film or digital camera sensor, shutter speed, etc
        var Body<epic_internal>:camera_body = external {}

        @experimental
        # Lens of the camera
        var Lens<epic_internal>:camera_lens = external {}

    @import_as("/Script/VerseCamera.UVersePlayerCameraViewComponent")
    @experimental
    player_camera_view_base<native><epic_internal> := class<abstract>:


    @experimental
    # Component used to associate a camera behavior component with a player
    player_camera_view<native><epic_internal> := class(player_camera_view_base):


    @experimental
    # Get the camera component currently active on the player (activated via camera_component.ActivateForPlayer)
    (Player:player).GetActiveCameraComponent<native><epic_internal>()<transacts><decides>:camera_component