# Copyright Epic Games, Inc. All Rights Reserved.
#################################################
# Generated Digest of Verse API
# DO NOT modify this manually!
# Generated from build: ++Fortnite+Release-36.30-CL-44367537
#################################################

SceneGraph<public> := module:
    using {/Verse.org/Temporary/EpicGamesRestricted/Network}
    using {/Verse.org/Simulation}
    using {/Verse.org/Native}
    @experimental
    frame_component<native><epic_internal> := class<final_super><abstract>(component):

    @experimental
    @import_as("/Script/UIFramework.UUIFrameworkWidget")
    ui_frame<native><epic_internal> := class<epic_internal>:

    @experimental
    ui_display_component<native><epic_internal> := class<abstract><final_super>(component, enableable):
        # Enable this component.
        Enable<native><override>():void

        # Disable this component.
        Disable<native><override>():void

        # Succeeds if the component is enabled, fails if it is disabled.
        IsEnabled<native><override>()<transacts><decides>:void

    @experimental
    world_ui_display_component<native><epic_internal> := class<final_super>(ui_display_component):
        OnInitializedInternal<native><override>():void

        OnAddedToSceneInternal<native><override>():void

        OnRemovingFromSceneInternal<native><override>():void

        OnBeginSimulationInternal<native><override>():void

        @editable
        @replicated("RepNotify")
        # Whether or not this frame always faces the camera.
        var FacingCamera<native><public>:logic = external {}

    using {/Verse.org/Assets}
    # Module import path: /Verse.org/SceneGraph/FNECon
    FNECon<public> := module:
        # Data type used for conversations.
        conversation_database<native><epic_internal> := class<computes><concrete><epic_internal>(asset):

        @experimental
        # Used to handle general conversation.
        conversation_component<native><epic_internal> := class<final_super><epic_internal>(component, enableable):
            OnInitializedInternal<native><override>():void

            OnUninitializingInternal<native><override>():void

            OnRemovingFromSceneInternal<native><override>():void

            OnBeginSimulationInternal<native><override>():void

            OnEndSimulationInternal<native><override>():void

            # Enables this component.
            Enable<native><override>():void

            # Disables this component.
            Disable<native><override>():void

            # Succeeds if the component is enabled. Fails if it’s disabled.
            IsEnabled<native><override>()<transacts><decides>:void

            # Sets the name of the speaker that is displayed during conversations.
            SetSpeakerName<native><public>(InSpeakerName:message):void

            # Gets the speaker's name.
            GetSpeakerName<native><public>():message

            @editable
            # Determines the range at which a player will be able to see the speech bubble (in meters). If set to less than 2m, the player will not see an indicator speech bubble.
            var IndicatorBubbleRange<native><public>:float = external {}

            @editable
            # The conversation database used when a conversation is started.
            var ConversationDatabase<native><public>:conversation_database = external {}

            @editable
            # The max number of participants allowed to interact with this component simultaneously.
            var MaximumParticipatingAgents<native><public>:int = external {}

            # Starts a conversation with the input agent.
            StartConversation<native><public>(Agent:agent):void

            # Ends a conversation with the input agent.
            EndConversation<native><public>(Agent:agent):void

            # Ends all conversations associated with this component.
            EndAllConversations<native><public>():void

            # Event that sends the participating agent when a conversation has started.
            ConversationStartedEvent<native><public>:listenable(agent) = external {}

            # Event that sends the participating agent when a conversation has ended.
            ConversationEndedEvent<native><public>:listenable(agent) = external {}

    @experimental
    # An interactable component with a composable feature set.
    basic_interactable_component<native><public> := class(interactable_component):
        OnInitializedInternal<native><override>():void

        # Attempt to cancel an interaction. Fails if the supplied agent is not currently interacting with the component.
        Cancel<native><public>(Agent:agent)<transacts><decides>:void

        # Attempt to succeed at an interaction. Success will also happen automatically after InteractDuration has elapsed after starting an interaction. Fails if the supplied agent is not currently interacting with the component.
        Succeed<native><public>(Agent:agent)<transacts><decides>:void

        # Get the remaining cooldown of the interactable for the supplied agent. This returns the duration left in seconds of either the shared or per agent cooldown, whichever is greater. Returns the same value when called multiple times within a transaction.
        GetRemainingCooldownDurationAffectingAgent<native><public>(Agent:agent):float

        # The agents which are currently interacting with this interactable.
        var<private> InteractingAgents<native><public>:[]agent = external {}

        @editable
        # Cooldowns begin elapsing on successful interactions. A cooldown which applies for all attempts to interact on this component.
        Cooldown<native><public>:?interactable_cooldown = external {}

        @editable
        # Cooldowns begin elapsing on successful interactions. A cooldown which applies for future attempts to interact on this component by the agent which succeeded.
        CooldownPerAgent<native><public>:?interactable_cooldown_per_agent = external {}

        @editable
        # Success limits prevent new interactions once the component has been successfully interacted with a specified number of times.
        SuccessLimit<native><public>:?interactable_success_limit = external {}

        @editable
        # An interaction with a duration does not succeed until the duration has elapsed, and success is not guaranteed as it can be canceled while the duration is active.
        InteractableDuration<native><public>:?interactable_duration = external {}

    # Used to handle general interaction.
    interactable_component<native><public> := class<final_super>(component, enableable):
        OnInitializedInternal<native><override>():void

        OnUninitializingInternal<native><override>():void

        OnBeginSimulationInternal<native><override>():void

        OnEndSimulationInternal<native><override>():void

        # Enable interaction with the component.
        Enable<native><override>():void

        # Disable interaction with the component. Disabled components do not provide interaction prompts.
        Disable<native><override>():void

        # Succeeds if the component is enabled, fails if it’s disabled.
        IsEnabled<native><override>()<transacts><decides>:void

        # Event fires when an a successful interaction starts. Sends the interacting agent. InteractDuration at or below 0 makes this event identical to InteractSucceededEvent.
        StartedEvent<native><public>:listenable(agent) = external {}

        # Event fires when an interaction has completed successfully. Sends the formerly interacting agent. InteractDuration at or below 0 makes this event identical to InteractStartedEvent.
        SucceededEvent<native><public>:listenable(agent) = external {}

        # Event fires when an interaction has ended before completing successfully. Sends the formerly interacting agent. interactable_component cannot be canceled, this event is provided for subclasses to fire where appropriate.
        CanceledEvent<native><public>:listenable(agent) = external {}

        # Attempt to start an interaction. Fails if the agent does not pass the CanInteract function.
        Start<native><final><public>(Agent:agent)<transacts><decides>:void

        # Fires the StartedEvent event.
        SignalStartEvent<native><protected>(Agent:agent)<transacts>:void

        # Fires the SucceededEvent event.
        SignalSucceedEvent<native><protected>(Agent:agent)<transacts>:void

        # Fires the CanceledEvent event.
        SignalCancelEvent<native><protected>(Agent:agent)<transacts>:void

        # Called from Start if CanInteract pass successfully to start the interaction. Overriding this function will allow you to create a custom interaction behaviour.
        OnStarted<native><native_callable><protected>(Agent:agent)<transacts><decides>:void

        # Returns whether the specified agent can interact.
        CanInteract<native><native_callable><public>(Agent:agent)<reads><decides>:void

        # Returns an appropriate message to display to players to communicate the current state of the interactable.
        InteractMessage<native><native_callable><public>(Agent:agent)<reads><decides>:message

    @experimental
    # Used to set a cooldown when interacted.
    interactable_cooldown<native><public> := class<concrete>:
        @editable
        # The number of seconds after a successful interaction, before being able to initiate a subsequent interaction for anyone.
        # This is only used if duration is greater than 0.0. Modifying this does not affect the RemainingDuration.
        # When a cooldown starts on the component all other interactions are canceled.
        var Duration<native><public>:float = external {}

        # The remaining cooldown, in seconds, before new interactions can be initiated on this component.
        var<public> RemainingDuration<public>:float = external {}

        # Event which fires when the shared cooldown expires.
        ExpiredEvent<native><public>:listenable(tuple()) = external {}

        # Set the remaining shared cooldown duration in seconds, affecting all agents.
        SetRemainingDuration<native><epic_internal>(__dupe___unnamed_parameter_69:accessor, InRemainingDuration:float)<transacts>:void

        # Get the remaining shared cooldown duration in seconds, affecting all agents.
        GetRemainingDuration<native><epic_internal>(__dupe___unnamed_parameter_70:accessor)<transacts>:float

    @experimental
    # Used to set a cooldown per agent when interacted.
    interactable_cooldown_per_agent<native><public> := class<concrete>:
        @editable
        # The duration in seconds after a successful interaction, before the interacting agent can initiate a subsequent interaction.
        # This is only used if the duration is greater than 0.0. Modifying this does not affect any RemainingPerAgentCooldownDuration.
        # This property gives other agents time to interact, when there is a limited number of Simultaneous Interactors.
        var Duration<native><public>:float = external {}

        # The cooldown remaining, in seconds, before a particular agent is able to initiate an interaction on this component.
        var<private> RemainingDuration<native><public>:[agent]float = external {}

        # Event which fires when the per agent cooldown expires. Sends the agent which was previously affected by the cooldown.
        ExpiredEvent<native><public>:listenable(agent) = external {}

        # Set the remaining shared cooldown duration in seconds, affecting all agents.
        SetRemainingDurationForAgent<native><epic_internal>(__dupe___unnamed_parameter_71:accessor, Agent:agent, InRemainingDuration:float)<transacts>:void

        # Get the remaining shared cooldown duration in seconds, affecting all agents.
        GetRemainingDurationForAgent<native><epic_internal>(__dupe___unnamed_parameter_72:accessor, Agent:agent)<transacts>:float

    @experimental
    # Used to set an interaction duration.
    interactable_duration<native><public> := class<concrete>:
        @editable
        # The number of seconds an agent must spend interacting with the object to successfully complete an interaction.
        # 0.0 or less results in an immediate successful interaction.
        # If set during an interaction, the value given will be used for the next interaction and the remaining duration will be updated subtracting the new given value with the current time elapsed.
        # If the subtraction were zero or less it will immediately conclude.
        var InteractDuration<public>:float = external {}

        @replicated("")
        @editable
        @display_name("Interact Duration")
        # Internal InteractDuration value.
        var _InteractDuration<native><epic_internal>:float = external {}

        # Interact duration setter.
        SetInteractDuration<native><epic_internal>(__dupe___unnamed_parameter_73:accessor, InRemainingDuration:float)<transacts>:void

        # Interact duration getter.
        GetInteractDuration<native><epic_internal>(__dupe___unnamed_parameter_74:accessor)<transacts>:float

        @editable
        # The max number of simultaneous interactors. A value of false is unlimited.  This value represents how many agents may have active interactions.
        # If this changes to a value less than the current number of active interactions, those interactions are not canceled but new interactions will not start.
        var MaxSimultaneousInteractors<native><public>:?int = external {}

        # Returns an agent’s remaining duration, in seconds, for interaction. Fails if the agent is not interacting with this component.Returns the same value when called multiple times within a transaction.
        GetRemainingInteractDurationForAgent<final><native><public>(Agent:agent)<reads><decides>:float

        # Sets an agent’s remaining duration, in seconds, for interaction. Fails if the agent is not interacting with this component.
        SetRemainingInteractDurationForAgent<final><native><public>(Agent:agent, RemainingDuration:float)<transacts>:void

    @experimental
    # Used to set a limit of times to interact.
    interactable_success_limit<native><public> := class<concrete>:
        # The number of times the component can be successfully interacted with. A value of false is unlimited.
        # When SuccessfulInteractionCount reaches MaxSuccessfulInteractions all active interactions are canceled, and the component cannot be interacted with.
        var MaxSuccessfulInteractions<public>:?int = external {}

        # The number of times this component has had a successful interaction.
        var SuccessfulInteractionCount<public>:int = external {}

        # Update the maximum number of successful interactions possible, a value of false is unlimited.
        # If the current number of tracked interactions is greater than the value specified here, all current interactions will be canceled.
        SetMaxSuccessfulInteractions<native><epic_internal>(__dupe___unnamed_parameter_75:accessor, InMaxSuccessfulInteractions:?int)<transacts>:void

        # Get the maximum number of successful interactions possible.
        GetMaxSuccessfulInteractions<native><epic_internal>(__dupe___unnamed_parameter_76:accessor)<transacts>:?int

        # Resets the counter for the times this component has had a successful interaction.
        ClearSuccessfulInteractionCount<native><public>()<transacts>:void

    using {/Verse.org/SpatialMath}
    using {/Verse.org/Simulation/Tags}
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
            # Focus distance in centimeters.
            var FocusDistance<native><epic_internal>:?float = external {}

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
        # Get the camera component currently active on the player (activated via camera_component.ActivateForPlayer)
        (Player:player).GetActiveCameraComponent<native><epic_internal>()<transacts><decides>:camera_component

        @experimental
        # A component that lives on the simulation entity and associates a camera with a player within the confines of that simulation
        simulation_camera_director_component<native><epic_internal> := class<final_super>(component):
            # Set the active camera for a player - Fails if the specified entity does not have a camera component
            SetActiveCamera<native><public>(Player:player, CameraEntity:entity)<transacts><decides>:cancelable


    component_query_iterator_interface<native><epic_internal> := interface<epic_internal>:
        NextValue<native_callable><public>()<transacts><decides>:component

    null_component_query_iterator<native><epic_internal> := class<epic_internal>(component_query_iterator_interface):
        NextValue<native><override>()<transacts><decides>:component

    slow_component_array_copy_query_iterator<native><epic_internal> := class<epic_internal>(component_query_iterator_interface):
        NextValue<native><override>()<transacts><decides>:component

    entity_query_iterator_interface<native><epic_internal> := interface<epic_internal>:
        NextValue<native_callable><public>()<transacts><decides>:entity

    null_entity_query_iterator<native><epic_internal> := class<epic_internal>(entity_query_iterator_interface):
        NextValue<native><override>()<transacts><decides>:entity

    entity_query_iterator<native><epic_internal> := class<epic_internal>(entity_query_iterator_interface):
        NextValue<native><override>()<transacts><decides>:entity

    slow_entity_array_copy_query_iterator<native><epic_internal> := class<epic_internal>(entity_query_iterator_interface):
        NextValue<native><override>()<transacts><decides>:entity

    @available {MinUploadedAtFNVersion := 3200}
    # Finds all descendant entities including `InEntity` of type `entity_type`.
    # The order of the returned entities is unspecified and subject to change.
    (InEntity:entity).FindDescendantEntities<native><public>(entity_type:castable_subtype(entity))<transacts>:generator(entity_type)

    @available {MinUploadedAtFNVersion := 3200}
    # Finds all descendant entities including `InEntity` containing a component of type `component_type`.
    # The order of the returned entities is unspecified and subject to change.
    (InEntity:entity).FindDescendantEntitiesWithComponent<native><public>(component_type:castable_subtype(component))<transacts>:generator(entity)

    @available {MinUploadedAtFNVersion := 3200}
    # Finds all components attached to descendant entities to and including `InEntity` of type `component_type`.
    # The order of the returned components is unspecified and subject to change.
    (InEntity:entity).FindDescendantComponents<native><public>(component_type:castable_subtype(component))<transacts>:generator(component_type)

    @available {MinUploadedAtFNVersion := 3200}
    # Finds all ancestor entities to `InEntity` of type `entity_type`.
    # The order of the returned entities is unspecified and subject to change.
    (InEntity:entity).FindAncestorEntities<native><public>(entity_type:castable_subtype(entity))<transacts>:generator(entity_type)

    @available {MinUploadedAtFNVersion := 3200}
    # Finds all ancestor entities to `InEntity` containing a component of type `component_type`.
    # The order of the returned entities is unspecified and subject to change.
    (InEntity:entity).FindAncestorEntitiesWithComponent<native><public>(component_type:castable_subtype(component))<transacts>:generator(entity)

    @available {MinUploadedAtFNVersion := 3200}
    # Finds all components attached to ancestor entities to `InEntity` of type `component_type`.
    # The order of the returned components is unspecified and subject to change.
    (InEntity:entity).FindAncestorComponents<native><public>(component_type:castable_subtype(component))<transacts>:generator(component_type)

    @hide_in_editor
    entity_registry_component<native><epic_internal> := class<final_super><epic_internal>(component):

    @hide_in_editor
    level_entity<native><epic_internal> := class<concrete><unique><transacts>(root_entity):

    using {/Verse.org/Colors}
    @hide_in_editor
    @experimental
    basic_camera_component<native><epic_internal> := class<final_super>(component):
        OnInitializedInternal<native><override>():void

        OnUninitializingInternal<native><override>():void

        OnAddedToSceneInternal<native><override>():void

        OnRemovingFromSceneInternal<native><override>():void

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

    # A `directional_light_component` simulates light that is being emitted from a source that is infinitely far away. This means that all shadows cast by this light will be parallel, making this the ideal choice for simulating sunlight.
    directional_light_component<native><public> := class<final>(light_component):
        OnAddedToSceneInternal<native><override>():void

        # Intensity of the light hitting the surface. In Lux (Lumen per square meter).
        var Illuminance<public>:float = external {}

        # Angle subtended by light source in degrees (also known as angular diameter). Defaults to 0.5357 which is the angle for our sun.
        var SourceAngleDegrees<public>:float = external {}

        @editable {EpicOnly := true}
        @category("directional_light_component|Epic Internal")
        # How far, in centimeters, cascaded shadow map dynamic shadows will cover, measured in units from the camera. A value of 0 disables the dynamic shadow
        DynamicShadowDistance<native><epic_internal>:float = external {}

        @editable_slider(int) {EpicOnly := true, MinValue := option {0}, MaxValue := option {4}}
        @category("directional_light_component|Epic Internal")
        # Number of cascades to split the view frustum into for the whole scene dynamic shadow
        NumDynamicShadowCascades<native><epic_internal>:int = external {}

        @editable_slider(float) {EpicOnly := true, MinValue := option {1.000000}, MaxValue := option {4.000000}}
        @category("directional_light_component|Epic Internal")
        # Controls whether the cascades are distributed closer to the camera (larger exponent) or further from the camera (smaller exponent)
        CascadeDistributionExponent<native><epic_internal>:float = external {}

        @editable_slider(float) {EpicOnly := true, MinValue := option {0.000000}, MaxValue := option {0.300000}}
        @category("directional_light_component|Epic Internal")
        # Proportion of the fade region between cascades
        CascadeTransitionFraction<native><epic_internal>:float = external {}

        @editable_slider(float) {EpicOnly := true, MinValue := option {0.000000}, MaxValue := option {1.000000}}
        @category("directional_light_component|Epic Internal")
        # Controls the size of the fade out region at the far extent of the dynamic shadow's influence
        CascadeDistanceFadeoutFraction<native><epic_internal>:float = external {}

        @editable_slider(int) {EpicOnly := true, MinValue := option {0}, MaxValue := option {4}}
        @category("directional_light_component|Epic Internal")
        # The number of cascades between DynamicShadowDistance and FarShadowDistance that are covered by Far Shadow Cascades, or zero to disable far shadow cascades
        FarShadowCascadeCount<native><epic_internal>:int = external {}

        @editable {EpicOnly := true}
        @category("directional_light_component|Epic Internal")
        # Distance, in centimeters, at which the far shadow cascade should end
        FarShadowDistance<native><epic_internal>:float = external {}

        @editable {EpicOnly := true}
        @category("directional_light_component|Epic Internal")
        # Distance at which the far shadow cascade should end
        EnableLightShaftOcclusion<native><epic_internal>:logic = external {}

        @editable {EpicOnly := true}
        @category("directional_light_component|Epic Internal")
        # Controls how dark the occlusion masking is
        OcclusionMaskDarkness<native><epic_internal>:float = external {}

        @editable {EpicOnly := true}
        @category("directional_light_component|Epic Internal")
        # Everything closer to the camera than this distance, measured in centimeters, will occlude light shafts
        OcclusionDepthRange<native><epic_internal>:float = external {}

    # Module import path: /Verse.org/SceneGraph/KeyframedMovement
    # Animate Scene Graph entities with keyframes.
    KeyframedMovement<public> := module:
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
            Easing<native><public>:easing_function = external {}

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

            Easing<native><public>:cubic_bezier_easing_function_native = external {}

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
        @category("light_component|Epic Internal")
        # Whether to enable lighting on the default channel for all primitives and lights
        EnableLightingChannel0<native><epic_internal>:logic = external {}

        @editable {EpicOnly := true}
        @category("light_component|Epic Internal")
        # Whether to enable lighting on the first custom channel
        EnableLightingChannel1<native><epic_internal>:logic = external {}

        @editable {EpicOnly := true}
        @category("light_component|Epic Internal")
        # Whether to enable lighting on the second custom channel
        EnableLightingChannel2<native><epic_internal>:logic = external {}

        @editable {EpicOnly := true}
        @category("light_component|Epic Internal")
        # Whether the light affects global illumination, when ray-traced global illumination is enabled
        AffectGlobalIllumination<native><epic_internal>:logic = external {}

        @editable_slider(float) {EpicOnly := true, MinValue := option {0.000000}, MaxValue := option {6.000000}}
        @category("light_component|Epic Internal")
        # Scales the indirect lighting contribution from this light
        IndirectLightingIntensity<native><epic_internal>:float = external {}

        @editable_slider(float) {EpicOnly := true, MinValue := option {0.000000}, MaxValue := option {4.000000}}
        @category("light_component|Epic Internal")
        # Intensity of the volumetric scattering from this light
        VolumetricScatteringIntensity<native><epic_internal>:float = external {}

        @editable {EpicOnly := true}
        @category("light_component|Epic Internal")
        # Whether to render light shaft bloom from this light
        EnableLightShaftBloom<native><epic_internal>:logic = external {}

        @editable {EpicOnly := true}
        @category("light_component|Epic Internal")
        # Scales the additive color
        BloomScale<native><epic_internal>:float = external {}

        @editable {EpicOnly := true}
        @category("light_component|Epic Internal")
        # Scene color must be larger than this to create bloom in the light shafts
        BloomThreshold<native><epic_internal>:float = external {}

        @editable {EpicOnly := true}
        @category("light_component|Epic Internal")
        # After exposure is applied, scene color brightness larger than the max brightness will be rescaled down to the max brightness
        BloomMaxBrightness<native><epic_internal>:float = external {}

        @editable {EpicOnly := true}
        @category("light_component|Epic Internal")
        # Multiplies against scene color to create the bloom color
        BloomTint<native><epic_internal>:color = external {}

        @editable {EpicOnly := true}
        @category("light_component|Epic Internal")
        # The light function material to be applied to this light
        LightFunctionMaterial<native><epic_internal>:?material = external {}

        @editable {EpicOnly := true}
        @category("light_component|Epic Internal")
        # Scales the light function projection. X and Y scale in the directions perpendicular to the light's direction, Z scales along the light direction.
        LightFunctionScale<native><epic_internal>:(/Verse.org/SpatialMath:)vector3 = external {}

        @editable {EpicOnly := true}
        @category("light_component|Epic Internal")
        # Distance, in centimeters, at which the light function should be completely faded to the configured disabled brightness
        LightFunctionFadeDistance<native><epic_internal>:float = external {}

        @editable_slider(float) {EpicOnly := true, MinValue := option {0.000000}, MaxValue := option {1.000000}}
        @category("light_component|Epic Internal")
        # Brightness factor applied to the light when the light function is specified but disabled
        LightFunctionDisabledBrightness<native><epic_internal>:float = external {}

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

        @replicated("RepNotify")
        # The `mesh` to be rendered by this `mesh_component`.
        Mesh<native><epic_internal>:mesh = external {}

        @experimental
        # Sets the `mesh` to be rendered.
        SetMesh<native><epic_internal>(InMesh:mesh):void

        @experimental
        # Sets the `material` to be applied to the `mesh`.
        SetMaterial<native><epic_internal>(InMaterial:?material):void

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

        # Triggered at the beginning of each tick when another entity first overlaps this entity.
        EntityEnteredEvent<native><public>:listenable(entity) = external {}

        # Triggered at the beginning of each tick when another entity is no longer overlapping this entity
        EntityExitedEvent<native><public>:listenable(entity) = external {}

        @experimental
        @available {MinUploadedAtFNVersion := 2930}
        CollisionEnteredEvent<native><epic_internal>:listenable(generator(collision_hit)) = external {}

        @experimental
        @available {MinUploadedAtFNVersion := 2930}
        CollisionEvent<native><epic_internal>:listenable(generator(collision_hit)) = external {}

        @experimental
        @available {MinUploadedAtFNVersion := 2930}
        CollisionExitedEvent<native><epic_internal>:listenable(generator(collision_volume_pair)) = external {}

        OnPropertyChangedFromVerse<native><override>(PropertyName:string)<transacts>:void

        @editable {EpicOnly := true}
        @category("mesh_component|Epic Internal")
        @experimental
        # Whether to hide this mesh in game, if the mesh is Visible.
        var HiddenInGame<native><epic_internal>:logic = external {}

        @editable {EpicOnly := true}
        @category("mesh_component|Epic Internal")
        # Controls whether this mesh should cast a shadow or not.
        var CastShadow<native><epic_internal>:logic = external {}

        @editable {EpicOnly := true}
        @category("mesh_component|Epic Internal")
        # Whether this mesh should cast dynamic shadows as if it were a two sided material.
        var CastShadowAsTwoSided<native><epic_internal>:logic = external {}

        @editable {EpicOnly := true}
        @category("mesh_component|Epic Internal")
        # If true, the mesh will cast shadows even if HiddenInGame is true.
        var CastHiddenShadow<native><epic_internal>:logic = external {}

        @editable {EpicOnly := true}
        @category("mesh_component|Epic Internal")
        # Controls whether the mesh should influence indirect lighting.
        var AffectDynamicIndirectLighting<native><epic_internal>:logic = external {}

        @editable {EpicOnly := true}
        @category("mesh_component|Epic Internal")
        # Controls whether the mesh should affect indirect lighting when hidden.
        var AffectIndirectLightingWhileHidden<native><epic_internal>:logic = external {}

        @editable {EpicOnly := true}
        @category("mesh_component|Epic Internal")
        @experimental
        # Whether this mesh should allow decals.
        var ReceivesDecals<native><epic_internal>:logic = external {}

        @editable {EpicOnly := true}
        @category("mesh_component|Epic Internal")
        # Controls the sort priority of this mesh if it is translucent.
        var TranslucencySortPriority<native><epic_internal>:int = external {}

        @editable {EpicOnly := true}
        @category("mesh_component|Epic Internal")
        @experimental
        # When enabled this mesh will never be culled by distance.
        var NeverDistanceCull<native><epic_internal>:logic = external {}

        # Returns the bounded box of this components, in world space.
        GetBoundedGlobalBox<override><native>()<reads>:bounded_box

        # Returns the bounded box of this components, in local space.
        GetBoundedLocalBox<override><native>()<reads>:bounded_box

        @experimental
        @experimental_always_overridden
        # Cached bounds used when the owning entity is not initialized.
        CachedLocalBounds<native><epic_internal>:bounded_box = external {}

        ___PropertyInterface_On_Collidable_Changed<epic_internal>():void = external {}

        ___PropertyInterface_On_Queryable_Changed<epic_internal>():void = external {}

        ___PropertyInterface_On_Visible_Changed<epic_internal>():void = external {}

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
        # Controls if the `particle_system_component` should play the simulation automatically when added to the scene, or when enabled from a disabled state.
        var<private> AutoPlay<native><public>:logic = external {}

        ParticleSystem<native><epic_internal>:particle_system = external {}

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

    @experimental
    @import_as("/Script/Component.UPresentationOwner")
    presentation_owner<native><epic_internal> := class<unique><epic_internal>:

    @experimental
    presentation_component<native><epic_internal> := class<final_super>(component):
        IsPresentableTo<native><final><public>(ToPlayer:player)<transacts><decides>:void

        AddOwner<native><public>(Player:player):void

        RemoveOwner<native><public>(Player:player):void

    # A `rect_light_component` emits light into the scene from a rectangular plane with a specified width and height. You can use these
    # to simulate any kind of light sources that have rectangular areas, such as televisions or monitor screens, overhead lighting
    # fixtures, or wall sconces.
    rect_light_component<native><public> := class<final>(light_component):
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

    metasound_trigger<native><epic_internal> := class<epic_internal>:
        Trigger<native><epic_internal>():void

        TriggerIdentifier<native><epic_internal>:string = external {}

        SoundComponentTarget<native><epic_internal>:?sound_component = external {}

    sound_component<native><public> := class<abstract><final_super><epic_internal>(component, property_changed_interface, enableable):
        OnInitializedInternal<native><override>():void

        OnUninitializingInternal<native><override>():void

        OnAddedToSceneInternal<native><override>():void

        OnRemovingFromSceneInternal<native><override>():void

        OnBeginSimulationInternal<native><override>():void

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
        @replicated("RepNotify")
        var<private> Enabled<native><public>:logic = external {}

        # The path to the sound asset
        InternalMetaSoundAssetPath<native><epic_internal>:metasound = external {}

        OnPropertyChangedFromVerse<native><override>(PropertyName:string)<transacts>:void

    # A `sphere_light_component` emits light in all directions into the scene from a spherical source shape with a specified radius. A radius of 0 makes it a point light. You can use these
    # to simulate any kind of light sources that emit in all directions, such as a light bulb.
    sphere_light_component<native><public> := class<final>(light_component):
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

        @editable {EpicOnly := true}
        @category("sphere_light_component|Epic Internal")
        # Whether to use physically based inverse squared distance falloff
        UseInverseSquaredFalloff<native><epic_internal>:logic = external {}

        @editable_slider(float) {EpicOnly := true, MinValue := option {2.000000}, MaxValue := option {16.000000}}
        @category("sphere_light_component|Epic Internal")
        # Controls the radial falloff of the light when UseInverseSquaredFalloff is disabled
        LightFalloffExponent<native><epic_internal>:float = external {}

    # A `spot_light_component` emits light from a single point in a cone shape. The shape of the light is defined by two cones: the `InnerConeAngleDegrees`
    # and `OuterConeAngleDegrees`. Within the `InnerConeAngleDegrees` the light achieves full brightness. As you go from the extent of the inner radius to the
    # extents of the `OuterConeAngleDegrees` a falloff takes place, creating a penumbra, or softening around the `spot_light_component`'s disc of
    # illumination. The Radius of the light defines the length of the cones. More simply, this will work like a flash light or stage can light.
    spot_light_component<native><public> := class<final>(light_component):
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

        @editable {EpicOnly := true}
        @category("spot_light_component|Epic Internal")
        # Whether to use physically based inverse squared distance falloff
        UseInverseSquaredFalloff<native><epic_internal>:logic = external {}

        @editable_slider(float) {EpicOnly := true, MinValue := option {2.000000}, MaxValue := option {16.000000}}
        @category("spot_light_component|Epic Internal")
        # Controls the radial falloff of the light when UseInverseSquaredFalloff is disabled
        LightFalloffExponent<native><epic_internal>:float = external {}

    @experimental
    # Used to add tags to an entity. Tagged entities can then be queried using `entity.FindDescendantEntitiesWithTag` and `entity.FindAncestorEntitiesWithTag`.
    #   * Finding entities from the simulation entity for tagged entities only considers any `tag_component` that has run `OnAddedToScene`.
    tag_component<native><public> := class<final><final_super>(component, tag_view):
        # Determine if TagToCheck is present in this container, also checking against parent tags {"A.1"}.Has("A") will return True, {"A"}.Has("A.1") will return False If TagToCheck is not Valid it will always return False.
        Has<native><override>(TagToCheck:tag)<reads><decides>:void

        # Checks if this container contains ANY of the tags in the specified container, also checks against parent tags {"A.1"}.HasAny({"A","B"}) will return True, {"A"}.HasAny({"A.1","B"}) will return False If InTags is empty/invalid it will always return False.
        HasAny<native><override>(InTags:[]tag)<reads><decides>:void

        # Checks if this container contains ALL of the tags in the specified container, also checks against parent tags {"A.1","B.1"}.HasAll({"A","B"}) will return True, {"A","B"}.HasAll({"A.1","B.1"}) will return False If InTags is empty/invalid it will always return True, because there were no failed checks.
        HasAll<native><override>(InTags:[]tag)<reads><decides>:void

        # Adds a tag to this component. Returns `true` if the tag was not present before being added.
        AddTag<native><public>(TagToAdd:tag)<transacts>:logic

        # Removes a tag from this component. Returns `true` if the tag was present before being removed.
        RemoveTag<native><public>(TagToRemove:tag)<transacts>:logic

        OnAddedToSceneInternal<native><override>():void

        OnRemovingFromSceneInternal<native><override>():void

    @hide_in_editor
    @experimental
    tag_query_manager_component<native><epic_internal> := class<final_super><epic_internal>(component):
        OnUninitializingInternal<native><override>():void

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

    # Specifies how a collision volume pair should interact. See collision_profile.
    collision_interaction<native><public> := enum:
        # The pair will not be detected by Overlap and Sweep queries. The pair will not collide in the physics simulation.
        Ignore
        # The pair will be detected by Overlap and Sweep queries. The pair will not collide in the physics simulation.
        Overlap
        # The pair will be detected by Overlap and Sweep queries. The pair will collide in the physics simulation.
        Block

    # Every volume has a collision channel as part of its collision_profile. It is used to determine how two volumes interact. See collision_profile.
    collision_channel<native><public> := class<concrete><epic_internal>:

    # An alias for the function type used to map a collision_channel to a collision_interaction used by  collision_profile.
    collision_channel_to_interaction<public> := type {_(:collision_channel)<computes>:collision_interaction}

    DefaultChannelToInteraction<epic_internal>(__dupe___unnamed_parameter_42:collision_channel)<computes>:collision_interaction = external {}

    # A collision profile determines how a volume interacts with other volumes for Overlap queries, Sweep queries, and physics simulation. When two volumes are being tested to see how they interact, the algorithm looks like this:
    #    GetInteraction(A:collision_profile, B:collision_profile):collision_interaction = 
    #        InteractionA = B.GetChannelInteraction(A.Channel) 
    #        InteractionB = A.GetChannelInteraction(B.Channel) 
    #        return Min(InteractionA, InteractionB) 
    collision_profile<native><public> := class<concrete>:
        # The collision channel for the owning object.
        Channel<native><public>:collision_channel = external {}

        # How the owning object should interact with other objects.GetChannelInteraction is a function which maps a collision_channel to a collision_interaction. It can be implemented as an simple sequence of if statements. For example, to block all channels except camera:
        #     BlockAllIgnoreCamera(Channel:collision_channel)<computes>:collision_interaction =
        #         if (CollisionChannels.camera[Channel]):
        #             return collision_interaction.Ignore
        #         return collision_interaction.Block
        #     MyProfile<public>:collision_profile = MakeCollisionProfile(CollisionChannels.dynamic, BlockAllIgnoreCamera)
        GetChannelInteraction<native><public>:collision_channel_to_interaction = external {}

    # Module import path: /Verse.org/SceneGraph/CollisionChannels
    # The set of built-in collision_channels. This is a closed set for now.
    CollisionChannels<public> := module:
        stationary<native><public> := class(collision_channel):

        dynamic<native><public> := class(collision_channel):

        avatar<native><public> := class(collision_channel):

        visibility<native><public> := class(collision_channel):

        camera<native><public> := class(collision_channel):

        physics<native><public> := class(collision_channel):

    # Module import path: /Verse.org/SceneGraph/CollisionProfiles
    # A set of useful collision profiles. New profiles can be created in Verse code
    CollisionProfiles<public> := module:
        # Stationary collision channel, Ignore all channels
        StationaryIgnoreAll<public>:collision_profile = external {}

        # Stationary collision channel, Overlap all channels
        StationaryOverlapAll<public>:collision_profile = external {}

        # Stationary collision channel, Block all channels
        StationaryBlockAll<public>:collision_profile = external {}

        # Dynamic collision channel, Ignore all channels
        DynamicIgnoreAll<public>:collision_profile = external {}

        # Dynamic collision channel, Overlap all channels
        DynamicOverlapAll<public>:collision_profile = external {}

        # Dynamic collision channel, Block all channels
        DynamicBlockAll<public>:collision_profile = external {}

        # Stationary collision channel, Block all channels except visibility (used for e.g., invisible wall, glass)
        StationaryBlockVisible<public>:collision_profile = external {}

        # Visibility collision channel, Overlap all channel (used for e.g., visibility testing)
        VisibilityOverlapAll<public>:collision_profile = external {}

    # The results of an overlap query. See entity.FindOverlapHits(). We will get one overlap_hit for each intersection of any volume in SourceVolumes with any other volume.
    overlap_hit<native><public> := struct<epic_internal>:
        # The source component and volume (query input). For compound inputs (like an entity hierarchy) this will be a component/volume in that hierarchy. The SourceTransform is the transform of SourceVolume used for the overlap test. For single volume inputs like a sphere, the Source volume and transform are just the inputs to the overlap test, and the component is false.
        SourceComponent<native><public>:?component

        # The source volume (query input)
        SourceVolume<native><public>:collision_volume

        # The source volume transform
        SourceGlobalTransform<native><public>:(/Verse.org/SpatialMath:)transform

        # The component that was hit by SourceVolume
        TargetComponent<native><public>:component

        # The volume that was hit by SourceVolume
        TargetVolume<native><public>:collision_element

    # The results of a sweep query. See entity.FindSweepHits(). We will get one sweep_hit for each intersection of any volume in SourceVolumes with any other volume.
    sweep_hit<native><public> := struct<epic_internal>:
        # The source component and volume (query input). For compound inputs (like an entity hierarchy) this will be a component/volume in that hierarchy. The SourceGlobalTransform is the transform of SourceVolume at the start of the sweep. For single volume inputs like a sphere, the volume and transform are just the inputs to the sweep, and the component is false.
        SourceComponent<native><public>:?component

        # The source volume (query input).
        SourceVolume<native><public>:collision_volume

        # The source volume transform at the start of the sweep.
        SourceStartGlobalTransform<native><public>:(/Verse.org/SpatialMath:)transform

        # The world-space translation (relative to SourceStartGlobalTransform) of SourceVolume when it touches TargetVolume.
        SourceHitTranslation<native><public>:(/Verse.org/SpatialMath:)vector3 = external {}

        # The Distance along the sweep at which SourceVolume touches TargetVolume.
        SourceHitDistance<native><public>:float = external {}

        # The component that was hit by SourceVolume.
        TargetComponent<native><public>:component

        # The volume that was hit by SourceVolume.
        TargetVolume<native><public>:collision_element

        # The point of contact between SourceVolume and TargetVolume.
        ContactPosition<native><public>:(/Verse.org/SpatialMath:)vector3 = external {}

        # The normal on TargetVolume at the HitPosition.
        ContactNormal<native><public>:(/Verse.org/SpatialMath:)vector3 = external {}

        # If TargetVolume is a polygonal object (mesh, convex hull, etc.) and the contact point is on an edge or vertex, this is the most-opposing face normal of the faces that share that edge or vertex. Otherwise it is the same as HitNormal.
        ContactFaceNormal<native><public>:(/Verse.org/SpatialMath:)vector3 = external {}

    @experimental
    contact_point<native><epic_internal> := struct<epic_internal>:
        ContactPosition<native><public>:(/Verse.org/SpatialMath:)vector3 = external {}

        ContactNormal<native><public>:(/Verse.org/SpatialMath:)vector3 = external {}

        ContactImpulse<native><public>:(/Verse.org/SpatialMath:)vector3 = external {}

        ContactDepth<native><public>:float = external {}

    @experimental
    collision_volume_pair<native><epic_internal> := struct<epic_internal>:
        SourceComponent<native><public>:component

        SourceVolume<native><public>:collision_element

        TargetComponent<native><public>:component

        TargetVolume<native><public>:collision_element

    @experimental
    collision_hit<native><epic_internal> := struct<epic_internal>:
        CollisionVolumes<native><public>:collision_volume_pair

        ContactPoints<native><public>:[]contact_point

    # Collision Volumes represent the collision shapes of meshes. They can be detected by Overlap and Sweep queries and generate collisions in the physics simulation.
    collision_volume<native><public> := class<abstract>:
        # Enable/disable collision on this volume.
        var Collidable<public>:logic = external {}

        # Enable/disable spatial queries against this volume.
        var Queryable<public>:logic = external {}

        # Get the transform of this volume in the space of its owner (usually a component on an entity)
        GetLocalTransform<public>()<transacts>:(/Verse.org/SpatialMath:)transform = external {}

        # Set the transform of this volume in the space of its owner (usually a component on an entity)
        SetLocalTransform<public>(NewLocalTransform:(/Verse.org/SpatialMath:)transform)<transacts>:void = external {}

    # Base class for collision_volumes that consist of a single volume with a single collision_profile and collision_material for the whole volume. This covers most volume types used in queries and physics, except compound types like a mesh. A query will always return an element rather than a general volume. For example when colliding with a mesh, the element will be a collision_triangle, which is a collision_element and has a single material, rather than a collision_triangle_mesh, which is not an element and has a material palette.
    collision_element<native><public> := class<abstract>(collision_volume):
        # The collision_profile for this volume.
        var CollisionProfile<public>:collision_profile = external {}

    # A collision capsule aligned along the Z axis.
    collision_capsule<native><public> := class(collision_element):
        # The radius of the capsule
        var Radius<public>:float = external {}

        # The length of the capsule's cylindrical section (distance between the two end cap centers)
        var Length<public>:float = external {}

    # A collision sphere.
    collision_sphere<native><public> := class(collision_element):
        # The radius of the sphere
        var Radius<public>:float = external {}

    # A collision point.
    collision_point<native><public> := class<concrete>(collision_element):

    # An axis-aligned collision box.
    collision_box<native><public> := class(collision_element):
        var Extents<public>:(/Verse.org/SpatialMath:)vector3

    collision_volume_internal<native><epic_internal> := class<concrete><epic_internal>(collision_element):

    @import_as("/*.FBoundedBox")
    # 3-dimensional box.
    bounded_box<native><epic_internal> := struct<concrete>:
        BoxMin:(/Verse.org/SpatialMath:)vector3 = external {}

        BoxMax:(/Verse.org/SpatialMath:)vector3 = external {}

        Valid:logic = external {}

    # Implemented by classes whose instances can provide a bounds.
    bounded<native><epic_internal> := interface:
        # Returns the associated bounded box for this object, in world space.
        GetBoundedGlobalBox<native_callable><epic_internal>()<transacts>:bounded_box

        # Returns the associated bounded box for this object, in local space.
        GetBoundedLocalBox<native_callable><epic_internal>()<transacts>:bounded_box

    # Returns the bounds of this entity by accumulating bounded components, not including owned entities, in world space.
    (InEntity:entity).GetSelfGlobalBounds<native><epic_internal>()<transacts>:bounded_box

    # Returns the bounds of this entity by accumulating bounded components, including owned entities, in world space.
    (InEntity:entity).GetGlobalBounds<native><epic_internal>()<transacts>:bounded_box

    # Returns the bounds of this entity by accumulating bounded components, not including owned entities, in local space.
    (InEntity:entity).GetSelfLocalBounds<native><epic_internal>()<transacts>:bounded_box

    # Returns the bounds of this entity by accumulating bounded components, including owned entities, in local space.
    (InEntity:entity).GetLocalBounds<native><epic_internal>()<transacts>:bounded_box

    # Base class for authoring logic and data in the SceneGraph. Using components you
    # can author re-usable building blocks of logic and data which can then be added to
    # entities in the scene.
    # 
    # Components are a very low level building block which can be used in many ways.
    # For example:
    #   * Exposing engine level concepts like mesh or sound
    #   * Adding gameplay capabilities like damage or interaction
    #   * Storing an inventory for a character in the game
    # 
    # As components are generic there is no specific way that they must be used.
    # It is up to the needs of your experience if you use one big game component
    # or if you break up logic into many small components.
    # 
    # Classes deriving from component must also specify `<final_super>` to be added
    # to entities. This ensures the class will always derive directly from `component`.
    # Further subclassing of the initial derived component is allowed and does not require
    # specifying `<final_super>` on the derived classes.
    # 
    # Only one instance of a component from each subclass group can be added to an entity
    # at a time. For example, given this group of components, only one light_component can
    # exist on a single entity. To create multiple lights you should use multiple entities.
    # 
    #   light_component             := class<final_super>(component){}
    #   capsule_light_component     := class<final>(light_component){}
    #   directional_light_component := class<final>(light_component){}
    #   spot_light_component        := class<final>(light_component){}
    #   sphere_light_component      := class<final>(light_component){}
    #   rect_light_component        := class<final>(light_component){}
    # 
    # ==============================================================================
    # Component Lifetime
    # 
    #   Components move through a series of lifetime functions as they are added
    #   to entities, added to the scene, and begin running in the simulation. Components
    #   should override these methods to perform setup and run their simulation.
    # 
    #   As a component shuts down it will then move through shutdown version of these
    #   functions, giving users the opportunity to clean up any retained state on the
    #   component before it is disposed
    # .
    #   Lifetime Methods:
    #      OnAddedToScene
    #        OnBeginSimulation -> OnSimulate<suspends>
    #        OnEndSimulation
    #      OnRemovingFromScene
    # ==============================================================================
    component<native><public> := class<abstract><unique><castable><final_super_base>(diagnosable):
        @allow_self_reference
        @experimental_always_overridden
        # The parent entity of this component.
        #   * Components must have a parent entity pointer provided when being constructed.
        #   * Components cannot be moved between parents.
        Entity<native><public>:entity

        # Called when the component is added to an entity using `entity.AddEntities`.
        #   * Components can check for dependent sibling components at this stage through `entity.GetComponents`.
        #   * Components can add additional components at this stage using `entity.AddComponents`
        OnInitialized<native><native_callable><epic_internal>():void

        # Called when the component is added to the scene by parenting it under the simulation entity or another entity already in the scene.
        #   * Querying for components in the scene is valid after this phase completes.
        OnAddedToScene<native><native_callable><protected>():void

        # Called when the component begins simulating within the scene.
        #   * Use this to set up TickEvent callbacks or other setup that must be guaranteed to complete immediately.
        #   * `OnAddedToScene` is guaranteed to run before `OnBeginSimulation`.
        OnBeginSimulation<native><native_callable><protected>():void

        # Called when the component begins simulating within the scene.
        #   * Use this to add asynchronous/suspends update logic for a component.
        #   * `OnBeginSimulation` is guaranteed to run before `OnSimulate`.
        #   * `OnSimulate` will be cancelled before `OnEndSimulation`
        OnSimulate<native_callable><protected>()<suspends>:void = external {}

        # Called when the component ends simulation within the scene.
        #   * Simulation ends on a component when the experience resets, the parent entity is removed from the scene.
        #   * Cached TickEvents cancelables should be canceled in `OnEndSimulation`.
        #   * `OnSimulate` task will be canceled before `OnEndSimulation` is called.
        #   * `OnEndSimulation` is only called on components that have already had `OnBeginSimulation` called.
        OnEndSimulation<native><native_callable><protected>():void

        # Called when the component is about to be removed from the scene.
        #   * Components are removed from a scene when the parent entity is removed from the scene.
        #   * `OnRemovingFromScene` is only called on components that have already had `OnAddedToScene` called.
        OnRemovingFromScene<native><native_callable><protected>():void

        # Called when the component is about to be removed from the parent entity.
        #   * `OnUninitializing` is only called on components that have already had `OnInitialized` called.
        OnUninitializing<native><native_callable><epic_internal>():void

        # Removes the component from the entity.
        #   * Removed components are removed from the scene and can only be added back to the same entity.
        #   * Flows through `OnEndSimulation`-> `OnRemovingFromScene`.
        RemoveFromEntity<native><final><public>():void

        # Succeeds if the component is currently initialized with its parent entity.
        #   * After `OnInitialized` is called this call succeeds.
        #   * After `OnUninitializing` is called this call fails.
        IsInitialized<native><final><epic_internal>()<reads><decides>:void

        # Succeeds if the component is currently in the scene.
        #   * After `OnAddedToScene` is called this call succeeds.
        #   * After `OnRemovingFromScene` is called this call fails.
        IsInScene<native><final><public>()<reads><decides>:void

        # Succeeds if the component is currently simulating.
        #   * After `OnBeginSimulation` is called this call succeeds.
        #   * After `OnEndSimulation` is called this call fails.
        IsSimulating<native><final><public>()<reads><decides>:void

        # Set callbacks to `TickEvents.PrePhysics` and `TickEvents.PostPhysics` to receive per-frame updates before and after physics is updated on your object.
        var<private> TickEvents<protected>:tick_events = external {}

        @experimental
        # Respond to an event being propagated through the scene graph. Returns if the event is consumed, in which case the event will not be passed to the next entity, depending on how the event is being sent through the hierarchy.
        OnReceive<native><native_callable><public>(SceneEvent:scene_event):logic

        OnInitializedInternal<native><native_callable><epic_internal>():void

        OnAddedToSceneInternal<native><native_callable><epic_internal>():void

        OnBeginSimulationInternal<native><native_callable><epic_internal>():void

        OnEndSimulationInternal<native><native_callable><epic_internal>():void

        OnRemovingFromSceneInternal<native><native_callable><epic_internal>():void

        OnUninitializingInternal<native><native_callable><epic_internal>():void

        GetDiagnostic<override><native>()<reads>:diagnostic

    @experimental
    # An event which can be sent through the scene graph.
    scene_event<native><public> := interface:

    @import_as("/Script/Entity.UBaseEntity")
    base_entity<native><epic_internal> := class<abstract>:

    # Entities are the base object in the SceneGraph.
    #   * Objects in experiences are constructed of one or more entities.
    #   * Entities are hierarchical. You can query your parent using `GetParent` and add child entities using `AddEntities`.
    #   * Behavior is added to entities through `component`s. You can add new components using `AddComponents`.
    #   * The structure and content of entities is dynamic and be changed at any time through your experience
    # .
    # ==============================================================================
    # Deriving from entity
    # 
    #   In the SceneGraph system a class that derives from `entity` is also known as a prefab. Prefabs are useful when you
    #   want to spawn/re-use a collection of entities and components many times within your game. Primarily prefabs are
    #   authored through the editor, with their Verse classes generated as part of the build into the projects
    #   Assets.digest.verse file.
    # 
    #   While you can create base prefabs for common game object types like a vehicle or character, we highly recommended
    #   that you do not add code directly to the entity class, and instead keep logic in components. Keeping logic and data in
    #   components allows you to restructure your prefabs throughout production of your experience, without needing to massively
    #   refactor your class structure.
    entity<native><public> := class<concrete><unique><transacts><castable>(base_entity, diagnosable):
        # Returns the parent entity of this entity.
        #   * The parent entity controls the lifetime of its child entities and components. When an entity
        #     is removed from the scene, all its child entities and components will be removed as well.
        #   * Method fails if there is currently no parent entity.
        GetParent<native><final><public>()<reads><decides>:entity

        # Removes this entity from its parent. This is used to remove entities from the scene.
        #   * Components on this entity and its children will run through `OnEndSimulation` -> `OnRemovingFromScene`.
        #   * Entity can be added back later by using `NewParent.AddEntities`.
        RemoveFromParent<native><final><public>():void

        # Adds the provided entities as children of this entity.
        #   * If child entity already has a parent, removes the entity from its current parent and adds it to the new one.
        #   * Added child entities will move through their lifetime methods until they match the state of the new parent.
        AddEntities<native><final><public>(NewChildEntities:[]entity):void

        # Returns the child entities belonging to this entity which are accessible from the calling context.
        #   * This method only gets the direct entity children. To query multiple levels down the entity structure use
        #     the Find* query methods instead.
        GetEntities<native><final><public>()<reads>:[]entity

        @available {MinUploadedAtFNVersion := 3200}
        # Succeeds and returns the child component of type `component_type` if it exists and is accessible from the calling context.
        #   Note: When called during the AddedToScene or BeginSimulation phase, it will make sure the returned component has achieved the corresponding phase.
        #   Fails if no component of `component_type` exists or can be accessed.
        GetComponent<native><final><public>(component_type:castable_subtype(component))<reads><decides>:component_type

        # Returns the child components belonging to this entity which are accessible from the calling context.
        GetComponents<native><final><public>()<reads>:[]component

        # Adds the provided components to the entity.
        #   * If a component is not allowed to be added to this entity it is skipped.
        #   Note: When called during the AddedToScene or BeginSimulation phase, it will make sure the added component has achieved the corresponding phase.
        #   * Components are added following these rules:
        #       1. All components are added to the entity child list.
        #       2. All components have `OnAddedToScene` called (if this entity is in the scene).
        #       3. All components have `OnBeginSimulation` called (if this entity is simulating).
        AddComponents<native><final><public>(Components:[]component):void

        GetDiagnostic<override><native>()<reads>:diagnostic

        @experimental
        # Send a scene event to only this entity. Returns true if the event was consumed.
        SendDirect<final><native><public>(SceneEvent:scene_event):logic

        @experimental
        # Send a scene event to this entity and its ancestors. Events do not propagate beyond the Simulation Entity. OnReceive will be invoked for each entity. Consuming the event will halt propagation to the next ancestor. Returns true if the event was consumed.
        SendUp<final><native><public>(SceneEvent:scene_event):logic

        @experimental
        # Send a scene event to this entity and all of its descendants. OnReceive will be invoked for each entity. Consuming the event at any entity will halt propagation down that subtree. Entities are traversed in breadth-first order, i.e. each layer is evaluated before moving deeper. Returns true if the event was consumed.
        SendDown<final><native><public>(SceneEvent:scene_event):logic

    @hide_in_editor
    root_entity<native><epic_internal> := class<concrete><unique><transacts>(entity):

    # Reference type to editor defined prefab. Only generated digest code should reference this type.
    entity_prefab<native><public> := class<computes><epic_internal>(asset):

    @hide_in_editor
    mass_component<native><epic_internal> := class<final_super><epic_internal>(component):
        OnUninitializingInternal<native><override>():void

        OnAddedToSceneInternal<native><override>():void

        OnRemovingFromSceneInternal<native><override>():void

    # Interface to provide alternative origin to an entity which is defaulted to its parent. See `transform_component`
    origin<native><public> := interface<epic_internal>:
        GetTransform<native_callable><public>()<transacts>:(/Verse.org/SpatialMath:)transform

    @available {MinUploadedAtFNVersion := 3200}
    # class to provide alternative origin to the 'transform_component' as an entity
    entity_origin<native><public> := class<final>(origin):
        @editable
        @replicated("")
        Entity<native><public>:entity

        GetTransform<override>()<transacts>:(/Verse.org/SpatialMath:)transform = external {}

    @import_as("/Script/CoreUObject.UObject")
    actor<native><epic_internal> := class:

    # class to provide alternative origin to the 'transform_component' as an actor. This class should never be public and is intended for internal use only.
    actor_origin<native><epic_internal> := class(origin):
        @editable
        @replicated("RepNotify")
        Actor<native><epic_internal>:actor

        GetTransform<native><override>()<transacts>:(/Verse.org/SpatialMath:)transform

    @experimental
    # Used to attach entities to a socket on an actor.
    socket_origin<native><epic_internal> := class(actor_origin):
        @editable
        @replicated("")
        var SocketName<native><public>:string

    replication_component<native><epic_internal> := class<final_super>(component):
        OnAddedToSceneInternal<native><override>():void

        OnRemovingFromSceneInternal<native><override>():void

        OnBeginSimulationInternal<native><override>():void

        OnEndSimulationInternal<native><override>():void

        @editable
        # Internal only flag to enable or disable replication
        EnableReplication<native><epic_internal>:logic = external {}

        @editable
        # Internal only flag to make this entity always relevant for replication to clients
        AlwaysRelevant<native><epic_internal>:logic = external {}

    @hide_in_editor
    simulation_entity<native><epic_internal> := class<concrete><unique><transacts>(root_entity):

    # Returns the simulation entity parent for this entity.
    #   * The simulation entity is the rootmost entity in an experience.
    #   * Fails if this entity is not currently in the scene.
    (InEntity:entity).GetSimulationEntity<native><public>()<transacts><decides>:entity

    # Describes discrete phases of a frame update. Subscribe to members of the tick_events object to run code before or after the physics system has updated your object, allowing you to affect or react to these updates.
    tick_events<native><public> := class<epic_internal>:
        # Listen `PrePhysics` to run your code before the physics system has updated your object this frame.
        PrePhysics<native><public>:execution_listenable = external {}

        StartPhysics<native><epic_internal>:execution_listenable = external {}

        DuringPhysics<native><epic_internal>:execution_listenable = external {}

        EndPhysics<native><epic_internal>:execution_listenable = external {}

        # Listen `PostPhysics` to run your code after the physics system has updated your object this frame.
        PostPhysics<native><public>:execution_listenable = external {}

        EndFrame<native><epic_internal>:execution_listenable = external {}

    # Stores the transforms for an entity, which are used to position the entity.
    transform_component<native><public> := class<final><final_super>(component):
        OnInitializedInternal<native><override>():void

        OnUninitializingInternal<native><override>():void

        # Current transform of the entity, globally referenced. Any value set at construction will be overrridden with the calculation from the Local Transform
        var GlobalTransform<public>:(/Verse.org/SpatialMath:)transform = external {}

        var<private> GlobalTransformInternal<native><private>:(/Verse.org/SpatialMath:)transform = external {}

        # LocalTransform to its parent/origin
        var LocalTransform<public>:(/Verse.org/SpatialMath:)transform = external {}

        @editable {}
        @display_name("LocalTransform")
        @replicated("RepNotify")
        var<private> LocalTransformInternal<native><private>:(/Verse.org/SpatialMath:)transform = external {}

        # alternate origin than the default parent entity
        var Origin<public>:?origin = external {}

        @editable {}
        @display_name("Origin")
        @replicated("RepNotify")
        var<private> OriginInternal<native><private>:?origin = external {}

    # Returns the global transform of this entity, in the case the entity does not have a transform_component it will return the transform of the first parent that has a transform
    (InEntity:entity).GetGlobalTransform<native><public>()<transacts>:(/Verse.org/SpatialMath:)transform

    # Returns the local transform of this entity, in the case the entity does not have a transform_component it will return identity
    (InEntity:entity).GetLocalTransform<native><public>()<transacts>:(/Verse.org/SpatialMath:)transform

    # Returns the origin of the entity in any, in the case the entity does not have a transform_component the method will fail
    (InEntity:entity).GetOrigin<native><public>()<transacts><decides>:origin

    # Sets the global transform of this entity, in the case the entity does not have a transform_component it will create one and set its global transform
    (InEntity:entity).SetGlobalTransform<native><public>(NewGlobalTransform:(/Verse.org/SpatialMath:)transform)<transacts>:void

    # Sets the local transform of this entity, in the case the entity does not have a transform_component it will create one and set its local transform
    (InEntity:entity).SetLocalTransform<native><public>(NewLocalTransform:(/Verse.org/SpatialMath:)transform)<transacts>:void

    # Sets the origin of this entity, in the case the entity does not have a transform_component it will create one and set its origin. This method fails if it recognized dependency recursion.
    (InEntity:entity).SetOrigin<native><public>(NewOrigin:origin)<transacts>:void

    # Resets the origin of this entity, which will now default to its parent
    (InEntity:entity).ResetOrigin<native><public>()<transacts>:void
    execution_subscription<native><epic_internal> := class(cancelable):
        Cancel<native><override>()<transacts>:void

        RunAfter<native><epic_internal>(__dupe___unnamed_parameter_24:execution_subscription):void

        RunBefore<native><epic_internal>(__dupe___unnamed_parameter_25:execution_subscription):void

    # Users to subscribe to, or await on, a DeltaTime based callback from one of the phases in a component's `TickEvents` object.'
    # 
    # IMPORTANT: You must keep a pointer on your component to the returned `cancelable`. Otherwise the GC will eventually clean up your subscription and your callback will stop being invoked.
    execution_listenable<native><public> := class<epic_internal>(listenable(float)):
        # Suspends the current task until resumed by a matching call to `signalable.Signal`. Returns the event `payload`.
        Await<native><override>()<suspends>:float

        # Subscribe a callback function to this TickEvent phase. The input parameter to your function (DeltaTime) is the time that has passed between the last update and the current update.
        Subscribe<native><override>(Callback:type {_(:float):void})<transacts>:cancelable

    # Used to subscribe a callback or await an event based callback '
    # 
    # IMPORTANT: You must keep a pointer on your component to the returned `cancelable`. Otherwise the GC will eventually clean up your subscription and your callback will stop being invoked.
    execution_event<native><epic_internal> := class<epic_internal>(listenable(tuple())):
        # Suspends the current task until resumed by a matching call to `signalable.Signal`.
        Await<native><override>()<suspends>:tuple()

        # Subscribe a callback function to this event.
        Subscribe<native><override>(Callback:type {_():void})<transacts>:cancelable

