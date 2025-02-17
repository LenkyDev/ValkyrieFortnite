using {/UnrealEngine.com/Temporary/SpatialMath}
using {/Verse.org/Assets}
# Module import path: /UnrealEngine.com/Assets
Assets<public> := module:
    SpawnParticleSystem<native><public>(Asset:particle_system, Position:vector3, ?Rotation:rotation = external {}, ?StartDelay:float = external {})<transacts>:cancelable