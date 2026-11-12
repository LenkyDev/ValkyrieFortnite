# Verse path: /Fortnite.com
using {/Verse.org/Native}
@available {MinUploadedAtFNVersion := 4200}
@experimental
# Module import path: /Fortnite.com/SceneGraphCameras
SceneGraphCameras<public> := module:
    using {/Verse.org/Assets}
    using {/Verse.org/SpatialMath}
    using {/Verse.org/Native}
    using {/Verse.org/Simulation}
    using {/Verse.org/Temporary/EpicGamesRestricted/Network}
    using {/Verse.org/SceneGraph}
    @available {MinUploadedAtFNVersion := 4300}
    @experimental
    # Camera modifier that attaches the camera to a target entity.
    fort_attach_to_entity_camera_modifier<native><public> := class<concrete>(camera_modifier):
        @experimental
        @replicated("")
        @editable
        # Entity to attach to.
        var TargetEntity<native><public>:entity = external {}

        @experimental
        @replicated("")
        @editable
        # Modify the render location to attach to the target's location?
        var ShouldFollowTranslation<native><public>:logic = external {}

        @experimental
        @replicated("")
        @editable
        # Modify the render rotation to attach to the target's rotation?
        var ShouldFollowOrientation<native><public>:logic = external {}

    @available {MinUploadedAtFNVersion := 4300}
    @experimental
    # Base class for camera modifiers that frame a target.
    fort_base_framing_camera_modifier<native><public> := class<abstract>(camera_modifier):
        @experimental
        # Targets to frame, mapping each target entity to the weight it contributes to the framing calculation.
        var TargetEntities<public>:[entity]float = external {}

        @experimental
        @replicated("")
        @display_name("TargetEntities")
        @editable
        var WeightedTargets<native><protected>:[]fort_weighted_target_entity = external {}

        @experimental
        @replicated("")
        @editable
        # Whether to frame the target with the ideal framing immediately on the first frame.
        ShouldInitializeWithIdealFraming<native><public>:logic = external {}

        @experimental
        @replicated("")
        @editable
        # The ideal horizontal screen-space position of the target.
        var IdealFramingLocationScreenSpaceLeft<native><public>:float = external {}

        @experimental
        @replicated("")
        @editable
        # The ideal vertical screen-space position of the target.
        var IdealFramingLocationScreenSpaceUp<native><public>:float = external {}

        @experimental
        @replicated("")
        @editable
        # The damping factor for how fast the framing recenters on the target.
        var ReframeDampingFactor<native><public>:float = external {}

        @experimental
        @replicated("")
        @editable
        # If valid, the recentering damping factor will interpolate between LowReframeDampingFactor and ReframeDampingFactor as the target moves between the ideal target position and the boundaries of the hard-zone. 
        # If invalid, no interpolation occurs and the damping factor is always equal to ReframeDampingFactor.
        var LowReframeDampingFactor<native><public>:?float = external {}

        @experimental
        @replicated("")
        @editable
        # The time spent ramping up the reframing after exiting the dead zone. If set to zero or a negative value, reframing will immediately restart once the target has exited the dead zone. Otherwise the ReframeDampingFactor will interpolate from zero to its desired value over the specified amount of seconds.
        var ReengageTimeSeconds<native><public>:float = external {}

        @experimental
        @replicated("")
        @editable
        # The time spent ramping down the reframing after entering the dead zone. If set to zero or a negative value, reframing will immediately stop once the target has entered the dead zone. Otherwise, the ReframeDampingFactor will interpolate towards zero over the specified amount of seconds.
        var DisengageTimeSeconds<native><public>:float = external {}

        @experimental
        @replicated("")
        @editable
        # How far ahead to look in time when attempting to anticipate the movement of the target.
        var TargetMovementAnticipationTimeSeconds<native><public>:float = external {}

        @experimental
        @replicated("")
        @editable
        # The size of the dead zone, i.e. the zone inside which the target can freely move.
        # Sizes are expressed screen percentages around the desired framing location.
        var DeadZoneScreenSpaceLeft<native><public>:float = external {}

        @experimental
        @replicated("")
        @editable
        # The size of the dead zone, i.e. the zone inside which the target can freely move.
        # Sizes are expressed screen percentages around the desired framing location.
        var DeadZoneScreenSpaceRight<native><public>:float = external {}

        @experimental
        @replicated("")
        @editable
        # The size of the dead zone, i.e. the zone inside which the target can freely move.
        # Sizes are expressed screen percentages around the desired framing location.
        var DeadZoneScreenSpaceTop<native><public>:float = external {}

        @experimental
        @replicated("")
        @editable
        # The size of the dead zone, i.e. the zone inside which the target can freely move.
        # Sizes are expressed screen percentages around the desired framing location.
        var DeadZoneScreenSpaceBottom<native><public>:float = external {}

        @experimental
        @replicated("")
        @editable
        # The margins of the soft zone, i.e. the zone inside which the reframing will engage, in order to bring the target back towards the ideal framing position. If the target is outside of the soft zone, it will be forcibly and immedialy brought back to its edges, so this zone also defines the "hard" or "safe" zone of framing. Sizes are expressed in screen percentages from the edges.
        var SoftZoneScreenSpaceLeft<native><public>:float = external {}

        @experimental
        @replicated("")
        @editable
        # The margins of the soft zone, i.e. the zone inside which the reframing will engage, in order to bring the target back towards the ideal framing position. If the target is outside of the soft zone, it will be forcibly and immedialy brought back to its edges, so this zone also defines the "hard" or "safe" zone of framing. Sizes are expressed in screen percentages from the edges.
        var SoftZoneScreenSpaceRight<native><public>:float = external {}

        @experimental
        @replicated("")
        @editable
        # The margins of the soft zone, i.e. the zone inside which the reframing will engage, in order to bring the target back towards the ideal framing position. If the target is outside of the soft zone, it will be forcibly and immedialy brought back to its edges, so this zone also defines the "hard" or "safe" zone of framing. Sizes are expressed in screen percentages from the edges.
        var SoftZoneScreenSpaceTop<native><public>:float = external {}

        @experimental
        @replicated("")
        @editable
        # The margins of the soft zone, i.e. the zone inside which the reframing will engage, in order to bring the target back towards the ideal framing position. If the target is outside of the soft zone, it will be forcibly and immedialy brought back to its edges, so this zone also defines the "hard" or "safe" zone of framing. Sizes are expressed in screen percentages from the edges.
        var SoftZoneScreenSpaceBottom<native><public>:float = external {}

    @available {MinUploadedAtFNVersion := 4300}
    @experimental
    fort_camera_auto_rotate_direction<native><public> := enum<open>:
        Facing
        Movement
        MovementOrFacing
        GlobalForward

    @available {MinUploadedAtFNVersion := 4300}
    @experimental
    # Auto-rotation settings for a boom arm camera modifier.
    fort_auto_rotate_camera_modifier_settings<native><public> := class<concrete>:
        @experimental
        @replicated("")
        @editable
        # Whether to enable auto-rotation
        var IsEnabled<native><public>:logic = external {}

        @experimental
        @replicated("")
        @editable
        # The direction to re-align towards
        Direction<native><public>:fort_camera_auto_rotate_direction = external {}

        @experimental
        @replicated("")
        @editable
        # The time in seconds, to wait before re-aligning.
        WaitTime<native><public>:float = external {}

        @experimental
        @replicated("")
        @units("Radians")
        @editable
        # The minimum player-induced/manual rotation in radians, to deactivate auto-rotation.
        DisableThreshold<native><public>:float = external {}

        @experimental
        @replicated("")
        @editable
        # Whether to auto-rotate yaw.
        ShouldAutoRotateYaw<native><public>:logic = external {}

        @experimental
        @replicated("")
        @editable
        # Whether to auto-rotate pitch.
        ShouldAutoRotatePitch<native><public>:logic = external {}

        @experimental
        @replicated("")
        @editable
        # Interpolation settings to use when re-aligning towards the auto-rotate direction.
        InterpolationSettings<native><public>:fort_camera_value_interpolation_settings = external {}

    @available {MinUploadedAtFNVersion := 4300}
    @experimental
    # Camera modifier that can rotate the camera in yaw and pitch based on player input.
    fort_boom_arm_camera_modifier<native><public> := class<concrete>(camera_modifier):
        @experimental
        @replicated("")
        @editable
        # The offset of the boom. Rotation occurs at the base (i.e. before the offset).
        var BoomOffset<native><public>:(/Verse.org/SpatialMath:)vector3 = external {}

        @experimental
        @replicated("")
        @editable
        # The maximum amount of forward movement the interpolator can introduce, expressed as a factor of the default boom length. If the value is less than 0.0 then there is no limit.
        var MaxForwardInterpolationFactor<native><public>:float = external {}

        @experimental
        @replicated("")
        @editable
        # The maximum amount of backward movement the interpolator can introduce, expressed as a factor of the default boom length. If the value is less than 0.0 then there is no limit.
        var MaxBackwardInterpolationFactor<native><public>:float = external {}

        @experimental
        @replicated("")
        @editable
        # If true, the boom arm's rotation will add to the existing rotation instead of being absolute.
        IsRotationAdditive<native><public>:logic = external {}

        @experimental
        @replicated("")
        @editable
        # Auto rotation settings
        AutoRotateSettings<native><public>:fort_auto_rotate_camera_modifier_settings = external {}

        @experimental
        @replicated("")
        @editable
        # Interpolation settings to use for changing the boom length based on its pivot's movements.
        BoomLengthInterpolationSettings<native><public>:fort_camera_value_interpolation_settings = external {}

    @available {MinUploadedAtFNVersion := 4300}
    @experimental
    # A camera value interpolator allows a camera modifier to control how a given value is interpolated to a given target.
    fort_camera_value_interpolation_settings<native><public> := class<concrete>:


    @available {MinUploadedAtFNVersion := 4300}
    @experimental
    # A simple value interpolator that immediately "pops" to the target value.
    fort_pop_value_camera_value_interpolation_settings<native><public> := class<concrete>(fort_camera_value_interpolation_settings):


    @available {MinUploadedAtFNVersion := 4300}
    @experimental
    # A value interpolator that first accelerates up to a maximum speed, and then decelerates before reaching the target value.
    fort_acceleration_deceleration_camera_value_interpolation_settings<native><public> := class<concrete>(fort_camera_value_interpolation_settings):
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
    # A value interpolator that uses a spring-mass system to converge towards the target value.
    fort_critical_damper_camera_value_interpolation_settings<native><public> := class<concrete>(fort_camera_value_interpolation_settings):
        @experimental
        @replicated("")
        # The damping factor of the spring-mass system.
        DampingFactor<native><public>:float = external {}

    @available {MinUploadedAtFNVersion := 4300}
    @experimental
    # Infinite impulse response filter interpolator.
    fort_infinite_impulse_response_camera_value_interpolation_settings<public> := class<concrete>(fort_camera_value_interpolation_settings):


    @available {MinUploadedAtFNVersion := 4300}
    @experimental
    # Double infinite impulse response filter interpolator.
    fort_double_infinite_impulse_response_camera_value_interpolation_settings<public> := class<concrete>(fort_camera_value_interpolation_settings):


    @available {MinUploadedAtFNVersion := 4300}
    @experimental
    # Camera modifier that pushes the camera out of world collision.
    fort_collision_push_camera_modifier<native><public> := class<concrete>(camera_modifier):
        @experimental
        @replicated("")
        @editable
        # Collision will ignore the specified entities only.
        var IgnoreEntities<native><public>:[]entity = external {}

        @experimental
        @replicated("")
        @editable
        # Collision will ignore the specified entities and all their descendants. If an entity is in both arrays, then this one takes precedence as being in IgnoreEntities doesn't specifically exclude an entity's descendants from being included, it just doesn't add them.
        var IgnoreEntitiesAndDescendants<native><public>:[]entity = external {}

        @experimental
        @replicated("")
        @editable
        # Global-space offset from the target to the line trace's end.
        var SafeLocationOffset<native><public>:(/Verse.org/SpatialMath:)vector3 = external {}

        @experimental
        @replicated("")
        @editable
        # Sphere radius to use for collision shape cast.
        var CollisionSphereRadius<native><public>:float = external {}

        @experimental
        @replicated("")
        @editable
        # Interpolation settings to use when pushing camera out, away from the pivot point.
        PushInterpolationSettings<native><public>:fort_camera_value_interpolation_settings = external {}

        @experimental
        @replicated("")
        @editable
        # Interpolation settings to use when pulling camera in, towards the pivot point.
        PullInterpolationSettings<native><public>:fort_camera_value_interpolation_settings = external {}

    @available {MinUploadedAtFNVersion := 4300}
    @experimental
    # Camera modifier that smooths the camera's rotation using a critically damped spring. Each axis is damped independently, so a camera can ease into a new yaw while pitching immediately. A damping factor of zero leaves that axis undamped.
    fort_dampen_rotation_camera_modifier<native><public> := class<concrete>(camera_modifier):
        @experimental
        @replicated("")
        @editable
        # Damping factor for the camera yaw.
        var YawDampingFactor<native><public>:float = external {}

        @experimental
        @replicated("")
        @editable
        # Damping factor for the camera pitch.
        var PitchDampingFactor<native><public>:float = external {}

        @experimental
        @replicated("")
        @editable
        # Damping factor for the camera roll.
        var RollDampingFactor<native><public>:float = external {}

    @available {MinUploadedAtFNVersion := 4300}
    @experimental
    # Camera modifier that smooths the camera's movement using a critically damped spring. Each axis is damped independently, so a camera can lag behind vertically while tracking laterally without delay. A damping factor of zero leaves that axis undamped.
    fort_dampen_translation_camera_modifier<native><public> := class<concrete>(camera_modifier):
        @experimental
        @replicated("")
        @editable
        # Damping factor for camera movement along the Forward axis.
        var ForwardDampingFactor<native><public>:float = external {}

        @experimental
        @replicated("")
        @editable
        # Damping factor for camera movement along the Left axis.
        var LeftDampingFactor<native><public>:float = external {}

        @experimental
        @replicated("")
        @editable
        # Damping factor for camera movement along the Up axis.
        var UpDampingFactor<native><public>:float = external {}

        @experimental
        @replicated("")
        @editable
        # The space the damping axes are measured in.
        DampenSpace<native><public>:fort_camera_offset_space = external {}

    @available {MinUploadedAtFNVersion := 4300}
    @experimental
    # Camera modifier that frames a target by moving along a sideways rail (left/right relative to the camera transform) and optionally also up and down.
    fort_dolly_framing_camera_modifier<native><public> := class<concrete>(fort_base_framing_camera_modifier):
        @experimental
        @replicated("")
        @editable
        # Whether the dolly can move horizontally.
        CanMoveHorizontally<native><public>:logic = external {}

        @experimental
        @replicated("")
        @editable
        # Whether the dolly can move vertically.
        CanMoveVertically<native><public>:logic = external {}

    @available {MinUploadedAtFNVersion := 4200}
    @experimental
    # Camera modifier that implements a first person camera.
    fort_first_person_camera_modifier<native><epic_internal> := class<concrete>(camera_modifier):
        NativeCameraRigAsset<override>:camera_rig_asset = external {}

        @experimental
        @replicated("")
        # Entity the camera is attached to
        TargetEntity<native><public>:entity = external {}

        @experimental
        @replicated("")
        # Rotation applied to the camera
        var RotationOffset<native><public>:(/Verse.org/SpatialMath:)rotation = external {}

        @experimental
        @replicated("")
        # Translation offset applied to the camera relative to the attached entity.
        var PositionOffsetCentimeters<native><public>:(/Verse.org/SpatialMath:)vector3 = external {}

        @experimental
        @replicated("")
        # Maximum forward interpolation factor for the boom arm.
        var BoomarmMaxForwardInterpolationFactor<native><public>:float = external {}

        @experimental
        @replicated("")
        # Maximum backward interpolation factor for the boom arm.
        var BoomarmMaxBackwardInterpolationFactor<native><public>:float = external {}

    @available {MinUploadedAtFNVersion := 4200}
    @experimental
    # Camera modifier that implements a fixed angle camera.
    fort_fixed_angle_camera_modifier<native><epic_internal> := class<concrete>(camera_modifier):
        NativeCameraRigAsset<override>:camera_rig_asset = external {}

        @experimental
        @replicated("")
        @editable
        # Entity the camera is attached to.
        TargetEntity<native><public>:entity = external {}

        @experimental
        @replicated("")
        @editable
        # Distance from the camera to the focus point along its forward axis.
        var CameraDistanceCentimeters<native><public>:float = external {}

        @experimental
        @replicated("")
        @editable
        # Translation offset applied on top of the calculated offset.
        var PositionOffsetCentimeters<native><public>:(/Verse.org/SpatialMath:)vector3 = external {}

        @experimental
        @replicated("")
        @editable
        # Rotation offset applied to the camera's orientation. Defaults to Pitch=`-45` (look down 45 degrees).
        var RotationOffset<native><public>:(/Verse.org/SpatialMath:)rotation = external {}

        @experimental
        @replicated("")
        @editable
        # Damping factor applied along the forward axis.
        var ForwardDampingFactor<native><public>:float = external {}

        @experimental
        @replicated("")
        @editable
        # Damping factor applied along the lateral axis.
        var LateralDampingFactor<native><public>:float = external {}

        @experimental
        @replicated("")
        @editable
        # Damping factor applied along the vertical axis.
        var VerticalDampingFactor<native><public>:float = external {}

        @experimental
        @replicated("")
        @editable
        # Whether camera-to-world collision avoidance is enabled.
        var EnableCollision<native><public>:logic = external {}

        @experimental
        @replicated("")
        @editable
        # Radius of the sphere used for collision queries.
        var CollisionSphereRadiusCentimeters<native><public>:float = external {}

        @experimental
        @replicated("")
        @editable
        # Translation offset applied to the collision safe position.
        var CollisionSafePositionOffsetCentimeters<native><public>:(/Verse.org/SpatialMath:)vector3 = external {}

    @available {MinUploadedAtFNVersion := 4200}
    @experimental
    # Camera modifier that implements a fixed point camera.
    fort_fixed_point_camera_modifier<native><epic_internal> := class<concrete>(camera_modifier):
        NativeCameraRigAsset<override>:camera_rig_asset = external {}

        @experimental
        @replicated("")
        @editable
        # Rotation offset applied to the camera's orientation.
        var RotationOffset<native><public>:(/Verse.org/SpatialMath:)rotation = external {}

        @experimental
        # Targets to frame, mapping each target entity to the weight it contributes to the framing calculation.
        var TargetEntities<public>:[entity]float = external {}

        @experimental
        @replicated("")
        @editable
        # The ideal horizontal screen-space position of the target in screen-space. Values are normalized where `0.5` is center of the screen
        var IdealFramingLocationScreenSpaceLeft<native><public>:float = external {}

        @experimental
        @replicated("")
        @editable
        # The ideal vertical screen-space position of the target. Values are normalized where `0.5` is center of the screen
        var IdealFramingLocationScreenSpaceUp<native><public>:float = external {}

        @experimental
        @replicated("")
        @editable
        # The time spent ramping down the reframing after entering the dead zone. If set to zero or a negative value, reframing will immediately stop once the target has entered the dead zone. Otherwise, the ReframeDampingFactor will interpolate towards zero over the specified amount of seconds.
        var DisengageTimeSeconds<native><public>:float = external {}

        @experimental
        @replicated("")
        @editable
        # The time spent ramping up the reframing after exiting the dead zone. 
        # If set to zero or a negative value, reframing will immediately stop once the target has entered the dead zone.
        # Otherwise the ReframeDampingFactor will interpolate from zero to its desired value over the specified amount of seconds.
        var ReengageTimeSeconds<native><public>:float = external {}

        @experimental
        @replicated("")
        @editable
        # Whether the camera is allowed to yaw (rotate horizontally) to reframe the target.
        # Turn off for a tilt-only camera that only corrects vertically.
        var CanYaw<native><public>:logic = external {}

        @experimental
        @replicated("")
        @editable
        # Whether the camera is allowed to pitch (rotate vertically) to reframe the target.
        # Turn off for a pan-only camera that only corrects horizontally.
        var CanPitch<native><public>:logic = external {}

        @experimental
        @replicated("")
        @editable
        # On first activation of this camera, snap the framing so the target is already at the ideal location instead of easing into it. Set to false for a pop-free entry from a wider blend.
        var ShouldSnapToIdealFraming<native><public>:logic = external {}

        @experimental
        @replicated("")
        @editable
        # How aggressively the camera corrects when the target is outside the dead zone. 0 = no damping (instant snap), higher = smoother but laggier (typically 1-10).
        var ReframeDampingFactor<native><public>:float = external {}

        @experimental
        @replicated("")
        @editable
        # If valid, the recentering damping factor will interpolate between LowReframeDampingFactor and ReframeDampingFactor as the target moves between the ideal target position and the boundaries of the soft-zone. 
        # If invalid, no interpolation occurs and the damping factor is always equal to ReframeDampingFactor.
        var LowReframeDampingFactor<native><public>:?float = external {}

        @experimental
        @replicated("")
        @editable
        # Predictive lead-time in seconds. The camera anticipates where the target will be N seconds from now based on its current velocity, and frames that anticipated position instead of the current one.  `0` = no anticipation. Useful for fast-moving targets to avoid trailing behind them.
        var TargetMovementAnticipationTimeSeconds<native><public>:float = external {}

        @experimental
        @replicated("")
        @editable
        # Left edge margin of the dead zone.
        # The dead zone is the screen-space region where the target can move freely without triggering reframing. 
        # Edges are normalized `[0, 1]` margins from each screen edge. `(0, 0, 0, 0)` = no dead zone (camera always reframes).
        var DeadZoneScreenSpaceLeft<native><public>:float = external {}

        @experimental
        @replicated("")
        @editable
        # Right edge margin of the dead zone 
        # The dead zone is the screen-space region where the target can move freely without triggering reframing. 
        # Edges are normalized `[0, 1]` margins from each screen edge. `(0, 0, 0, 0)` = no dead zone (camera always reframes).
        var DeadZoneScreenSpaceRight<native><public>:float = external {}

        @experimental
        @replicated("")
        @editable
        # Top edge margin of the dead zone 
        # The dead zone is the screen-space region where the target can move freely without triggering reframing. 
        # Edges are normalized `[0, 1]` margins from each screen edge. `(0, 0, 0, 0)` = no dead zone (camera always reframes).
        var DeadZoneScreenSpaceTop<native><public>:float = external {}

        @experimental
        @replicated("")
        @editable
        # Bottom edge margin of the dead zone 
        # The dead zone is the screen-space region where the target can move freely without triggering reframing. 
        # Edges are normalized `[0, 1]` margins from each screen edge. `(0, 0, 0, 0)` = no dead zone (camera always reframes).
        var DeadZoneScreenSpaceBottom<native><public>:float = external {}

        @experimental
        @replicated("")
        @editable
        # Left edge margin of the soft zone.
        # The soft zone is the screen-space region inside which the target is reframed normally. 
        # Outside the soft zone, the camera switches to a stronger damping factor to catch up quickly. 
        # Edges are normalized `[0, 1]` margins from each screen edge.
        var SoftZoneScreenSpaceLeft<native><public>:float = external {}

        @experimental
        @replicated("")
        @editable
        # Right edge margin of the soft zone. 
        # The soft zone is the screen-space region inside which the target is reframed normally. 
        # Outside the soft zone, the camera switches to a stronger damping factor to catch up quickly. 
        # Edges are normalized `[0, 1]` margins from each screen edge.
        var SoftZoneScreenSpaceRight<native><public>:float = external {}

        @experimental
        @replicated("")
        @editable
        # Top edge margin of the soft zone. 
        # The soft zone is the screen-space region inside which the target is reframed normally. 
        # Outside the soft zone, the camera switches to a stronger damping factor to catch up quickly. 
        # Edges are normalized `[0, 1]` margins from each screen edge.
        var SoftZoneScreenSpaceTop<native><public>:float = external {}

        @experimental
        @replicated("")
        @editable
        # Bottom edge margin of the soft zone. 
        # The soft zone is the screen-space region inside which the target is reframed normally. 
        # Outside the soft zone, the camera switches to a stronger damping factor to catch up quickly. 
        # Edges are normalized `[0, 1]` margins from each screen edge.
        var SoftZoneScreenSpaceBottom<native><public>:float = external {}

    @available {MinUploadedAtFNVersion := 4300}
    @experimental
    fort_camera_offset_space<native><public> := enum<open>:
        CameraSpace
        PivotSpace
        GlobalSpace

    @available {MinUploadedAtFNVersion := 4300}
    @experimental
    # Camera modifier that offsets the camera in the specified space.
    fort_offset_camera_modifier<native><public> := class<concrete>(camera_modifier):
        @experimental
        @replicated("")
        @editable
        # The translation offset to apply to the camera.
        var TranslationOffset<native><public>:(/Verse.org/SpatialMath:)vector3 = external {}

        @experimental
        @replicated("")
        @editable
        # The rotation offset to apply to the camera.
        var RotationOffset<native><public>:(/Verse.org/SpatialMath:)rotation = external {}

        @experimental
        @replicated("")
        @editable
        # The space in which to apply the offset.
        OffsetSpace<native><public>:fort_camera_offset_space = external {}

    @available {MinUploadedAtFNVersion := 4200}
    @experimental
    # Camera modifier that implements an orbit camera.
    fort_orbit_camera_modifier<native><epic_internal> := class<concrete>(camera_modifier):
        NativeCameraRigAsset<override>:camera_rig_asset = external {}

        @experimental
        @replicated("")
        @editable
        # Entity the camera is attached to
        TargetEntity<native><public>:entity = external {}

        @experimental
        @replicated("")
        @editable
        # Boom arm offset relative to the attached entity
        var BoomArmOffsetCentimeters<native><public>:(/Verse.org/SpatialMath:)vector3 = external {}

        @experimental
        @replicated("")
        @editable
        # Maximum forward interpolation factor for the boom arm
        var BoomArmMaxForwardInterpolationFactor<native><public>:float = external {}

        @experimental
        @replicated("")
        @editable
        # Maximum backward interpolation factor for the boom arm
        var BoomArmMaxBackwardInterpolationFactor<native><public>:float = external {}

        @experimental
        @replicated("")
        @editable
        # Damping factor applied along the forward axis
        var ForwardDampingFactor<native><public>:float = external {}

        @experimental
        @replicated("")
        @editable
        # Damping factor applied along the lateral axis
        var LateralDampingFactor<native><public>:float = external {}

        @experimental
        @replicated("")
        @editable
        # Damping factor applied along the vertical axis
        var VerticalDampingFactor<native><public>:float = external {}

        @experimental
        @replicated("")
        @editable
        # Whether camera-to-world collision avoidance is enabled
        var IsCollisionEnabled<native><public>:logic = external {}

        @experimental
        @replicated("")
        @editable
        # Radius of the sphere used for collision queries
        var CollisionSphereRadiusCentimeters<native><public>:float = external {}

        @experimental
        @replicated("")
        @editable
        # Distance from the camera to the orbit pivot along the camera's forward axis.
        var CameraDistanceCentimeters<native><public>:float = external {}

        @experimental
        @replicated("")
        @editable
        # Height of the orbit pivot above the attached entity's root, in centimeters.
        var CameraHeightCentimeters<native><public>:float = external {}

        @experimental
        @replicated("")
        @editable
        # Position offset applied to the camera relative to the orbit pivot, after the boom arm.
        var PositionOffsetCentimeters<native><public>:(/Verse.org/SpatialMath:)vector3 = external {}

        @experimental
        @replicated("")
        @editable
        # Rotation offset applied to the camera's orientation.
        var RotationOffset<native><public>:(/Verse.org/SpatialMath:)rotation = external {}

    @available {MinUploadedAtFNVersion := 4300}
    @experimental
    # Camera modifier that frames a target by rotating in place.
    fort_panning_framing_camera_modifier<native><public> := class<concrete>(fort_base_framing_camera_modifier):
        @experimental
        @replicated("")
        @editable
        # Whether the camera can rotate laterally (yaw).
        CanYaw<native><public>:logic = external {}

        @experimental
        @replicated("")
        @editable
        # Whether the camera can rotate vertically (pitch).
        CanPitch<native><public>:logic = external {}

    @available {MinUploadedAtFNVersion := 4300}
    @experimental
    # Camera modifier that sets the camera's rotation, replacing whatever the camera state arrived with rather than offsetting it. The rotation is always in global-space.
    fort_set_rotation_camera_modifier<native><public> := class<concrete>(camera_modifier):
        @experimental
        @replicated("")
        @editable
        # The global-space rotation to set on the camera.
        var Rotation<native><public>:(/Verse.org/SpatialMath:)rotation = external {}

    @available {MinUploadedAtFNVersion := 4300}
    @experimental
    # Camera modifier that sets the camera's translation, replacing whatever the camera state arrived with rather than offsetting it. The translation is always in global-space.
    fort_set_translation_camera_modifier<native><public> := class<concrete>(camera_modifier):
        @experimental
        @replicated("")
        @editable
        # The global-space translation to set on the camera.
        var Translation<native><public>:(/Verse.org/SpatialMath:)vector3 = external {}

    @available {MinUploadedAtFNVersion := 4300}
    @experimental
    @replicatable
    # A target entity paired with the weight it contributes to a framing calculation.
    fort_weighted_target_entity<native><public> := struct<concrete>:
        @editable
        Entity<native><public>:entity = external {}

        @editable
        Weight<native><public>:float = external {}