SceneGraphTests<public> := module:
    using {/Verse.org/Simulation}
    using {/Verse.org/SceneGraph}
    @hide_in_editor
    @experimental
    Test_CustomInteractTime<native><epic_internal> := class<epic_internal>(interactable_component):
        var CurrentAgent<public>:agent

        var TimesSucceeded<native><public>:int = external {}

        OnBeginSimulation<override>():void = external {}

        OnStarted<override>(Agent:agent)<transacts><decides>:void = external {}

    @hide_in_editor
    @experimental
    Test_OnStartedNoSignalling<native><epic_internal> := class<epic_internal>(interactable_component):
        var CurrentAgent<public>:agent

        var TimesSucceeded<native><public>:int = external {}

        OnBeginSimulation<override>():void = external {}

        OnStarted<override>(Agent:agent)<transacts><decides>:void = external {}

    @hide_in_editor
    @experimental
    Test_InitBasicVariables<native><epic_internal> := class<epic_internal>(basic_interactable_component):
        OnBeginSimulation<override>():void = external {}


using {/UnrealEngine.com/ControlInput}
using {/Verse.org/Simulation}
# Module import path: /Verse.org/ControlInput
(/Verse.org:)ControlInput<public> := module:
    GetPlayerInputDeprecated<epic_internal>(Player:player)<transacts><decides>:player_input = external {}

