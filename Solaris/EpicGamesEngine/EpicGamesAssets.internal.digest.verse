using {/UnrealEngine.com/Temporary/SpatialMath}
using {/Verse.org/Assets}
# Module import path: /UnrealEngine.com/Assets
(/UnrealEngine.com:)Assets<public> := module:
    play_sound_subscription<native><epic_internal> := class(cancelable):
        Cancel<native><override>()<transacts>:void

    PlaySound<native><epic_internal>(Asset:sound, ?StartDelay:float = external {})<transacts>:cancelable

    PlaySoundAtLocation<native><epic_internal>(Asset:sound, Position:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, ?Rotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation = external {}, ?StartDelay:float = external {})<transacts>:cancelable

    spawn_particle_system_subscription<native><epic_internal> := class(cancelable):
        Cancel<native><override>()<transacts>:void

    SpawnParticleSystem<native><public>(Asset:particle_system, Position:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, ?Rotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation = external {}, ?StartDelay:float = external {})<transacts>:cancelable