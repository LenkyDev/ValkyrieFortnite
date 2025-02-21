using {/Verse.org/Native}
using {/Verse.org/SpatialMath}
using {/Verse.org/Simulation/Tags}
using {/Verse.org/Assets}
using {/Verse.org/Simulation}
using {/UnrealEngine.com/EpicGamesRestricted/Network}
# Module import path: /UnrealEngine.com/Temporary/SceneGraph/VerseCamera
VerseCamera<public> := module:
    @experimental
    # Represents the physical body, lens of the camera and other cinematographic qualities, such as sensor size, aspect ratio lock/constraint, focal length, focus distance, post-process settings, etc.
    camera_component<native><epic_internal> := class(basic_camera_component):


    @experimental
    # Component that owns higher level camera behavior. 
    # Responsible for selecting the best camera mode every update.
    # Owns a default EvaluationContext, which is responsible for setting the default camera transform, before camera logic is applied
    camera_director_component<native><epic_internal> := class<final_super>(camera_component):
        @experimental
        # Determine which camera mode should be active
        DetermineActiveCameraMode<native_callable><public>()<transacts><decides>:camera_mode = external {}

        @experimental
        # Add a camera component to the list for consideration
        AddCameraMode<native><public>(CameraMode:camera_mode):void

        @experimental
        # Remove a camera component from the list for consideration
        RemoveCameraMode<native><public>(CameraMode:camera_mode):void

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
    verse_camera_mode_tag<native><epic_internal> := class(tag):


    @experimental
    # Update params to a camera operation
    camera_update_parameters<native><epic_internal> := class<final>:
        @experimental
        # Camera director component that this camera_mode is running in
        var<private> CameraDirectorComponent<native><public>:camera_director_component

        # Player that the camera director is active for (if any)
        var<private> Player<native><public>:?player = external {}

        @experimental
        # Delta time since last update
        var<private> DeltaTime<native><public>:float = external {}

        @experimental
        # Camera location from the initial evaluator execution, or previous operation if an operation modified it before this one
        var CameraLocation<native><public>:(/Verse.org/SpatialMath:)vector3 = external {}

        @experimental
        # Camera rotation from the initial evaluator execution,  or previous operation if an operation modified it before this one
        var CameraRotation<native><public>:(/Verse.org/SpatialMath:)rotation = external {}

        @experimental
        # Field of view
        var CameraFieldOfViewDegrees<native><public>:?float = external {}

    @import_as("/Script/VerseCamera.UVerseCameraMode")
    @experimental
    camera_mode_base<native><epic_internal> := class<abstract>:


    @experimental
    # A camera mode builds up a camera transform piece by piece by executing a camera rig asset
    camera_mode<native><epic_internal> := class<concrete>:
        @experimental
        GetCameraModeTag<native><public>()<transacts><decides>:verse_camera_mode_tag

        @experimental
        # Get blend to use when exiting this camera mode to transition to the destination camera mode
        GetExitBlend<native_callable><public>(DestinationCameraMode:camera_mode)<transacts><decides>:camera_mode_blend = external {}

        @experimental
        # Get blend to use when entering this camera mode to transition to the specified camera mode
        GetEnterBlend<native_callable><public>(SourceCameraMode:camera_mode)<transacts><decides>:camera_mode_blend = external {}

        @experimental
        GetEnterBlend_Internal<native_callable><epic_internal>(SourceCameraMode:camera_mode)<transacts><decides>:camera_mode_blend = external {}

        @experimental
        # Update camera mode
        Update<native_callable><public>(UpdateParameters:camera_update_parameters):void = external {}

    @experimental
    # A camera mode implemented using a native CameraRig asset
    native_camera_mode<native><epic_internal> := class<concrete>(camera_mode):
        @editable
        @display_name("CameraRig")
        @experimental
        CameraRig<native><epic_internal>:camera_rig_asset = external {}

    @experimental
    (CameraMode:camera_mode).GetViewTargetTransform<native><epic_internal>(UpdateParameters:camera_update_parameters)<transacts><decides>:(/Verse.org/SpatialMath:)transform

    @experimental
    (CameraMode:camera_mode).GetControlRotation<native><epic_internal>(UpdateParameters:camera_update_parameters)<transacts><decides>:(/Verse.org/SpatialMath:)rotation

    @experimental
    @hide_in_editor
    # Configurable blend between two camera modes
    camera_mode_blend<native><epic_internal> := class<concrete>:


    @experimental
    # Instantly snap to target mode
    camera_mode_blend_pop<native><epic_internal> := class<concrete>(camera_mode_blend):


    @experimental
    @hide_in_editor
    # Base class for camera mode blends that have a duration
    camera_mode_blend_with_duration<native><epic_internal> := class<concrete>(camera_mode_blend):
        @editable
        # Sets the duration of the camera blend
        Duration<native><public>:float = external {}

    @experimental
    # Linear blend between camera modes
    camera_mode_blend_linear<native><epic_internal> := class<concrete>(camera_mode_blend_with_duration):


    @experimental
    # Camera mode blend that uses the smoothstep function to blend between the two camera modes
    camera_mode_blend_smoothstep<native><epic_internal> := class<concrete>(camera_mode_blend_with_duration):


    @experimental
    # Camera mode blend that uses the smootherstep function to blend between the two camera modes
    camera_mode_blend_smootherstep<native><epic_internal> := class<concrete>(camera_mode_blend_with_duration):


    @import_as("/Script/VerseCamera.UVerseCameraNode")
    @experimental
    camera_operation_base<native><epic_internal> := class<abstract>:


    @experimental
    # A camera operation is a primitive operation that is used to build up a camera transform piece by piece
    camera_operation<native><epic_internal> := class<concrete><unique>(camera_operation_base):
        @experimental
        # Called by the camera mode to build up the camera settings
        Update<native_callable><public>(UpdateParams:camera_update_parameters):void = external {}

    @import_as("/Script/VerseCamera.UVersePlayerCameraViewComponent")
    @experimental
    player_camera_view_base<native><epic_internal> := class<abstract>:


    @experimental
    # Component used to associate a camera behavior component with a player
    player_camera_view<native><epic_internal> := class(player_camera_view_base):