Simulation<public> := module:
    using {/Verse.org/Native}
    # Module import path: /Verse.org/Simulation/Tags
    Tags<public> := module:
        # A single gameplay tag, which represents a hierarchical name of the form x.y that is registered in the GameplayTagsManager You can filter the gameplay tags displayed in the editor.
        tag<native><public> := class<abstract>:

        @import_as("/Script/VerseGameplayTags.FVerseGameplayTag")
        # Utility structure which allows users to select a gameplay tag when exposed to editor
        tag_selector<native><epic_internal> := struct<concrete>:

        # Get a string representation of the gameplay tag. Useful for debugging.
        (/Verse.org/Simulation/Tags:)ToString<native><epic_internal>(__dupe___unnamed_parameter_24:tag)<computes>:string

        # Succeeds if Left and Right are equal.
        Equals<native><epic_internal>(Left:tag, Right:tag)<transacts><decides>:void

        # Utility function to allow for easy construction from subclass
        MakeTagFromSubClass<native><epic_internal>(tag_type:subtype(tag))<transacts><decides>:tag

        # Utility function to allow for easy construction from editor exposable tag_selector
        MakeTag<native><epic_internal>(Selector:tag_selector)<transacts><decides>:tag

        # A queryable collection of gameplay tags.
        tag_view<native><public> := interface<epic_internal>:
            # Determine if TagToCheck is present in this container, also checking against parent tags {"A.1"}.Has("A") will return True, {"A"}.Has("A.1") will return False If TagToCheck is not Valid it will always return False.
            Has<public>(TagToCheck:tag)<reads><decides>:void

            # Checks if this container contains ANY of the tags in the specified container, also checks against parent tags {"A.1"}.HasAny({"A","B"}) will return True, {"A"}.HasAny({"A.1","B"}) will return False If InTags is empty/invalid it will always return False.
            HasAny<public>(InTags:[]tag)<reads><decides>:void

            # Checks if this container contains ALL of the tags in the specified container, also checks against parent tags {"A.1","B.1"}.HasAll({"A","B"}) will return True, {"A","B"}.HasAll({"A.1","B.1"}) will return False If InTags is empty/invalid it will always return True, because there were no failed checks.
            HasAll<public>(InTags:[]tag)<reads><decides>:void

        # A mutable collection of gameplay tags.
        tag_container<native><epic_internal> := class<concrete>(tag_view):
            # Add the specified tag to the container.
            Add<native><epic_internal>(Tag:tag):void

            # Remove the specified tag from the container.
            Remove<native><epic_internal>(Tag:tag)<decides>:void

            # Adds all the tags from one container to this container NOTE: From set theory, this effectively is the union of the container this is called on with TagsToAdd.
            Add<native><epic_internal>(TagsToAdd:[]tag):void

            # Removes all tags in TagsToRemove from this container.
            Remove<native><epic_internal>(TagsToRemove:[]tag):void

            # Adds all the tags from one container to this container NOTE: From set theory, this effectively is the union of the container this is called on with TagsToAdd.
            Add<native><epic_internal>(TagsToAdd:tag_container):void

            # Removes all tags in TagsToRemove from this container.
            Remove<native><epic_internal>(TagsToRemove:tag_container):void

            # Remove all tags from the container. Will maintain slack by default.
            Reset<native><epic_internal>():void

            # Remove all tags from the container. Update the amount of slack pre-allocated for tags.
            ResetWithSlack<native><epic_internal>(slack:int):void

            # Determine if TagToCheck is present in this container, also checking against parent tags {"A.1"}.Has("A") will return True, {"A"}.Has("A.1") will return False If TagToCheck is not Valid it will always return False.
            Has<native><override>(TagToCheck:tag)<reads><decides>:void

            # Checks if this container contains ANY of the tags in the specified container, also checks against parent tags {"A.1"}.HasAny({"A","B"}) will return True, {"A"}.HasAny({"A.1","B"}) will return False If InTags is empty/invalid it will always return False.
            (/Verse.org/Simulation/Tags/tag_view:)HasAny<native><override>(InTags:[]tag)<reads><decides>:void

            # Checks if this container contains ALL of the tags in the specified container, also checks against parent tags {"A.1","B.1"}.HasAll({"A","B"}) will return True, {"A","B"}.HasAll({"A.1","B.1"}) will return False If InTags is empty/invalid it will always return True, because there were no failed checks.
            (/Verse.org/Simulation/Tags/tag_view:)HasAll<native><override>(InTags:[]tag)<reads><decides>:void

            # Checks if this container contains ANY of the tags in the specified container, also checks against parent tags {"A.1"}.HasAny({"A","B"}) will return True, {"A"}.HasAny({"A.1","B"}) will return False If InTags is empty/invalid it will always return False.
            (/Verse.org/Simulation/Tags/tag_container:)HasAny<native><epic_internal>(InTags:tag_container)<reads><decides>:void

            # Checks if this container contains ALL of the tags in the specified container, also checks against parent tags {"A.1","B.1"}.HasAll({"A","B"}) will return True, {"A","B"}.HasAll({"A.1","B.1"}) will return False If InTags is empty/invalid it will always return True, because there were no failed checks.
            (/Verse.org/Simulation/Tags/tag_container:)HasAll<native><epic_internal>(InTags:tag_container)<reads><decides>:void

            # Returns the number of explicitly added tags.
            Num<native><epic_internal>()<reads>:int

            @available {MinUploadedAtFNVersion := 2930}
            # Returns a generator for the tags in this container. This is an expensive operation since it will create new tag instances for all tags in the container. Do preferably not use this function for anything else than debugging.
            GetTags<native><epic_internal>()<transacts>:generator(tag)

        # Returns abbreviated human readable Tag list. Useful for debugging.
        (/Verse.org/Simulation/Tags:)ToString<native><epic_internal>(__dupe___unnamed_parameter_27:tag_container)<computes>:string

        @import_as("/Script/VerseGameplayTags.FVerseGameplayTagContainer")
        # Utility structure which allows users to select a gameplay tag when exposed to editor
        tag_selector_container<native><epic_internal> := struct<concrete>:

        # Create a tag container from an array of gameplay_tag.
        MakeTagContainer<native><constructor><epic_internal>(InTags:[]tag)<transacts>:tag_container

        # Succeeds if all tags in Left are found in Right and all tags in Right are found in Left.
        Equals<native><epic_internal>(Left:tag_container, Right:tag_container)<transacts><decides>:void

        # Utility function to allow for easy construction from editor exposable tag_selector_container
        MakeTagContainer<native><epic_internal>(Selector:tag_selector_container)<transacts><decides>:tag_container

        tag_search_sort_type<native><public> := enum:
            Unsorted
            Sorted

        # Advanced tag search criteria
        tag_search_criteria<native><public> := class:
            # Tags required to be on the object.
            RequiredTags<native><public>:[]tag = external {}

            # Tags that are used if no required tags are specified. These are treated as if any of them will do.
            PreferredTags<native><public>:[]tag = external {}

            # Tags that may NOT be on the object. All items with these tags are excluded from the search.
            ExclusionTags<native><public>:[]tag = external {}

            # Flag to request sorting the results by tag.
            SortType<native><public>:tag_search_sort_type = external {}

    @attribscope_class
    @attribscope_data
    @customattribhandler
    allow_self_reference<epic_internal> := class<computes>(attribute):

    @attribscope_class
    @attribscope_data
    @attribscope_function
    @customattribhandler
    category_attribute<epic_internal> := class<computes><internal>(attribute):

    category<constructor><epic_internal>(Category:string)<computes>:category_attribute = external {}

    @attribscope_data
    @customattribhandler
    clamp_max_attribute<epic_internal> := class<computes><internal>(attribute):

    clamp_max<constructor><epic_internal>(ClampMax:string)<computes>:clamp_max_attribute = external {}

    @attribscope_data
    @customattribhandler
    clamp_min_attribute<epic_internal> := class<computes><internal>(attribute):

    clamp_min<constructor><epic_internal>(ClampMin:string)<computes>:clamp_min_attribute = external {}

    @attribscope_class
    @attribscope_data
    @attribscope_function
    @customattribhandler
    display_name_attribute<epic_internal> := class<computes><internal>(attribute):

    display_name<constructor><epic_internal>(DisplayName:string)<computes>:display_name_attribute = external {}

    @attribscope_class
    @attribscope_data
    @attribscope_function
    @customattribhandler
    display_priority_attribute<epic_internal> := class<computes><internal>(attribute):

    display_priority<constructor><epic_internal>(DisplayPriority:string)<computes>:display_priority_attribute = external {}

    editable_empty_message<localizes><epic_internal>:message = external {}

    @attribscope_class
    @attribscope_struct
    @attribscope_data
    @customattribhandler
    editable<public> := class<computes>(attribute):
        # The tooltip displayed in the editor.
        ToolTip<public>:message = external {}

        # The short tooltip displayed in the editor.
        ShortToolTip<epic_internal>:message = external {}

        # The thumbnail shown in the content browser.
        ShowThumbnail<epic_internal>:logic = external {}

        # The categories displayed in the editor.
        Categories<public>:[]message = external {}

        EditInline<epic_internal>:logic = external {}

        # If true the property will only be displayed if epic developer permission exist.
        EpicOnly<epic_internal>:logic = external {}

    @attribscope_class
    @attribscope_struct
    @attribscope_data
    @customattribhandler
    editable_non_concrete<epic_internal> := class<computes>(attribute):
        EditInline<epic_internal>:logic = external {}

    @attribscope_class
    @attribscope_struct
    @attribscope_data
    @customattribhandler
    editable_text_box<public> := class<final><computes>(editable):
        # True if the editor text box should support multiple lines.
        MultiLine<public>:logic = external {}

        # The maximum length of the text.
        MaxLength<public>:int = external {}

    @attribscope_class
    @attribscope_struct
    @attribscope_data
    @customattribhandler
    editable_slider<public>(t:type) := class<final><computes>(editable):
        # The minimum value of the editor slider.
        MinValue<public>:?t = external {}

        # The maximum value of the editor slider.
        MaxValue<public>:?t = external {}

        # The amount the slider moves for each step.
        SliderDelta<public>:?t = external {}

        # Used to scale a slider exponentially. Common values are found within the range of 1-20.
        SliderExponent<public>:?t = external {}

        # Used to change how sensitive the field value is when moving the slider via mouse cursor.
        MouseLinearDeltaSensitivity<public>:float = external {}

        MouseShiftMovePixelPerDelta<public>:float = external {}

    @attribscope_class
    @attribscope_struct
    @attribscope_data
    @customattribhandler
    editable_number<public>(t:type) := class<final><computes>(editable):
        # The minimum value the editor allows.
        MinValue<public>:?t = external {}

        # The maximum value the editor allows.
        MaxValue<public>:?t = external {}

        # Snap the spinbox to the nearest delta.
        SpinBoxDelta<public>:?t = external {}

    @attribscope_class
    @attribscope_struct
    @attribscope_data
    @customattribhandler
    editable_vector_slider<public>(t:type) := class<final><computes>(editable):
        # Show the button that allows locking the vector aspect ratio.
        ShowPreserveRatio<public>:logic = external {}

        # Show the button that allows normalizing the vector.
        ShowNormalize<public>:logic = external {}

        # The minimum value allowed for each vector element.
        MinComponentValue<public>:?t = external {}

        # The maximum value allowed for each vector element.
        MaxComponentValue<public>:?t = external {}

        # The amount the slider moves for each step.
        SliderDelta<public>:?t = external {}

        # Used to scale a slider exponentially. Common values are found within the range of 1-20.
        SliderExponent<public>:?t = external {}

        # Used to change how sensitive the field value is when moving the slider via mouse cursor.
        MouseLinearDeltaSensitivity<public>:float = external {}

        MouseShiftMovePixelPerDelta<public>:float = external {}

    @attribscope_class
    @attribscope_struct
    @attribscope_data
    @customattribhandler
    editable_vector_number<public>(t:type) := class<final><computes>(editable):
        # Show the button that allows locking the vector aspect ratio.
        ShowPreserveRatio<public>:logic = external {}

        # Show the button that allows normalizing the vector.
        ShowNormalize<public>:logic = external {}

        # The minimum value allowed for each vector element.
        MinComponentValue<public>:?t = external {}

        # The maximum value allowed for each vector element.
        MaxComponentValue<public>:?t = external {}

        # Snap the spinbox to the nearest delta.
        SpinBoxDelta<public>:?t = external {}

    @attribscope_class
    @attribscope_struct
    @attribscope_data
    @customattribhandler
    editable_container<public> := class<final><computes>(editable):
        # If true, allows reordering of the container elements in the editor.
        AllowReordering<public>:logic = external {}

    @attribscope_class
    @customattribhandler
    editor_type<epic_internal> := class<computes>(attribute):

    @attribscope_class
    @attribscope_data
    @customattribhandler
    experimental_always_overridden<epic_internal> := class<computes>(attribute):

    @attribscope_class
    @customattribhandler
    hide_in_editor<epic_internal> := class<computes>(attribute):

    @attribscope_class
    @attribscope_data
    @attribscope_function
    @customattribhandler
    short_tool_tip_attribute<epic_internal> := class<computes><internal>(attribute):

    short_tool_tip<constructor><epic_internal>(ShortToolTip:string)<computes>:short_tool_tip_attribute = external {}

    @attribscope_class
    @attribscope_data
    @attribscope_function
    @customattribhandler
    tool_tip_attribute<epic_internal> := class<computes><internal>(attribute):

    tool_tip<constructor><epic_internal>(ToolTip:string)<computes>:tool_tip_attribute = external {}

    @attribscope_data
    @customattribhandler
    ui_max_attribute<epic_internal> := class<computes><internal>(attribute):

    ui_max<constructor><epic_internal>(UIMax:string)<computes>:ui_max_attribute = external {}

    @attribscope_data
    @customattribhandler
    ui_min_attribute<epic_internal> := class<computes><internal>(attribute):

    ui_min<constructor><epic_internal>(UIMin:string)<computes>:ui_min_attribute = external {}

    @attribscope_data
    @customattribhandler
    units_attribute<epic_internal> := class<computes><internal>(attribute):

    units<constructor><epic_internal>(Unit:string)<computes>:units_attribute = external {}
    agent<native><public> := class<unique><epic_internal>:

    localizable_agent<native><epic_internal> := class(localizable_value):
        Value<native><epic_internal>:agent

    (/Verse.org/Simulation:)MakeLocalizableValue<epic_internal>(Agent:agent):localizable_agent = external {}

    player<native><public> := class<unique><persistent><module_scoped_var_weak_map_key><epic_internal>(agent):
        # Succeeds when this `player` may be used as a module-scoped `var` `weak_map` key. This coincides with the corresponding player having joined the game and not yet left. Using a `player` as a module-scope `var` `weak_map` key when this method fails results in a runtime error.
        IsActive<native><public>()<reads><decides>:void

    # Type for which there is a single instance per round.  Use `GetSession` to get the current round's `session` instance. May be used with `weak_map` to implement global variables.
    # Note: may be changed in a future release to a single instance per game. Round-local behavior should not be relied upon.
    session<native><public> := class<unique><module_scoped_var_weak_map_key><epic_internal>:

    # Returns the `session` corresponding to the current round.  The result can be used with `weak_map` to implement global variables.
    # Note: may be changed in a future release to return a single instance per game. Round-local behavior should not be relied upon.
    GetSession<native><public>()<reads>:session

    # Waits specified number of seconds and then resumes. If `Seconds` = 0.0 then it waits until next tick/frame/update. If `Seconds` = Inf then it waits forever and only calls back if canceled - such as via `race`. If `Seconds` < 0.0 then it completes immediately and does not yield to other aysnc expressions.
    # Waiting until the next update (0.0) is especially useful in a loop of a coroutine that needs to do some work every update and this yields to other coroutines so that it doesn't hog a processor's resources.
    # Waiting forever (Inf) will have any expression that follows never be evaluated. Occasionally it is desireable to have a task never complete such as the last expression in a `race` subtask where the task must never win the race though it still may be canceled earlier.
    # Immediately completing (less than 0) is useful when you want programmatic control over whether an expression yields or not.
    Sleep<native><public>(Seconds:float)<suspends>:void

    # Get the seconds that have elapsed since the world began simulating
    GetSimulationElapsedTime<native><public>()<transacts>:float

    team<native><public> := class<unique><epic_internal>:

