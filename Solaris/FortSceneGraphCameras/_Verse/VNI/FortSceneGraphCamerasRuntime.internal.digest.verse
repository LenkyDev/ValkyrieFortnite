# Verse path: /Fortnite.com
using {/Verse.org/Native}
@available {MinUploadedAtFNVersion := 4200}
@experimental
# Module import path: /Fortnite.com/SceneGraphCameras
SceneGraphCameras<public> := module:
    using {/Verse.org/SpatialMath}
    using {/Verse.org/Assets}
    using {/Verse.org/Native}
    using {/Verse.org/Temporary/EpicGamesRestricted/Network}
    using {/Verse.org/SceneGraph}
    @available {MinUploadedAtFNVersion := 4200}
    @experimental
    # Base class for nodes that frame a target
    fort_base_framing_camera_modifier<native><epic_internal> := class<abstract>(camera_modifier):
        @experimental
        @replicated("")
        # Targets to frame
        var Targets<native><public>:[entity]float = external {}

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

    @available {MinUploadedAtFNVersion := 4200}
    @experimental
    # Camera modifier that frames a target by moving along a sideways rail (left/right relative to the camera transform) and optionally also up and down..
    fort_dolly_framing_camera_modifier<native><epic_internal> := class<concrete>(fort_base_framing_camera_modifier):


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
    fort_fixed_angle_camera_modifier<native><public> := class<concrete>(camera_modifier):
        NativeCameraRigAsset<override>:camera_rig_asset = external {}

        @experimental
        @replicated("")
        # Entity the camera is attached to.
        TargetEntity<native><public>:entity = external {}

        @experimental
        @replicated("")
        # Distance from the camera to the focus point along its forward axis.
        var CameraDistanceCentimeters<native><public>:float = external {}

        @experimental
        @replicated("")
        # Translation offset applied on top of the calculated offset.
        var PositionOffsetCentimeters<native><public>:(/Verse.org/SpatialMath:)vector3 = external {}

        @experimental
        @replicated("")
        # Rotation offset applied to the camera's orientation. Defaults to Pitch=`-45` (look down 45 degrees).
        var RotationOffset<native><public>:(/Verse.org/SpatialMath:)rotation = external {}

        @experimental
        @replicated("")
        # Damping factor applied along the forward axis.
        var ForwardDampingFactor<native><public>:float = external {}

        @experimental
        @replicated("")
        # Damping factor applied along the lateral axis.
        var LateralDampingFactor<native><public>:float = external {}

        @experimental
        @replicated("")
        # Damping factor applied along the vertical axis.
        var VerticalDampingFactor<native><public>:float = external {}

        @experimental
        @replicated("")
        # Whether camera-to-world collision avoidance is enabled.
        var EnableCollision<native><public>:logic = external {}

        @experimental
        @replicated("")
        # Radius of the sphere used for collision queries.
        var CollisionSphereRadiusCentimeters<native><public>:float = external {}

        @experimental
        @replicated("")
        # Translation offset applied to the collision safe position.
        var CollisionSafePositionOffsetCentimeters<native><public>:(/Verse.org/SpatialMath:)vector3 = external {}

    @available {MinUploadedAtFNVersion := 4200}
    @experimental
    # Camera modifier that implements a fixed point camera.
    fort_fixed_point_camera_modifier<native><public> := class<concrete>(camera_modifier):
        NativeCameraRigAsset<override>:camera_rig_asset = external {}

        @experimental
        @replicated("")
        # Rotation offset applied to the camera's orientation.
        var RotationOffset<native><public>:(/Verse.org/SpatialMath:)rotation = external {}

        @experimental
        @replicated("")
        # Entities to frame in the camera.
        TargetEntities<native><public>:[]entity = external {}

        @experimental
        @replicated("")
        # The ideal horizontal screen-space position of the target in screen space. Values are normalized where `0.5` is center of the screen
        var IdealFramingLocationScreenSpaceLeft<native><public>:float = external {}

        @experimental
        @replicated("")
        # The ideal vertical screen-space position of the target. Values are normalized where `0.5` is center of the screen
        var IdealFramingLocationScreenSpaceUp<native><public>:float = external {}

        @experimental
        @replicated("")
        # The time spent ramping up the reframing after exiting the dead zone. 
        # If set to zero or a negative value, reframing will immediately stop once the target has entered the dead zone.
        # Otherwise the ReframeDampingFactor will interpolate from zero to its desired value over the specified amount of seconds.
        var ReengageTimeSeconds<native><public>:float = external {}

        @experimental
        @replicated("")
        # Whether the camera is allowed to yaw (rotate horizontally) to reframe the target.
        # Turn off for a tilt-only camera that only corrects vertically.
        var CanYaw<native><public>:logic = external {}

        @experimental
        @replicated("")
        # Whether the camera is allowed to pitch (rotate vertically) to reframe the target.
        # Turn off for a pan-only camera that only corrects horizontally.
        var CanPitch<native><public>:logic = external {}

        @experimental
        @replicated("")
        # On first activation of this camera, snap the framing so the target is already at the ideal location instead of easing into it. Set to false for a pop-free entry from a wider blend.
        var SnapToIdealFramingOnEnable<native><public>:logic = external {}

        @experimental
        @replicated("")
        # How aggressively the camera corrects when the target is outside the dead zone. 0 = no damping (instant snap), higher = smoother but laggier (typically 1-10).
        var ReframeDampingFactor<native><public>:float = external {}

        @experimental
        @replicated("")
        # If valid, the recentering damping factor will interpolate between LowReframeDampingFactor and ReframeDampingFactor as the target moves between the ideal target position and the boundaries of the soft-zone. 
        # If invalid, no interpolation occurs and the damping factor is always equal to ReframeDampingFactor.
        var LowReframeDampingFactor<native><public>:?float = external {}

        @experimental
        @replicated("")
        # Predictive lead-time in seconds. The camera anticipates where the target will be N seconds from now based on its current velocity, and frames that anticipated position instead of the current one.  `0` = no anticipation. Useful for fast-moving targets to avoid trailing behind them.
        var TargetMovementAnticipationTimeSeconds<native><public>:float = external {}

        @experimental
        @replicated("")
        # Left edge margin of the dead zone.
        # The dead zone is the screen-space region where the target can move freely without triggering reframing. 
        # Edges are normalized `[0, 1]` margins from each screen edge. `(0, 0, 0, 0)` = no dead zone (camera always reframes).
        var DeadZoneScreenSpaceLeft<native><public>:float = external {}

        @experimental
        @replicated("")
        # Right edge margin of the dead zone 
        # The dead zone is the screen-space region where the target can move freely without triggering reframing. 
        # Edges are normalized `[0, 1]` margins from each screen edge. `(0, 0, 0, 0)` = no dead zone (camera always reframes).
        var DeadZoneScreenSpaceRight<native><public>:float = external {}

        @experimental
        @replicated("")
        # Top edge margin of the dead zone 
        # The dead zone is the screen-space region where the target can move freely without triggering reframing. 
        # Edges are normalized `[0, 1]` margins from each screen edge. `(0, 0, 0, 0)` = no dead zone (camera always reframes).
        var DeadZoneScreenSpaceTop<native><public>:float = external {}

        @experimental
        @replicated("")
        # Bottom edge margin of the dead zone 
        # The dead zone is the screen-space region where the target can move freely without triggering reframing. 
        # Edges are normalized `[0, 1]` margins from each screen edge. `(0, 0, 0, 0)` = no dead zone (camera always reframes).
        var DeadZoneScreenSpaceBottom<native><public>:float = external {}

        @experimental
        @replicated("")
        # Left edge margin of the soft zone.
        # The soft zone is the screen-space region inside which the target is reframed normally. 
        # Outside the soft zone, the camera switches to a stronger damping factor to catch up quickly. 
        # Edges are normalized `[0, 1]` margins from each screen edge.
        var SoftZoneScreenSpaceLeft<native><public>:float = external {}

        @experimental
        @replicated("")
        # Right edge margin of the soft zone. 
        # The soft zone is the screen-space region inside which the target is reframed normally. 
        # Outside the soft zone, the camera switches to a stronger damping factor to catch up quickly. 
        # Edges are normalized `[0, 1]` margins from each screen edge.
        var SoftZoneScreenSpaceRight<native><public>:float = external {}

        @experimental
        @replicated("")
        # Top edge margin of the soft zone. 
        # The soft zone is the screen-space region inside which the target is reframed normally. 
        # Outside the soft zone, the camera switches to a stronger damping factor to catch up quickly. 
        # Edges are normalized `[0, 1]` margins from each screen edge.
        var SoftZoneScreenSpaceTop<native><public>:float = external {}

        @experimental
        @replicated("")
        # Bottom edge margin of the soft zone. 
        # The soft zone is the screen-space region inside which the target is reframed normally. 
        # Outside the soft zone, the camera switches to a stronger damping factor to catch up quickly. 
        # Edges are normalized `[0, 1]` margins from each screen edge.
        var SoftZoneScreenSpaceBottom<native><public>:float = external {}

    @available {MinUploadedAtFNVersion := 4200}
    @experimental
    # Camera modifier that implements an orbit camera.
    fort_orbit_camera_modifier<native><public> := class<concrete>(camera_modifier):
        NativeCameraRigAsset<override>:camera_rig_asset = external {}

        @experimental
        @replicated("")
        # Entity the camera is attached to
        TargetEntity<native><public>:entity = external {}

        @experimental
        @replicated("")
        # Boom arm offset relative to the attached entity
        var BoomArmOffsetCentimeters<native><public>:(/Verse.org/SpatialMath:)vector3 = external {}

        @experimental
        @replicated("")
        # Maximum forward interpolation factor for the boom arm
        var BoomArmMaxForwardInterpolationFactor<native><public>:float = external {}

        @experimental
        @replicated("")
        # Maximum backward interpolation factor for the boom arm
        var BoomArmMaxBackwardInterpolationFactor<native><public>:float = external {}

        @experimental
        @replicated("")
        # Damping factor applied along the forward axis
        var ForwardDampingFactor<native><public>:float = external {}

        @experimental
        @replicated("")
        # Damping factor applied along the lateral axis
        var LateralDampingFactor<native><public>:float = external {}

        @experimental
        @replicated("")
        # Damping factor applied along the vertical axis
        var VerticalDampingFactor<native><public>:float = external {}

        @experimental
        @replicated("")
        # Whether camera-to-world collision avoidance is enabled
        var EnableCollision<native><public>:logic = external {}

        @experimental
        @replicated("")
        # Radius of the sphere used for collision queries
        var CollisionSphereRadiusCentimeters<native><public>:float = external {}

        @experimental
        @replicated("")
        # Distance from the camera to the orbit pivot along the camera's forward axis.
        var CameraDistanceCentimeters<native><public>:float = external {}

        @experimental
        @replicated("")
        # Height of the orbit pivot above the attached entity's root, in centimeters.
        var CameraHeightCentimeters<native><public>:float = external {}

        @experimental
        @replicated("")
        # Position offset applied to the camera relative to the orbit pivot, after the boom arm.
        var PositionOffsetCentimeters<native><public>:(/Verse.org/SpatialMath:)vector3 = external {}

        @experimental
        @replicated("")
        # Rotation offset applied to the camera's orientation.
        var RotationOffset<native><public>:(/Verse.org/SpatialMath:)rotation = external {}

    @available {MinUploadedAtFNVersion := 4200}
    @experimental
    # Camera modifier that frames a target by rotating in place.
    fort_panning_framing_camera_modifier<native><epic_internal> := class<concrete>(fort_base_framing_camera_modifier):
