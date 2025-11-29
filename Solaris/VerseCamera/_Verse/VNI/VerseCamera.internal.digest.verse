# Module import path: /Verse.org/SceneGraph/VerseCamera
VerseCamera<public> := module:
    using {/Verse.org/Native}
    using {/Verse.org/SpatialMath}
    using {/Verse.org/Assets}
    using {/Verse.org/Temporary/EpicGamesRestricted/Network}
    using {/Verse.org/Simulation}
    @experimental
    # Camera body settings, e.g. sensor/film settings, shutter speed, etc
    camera_body<native><epic_internal> := class:
        # Width of camera sensor in millimeters.
        var SensorWidthMillimeters<public>:float = external {}

        # Height of camera sensor in millimeters.
        var SensorHeightMillimeters<public>:float = external {}

        # Horizontal offset of camera sensor.
        var SensorHorizontalOffsetMillimeters<public>:float = external {}

        # Vertical offset of camera sensor.
        var SensorVerticalOffsetMillimeters<public>:float = external {}

        # The camera sensor sensitivity to light.
        var ISO<public>:float = external {}

        # Camera shutter speed.
        var ShutterSpeed<public>:float = external {}

    @experimental
    # Represents the physical body, lens of the camera and other cinematographic qualities, such as sensor size, aspect ratio lock/constraint, focal length, focus distance, post-process settings, etc.
    camera_component<native><epic_internal> := class<final_super><abstract>(component):
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
        GetExitTransition<native_callable><epic_internal>(DestinationCamera:camera_component)<transacts><decides>:camera_transition = external {}

        @experimental
        # Get transition to use when entering this camera mode to transition to the specified camera mode
        GetEnterTransition<native_callable><epic_internal>(SourceCamera:camera_component)<transacts><decides>:camera_transition = external {}

        @experimental
        GetEnterTransition_Internal<native_callable><epic_internal>(SourceCamera:camera_component)<transacts><decides>:camera_transition = external {}

    # Layer of the camera system - Allows camera operators to modify the camera state at various stages of evaluation
    camera_layer<native><epic_internal> := enum<open>:
        Global
        Visual

    @experimental
    camera_operator_layer<native><epic_internal> := struct:
        @experimental
        CameraEntity<native><public>:entity

        @experimental
        Priority<native><public>:rational

        @experimental
        Layer<native><public>:camera_layer

        @experimental
        ID<native><public>:int

    @experimental
    camera_operator_layer_cancelable<native><epic_internal> := class(cancelable):
        @experimental
        Director<native><epic_internal>:camera_director_component

        @experimental
        ID<native><public>:int

        Cancel<override><native>()<transacts>:void

    @experimental
    # Camera director component is responsible for selecting a camera and blending when the active camera changes. 
    # Also allows global settings to be shared between different cameras (such as post process settings) and modifications to the final blended camera state, such as camera shakes
    camera_director_component<native><epic_internal> := class<final_super><abstract>(component):
        @experimental
        # Decide which camera should be active, called every update for each player that has the camera_director set as their active camera
        EvaluateActiveCamera<native_callable><epic_internal>()<transacts><decides>:camera_component

        @experimental
        # Select a camera transition. Override this function to define camera transition behavior globally for the entire camera director. 
        # The default behavior is to call SourceCameraMode.GetExitTransition[DestinationCameraMode], if this function fails, then we call DestinationCameraMode.GetEnterTransition[SourceCameraMode]. If both failed then we default to an instant pop transition
        SelectCameraTransition<native_callable><epic_internal>(SourceCamera:camera_component, DestinationCamera:camera_component)<transacts><decides>:camera_transition = external {}

        @experimental
        # Add a new camera operator to the specified part of the update, with the specified priority
        AddCameraOperatorWithPriority<native><epic_internal>(Operator:camera_operator_component, CameraLayer:camera_layer, Priority:rational)<transacts><decides>:cancelable

        @replicated("")
        @experimental
        # Parameters that can be used as input to all camera modes being run by this camera behavior component
        var<private> CameraParameters<native><epic_internal>:[]parameterized_property_interface = external {}

        # Get camera parameters for a specific player
        GetCameraParametersForPlayer<native><epic_internal>(Player:player)<transacts><decides>:[]parameterized_property_interface

    @experimental
    # Camera lens settings
    camera_lens<native><epic_internal> := class:
        # Focal length of the lens in millimeters.
        var FocalLengthMillimeters<public>:float = external {}

        # Aperture of the lens in FStop.
        var FStop<public>:float = external {}

        # Squeeze factor for anamorphic lenses.
        var SqueezeFactor<public>:float = external {}

        # Number of blades of diaphragm.
        var BladeCount<public>:int = external {}

        # Focus distance in centimeters.
        var FocusDistance<epic_internal>:?float = external {}

    @experimental
    # Get the transform of the player pawn
    (CameraOperator:camera_operator_component).GetViewTargetTransform<native><epic_internal>(UpdateParameters:camera_operator_update_parameters)<transacts><decides>:(/Verse.org/SpatialMath:)transform

    @experimental
    # Get the player's control rotation
    (CameraOperator:camera_operator_component).GetControlRotation<native><epic_internal>(UpdateParameters:camera_operator_update_parameters)<transacts><decides>:(/Verse.org/SpatialMath:)rotation

    @experimental
    # Get the transform of the player's camera bone for first person
    (CameraOperator:camera_operator_component).GetFirstPersonCameraBoneTransform<native><epic_internal>(UpdateParameters:camera_operator_update_parameters)<transacts><decides>:(/Verse.org/SpatialMath:)transform

    @experimental
    # 1D Perlin Noise
    (CameraOperator:camera_operator_component).PerlinNoise1D<native><epic_internal>(X:float):float

    @experimental
    # 2D Perlin Noise
    (CameraOperator:camera_operator_component).PerlinNoise2D<native><epic_internal>(X:float, Y:float):float

    @experimental
    # Component that animates the state of a camera component over time
    camera_operator_component<native><epic_internal> := class<abstract><final_super>(component):
        @experimental
        UpdateCamera<native_callable><epic_internal>(UpdateParameters:camera_operator_update_parameters):void

        @experimental
        CameraRigAsset<native><epic_internal>:camera_rig_asset = external {}

    @experimental
    # Input parameters to a camera mode update
    camera_operator_update_parameters<native><epic_internal> := class<final>:
        @experimental
        # Input/Output camera state
        var CameraState<native><public>:camera_state = external {}

        @experimental
        # Delta time since last update
        var<private> DeltaTime<native><public>:float = external {}

        @experimental
        # Player that the camera operator is active for (if any)
        var<private> Player<native><epic_internal>:?player = external {}

        @experimental
        # Camera director that camera_operator is running under (if any)
        var<private> CameraDirector<native><epic_internal>:?camera_director_component = external {}

        @experimental
        # Is this the first time this camera operator is being updated?
        var<private> IsFirstUpdate<native><epic_internal>:logic = external {}

    @experimental
    camera_projection_mode<native><epic_internal> := enum<open>:
        Perspective
        Orthographic

    @experimental
    camera_state<native><epic_internal> := class<epic_internal>:
        @experimental
        # Render location of the camera. This render location can be modified by camera directions (like camera shakes), without modifying the physical location of any camera entity
        var RenderLocation<public>:(/Verse.org/SpatialMath:)vector3 = external {}

        @experimental
        # Render rotation of the camera. This render rotation can be modified by camera directions (like camera shakes), without modifying the physical location of any camera entity
        var RenderRotation<public>:(/Verse.org/SpatialMath:)rotation = external {}

        @experimental
        # Determines how wide the camera projects in orthographic mode, in centimeters - Used only if projection mode is orthographic
        var OrthographicProjectionWidth<public>:float = external {}

        @experimental
        # Physical camera body settings
        var Body<native><public>:camera_body = external {}

        @experimental
        # Physical camera lens settings
        var Lens<native><public>:camera_lens = external {}

        @experimental
        # Projection mode - perspective or orthographic
        var<private> ProjectionMode<native><public>:camera_projection_mode = external {}

        @experimental
        # How much to apply physical camera settings between 0.0 and 1.0
        var<private> PhysicalCameraWeight<native><public>:float = external {}

        @experimental
        # Set horizontal field of view in degrees - Assuming an aspect ratio of 16:9. The camera system will use Hor+ scaling for aspect ratios other than 16:9.
        # This will modify the focal length of the camera to achieve the requested field of view
        SetFieldOfView<native><public>(FieldOfView:float):void

        @experimental
        # Get horizontal field of view in degrees - Assuming an aspect ratio of 16:9. In practice, the actual field of view on an end-user's device may be different due to differing display aspect ratios
        GetFieldOfView<native><public>():float

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
        # Horizontal field of view in degrees, specified for an aspect ratio of 16:9 /nThis is then to calculate an effective horizontal field of view for the display’s real aspect ratio /nIf for example the screen is an ultrawide (21:9, or 32:9 being common ultrawide aspect ratios) then in practice the actual field of view will be wider. This is known as the Hor+ view scaling method and is generally accepted to be the best solution for ultrawide displays.
        var FieldOfViewDegrees<native><public>:float = external {}

    @experimental
    # Camera that is physically based, determining its view properties in a manner more consistent with a physical camera
    physical_camera_component<native><epic_internal> := class<final_super>(camera_component):
        OnInitializedInternal<native><override>():void

        OnUninitializingInternal<native><override>():void

        @experimental
        # Camera’s body settings.
        #  This contains sensor settings, e.g. film or digital camera sensor, shutter speed, etc
        var Body<public>:camera_body = external {}

        @experimental
        # Lens of the camera
        var Lens<public>:camera_lens = external {}

    @import_as("/Script/VerseCamera.UVersePlayerCameraViewComponent")
    @experimental
    player_camera_view_base<native><epic_internal> := class<abstract>:


    @experimental
    # Component used to associate a camera behavior component with a player
    player_camera_view<native><epic_internal> := class(player_camera_view_base):


    @experimental
    camera_mode_with_priority<native><epic_internal> := struct:
        @experimental
        CameraEntity<native><public>:entity

        @experimental
        Priority<native><public>:rational

        @experimental
        ID<native><public>:int

    @experimental
    priority_list_camera_director_cancelable<native><epic_internal> := class(cancelable):
        @experimental
        Director<native><epic_internal>:priority_list_camera_director_component

        @experimental
        ID<native><public>:int

        Cancel<override><native>()<transacts>:void

    @experimental
    # Camera director that maintains a prioritized list of camera modes. The highest priority camera mode is chosen every frame
    priority_list_camera_director_component<native><epic_internal> := class<final_super>(camera_director_component):
        # Returns the camera component with the highest priority
        EvaluateActiveCamera<native><final><override>()<transacts><decides>:camera_component

        @experimental
        # Add a camera with an associated priority - Fails if CameraEntity does not contain a camera_component
        AddCameraWithPriority<native><public>(CameraEntity:entity, Priority:rational)<transacts><decides>:cancelable

    @experimental
    # A component that lives on the simulation entity and associates a camera with a player within the confines of that simulation
    simulation_camera_director_component<native><epic_internal> := class<final_super>(component):
        # Set the active camera for a player - Fails if the specified entity does not have a camera component
        SetActiveCamera<native><public>(Player:player, CameraEntity:entity)<transacts><decides>:cancelable

    @experimental
    (SimulationCameraDirector:simulation_camera_director_component).GetActiveCamera_AutomatedTestingOnly<native><epic_internal>(Player:player)<transacts><decides>:entity

    @experimental
    single_camera_director_cancelable<native><epic_internal> := class(cancelable):
        @experimental
        Director<native><epic_internal>:single_camera_director_component

        @experimental
        CameraEntity<native><public>:entity

        Cancel<override><native>()<transacts>:void

    @experimental
    # Camera director that has a single active camera mode, that is expliclty set through its SetActiveCamera function
    single_camera_director_component<native><epic_internal> := class<final_super>(camera_director_component):
        # Returns the camera component that was set by SetActiveCamera
        EvaluateActiveCamera<native><final><override>()<transacts><decides>:camera_component

        @experimental
        # Set the active camera for a player - Fails if the specified entity does not have a camera component
        SetActiveCamera<native><public>(CameraEntity:entity)<transacts><decides>:cancelable