using {/Verse.org/Native}
using {/Verse.org/Restricted}
# Module import path: /Verse.org/Assets
Assets<public> := module:
    # Create an asset reference to the given internal asset path
    MakeAsset<native><epic_internal>(asset_type:subtype(asset), AssetPath:string)<converges>:asset_type

    asset<native><epic_internal> := class<computes><epic_internal>:
        SyncLoad<native><epic_internal>():logic

        Async_Load<native><epic_internal>():sticky_event(void)

        GetAsyncLoadEvent<native><epic_internal>()<decides>:sticky_event(void)

        GetAssetType<native><epic_internal>()<transacts><decides>:subtype(asset)

    client_asset<native><epic_internal> := class<abstract><computes><epic_internal>(asset):

    animation<native><epic_internal> := class<computes><final><epic_internal>(asset):

    animation_blueprint<native><epic_internal> := class<computes><final><epic_internal>(asset):

    animation_instance<native><epic_internal> := class<computes><final><epic_internal>(asset):

    animation_sequence<native><public> := class<computes><final><epic_internal>(asset):

    material<native><public> := class<epic_internal>(asset, property_changed_interface):
        MaterialPath<native><epic_internal>:string = external {}

        OnPropertyChangedFromVerse<native><override>(PropertyName:string)<transacts>:void

    material_parameter_collection<native><epic_internal> := class<epic_internal>(asset, property_changed_interface):
        MPCPath<native><epic_internal>:string = external {}

        OnPropertyChangedFromVerse<native><override>(PropertyName:string)<transacts>:void

        var Enabled<public>:logic = external {}

        ___PropertyInterface_On_Enabled_Changed<epic_internal>():void = external {}

    particle_system<native><public> := class<computes><final><epic_internal>(client_asset):

    skeletal_mesh<native><epic_internal> := class<computes><final><epic_internal>(mesh):

    mesh<native><public> := class<computes><epic_internal>(asset):

    sound<native><epic_internal> := class<computes><final><epic_internal>(client_asset):

    sound_wave<native><public> := class<computes><final><epic_internal>(client_asset):

    metasound<native><epic_internal> := class<computes><final><epic_internal>(client_asset):

    font<native><epic_internal> := class<computes><final><epic_internal>(client_asset):

    level<native><epic_internal> := class<computes><final><epic_internal>(asset):

    texture_base<native><epic_internal> := class<computes><epic_internal>(asset):

    texture<native><public> := class<computes><final><epic_internal>(texture_base):

    input_action<native><epic_internal>(t:type) := class<computes><epic_internal>(asset):
        Path<native><epic_internal>:string = external {}

        RequiredByCompiler<epic_internal>:?t = external {}

    input_mapping<native><epic_internal> := class<computes><epic_internal>(asset):

    camera_rig_asset<native><epic_internal> := class<computes><epic_internal>(asset):

    # The UClass generated by the PropertyInterface asset. It represents the property_interface verse class but with UE5 properties.
    property_interface_UE5_definition<native><epic_internal> := class<computes><final>(asset):

    # property_interface that will be generated in the digest from the Editable
    parameterized_property_interface<native><epic_internal> := class<unique>(property_changed_interface):
        UE5Class<native><epic_internal>:property_interface_UE5_definition

        OnPropertyChangedFromVerse<native><override>(PropertyName:string)<transacts>:void
