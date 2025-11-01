# Module import path: /UnrealEngine.com/Assets
(/UnrealEngine.com:)Assets<public> := module:
    using {/Verse.org/SpatialMath}
    using {/UnrealEngine.com/Temporary/SpatialMath}
    using {/Verse.org/Assets}
    SpawnParticleSystem<native><public>(Asset:particle_system, Position:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, ?Rotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation = external {}, ?StartDelay:float = external {})<transacts>:cancelable

    SpawnParticleSystem<native><public>(Asset:particle_system, Position:(/Verse.org/SpatialMath:)vector3, ?Rotation:(/Verse.org/SpatialMath:)rotation = external {}, ?StartDelay:float = external {})<transacts>:cancelable