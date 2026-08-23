# Verse path: /Verse.org/SceneGraph
using {/UnrealEngine.com/Temporary/SpatialMath}
using {/Verse.org/SpatialMath}
using {/Verse.org/Simulation}
# Suspends until the transform update completes or the timeout elapses. Returns true on success, false if the move did not complete in time.
(InEntity:entity).WaitForGlobalTransform<native><epic_internal>(Agent:agent, NewGlobalTransform:(/Verse.org/SpatialMath:)transform, ?Timeout:float)<suspends>:logic

# Suspends until the transform update completes or the timeout elapses. Returns true on success, false if the move did not complete in time.
(InEntity:entity).WaitForLocalTransform<native><epic_internal>(Agent:agent, NewLocalTransform:(/Verse.org/SpatialMath:)transform, ?Timeout:float)<suspends>:logic

# Suspends until the character's pawn is within PositionTolerance of ExpectedPosition and RotationTolerance of ExpectedRotation, and its physics has settled (stopped moving, grounded), or the timeout elapses.Returns true on success, false on timeout. Player characters only.
(Agent:agent).WaitForTeleportTo<native><epic_internal>(ExpectedPosition:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, ExpectedRotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation, PositionTolerance:float, RotationToleranceDegrees:float, IgnoreUp:logic, VelocityTolerance:float, Timeout:float)<suspends>:logic