Temporary<public> := module:
    # Module import path: /Verse.org/Temporary/EpicGamesRestricted
    EpicGamesRestricted<public> := module:
        # Module import path: /Verse.org/Temporary/EpicGamesRestricted/Network
        Network<public> := module:
            @attribscope_data
            @customattribhandler
            replicated_attribute<epic_internal> := class<computes><internal>(attribute):

            replicated<constructor><epic_internal>(ReplicationArgs:string)<computes>:replicated_attribute = external {}

# Module import path: /Verse.org/VerseEngine
VerseEngine<public> := module:
    subscribable_event<epic_internal>(t:type) := class(subscribable_event_intrnl(t)):
        Broadcast<epic_internal>(Val:t):void = external {}


# Module import path: /Verse.org/Restricted
Restricted<public> := module:
    sticky_event<native><public>(t:type) := class(event(t)):
        IsSignaled<native><public>()<decides>:void

        ClearSignal<native><public>():void

        Await<native><override>()<suspends>:t

        Signal<native><override>(__dupe___unnamed_parameter_24:t):void

    sticky_event<public>() := sticky_event(void)
Verse<public> := module:
    using {/Verse.org/Colors}
    # Writes `Message` to a dedicated `Print` log while displaying it in `Color` on the client screen for `Duration` seconds. By default, `Color` is `NamedColors.White` and `Duration` is `2.0` seconds.
    Print<native><public>(Message:string, ?Duration:float = external {}, ?Color:color = external {})<transacts>:void

    # Writes `Message` to a dedicated `Print` log while displaying it in `Color` on the client screen for `Duration` seconds. By default, `Color` is `NamedColors.White` and `Duration` is `2.0` seconds.
    Print<native><public>(Message:message, ?Duration:float = external {}, ?Color:color = external {})<transacts>:void

    # Writes `Message` to a dedicated `Print` log while displaying it in `Color` on the client screen for `Duration` seconds. By default, `Color` is `NamedColors.White` and `Duration` is `2.0` seconds.
    Print<public>(Message:diagnostic, ?Duration:float = external {}, ?Color:color = external {})<transacts>:void = external {}
    # Makes a flattened `array` by concatenating the elements of `Arrays`.
    Concatenate<public>(Arrays:[][]t where t:type)<computes>:[]t = external {}

    # Makes an `array` containing `Input`'s elements from `StartIndex` to `StopIndex-1`.
    # Fails unless `0 <= StartIndex <= StopIndex <= Input.Length`.
    (Input:[]t where t:type).Slice<public>(StartIndex:int, StopIndex:int)<computes><decides>:[]t = external {}

    # Makes an `array` containing `Input`'s elements from `StartIndex` to `Input.Length-1`.
    # Succeeds if `0 <= StartIndex <= Input.Length`.
    (Input:[]t where t:type).Slice<public>(StartIndex:int)<computes><decides>:[]t = external {}

    # Makes an `array` by inserting `ElementsToInsert` into `Input` such that the first element of `ElementsToInsert` is at `InsertionIndex`.
    (Input:[]t where t:type).Insert<public>(InsertionIndex:int, ElementsToInsert:[]t)<computes><decides>:[]t = external {}

    # Makes an `array` by removing the element at `IndexToRemove` from `Input`.
    # Succeeds if `0 <= IndexToRemove <= Input.Length-1`.
    (Input:[]t where t:type).RemoveElement<public>(IndexToRemove:int)<computes><decides>:[]t = external {}

    # Makes an `array` by removing the element at the lowest index that equals `ElementToRemove` from `Input`.
    # Fails if `Input` did not contain any instances of `ElementToRemove`.
    (Input:[]t where t:subtype(comparable)).RemoveFirstElement<public>(ElementToRemove:t)<computes><decides>:[]t = external {}

    # Makes an `array` by removing all elements that equal `ElementToRemove` from `Input`.
    (Input:[]t where t:subtype(comparable)).RemoveAllElements<public>(ElementToRemove:t)<computes>:[]t = external {}

    # Makes an `array` by replacing the element at `IndexToReplace` with `ElementToReplaceWith` in `Input`.
    # Succeeds if `0 <= IndexToReplace <= Input.Length-1`.
    (Input:[]t where t:type).ReplaceElement<public>(IndexToReplace:int, ElementToReplaceWith:t)<computes><decides>:[]t = external {}

    # Makes an `array` by replacing the element at the lowest index that equals `ElementToReplace` with `ElementToReplaceWith` in `Input`.
    # Fails if `Input` did not contain any instances of `ElementToReplace`.
    (Input:[]t where t:subtype(comparable)).ReplaceFirstElement<public>(ElementToReplace:t, ElementToReplaceWith:t)<computes><decides>:[]t = external {}

    # Makes an `array` by replacing all elements that equal `ElementToReplace` with `ElementToReplaceWith` in `Input`.
    (Input:[]t where t:subtype(comparable)).ReplaceAllElements<public>(ElementToReplace:t, ElementToReplaceWith:t)<computes>:[]t = external {}

    # Makes an `array` by replacing all ranges of elements that equal `ElementsToReplace` with `Replacement` in `Input`.
    # When there are multiple overlapping instances of `ElementsToReplace` in `Input`, only the position with the lowest index is replaced.
    (Input:[]t where t:subtype(comparable)).ReplaceAll<public>(ElementsToReplace:[]t, Replacement:[]t)<transacts>:[]t = external {}

    # Makes an `array` by removing `Input`'s elements from `StartIndex` to `StopIndex-1`.
    # Succeeds if `0 <= StartIndex <= StopIndex <= Input.Length`.
    (Input:[]t where t:type).Remove<public>(StartIndex:int, StopIndex:int)<computes><decides>:[]t = external {}

    # Returns the first index whose element in `Input` equals `ElementToFind`.
    # Fails if ElementToFind does not exist in the array.
    (Input:[]t where t:subtype(comparable)).Find<public>(ElementToFind:t)<computes><decides>:int = external {}

    # Implemented by classes that allow users to cancel an operation. For example, calling `subscribable.Subscribe` with a callback returns a `cancelable` object. Calling `Cancel` on the return object unsubscribes the callback.
    cancelable<native><public> := interface:
        # Prevents any current or future work from completing.
        Cancel<native_callable><public>()<transacts>:void

    @available {MinUploadedAtFNVersion := 3300}
    # Return an immediate subclass of base_type that is <castable> and <final_super> and is also shared with Instance. Otherwise failure.
    GetCastableFinalSuperClass<native><epic_internal>(base_type:type, Instance:base_type)<reads><decides>:castable_subtype(base_type)

    @available {MinUploadedAtFNVersion := 3300}
    # Return an immediate subclass of base_type that is <castable> and <final_super> and is also shared with sub_type. Otherwise failure.
    GetCastableFinalSuperClassFromType<native><epic_internal>(base_type:type, sub_type:subtype(base_type))<reads><decides>:castable_subtype(base_type)

    accessor<epic_internal> := enum:
        Dummy

    # An opaque diagnostic message that only shows up in diagnostic logs. The format of the diagnostic may change at any time without warning and may not be inspected by Verse code.
    diagnostic<native><public> := class<computes><epic_internal>(diagnosable):
        String<native><epic_internal>:string

        GetDiagnostic<override>()<reads>:diagnostic = external {}

    # Concatenates two diagnostic messages.
    operator'+'<public>(Lhs:diagnostic, Rhs:diagnostic)<computes>:diagnostic = external {}

    # Concatenates a diagnostic message with a normal string, yielding a diagnostic message.
    operator'+'<public>(Lhs:diagnostic, Rhs:string)<computes>:diagnostic = external {}

    # Concatenates a normal string with a diagnostic message, yielding a diagnostic message.
    operator'+'<public>(Lhs:string, Rhs:diagnostic)<computes>:diagnostic = external {}

    # Converts any Verse value into an opaque diagnostic message.
    ToDiagnostic<native><public>(Value:any)<reads>:diagnostic

    # Provides a hook for class-specific ToDiagnostic behavior; ToDiagnostic will call this interface when provided a class that implements it.
    diagnosable<native><epic_internal> := interface:
        GetDiagnostic<native_callable><epic_internal>()<reads>:diagnostic

    # Implemented by classes whose instances have limited lifetimes.
    disposable<native><public> := interface:
        # Cleans up this object.
        Dispose<public>():void

    # Implemented by classes whose instances can be enabled and disabled.
    enableable<native><public> := interface<public>:
        # Enable this object.
        Enable<public>():void

        # Disable this object.
        Disable<public>():void

        # Succeeds if the object is enabled, fails if it’s disabled.
        IsEnabled<public>()<transacts><decides>:void

    # Halts the Verse runtime with error `Message`.
    Err<native><public>(Message:string)<computes>:false

    event_base_intrnl<native><epic_internal> := class:

    # A *recurring*, successively signaled parametric `event` with a `payload` allowing a simple mechanism to coordinate between concurrent tasks.
    event<native><public>(t:type) := class(event_base_intrnl, signalable(t), awaitable(t)):
        # Suspends the current task until another task calls `Signal`.
        # If called during another invocation of `Signal`, the the task will still suspend and resume during the next call to `Signal`.
        Await<native><override>()<suspends>:t

        # Concurrently resumes the tasks that were suspended by `Await` calls before this call to `Signal`.
        # 
        # Tasks are resumed in the order they were suspended. Each task will perform as much work as it can until it encounters a blocking call, whereupon it will transfer control to the next suspended task.
        Signal<native><override>(Val:t):void

    # A *recurring*, successively signaled event allowing a simple mechanism to coordinate between concurrent tasks.
    event<public>() := event(tuple())

    subscribable_event_intrnl<native><epic_internal>(t:type) := class(event(t), listenable(t)):
        # Registers `Callback` to be invoked each time `Signal` is called.
        # Call `Cancel` on the returned `cancelable` to unregister `Callback`.
        Subscribe<native><override>(Callback:type {_(:t):void})<transacts>:cancelable

        Signal<native><override>(Val:t):void

    subscribable_event_intrnl<epic_internal>() := subscribable_event_intrnl(tuple())

    # Returns the smallest `int` that is greater than or equal to `Val`.
    # Fails if `not IsFinite(Val)`.
    Ceil<native><public>(Val:float)<reads><decides>:int

    # Returns the largest `int` that is less than or equal to `Val`.
    # Fails if `not IsFinite(Val)`.
    Floor<native><public>(Val:float)<reads><decides>:int

    # Returns `Val` rounded to the nearest `int`. When the fractional part of `Val` is `0.5`, rounds to the nearest *even* `int` (per the IEEE-754 default rounding mode).
    # Fails if `not IsFinite(Val)`.
    Round<native><public>(Val:float)<reads><decides>:int

    # Returns the `int` that equals `Val` without the fractional part.
    # Fails if `not IsFinite(val)`.
    Int<native><public>(Val:float)<reads><decides>:int

    # Makes a `string` representation of `Val`.
    ToString<native><public>(Val:float)<reads>:string

    # Returns the number of seconds since January 1, 1970 UTC, ignoring leap seconds. I.e, this function implements Unix time. This function always returns the same value within the same transaction.
    GetSecondsSinceEpoch<native><public>()<reads>:float

    # Makes a printable `string` representation of `Val`.
    ToString<native><public>(Val:int)<computes>:string

    # Implemented by classes whose instances can become invalid at runtime.
    invalidatable<native><public> := interface(disposable):
        # Succeeds if this object is still valid.
        IsValid<public>()<transacts><decides>:void

    # A parametric interface combining `awaitable` and `subscribable`.
    listenable<public>(payload:type) := interface(awaitable(payload), subscribable(payload)):

    # A parameterless interface combining `awaitable` and `subscribable`.
    listenable<public>() := listenable(tuple())

    # Used for message localization.
    locale<native><public> := struct<epic_internal>:

    # A localizable text message.
    message<native><public> := class<epic_internal>:
        Key<native><epic_internal>:string

        DefaultText<native><epic_internal>:string

        Substitutions<native><epic_internal>:[string]localizable_value

    # Makes a `string` by localizing `Message` based on the current `locale`.
    Localize<native><public>(Message:message)<reads>:string

    localizable_value<native><epic_internal> := class:

    localizable_string<native><epic_internal> := class<internal>(localizable_value):

    MakeLocalizableValue<epic_internal>(V:string):localizable_string = external {}

    localizable_int<native><epic_internal> := class<internal>(localizable_value):

    MakeLocalizableValue<epic_internal>(V:int):localizable_int = external {}

    localizable_float<native><epic_internal> := class<internal>(localizable_value):

    MakeLocalizableValue<epic_internal>(V:float):localizable_float = external {}

    localizable_message<native><epic_internal> := class<internal>(localizable_value):

    MakeLocalizableValue<epic_internal>(V:message):localizable_message = external {}

    MakeMessageInternal<native><epic_internal>(K:string, D:string, S:[string]localizable_value)<converges>:message

    # Pi, the ratio of the circumference of a circle to its diameter.
    PiFloat<public>:float = external {}

    # Constrains the value of `Val` between `A` and `B`. Robustly handles different argument orderings.
    # Returns the median of `Val`, `A`, and `B`, such that comparisons with `NaN` operate as if `NaN > +Inf`.
    Clamp<public>(Val:float, A:float, B:float)<computes>:float = external {}

    @rtfm_always_open
    # Constrains the value of `Val` between `A` and `B`. Robustly handles different argument orderings.
    # Returns the median of `Val`, `A`, and `B`.
    Clamp<native><public>(Val:int, A:int, B:int)<computes>:int

    # Returns the minimum of `X` and `Y`.
    Min<public>(X:int, Y:int)<computes>:int = external {}

    # Returns the maximum of `X` and `Y`.
    Max<public>(X:int, Y:int)<computes>:int = external {}

    # Returns the minimum of `X` and `Y` unless either are `NaN`.
    # Returns `NaN` if either `X` or `Y` are `NaN`.
    Min<public>(X:float, Y:float)<computes>:float = external {}

    # Returns the maximum of `X` and `Y` unless either are `NaN`.
    # Returns `NaN` if either `X` or `Y` are `NaN`.
    Max<public>(X:float, Y:float)<computes>:float = external {}

    @rtfm_always_open
    # Returns the square root of `X` if `X >= 0.0`.
    # Returns `NaN` if `X < 0.0`.
    Sqrt<native><public>(X:float)<reads>:float

    @rtfm_always_open
    # Returns the sine of `X` if `IsFinite(X)`.
    # Returns `NaN` if `not IsFinite(X)
    Sin<native><public>(X:float)<reads>:float

    @rtfm_always_open
    # Returns the cosine of `X` if `IsFinite(X)`.
    # Returns `NaN` if `not IsFinite(X)
    Cos<native><public>(X:float)<reads>:float

    @rtfm_always_open
    # Returns the tangent of `X` if `IsFinite(X)`.
    # Returns `NaN` if `not IsFinite(X).
    Tan<native><public>(X:float)<reads>:float

    @rtfm_always_open
    # Returns the inverse sine (arcsine) of `X` if `-1.0 <= X <= 1.0`.
    ArcSin<native><public>(X:float)<reads>:float

    @rtfm_always_open
    # Returns the inverse cosine (arccosine) of `X` if `-1.0 <= X <= 1.0`.
    ArcCos<native><public>(X:float)<reads>:float

    @rtfm_always_open
    # Returns the inverse tangent (arctangent) of `X` such that:`-PiFloat/2.0 <= ArcTan(x) <= PiFloat/2.0`.
    ArcTan<native><public>(X:float)<reads>:float

    @rtfm_always_open
    # Returns the angle in radians at the origin between a ray pointing to `(X, Y)` and the positive `X` axis such that `-PiFloat < ArcTan(Y, X) <= PiFloat`.
    # Returns 0.0 if `X=0.0 and Y=0.0`.
    ArcTan<native><public>(Y:float, X:float)<reads>:float

    @rtfm_always_open
    # Returns the hyperbolic sine of `X`.
    Sinh<native><public>(X:float)<reads>:float

    @rtfm_always_open
    # Returns the hyperbolic cosine of `X`.
    Cosh<native><public>(X:float)<reads>:float

    @rtfm_always_open
    # Returns the hyperbolic tangent of `X`.
    Tanh<native><public>(X:float)<reads>:float

    @rtfm_always_open
    # Returns the inverse hyperbolic sine of `X` if `IsFinite(X)`.
    ArSinh<native><public>(X:float)<reads>:float

    @rtfm_always_open
    # Returns the inverse hyperbolic cosine of `X` if `1.0 <= X`.
    ArCosh<native><public>(X:float)<reads>:float

    @rtfm_always_open
    # Returns the inverse hyperbolic tangent of `X` if `IsFinite(X)`.
    ArTanh<native><public>(X:float)<reads>:float

    @rtfm_always_open
    # Returns `A` to the power of `B`.
    Pow<native><public>(A:float, B:float)<reads>:float

    # Returns `X` if `X` is finite.
    # Fails if `X` is one of:`
    #  * `+Inf`
    #  * `-Inf`
    #  * `NaN`
    (X:float).IsFinite<public>()<computes><decides>:float = external {}

    @rtfm_always_open
    # Returns the quotient `X/Y` as defined by Euclidean division, i.e.:
    #  * `Quotient[X/Y] = Floor[X/Y]` when `Y > 0`
    #  * `Quotient[X/Y] = Ceil[X/Y]` when `Y < 0`
    #  * `Quotient[X/Y] * Y + Mod[X,Y] = X`
    # Fails if `Y = 0`.
    Quotient<native><public>(X:int, Y:int)<computes><decides>:int

    @rtfm_always_open
    # Returns the remainder of `X/Y` as defined by Euclidean division, i.e.:
    #  * `Mod[X,Y] = X - Quotient(X/Y)*Y`
    #  * `0 <= Mod[X,Y] < Abs(Y)`
    # Fails if `Y=0`.
    Mod<native><public>(X:int, Y:int)<computes><decides>:int

    @rtfm_always_open
    # Returns the natural exponent of `X`.
    Exp<native><public>(X:float)<reads>:float

    @rtfm_always_open
    # Returns the natural logarithm of `X`.
    Ln<native><public>(X:float)<reads>:float

    # Returns the base `B` logarithm of `X`.
    Log<public>(B:float, X:float)<reads>:float = external {}

    @rtfm_always_open
    # Used to linearly interpolate/extrapolate between `From` (when `Parameter = 0.0`) and `To` (when `Parameter = 1.0`). Expects that all arguments are finite.
    # Returns `From*(1 - Parameter) + To*Parameter`.
    Lerp<native><public>(From:float, To:float, Parameter:float)<reads>:float

    # Returns the sign of `Val`:
    #   * `1` if `Val > 0`
    #  * `0` if `Val = 0`
    #  * `-1` if `Val < 0`
    Sgn<public>(Val:int)<computes>:int = external {}

    # Returns the sign of `Val`:
    #  * `1.0` if `Val > 0.0`
    #  * `0.0` if `Val = 0.0`
    #  * `-1.0` if `Val < 0.0`
    #  * `NaN` if `Val = NaN`
    Sgn<public>(Val:float)<computes>:float = external {}

    # Succeeds if `Val` is within `AbsoluteTolerance` of `0.0`.
    (Val:float).IsAlmostZero<public>(AbsoluteTolerance:float)<computes><decides>:void = external {}

    # Succeeds if `Val1` and `Val2` are within `AbsoluteTolerance` of each other.
    IsAlmostEqual<public>(Val1:float, Val2:float, AbsoluteTolerance:float)<computes><decides>:void = external {}

    # A parametric interface implemented by events with a `payload` that can be signaled.
    # Can be used with `awaitable`, `subscribable`, or both (see: `listenable`).
    signalable<public>(payload:type) := interface:
        # Concurrently resumes the tasks waiting for this event in `awaitable.Await` and synchronously invokes any callbacks added to this event by `subscribable.Subscribe`.
        Signal<native_callable><public>(Val:payload):void

    # Makes a `string` by concatenating `Separator` between the elements of `Strings`.
    Join<native><public>(Strings:[]string, Separator:string)<computes>:string

    # Returns `String` without modification.
    ToString<public>(String:string)<computes>:string = external {}

    # Makes a `string` from `Character`.
    ToString<native><public>(Character:char)<computes>:string

    # Makes a `string` by converting `Character` to UTF-8 from UTF-32.
    ToString<native><epic_internal>(Character:char32)<computes>:string

    # A parametric interface implemented by events with a `payload` that can be subscribed to.
    # Matched with `signalable.`
    subscribable<public>(t:type) := interface:
        # Registers `Callback` to be invoked on matching calls to `signable.Signal`.
        # Returns an unsubscriber object. Call `cancelable.Cancel` on the unsubscriber to unregister `Callback`.
        Subscribe<public>(Callback:type {_(:t):void})<transacts>:cancelable

    # A parameterless interface implemented by events that can be subscribed to.
    subscribable<public>() := subscribable(tuple())

