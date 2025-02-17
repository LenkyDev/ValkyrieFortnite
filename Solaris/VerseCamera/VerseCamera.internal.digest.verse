using {/UnrealEngine.com/Temporary/SpatialMath}
using {/Verse.org/Simulation/Tags}
using {/Verse.org/Native}
using {/Verse.org/Simulation}
using {/UnrealEngine.com/EpicGamesRestricted/Network}
using {/Verse.org/Assets}
# Module import path: /UnrealEngine.com/Temporary/SceneGraph/VerseCamera
VerseCamera<public> := module:
    @experimental
    # Component that owns higher level camera behavior. 
    # Owns a CameraDirector, which is responsible for selecting the best camera mode every update.
    # Owns a default EvaluationContext, which is responsible for setting the default camera transform, before camera logic is applied
    camera_behavior_component<native><epic_internal> := class<final_super>(component):
        OnAddedToSceneInternal<native><override>():void

        OnBeginSimulationInternal<native><override>():void

        OnEndSimulationInternal<native><override>():void

        @experimental
        # Responsible for deciding which camera modes should be active on each layer
        var CameraDirector<public>:camera_director = external {}

        @replicated("")
        @experimental
        # Parameters that can be used as input to all camera modes being run by this camera behavior component
        var<private> CameraParameters<native><epic_internal>:[]parameterized_parameter_collection = external {}

        # Get camera parameters for a specific player
        GetCameraParametersForPlayer<native><epic_internal>(Player:player)<transacts><decides>:[]parameterized_parameter_collection

    @experimental
    # Represents the physical body, lens of the camera and other cinematographic qualities, such as sensor size, aspect ratio lock/constraint, focal length, focus distance, post-process settings, etc.
    camera_component<native><epic_internal> := class(basic_camera_component):


    @experimental
    # A camera mode, camera component pair used to give all the context required to execute a camera mode
    camera_mode_context<native><epic_internal> := struct:
        # Camera mode this camera mode context refers to
        CameraMode<native><public>:camera_mode

        # Camera component this camera mode should run on
        CameraComponent<native><public>:camera_component

    @import_as("/Script/VerseCamera.UVerseCameraDirectorBase")
    @experimental
    camera_director_base<native><epic_internal> := class:


    @experimental
    # Base class for Camera Directors defined in Verse
    camera_director<native><epic_internal> := class(camera_director_base):
        @experimental
        # Determine which camera mode should be active
        DetermineActiveCameraModes<native_callable><public>():[]camera_mode_context = external {}

        @experimental
        # Add a camera component to the list for consideration
        AddCameraMode<native><public>(CameraModeContext:camera_mode_context):void

        @experimental
        # Remove a camera component from the list for consideration
        RemoveCameraMode<native><public>(CameraModeContext:camera_mode_context):void

    @experimental
    # Camera director that returns the camera mode with the highest priority every update
    camera_director_priority_list<native><epic_internal> := class<final>(camera_director):
        # Determine which camera mode should be active
        DetermineActiveCameraModes<native><override>():[]camera_mode_context

    @experimental
    verse_camera_mode_tag<native><epic_internal> := class(tag):


    @import_as("/Script/VerseCamera.UVerseCameraMode")
    @experimental
    camera_mode_base<native><epic_internal> := class<abstract>:


    @experimental
    # A camera mode builds up a camera transform piece by piece by executing a camera rig asset
    camera_mode<native><epic_internal> := class<concrete>:
        @experimental
        GetCameraModeTag<native><public>()<transacts><decides>:verse_camera_mode_tag

        @editable
        @display_name("CameraRigAsset")
        @replicated("")
        @experimental
        CameraRigAsset<native><epic_internal>:camera_rig_asset = external {}

        @replicated("")
        @editable
        @experimental
        # Root camera operation - This is mutually exclusive with CameraRigAsset and is intended to allow you to build up your camera mode entirely in Verse without referencing any external assets
        RootCameraOperation<native><epic_internal>:?camera_operation = external {}

        @experimental
        @editable
        # Transitions to use when entering this camera mode. Controls how this camera mode blends when blending in.  Enter transitions on this camera mode will be favoured over the outgoing camera mode's exit transition, unless the exit transition has a higher priority.  The camera mode will use the first transition it finds in this array that succeeds.
        EnterTransitions<native><public>:[]camera_mode_transition = external {}

        @experimental
        @editable
        # Transitions to use when exiting this camera mode. Controls how this camera mode blends when blending out  Enter transitions from the camera mode we're transitioning to will be favoured over the this camera mode's exit transition, unless the exit transition has a higher priority.  The camera mode will use the first transition it finds in this array that succeeds.
        ExitTransitions<native><public>:[]camera_mode_transition = external {}

        @experimental
        # Priority level that can be used by camera directors to determine the best camera mode
        var Priority<public>:float = external {}

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


    @experimental
    # Controls how a camera mode transitions to another
    camera_mode_transition<native><epic_internal> := class<concrete>:
        @editable
        # Priority of this transition. System will default to using enter transition from new camera mode. This priority can be set to force the exit transition of the outgoing camera mode to be chosen
        Priority<native><public>:?float = external {}

        @editable
        # Blend settings for this transition
        Blend<native><public>:camera_mode_blend = external {}

        # Transition will be taken if this function succeeds
        CanTransition<native_callable><public>(SourceCameraMode:camera_mode, DestinationCameraMode:camera_mode)<transacts><decides>:void = external {}

    @experimental
    # Transition that will only be chosen if the CameraModeTag of the source and destination camera modes match the specified tag query
    camera_mode_transition_if_tags_match<native><epic_internal> := class<concrete>(camera_mode_transition):
        # Source camera mode's tag must pass this search criteria
        SourceCameraModeTags<native><public>:tag_search_criteria = external {}

        # Destination camera mode's tag must pass this search criteria
        DestinationCameraModeTags<native><public>:tag_search_criteria = external {}

        # Transition will be taken if this function succeeds
        CanTransition<native><override>(SourceCameraMode:camera_mode, DestinationCameraMode:camera_mode)<transacts><decides>:void

    @experimental
    # Camera operation initialization parameters
    camera_operation_initialization_parameters<native><epic_internal> := class<final>:


    @experimental
    # Input params to a camera operation
    camera_operation_input_parameters<native><epic_internal> := class<final>:
        @experimental
        # Camera behavior component that this camera_mode is running in
        var CameraBehaviorComponent<native><public>:?camera_behavior_component = external {}

        @experimental
        # camera_component that this camera_mode is running in
        var CameraComponent<native><public>:?camera_component = external {}

        @experimental
        # Camera location from the initial evaluator execution, or previous operation if an operation modified it before this one
        var CameraLocation<native><public>:vector3 = external {}

        @experimental
        # Camera rotation from the initial evaluator execution,  or previous operation if an operation modified it before this one
        var CameraRotation<native><public>:rotation = external {}

        @experimental
        # Delta time since last update
        var DeltaTime<native><public>:float = external {}

        @experimental
        # Get the value of a camera parameter
        GetCameraParameterValue<native><epic_internal>(Parameter:camera_parameter_logic)<transacts><decides>:void

        @experimental
        GetCameraParameterValue<native><epic_internal>(Parameter:camera_parameter_float)<transacts><decides>:float

        @experimental
        GetCameraParameterValue<native><epic_internal>(Parameter:camera_parameter_integer)<transacts><decides>:int

        @experimental
        GetCameraParameterValue<native><epic_internal>(Parameter:camera_parameter_vector2)<transacts><decides>:vector2

        @experimental
        GetCameraParameterValue<native><epic_internal>(Parameter:camera_parameter_vector3)<transacts><decides>:vector3

        @experimental
        GetCameraParameterValue<native><epic_internal>(Parameter:camera_parameter_rotation)<transacts><decides>:rotation

        @experimental
        GetCameraParameterValue<native><epic_internal>(Parameter:camera_parameter_transform)<transacts><decides>:transform

    @experimental
    # Output params to a camera operation
    camera_operation_output_parameters<native><epic_internal> := class<final>(camera_output_parameters):


    @import_as("/Script/VerseCamera.UVerseCameraNode")
    @experimental
    camera_operation_base<native><epic_internal> := class<abstract>:


    @experimental
    # A camera operation is a primitive operation that is used to build up a camera transform piece by piece
    camera_operation<native><epic_internal> := class<concrete><unique>(camera_operation_base):
        @experimental
        # Called when the camera mode is initialized
        Initialize<native_callable><public>(InitParams:camera_operation_initialization_parameters)<transacts><decides>:void = external {}

        @experimental
        # Called by the camera mode to build up the camera settings
        Update<native_callable><public>(InputParams:camera_operation_input_parameters, OutputParams:camera_operation_output_parameters):void = external {}

    @experimental
    camera_parameter_logic<native><epic_internal> := class:
        @editable
        @experimental
        Value<native><public>:logic = external {}

        @editable
        @experimental
        Variable<native><public>:camera_variable_logic = external {}

    @experimental
    camera_parameter_float<native><epic_internal> := class:
        @editable
        @experimental
        Value<native><public>:float = external {}

        @editable
        @experimental
        Variable<native><public>:camera_variable_float = external {}

    @experimental
    camera_parameter_integer<native><epic_internal> := class:
        @editable
        @experimental
        Value<native><public>:int = external {}

        @editable
        @experimental
        Variable<native><public>:camera_variable_integer = external {}

    @experimental
    camera_parameter_vector2<native><epic_internal> := class:
        @editable
        @experimental
        Value<native><public>:vector2 = external {}

        @editable
        @experimental
        Variable<native><public>:camera_variable_vector2 = external {}

    @experimental
    camera_parameter_vector3<native><epic_internal> := class:
        @editable
        @experimental
        Value<native><public>:vector3 = external {}

        @editable
        @experimental
        Variable<native><public>:camera_variable_vector3 = external {}

    @experimental
    camera_parameter_rotation<native><epic_internal> := class:
        @editable
        @experimental
        Value<native><public>:rotation = external {}

        @editable
        @experimental
        Variable<native><public>:camera_variable_rotation = external {}

    @experimental
    camera_parameter_transform<native><epic_internal> := class:
        @editable
        @experimental
        Value<native><public>:transform = external {}

        @editable
        @experimental
        Variable<native><public>:camera_variable_transform = external {}

    @experimental
    camera_output_parameters<native><epic_internal> := class:
        @experimental
        # If written to, will set the camera location
        var CameraLocation<native><public>:?vector3 = external {}

        @experimental
        # If written to, will set the camera rotation
        var CameraRotation<native><public>:?rotation = external {}

        @experimental
        # If written to, will set the camera field of view
        var CameraFieldOfViewDegrees<native><public>:?float = external {}

        @experimental
        # Set a camera variable value
        SetCameraVariable<native><epic_internal>(CameraVariable:camera_variable_logic, Value:logic)<transacts><decides>:void

        @experimental
        SetCameraVariable<native><epic_internal>(CameraVariable:camera_variable_float, Value:float)<transacts><decides>:void

        @experimental
        SetCameraVariable<native><epic_internal>(CameraVariable:camera_variable_integer, Value:int)<transacts><decides>:void

        @experimental
        SetCameraVariable<native><epic_internal>(CameraVariable:camera_variable_vector2, Value:vector2)<transacts><decides>:void

        @experimental
        SetCameraVariable<native><epic_internal>(CameraVariable:camera_variable_vector3, Value:vector3)<transacts><decides>:void

        @experimental
        SetCameraVariable<native><epic_internal>(CameraVariable:camera_variable_rotation, Value:rotation)<transacts><decides>:void

        @experimental
        SetCameraVariable<native><epic_internal>(CameraVariable:camera_variable_transform, Value:transform)<transacts><decides>:void

        Reset_Internal<native><epic_internal>():void

    @import_as("/Script/VerseCamera.UVersePlayerCameraViewComponent")
    @experimental
    player_camera_view_base<native><epic_internal> := class<abstract>:


    @experimental
    # Component used to associate a camera behavior component with a player
    player_camera_view<native><epic_internal> := class(player_camera_view_base):
