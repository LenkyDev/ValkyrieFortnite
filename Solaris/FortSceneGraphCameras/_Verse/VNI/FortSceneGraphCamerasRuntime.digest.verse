# Verse path: /Fortnite.com
using {/Verse.org/Native}
@available {MinUploadedAtFNVersion := 4200}
@experimental
# Module import path: /Fortnite.com/SceneGraphCameras
SceneGraphCameras<public> := module:
    using {/Verse.org/Native}
    using {/Verse.org/SpatialMath}
    using {/Verse.org/SceneGraph}
    @available {MinUploadedAtFNVersion := 4200}
    @experimental
    # Camera modifier that implements a fixed angle camera.
    fort_fixed_angle_camera_modifier<native><public> := class<concrete>(camera_modifier):
        @experimental
        # Entity the camera is attached to.
        TargetEntity<native><public>:entity = external {}

        @experimental
        # Distance from the camera to the focus point along its forward axis.
        var CameraDistanceCentimeters<native><public>:float = external {}

        @experimental
        # Translation offset applied on top of the calculated offset.
        var PositionOffsetCentimeters<native><public>:(/Verse.org/SpatialMath:)vector3 = external {}

        @experimental
        # Rotation offset applied to the camera's orientation. Defaults to Pitch=`-45` (look down 45 degrees).
        var RotationOffset<native><public>:(/Verse.org/SpatialMath:)rotation = external {}

        @experimental
        # Damping factor applied along the forward axis.
        var ForwardDampingFactor<native><public>:float = external {}

        @experimental
        # Damping factor applied along the lateral axis.
        var LateralDampingFactor<native><public>:float = external {}

        @experimental
        # Damping factor applied along the vertical axis.
        var VerticalDampingFactor<native><public>:float = external {}

        @experimental
        # Whether camera-to-world collision avoidance is enabled.
        var EnableCollision<native><public>:logic = external {}

        @experimental
        # Radius of the sphere used for collision queries.
        var CollisionSphereRadiusCentimeters<native><public>:float = external {}

        @experimental
        # Translation offset applied to the collision safe position.
        var CollisionSafePositionOffsetCentimeters<native><public>:(/Verse.org/SpatialMath:)vector3 = external {}

    @available {MinUploadedAtFNVersion := 4200}
    @experimental
    # Camera modifier that implements a fixed point camera.
    fort_fixed_point_camera_modifier<native><public> := class<concrete>(camera_modifier):
        @experimental
        # Rotation offset applied to the camera's orientation.
        var RotationOffset<native><public>:(/Verse.org/SpatialMath:)rotation = external {}

        @experimental
        # Entities to frame in the camera.
        TargetEntities<native><public>:[]entity = external {}

        @experimental
        # The ideal horizontal screen-space position of the target in screen space. Values are normalized where `0.5` is center of the screen
        var IdealFramingLocationScreenSpaceLeft<native><public>:float = external {}

        @experimental
        # The ideal vertical screen-space position of the target. Values are normalized where `0.5` is center of the screen
        var IdealFramingLocationScreenSpaceUp<native><public>:float = external {}

        @experimental
        # The time spent ramping up the reframing after exiting the dead zone. 
        # If set to zero or a negative value, reframing will immediately stop once the target has entered the dead zone.
        # Otherwise the ReframeDampingFactor will interpolate from zero to its desired value over the specified amount of seconds.
        var ReengageTimeSeconds<native><public>:float = external {}

        @experimental
        # Whether the camera is allowed to yaw (rotate horizontally) to reframe the target.
        # Turn off for a tilt-only camera that only corrects vertically.
        var CanYaw<native><public>:logic = external {}

        @experimental
        # Whether the camera is allowed to pitch (rotate vertically) to reframe the target.
        # Turn off for a pan-only camera that only corrects horizontally.
        var CanPitch<native><public>:logic = external {}

        @experimental
        # On first activation of this camera, snap the framing so the target is already at the ideal location instead of easing into it. Set to false for a pop-free entry from a wider blend.
        var SnapToIdealFramingOnEnable<native><public>:logic = external {}

        @experimental
        # How aggressively the camera corrects when the target is outside the dead zone. 0 = no damping (instant snap), higher = smoother but laggier (typically 1-10).
        var ReframeDampingFactor<native><public>:float = external {}

        @experimental
        # If valid, the recentering damping factor will interpolate between LowReframeDampingFactor and ReframeDampingFactor as the target moves between the ideal target position and the boundaries of the soft-zone. 
        # If invalid, no interpolation occurs and the damping factor is always equal to ReframeDampingFactor.
        var LowReframeDampingFactor<native><public>:?float = external {}

        @experimental
        # Predictive lead-time in seconds. The camera anticipates where the target will be N seconds from now based on its current velocity, and frames that anticipated position instead of the current one.  `0` = no anticipation. Useful for fast-moving targets to avoid trailing behind them.
        var TargetMovementAnticipationTimeSeconds<native><public>:float = external {}

        @experimental
        # Left edge margin of the dead zone.
        # The dead zone is the screen-space region where the target can move freely without triggering reframing. 
        # Edges are normalized `[0, 1]` margins from each screen edge. `(0, 0, 0, 0)` = no dead zone (camera always reframes).
        var DeadZoneScreenSpaceLeft<native><public>:float = external {}

        @experimental
        # Right edge margin of the dead zone 
        # The dead zone is the screen-space region where the target can move freely without triggering reframing. 
        # Edges are normalized `[0, 1]` margins from each screen edge. `(0, 0, 0, 0)` = no dead zone (camera always reframes).
        var DeadZoneScreenSpaceRight<native><public>:float = external {}

        @experimental
        # Top edge margin of the dead zone 
        # The dead zone is the screen-space region where the target can move freely without triggering reframing. 
        # Edges are normalized `[0, 1]` margins from each screen edge. `(0, 0, 0, 0)` = no dead zone (camera always reframes).
        var DeadZoneScreenSpaceTop<native><public>:float = external {}

        @experimental
        # Bottom edge margin of the dead zone 
        # The dead zone is the screen-space region where the target can move freely without triggering reframing. 
        # Edges are normalized `[0, 1]` margins from each screen edge. `(0, 0, 0, 0)` = no dead zone (camera always reframes).
        var DeadZoneScreenSpaceBottom<native><public>:float = external {}

        @experimental
        # Left edge margin of the soft zone.
        # The soft zone is the screen-space region inside which the target is reframed normally. 
        # Outside the soft zone, the camera switches to a stronger damping factor to catch up quickly. 
        # Edges are normalized `[0, 1]` margins from each screen edge.
        var SoftZoneScreenSpaceLeft<native><public>:float = external {}

        @experimental
        # Right edge margin of the soft zone. 
        # The soft zone is the screen-space region inside which the target is reframed normally. 
        # Outside the soft zone, the camera switches to a stronger damping factor to catch up quickly. 
        # Edges are normalized `[0, 1]` margins from each screen edge.
        var SoftZoneScreenSpaceRight<native><public>:float = external {}

        @experimental
        # Top edge margin of the soft zone. 
        # The soft zone is the screen-space region inside which the target is reframed normally. 
        # Outside the soft zone, the camera switches to a stronger damping factor to catch up quickly. 
        # Edges are normalized `[0, 1]` margins from each screen edge.
        var SoftZoneScreenSpaceTop<native><public>:float = external {}

        @experimental
        # Bottom edge margin of the soft zone. 
        # The soft zone is the screen-space region inside which the target is reframed normally. 
        # Outside the soft zone, the camera switches to a stronger damping factor to catch up quickly. 
        # Edges are normalized `[0, 1]` margins from each screen edge.
        var SoftZoneScreenSpaceBottom<native><public>:float = external {}

    @available {MinUploadedAtFNVersion := 4200}
    @experimental
    # Camera modifier that implements an orbit camera.
    fort_orbit_camera_modifier<native><public> := class<concrete>(camera_modifier):
        @experimental
        # Entity the camera is attached to
        TargetEntity<native><public>:entity = external {}

        @experimental
        # Boom arm offset relative to the attached entity
        var BoomArmOffsetCentimeters<native><public>:(/Verse.org/SpatialMath:)vector3 = external {}

        @experimental
        # Maximum forward interpolation factor for the boom arm
        var BoomArmMaxForwardInterpolationFactor<native><public>:float = external {}

        @experimental
        # Maximum backward interpolation factor for the boom arm
        var BoomArmMaxBackwardInterpolationFactor<native><public>:float = external {}

        @experimental
        # Damping factor applied along the forward axis
        var ForwardDampingFactor<native><public>:float = external {}

        @experimental
        # Damping factor applied along the lateral axis
        var LateralDampingFactor<native><public>:float = external {}

        @experimental
        # Damping factor applied along the vertical axis
        var VerticalDampingFactor<native><public>:float = external {}

        @experimental
        # Whether camera-to-world collision avoidance is enabled
        var EnableCollision<native><public>:logic = external {}

        @experimental
        # Radius of the sphere used for collision queries
        var CollisionSphereRadiusCentimeters<native><public>:float = external {}

        @experimental
        # Distance from the camera to the orbit pivot along the camera's forward axis.
        var CameraDistanceCentimeters<native><public>:float = external {}

        @experimental
        # Height of the orbit pivot above the attached entity's root, in centimeters.
        var CameraHeightCentimeters<native><public>:float = external {}

        @experimental
        # Position offset applied to the camera relative to the orbit pivot, after the boom arm.
        var PositionOffsetCentimeters<native><public>:(/Verse.org/SpatialMath:)vector3 = external {}

        @experimental
        # Rotation offset applied to the camera's orientation.
        var RotationOffset<native><public>:(/Verse.org/SpatialMath:)rotation = external {}