# Module import path: /Verse.org/Colors
Colors<public> := module:
    # Represents colors as RGB triples in the ACES 2065-1 color space.
    # Component values are linear (i.e. `*gamma* = 1.0`).
    color<native><public> := struct<concrete><computes><persistable>:
        @editable
        # Red component of this `color`.
        R<native><public>:float = external {}

        @editable
        # Green component of this `color`.
        G<native><public>:float = external {}

        @editable
        # Blue component of this `color`.
        B<native><public>:float = external {}

    # Makes an ACES 2065-1 `color` from the component-wise sum of `c0` and `c1`.
    (/Verse.org/Colors:)operator'+'<native><public>(c0:color, c1:color)<converges>:color

    # Makes an ACES 2065-1 `color` from the component-wise difference of `c0` and `c1`.
    (/Verse.org/Colors:)operator'-'<native><public>(c0:color, c1:color)<converges>:color

    # Makes an ACES 2065-1 `color` from the component-wise product of `c0` and `c1`.
    (/Verse.org/Colors:)operator'*'<native><public>(c0:color, c1:color)<converges>:color

    # Makes an ACES 2065-1 `color` from each component of `c` scaled by `factor`.
    (/Verse.org/Colors:)operator'*'<native><public>(c:color, factor:float)<converges>:color

    # Makes an ACES 2065-1 `color` from each component of `c` scaled by `factor`.
    (/Verse.org/Colors:)operator'*'<native><public>(c:color, factor:int)<converges>:color

    # Makes an ACES 2065-1 `color` from each component of `c` scaled by `factor`.
    (/Verse.org/Colors:)operator'*'<native><public>(factor:float, c:color)<converges>:color

    # Makes an ACES 2065-1 `color` from each component of `c` scaled by `factor`.
    (/Verse.org/Colors:)operator'*'<native><public>(factor:int, c:color)<converges>:color

    # Makes an ACES 2065-1 `color` from each component of `c` divided by `factor`.
    (/Verse.org/Colors:)operator'/'<native><public>(c:color, factor:float)<decides><converges>:color

    # Makes an ACES 2065-1 `color` from each component of `c` divided by `factor`.
    (/Verse.org/Colors:)operator'/'<native><public>(c:color, factor:int)<decides><converges>:color

    # Makes an ACES 2065-1 `color` from sRGB components `Red`, `Green`, and `Blue`.
    # Normal sRGB component values are between `0.0` and `1.0`, but this can handle larger values.
    MakeColorFromSRGB<native><public>((local:)Red:float, (local:)Green:float, (local:)Blue:float)<converges>:color

    # Makes an sRGB `tuple` by converting `InColor` from an ACES 2065-1 `color` to sRGB.
    MakeSRGBFromColor<native><public>(InColor:color)<converges>:tuple(float, float, float)

    # Makes an ACES 2065-1 `color` from the integer sRGB components `Red`, `Green`, and `Blue`.
    # Valid sRGB component values are between '0' and '255', inclusive.
    MakeColorFromSRGBValues<native><public>((local:)Red:int, (local:)Green:int, (local:)Blue:int)<converges>:color

    # Makes an ACES 2065-1 `color` from a CSS-style sRGB `hexString`. Supported formats are:
    #  * RGB
    #  * RRGGBB
    #  * RRGGBBAA
    #  * #RGB
    #  * #RRGGBB
    #  * #RRGGBBAA
    # An invalid hex string will return `Black`.
    MakeColorFromHex<native><public>(hexString:string)<converges>:color

    # Makes an ACES 2065-1 `color` from `Hue`, `Saturation`, and `Value` components.
    # Components use the HSV color model in the sRGB color space. Expected ranges:
    #  * `0.0 <= Hue <= 360.0`
    #  * `0.0 <= Saturation <= 1.0`
    #  * `0.0 <= Value <= 1.0`
    # Values out of expected ranges will undergo range reduction and conversion.
    MakeColorFromHSV<native><public>(Hue:float, Saturation:float, Value:float)<converges>:color

    # Makes an HSV `tuple` by converting `InColor` from an ACES 2065-1 `color` to sRGB and applying the HSV color model.
    MakeHSVFromColor<native><public>(InColor:color):tuple(float, float, float)

    # Makes an ACES 2065-1 `color` from the chromaticity of a blackbody radiator at `Temperature` Kelvin.
    # `Temperature` is clamped such that `0 <= Temperature`.
    MakeColorFromTemperature<native><public>(Temperature:float)<converges>:color

    # Module import path: /Verse.org/Colors/NamedColors
    # Color presets from CSS Color Module 3 Extended color keywords.
    NamedColors<public> := module:
        AliceBlue<public>:color = external {}

        AntiqueWhite<public>:color = external {}

        Aqua<public>:color = external {}

        Aquamarine<public>:color = external {}

        Azure<public>:color = external {}

        Beige<public>:color = external {}

        Bisque<public>:color = external {}

        Black<public>:color = external {}

        BlanchedAlmond<public>:color = external {}

        Blue<public>:color = external {}

        BlueViolet<public>:color = external {}

        Brown<public>:color = external {}

        Burlywood<public>:color = external {}

        CadetBlue<public>:color = external {}

        Chartreuse<public>:color = external {}

        Chocolate<public>:color = external {}

        Coral<public>:color = external {}

        CornflowerBlue<public>:color = external {}

        Cornsilk<public>:color = external {}

        Crimson<public>:color = external {}

        Cyan<public>:color = external {}

        DarkBlue<public>:color = external {}

        DarkCyan<public>:color = external {}

        DarkGoldenrod<public>:color = external {}

        DarkGray<public>:color = external {}

        DarkGreen<public>:color = external {}

        DarkGrey<public>:color = external {}

        DarkKhaki<public>:color = external {}

        DarkMagenta<public>:color = external {}

        DarkOliveGreen<public>:color = external {}

        DarkOrange<public>:color = external {}

        DarkOrchid<public>:color = external {}

        DarkRed<public>:color = external {}

        DarkSalmon<public>:color = external {}

        DarkSeaGreen<public>:color = external {}

        DarkSlateBlue<public>:color = external {}

        DarkSlateGray<public>:color = external {}

        DarkSlateGrey<public>:color = external {}

        DarkTurquoise<public>:color = external {}

        DarkViolet<public>:color = external {}

        DeepPink<public>:color = external {}

        DeepSkyBlue<public>:color = external {}

        DimGray<public>:color = external {}

        DimGrey<public>:color = external {}

        DodgerBlue<public>:color = external {}

        Firebrick<public>:color = external {}

        FloralWhite<public>:color = external {}

        ForestGreen<public>:color = external {}

        Fuchsia<public>:color = external {}

        Gainsboro<public>:color = external {}

        GhostWhite<public>:color = external {}

        Gold<public>:color = external {}

        Goldenrod<public>:color = external {}

        Gray<public>:color = external {}

        Green<public>:color = external {}

        GreenYellow<public>:color = external {}

        Grey<public>:color = external {}

        Honeydew<public>:color = external {}

        Hotpink<public>:color = external {}

        IndianRed<public>:color = external {}

        Indigo<public>:color = external {}

        Ivory<public>:color = external {}

        Khaki<public>:color = external {}

        Lavender<public>:color = external {}

        LavenderBlush<public>:color = external {}

        LawnGreen<public>:color = external {}

        LemonChiffon<public>:color = external {}

        LightBlue<public>:color = external {}

        LightCoral<public>:color = external {}

        LightCyan<public>:color = external {}

        LightGoldenrodYellow<public>:color = external {}

        LightGray<public>:color = external {}

        LightGreen<public>:color = external {}

        LightGrey<public>:color = external {}

        LightPink<public>:color = external {}

        LightSalmon<public>:color = external {}

        LightSeaGreen<public>:color = external {}

        LightSkyBlue<public>:color = external {}

        LightSlateGray<public>:color = external {}

        LightSlateGrey<public>:color = external {}

        LightSteelBlue<public>:color = external {}

        LightYellow<public>:color = external {}

        Lime<public>:color = external {}

        LimeGreen<public>:color = external {}

        Linen<public>:color = external {}

        Magenta<public>:color = external {}

        Maroon<public>:color = external {}

        MediumAquamarine<public>:color = external {}

        MediumBlue<public>:color = external {}

        MediumOrchid<public>:color = external {}

        MediumPurple<public>:color = external {}

        MediumSeaGreen<public>:color = external {}

        MediumSlateBlue<public>:color = external {}

        MediumSpringGreen<public>:color = external {}

        MediumTurquoise<public>:color = external {}

        MediumVioletRed<public>:color = external {}

        MidnightBlue<public>:color = external {}

        MintCream<public>:color = external {}

        MistyRose<public>:color = external {}

        Moccasin<public>:color = external {}

        NavajoWhite<public>:color = external {}

        Navy<public>:color = external {}

        OldLace<public>:color = external {}

        Olive<public>:color = external {}

        OliveDrab<public>:color = external {}

        Orange<public>:color = external {}

        OrangeRed<public>:color = external {}

        Orchid<public>:color = external {}

        PaleGoldenrod<public>:color = external {}

        PaleGreen<public>:color = external {}

        PaleTurquoise<public>:color = external {}

        PaleVioletred<public>:color = external {}

        PapayaWhip<public>:color = external {}

        PeachPuff<public>:color = external {}

        Peru<public>:color = external {}

        Pink<public>:color = external {}

        Plum<public>:color = external {}

        PowderBlue<public>:color = external {}

        Purple<public>:color = external {}

        Red<public>:color = external {}

        RosyBrown<public>:color = external {}

        RoyalBlue<public>:color = external {}

        SaddleBrown<public>:color = external {}

        Salmon<public>:color = external {}

        SandyBrown<public>:color = external {}

        SeaGreen<public>:color = external {}

        SeaShell<public>:color = external {}

        Sienna<public>:color = external {}

        Silver<public>:color = external {}

        SkyBlue<public>:color = external {}

        SlateBlue<public>:color = external {}

        SlateGray<public>:color = external {}

        SlateGrey<public>:color = external {}

        Snow<public>:color = external {}

        SpringGreen<public>:color = external {}

        SteelBlue<public>:color = external {}

        (/Verse.org/Colors/NamedColors:)Tan<public>:color = external {}

        Teal<public>:color = external {}

        Thistle<public>:color = external {}

        Tomato<public>:color = external {}

        Turquoise<public>:color = external {}

        Violet<public>:color = external {}

        Wheat<public>:color = external {}

        White<public>:color = external {}

        WhiteSmoke<public>:color = external {}

        Yellow<public>:color = external {}

        YellowGreen<public>:color = external {}

# Module import path: /Verse.org/SpatialMath
SpatialMath<public> := module:
    @import_as("/*.FVRotation")
    rotation<native><public> := struct<concrete>:

    @available {MinUploadedAtFNVersion := 3600}
    # Makes a `rotation` from `Axis` and `Angle` in radians using a right-handed sign convention (e.g. a positive rotation around Up takes Forward to Left).
    MakeRotationRadians<native><public>(Axis:vector3, Angle:float)<reads><converges>:rotation

    @available {MinUploadedAtFNVersion := 3600}
    # Degrees version of `MakeRotationRadians`
    MakeRotationDegrees<public>(Axis:vector3, Angle:float)<reads>:rotation = external {}

    @available {MinUploadedAtFNVersion := 3600}
    # Makes a `rotation` by applying a pre-rotation of `YawAngle` followed by `PitchAngle` and then `RollAngle`, in that order:
    #  * *yaw* is right-handed rotation about the Down axis,
    #  * *pitch* is right-handed rotation about the Right axis,
    #  * *roll* is right-handed rotation about the Forward axis.
    MakeRotationFromYawPitchRollRadians<public>(YawAngle:float, PitchAngle:float, RollAngle:float)<reads>:rotation = external {}

    # Degrees version of `MakeRotationFromYawPitchRollRadians`
    MakeRotationFromYawPitchRollDegrees<native><public>(YawAngle:float, PitchAngle:float, RollAngle:float)<reads><converges>:rotation

    @available {MinUploadedAtFNVersion := 3600}
    # Makes a `rotation` by applying a post-rotation of `LeftAxisAngle` followed by `UpAxisAngle` and then `ForwardAxisAngle `in that order. Right-handed convention (e.g. a positive rotation around Up takes +Forward to Left).
    MakeRotationFromEulerRadians<native><public>(LeftAxisAngle:float, UpAxisAngle:float, ForwardAxisAngle:float)<reads><converges>:rotation

    @available {MinUploadedAtFNVersion := 3600}
    # Degrees version of `MakeRotationFromEulerRadians`
    MakeRotationFromEulerDegrees<public>(LeftAxisAngle:float, UpAxisAngle:float, ForwardAxisAngle:float)<reads>:rotation = external {}

    # Makes the identity `rotation`.
    IdentityRotation<native><public>()<converges>:rotation

    # Returns the distance between `Rotation1` and `Rotation2`. The result will be between:
    #  * `0.0`, representing equivalent rotations and
    #  * `1.0` representing rotations which are 180 degrees apart (i.e., the shortest rotation between them is 180 degrees around some axis).
    Distance<native><public>(Rotation1:rotation, Rotation2:rotation)<reads><converges>:float

    @available {MinUploadedAtFNVersion := 3600}
    # Returns the smallest angular distance between `Rotation1` and `Rotation2` in radians.
    AngularDistanceRadians<native><public>(Rotation1:rotation, Rotation2:rotation)<reads><converges>:float

    @available {MinUploadedAtFNVersion := 3600}
    # Degrees version of `AngularDistanceRadians`.
    AngularDistanceDegrees<public>(Rotation1:rotation, Rotation2:rotation)<reads>:float = external {}

    @available {MinUploadedAtFNVersion := 3600}
    # Apply a `PreRotation` to `PostRotation` as `v * PreRotation * PostRotation`.
    (/Verse.org/SpatialMath:)operator'*'<native><public>(PreRotation:rotation, PostRotation:rotation)<reads><converges>:rotation

    @available {MinUploadedAtFNVersion := 3600}
    # Makes a `tuple(float, float, float)` with three elements:
    #  * *yaw* of `rotation` in radians
    #  * *pitch* of `rotation` in radians
    #  * *roll* of `rotation` in radians
    # using the conventions of `MakeRotationFromYawPitchRollRadians`.
    (Rotation:rotation).GetYawPitchRollRadians<public>()<reads>:tuple(float, float, float) = external {}

    @available {MinUploadedAtFNVersion := 3600}
    # Degrees version of `GetYawPitchRollRadians`.
    (Rotation:rotation).GetYawPitchRollDegrees<native><public>()<reads><converges>:tuple(float, float, float)

    @available {MinUploadedAtFNVersion := 3600}
    # Makes a `tuple(float, float, float)` with three elements:
    #  * *left axis* `rotation` in radians
    #  * *up axis* of `rotation` in radians
    #  * *forward axis* of `rotation` in radians
    # using the conventions of `MakeRotationEulerRadians`.
    (Rotation:rotation).GetEulerRadians<native><public>()<reads><converges>:tuple(float, float, float)

    @available {MinUploadedAtFNVersion := 3600}
    # Degrees version of `GetEulerRadians`.
    (Rotation:rotation).GetEulerDegrees<public>()<reads>:tuple(float, float, float) = external {}

    # Makes a `vector3` from the axis of `rotation` for an right-handed angle.
    # If `rotation` is nearly identity, this will return the +Forward axis. See also `GetAngleRadians`.
    (Rotation:rotation).GetAxis<native><public>()<reads><converges>:vector3

    @available {MinUploadedAtFNVersion := 3600}
    # Returns the radians of right-handed `rotation` around the axis of `rotation`. See also `GetAxis`.
    (Rotation:rotation).GetAngleRadians<native><public>()<reads><converges>:float

    @available {MinUploadedAtFNVersion := 3600}
    # Degrees version of GetAngleRadians
    (Rotation:rotation).GetAngleDegrees<public>()<reads>:float = external {}

    # Makes the smallest angular `rotation` from `InitialVector` to `FinalVector` two vectors of arbitrary length such that:
    # `InitialVector * MakeShortestRotationBetween(InitialVector, FinalVector) = FinalVector` and
    # `MakeShortestRotationBetween(InitialVector, FinalVector)?.GetAngleRadians()` is as small as possible.
    MakeShortestRotationBetween<native><public>(InitialVector:vector3, FinalVector:vector3)<reads><converges>:rotation

    # Used to perform spherical linear interpolation between `From` (when `Ratio = 0.0`) and `To` (when `Ratio = 1.0`). Expects `0.0 <= Ratio <= 1.0`.
    Slerp<native><public>(InitialRotation:rotation, FinalRotation:rotation, Ratio:float)<reads><converges>:rotation

    # Makes a `vector3` by applying `Rotation` to `Vector`.
    (/Verse.org/SpatialMath:)operator'*'<native><public>(Vector:vector3, Rotation:rotation)<reads><converges>:vector3

    # Makes a `rotation` by inverting `Rotation` such that `ApplyRotation(Rotation, Rotation.Invert())) = IdentityRotation`.
    (Rotation:rotation).Invert<native><public>()<reads><converges>:rotation

    # Returns `Rotation` if it does not contain `NaN`, `Inf` or `-Inf`.
    (Rotation:rotation).(/Verse.org/SpatialMath:)IsFinite<native><public>()<decides><converges>:rotation

    # Makes a unit `vector3` pointing in the *forward* rotated direction.
    # This is equivalent to: `vector3{Forward:=1.0, Left:=0.0, Up:=0.0} * Rotation`.
    (Rotation:rotation).GetForwardAxis<public>()<reads>:vector3 = external {}

    # Makes a unit `vector3` pointing in the *left* rotated direction.
    # This is equivalent to: `vector3{Forward:=0.0, Left:=1.0, Up:=0.0} * Rotation`.
    (Rotation:rotation).GetLeftAxis<public>()<reads>:vector3 = external {}

    # Makes a unit `vector3` pointing in the *up* rotated direction.
    # This is equivalent to: `vector3{Forward:=0.0, Left:=0.0, Up:=1.0} * Rotation`.
    (Rotation:rotation).GetUpAxis<public>()<reads>:vector3 = external {}

    # Makes a `string` representation of `rotation` in axis/degrees format with a right-handed sign convention.
    # `ToString(MakeRotationRadians(vector3{Left:=0.0, Up:=0.0, Forward:=1.0}, PiFloat/2.0))` produces the string: `"{Axis = {Left=0.000000, Up=0.000000, Forward=1.000000}, Angle = 90.000000}"`.
    (/Verse.org/SpatialMath:)ToString<public>(Rotation:rotation)<reads>:string = external {}

    # Returns radians from `Degrees`.
    DegreesToRadians<public>(Degrees:float)<reads>:float = external {}

    # Returns degrees from `Radians`.
    RadiansToDegrees<public>(Radians:float)<reads>:float = external {}

    @import_as("/*.FVTransform")
    # A combination of scale, rotation, and translation, applied in that order.
    transform<native><public> := struct<concrete><computes>:
        @editable
        # The location of this `transform`.
        Translation<public>:vector3 = external {}

        @editable
        # The rotation of this `transform`.
        Rotation<public>:rotation = external {}

        @editable
        @units("x")
        # The scale of this `transform`.
        Scale<public>:vector3 = external {}

    # Makes a `vector3` by applying `InTransform` to `InVector`.
    (/Verse.org/SpatialMath:)operator'*'<public>(InVector:vector3, InTransform:transform)<reads>:vector3 = external {}

    # Makes a `string` representation of `InTransform` where the result is on the form.
    # `"{Translation = {ToString(`InTransform.Translation`)}, Rotation = {ToString(`InTransform.Rotation`)}, Scale = {ToString(`InTransform.Scale`)}}".
    (/Verse.org/SpatialMath:)ToString<public>(InTransform:transform)<reads>:string = external {}

    @import_as("/*.FVVector3")
    # 3-dimensional vector with `float` components.
    vector3<native><public> := struct<concrete><computes><persistable>:
        @editable
        # The Left (was -Y) component of this vector.
        Left<public>:float = external {}

        @editable
        # The Up (was Z) component of this vector.
        Up<public>:float = external {}

        @editable
        # The Forward (was X) component of this vector.
        Forward<public>:float = external {}

    # Makes a unit `vector3` pointing in the positive Forward axis
    ForwardAxis<epic_internal>()<computes>:vector3 = external {}

    # Makes a unit `vector3` pointing in the positive Backward axis
    BackwardAxis<epic_internal>()<computes>:vector3 = external {}

    # Makes a unit `vector3` pointing in the positive Right axis
    RightAxis<epic_internal>()<computes>:vector3 = external {}

    # Makes a unit `vector3` pointing in the positive Left axis
    LeftAxis<epic_internal>()<computes>:vector3 = external {}

    # Makes a unit `vector3` pointing in the positive Up axis
    UpAxis<epic_internal>()<computes>:vector3 = external {}

    # Makes a unit `vector3` pointing in the positive Down axis
    DownAxis<epic_internal>()<computes>:vector3 = external {}

    # Makes a `vector3` with all components `0.0`.
    Zero<epic_internal>()<computes>:vector3 = external {}

    # Makes a `vector3` with all components `1.0`.
    Ones<epic_internal>()<computes>:vector3 = external {}

    # Makes a `vector3` by inverting the `SurfaceNormal` component of `Direction`.
    ReflectVector<public>(Direction:vector3, SurfaceNormal:vector3)<reads>:vector3 = external {}

    # Returns the dot product of `V1` and `V2`.
    DotProduct<public>(V1:vector3, V2:vector3)<reads>:float = external {}

    # Returns the left-handed cross product of `V1` and `V2`.
    CrossProductLeftHanded<public>(V1:vector3, V2:vector3)<reads>:vector3 = external {}

    @available {MinUploadedAtFNVersion := 3600}
    # Returns the right-handed cross product of `V1` and `V2`.
    CrossProduct<public>(V1:vector3, V2:vector3)<reads>:vector3 = external {}

    # Returns the Euclidean distance between `V1` and `V2`.
    Distance<public>(V1:vector3, V2:vector3)<reads>:float = external {}

    # Returns the squared Euclidean distance between `V1` and `V2`.
    DistanceSquared<public>(V1:vector3, V2:vector3)<reads>:float = external {}

    # Returns the 2-D Euclidean distance between `V1` and `V2` by ignoring the difference in `Up`.
    DistanceForwardLeft<public>(V1:vector3, V2:vector3)<reads>:float = external {}

    # Returns the squared 2-D Euclidean distance between `V1` and `V2` by ignoring their difference in `Up`.
    DistanceSquaredForwardLeft<public>(V1:vector3, V2:vector3)<reads>:float = external {}

    # Makes a unit length `vector3` pointing in the same direction of `V`.
    (V:vector3).MakeUnitVector<public>()<reads>:vector3 = external {}

    # Makes a `string` representation of `V`.
    (/Verse.org/SpatialMath:)ToString<public>(V:vector3)<reads>:string = external {}

    # Returns the length of `V`.
    (V:vector3).Length<public>()<reads>:float = external {}

    # Returns the squared length of `V`.
    (V:vector3).LengthSquared<public>()<computes>:float = external {}

    # Returns the length of `V` as if `V.Up = 0.0`.
    (V:vector3).LengthForwardLeft<public>()<reads>:float = external {}

    # Returns the squared length of `V` as if `V.Up = 0.0`.
    (V:vector3).LengthSquaredForwardLeft<public>()<reads>:float = external {}

    # Used to linearly interpolate/extrapolate between `From` (when `Parameter = 0.0`) and `To` (when `Parameter = 1.0`). Expects that all arguments are finite.
    # Returns `From*(1 - Parameter) + To*Parameter`.
    (/Verse.org/SpatialMath:)Lerp<public>(From:vector3, To:vector3, Parameter:float)<reads>:vector3 = external {}

    # Makes a `vector3` by inverting the signs of `Operand`.
    (/Verse.org/SpatialMath:)prefix'-'<public>(Operand:vector3)<computes>:vector3 = external {}

    # Makes a `vector3` by component-wise addition of `Left` and `Right`.
    (/Verse.org/SpatialMath:)operator'+'<public>(Left:vector3, Right:vector3)<computes>:vector3 = external {}

    # Makes a `vector3` by component-wise subtraction of `Right` from `Left`.
    (/Verse.org/SpatialMath:)operator'-'<public>(Left:vector3, Right:vector3)<computes>:vector3 = external {}

    # Makes a `vector3` by component-wise multiplication of `Left` and `Right`.
    (/Verse.org/SpatialMath:)operator'*'<public>(Left:vector3, Right:vector3)<computes>:vector3 = external {}

    # Makes a `vector3` by multiplying the components of `Left` by `Right`.
    (/Verse.org/SpatialMath:)operator'*'<public>(Left:vector3, Right:float)<computes>:vector3 = external {}

    # Makes a `vector3` by multiplying the components of `Right` by `Left`.
    (/Verse.org/SpatialMath:)operator'*'<public>(Left:float, Right:vector3)<computes>:vector3 = external {}

    # Makes a `vector3` by dividing the components of `Left` by `Right`.
    (/Verse.org/SpatialMath:)operator'/'<public>(Left:vector3, Right:float)<computes>:vector3 = external {}

    # Makes a `vector3` by component-wise division of `Left` by `Right`.
    (/Verse.org/SpatialMath:)operator'/'<public>(Left:vector3, Right:vector3)<computes>:vector3 = external {}

    # Returns `V` if all components are finite.
    # Fails if any of the components are not finite.
    (V:vector3).(/Verse.org/SpatialMath:)IsFinite<public>()<computes><decides>:vector3 = external {}

    # Succeeds when each component of `V` is within `AbsoluteTolerance` of `0.0`.
    (V:vector3).(/Verse.org/SpatialMath:)IsAlmostZero<public>(AbsoluteTolerance:float)<computes><decides>:void = external {}

    # Succeeds when each component of `V1` and `V2` are within `AbsoluteTolerance` of each other.
    (/Verse.org/SpatialMath:)IsAlmostEqual<public>(V1:vector3, V2:vector3, AbsoluteTolerance:float)<computes><decides>:void = external {}

using {/Verse.org/Concurrency}
# Module import path: /Verse.org/Random
Random<public> := module:
    # Returns a random `float` between `Low` and `High`, inclusive.
    GetRandomFloat<native><public>(Low:float, High:float)<transacts>:float

    # Returns a uniformly distributed, cryptographically-secure random `int` between `Low` and `High`, inclusive. (`Low` and `High` can be out of order.)
    GetRandomInt<native><public>(Low:int, High:int)<transacts>:int

    # Makes an `array` with the same elements as `Input` shuffled in a random order.
    Shuffle<public>(Input:[]t where t:type)<transacts>:[]t = external {}

# Module import path: /Verse.org/Predicts
Predicts<public> := module:
    PredictsServerRegisterObject<native><epic_internal>(__dupe___unnamed_parameter_4:any)<transacts>:any

    PredictsObjectIdOf<native><epic_internal>(__dupe___unnamed_parameter_5:any)<transacts>:any

    PredictsInitObjectField<native><epic_internal>(SelfID:any, FieldName:string, Value:any)<transacts>:void

    Dictate<native><epic_internal>()<suspends><predicts>:void

    PredictsDebugServerMode<native><epic_internal>()<transacts>:void

    PredictsDebugClientMode<native><epic_internal>()<transacts>:void

    PredictsDebugFindObjectID<native><epic_internal>(Obj:any)<decides>:int

    PredictsDebugFindObject<native><epic_internal>(ObjectID:int)<transacts><decides>:any

    PredictsDebugObjectFieldEquals<native><epic_internal>(ObjectID:int, FieldName:string, Value:any)<decides>:void

    PredictsDebugReplicateToClient<native><epic_internal>()<transacts>:void

    PredictsDebugRegisterFunc<native><epic_internal>(__dupe___unnamed_parameter_6:string, __dupe___unnamed_parameter_7:type {_()<predicts>:void})<transacts>:void

    PredictsDebugCallFunc<native><epic_internal>(__dupe___unnamed_parameter_8:string)<transacts>:void

    PredictsDebugResetAllDataAndCallbacks<native><epic_internal>()<transacts>:void

    PredictsDebugGCPinObject<native><epic_internal>(__dupe___unnamed_parameter_9:any)<transacts>:void

    PredictsDebugGCUnpinObject<native><epic_internal>(__dupe___unnamed_parameter_10:any)<transacts>:void

# Module import path: /Verse.org/Native
Native<public> := module:
    @attribscope_function
    @attribscope_data
    validate_asset_path_attribute<epic_internal> := class<computes><internal>(attribute):

    validate_asset_path<constructor><epic_internal>(Modifiers:string)<computes>:validate_asset_path_attribute = external {}

    @attribscope_module
    @attribscope_class
    @attribscope_struct
    @attribscope_function
    @attribscope_data
    @attribscope_enum
    @attribscope_enumerator
    @attribscope_interface
    @attribscope_typedefinition
    doc_attribute<epic_internal> := class<computes><internal>(attribute):

    doc<constructor><epic_internal>(DocumentationString:string)<computes>:doc_attribute = external {}

    @attribscope_class
    @attribscope_struct
    @attribscope_enum
    @attribscope_interface
    import_as_attribute<epic_internal> := class<computes><internal>(attribute):

    import_as<constructor><epic_internal>(ImportName:string)<computes>:import_as_attribute = external {}

    property_changed_interface<native><epic_internal> := interface:
        OnPropertyChangedFromVerse<epic_internal>(PropertyName:string)<transacts>:void

# Module import path: /Verse.org/Concurrency
Concurrency<public> := module:
    # A parametric interface implemented by events with a `payload` that can be waited on. Matched with `signalable.`
    awaitable<public>(payload:type) := interface:
        # Suspends the current task until resumed by a matching call to `signalable.Signal`. Returns the event `payload`.
        Await<public>()<suspends>:payload

    awaitable<public>() := awaitable(void)

    task<native><public>(t:type) := class<abstract><final>(awaitable(t)):
        Active<native><epic_internal>()<transacts><decides>:void

        Completed<native><epic_internal>()<transacts><decides>:void

        Canceling<native><epic_internal>()<transacts><decides>:void

        Canceled<native><epic_internal>()<transacts><decides>:void

        Unsettled<native><epic_internal>()<transacts><decides>:void

        Settled<native><epic_internal>()<transacts><decides>:void

        Uninterrupted<native><epic_internal>()<transacts><decides>:void

        Interrupted<native><epic_internal>()<transacts><decides>:void

        Await<native><override>()<suspends>:t

        Cancel<native><epic_internal>()<suspends>:void
