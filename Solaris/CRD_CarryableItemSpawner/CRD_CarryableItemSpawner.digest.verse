using {/UnrealEngine.com/Temporary/SpatialMath}
using {/Verse.org/Simulation}
# Used to spawn a carryable object into the experience.
carryable_spawner_device<public> := class<concrete><final>(creative_device_base, enableable):
    # Spawn the carryable from the device if it doesn't currently exist.
    Spawn<public>():void = external {}

    # Despawn the carryable, if it exists.
    Despawn<public>():void = external {}

    # Signaled when the carryable spawns, either by the `Spawn` function, or by timer.
    SpawnEvent<public>:listenable(tuple()) = external {}

    # Fails if the carryable does not exist in-world.
    IsSpawned<public>()<reads><decides>:void = external {}

    # Explode the carryable, if it exists.
    Explode<public>():void = external {}

    # Explode the carryable, if it exists.
    # Assigns the provided `agent` as the explosion instigator.
    Explode<public>(Agent:agent):void = external {}

    # Signaled when the carryable explodes.
    # Returns the instigating `agent`, if one exists.
    #  * The `agent` provided to the *Explode* function, or the agent who dealt lethal damage to the carryable.
    #  * Otherwise, the `agent` who most recently carried the item.
    # Returns an array of `agent`s affected by the explosion.
    ExplodeEvent<public>:listenable(tuple(?agent, []agent)) = external {}

    # Forces the carryable to be carried by the provided `player`, teleporting it into their hands.
    # If not in a viable state to carry the item (such as in a vehicle), or if the `player` fails the device's filters, it is ignored.
    ForcePlayerToCarry<public>(Player:player):void = external {}

    # Signaled when `agent` picks up the carryable.
    PickUpEvent<public>:listenable(agent) = external {}

    # Signaled when `agent` drops the carryable.
    # Includes manual drop as well as force drop, which can occur on entering a state that doesn't support carrying, such as elimination.
    DropEvent<public>:listenable(agent) = external {}

    # Signaled when `agent` throws the carryable.
    ThrowEvent<public>:listenable(agent) = external {}

    # Signaled when `agent` stops carrying the carryable.
    # This includes dropping, throwing, despawning, or force pickup by another player.
    ReleaseEvent<public>:listenable(agent) = external {}

    # Signaled when the carryable collides with an agent.
    # Damage applied is based off the collision velocity, as well as the device's *Impact Damage* settings.
    # This event will fire even if the damage applied is 0
    AgentCollideEvent<public>:listenable(carryable_spawner_agent_impact_result) = external {}

    # The `agent` carrying the carryable, if one exists.
    var<private> CarryingAgent<public>:?agent = external {}

    # The carryable transform, if the carryable exists in-world.
    var<private> CarryableObjectTransform<public>:?(/UnrealEngine.com/Temporary/SpatialMath:)transform = external {}

    # Maps to the device option for *Initial Spawn Velocity*.
    # The velocity (in meters per second) applied to the carryable when it first spawns.
    var InitialSpawnVelocity<public>:float = external {}

    # Maps to the device option for *Initial Spawn Angle*.
    # The angle (in degrees) of the cone from which the carryable will be randomly tossed when it first spawns.
    var InitialSpawnAngle<public>:float = external {}

    # Maps to the device option for *Takes Damage*.
    # Whether or not the carryable takes damage / can be destroyed.
    var CanTakeDamage<public>:logic = external {}

    # Maps to the device option for *Starting Health*.
    # Describes how much health the carryable spawns with.
    var StartingHealth<public>:float = external {}

    # Maps to the device option for *Impact Character Damage*.
    # Describes how much damage is done to characters hit by the carryable.
    # This value is scaled by the impact magnitude to calculate the applied damage.
    var ImpactDamage<public>:float = external {}

    # Maps to the device option for *Impact Environmental Damage*.
    # Describes how much damage is done to world objects hit by the carryable.
    # This value is scaled by the impact magnitude to calculate the applied damage.
    var ImpactEnvironmentalDamage<public>:float = external {}

    # Maps to the device option for *Explosion Character Damage*.
    # Describes how much damage is done to characters caught in the carryable explosion.
    var ExplosionDamage<public>:float = external {}

    # Maps to the device option for *Explosion Environmental Damage*.
    # Describes how much damage is done to world objects caught in the carryable explosion.
    var ExplosionEnvironmentalDamage<public>:float = external {}

    # Maps to the device option for *Explosion Radius*.
    # Describes the radius (in meters) of the carryable explosion.
    var ExplosionRadius<public>:float = external {}

    # Maps to the device option for *Explosion Impulse*.
    # Describes the strength of the knockback impulse applied by the carryable explosion.
    var ExplosionImpulse<public>:float = external {}

    # Enables this device, allowing it to listen for inputs and send events.
    Enable<override>():void = external {}

    # Disables this device, preventing it from listening for inputs and sending events.
    # When disabled, the carryable is unspawned, if it exists.
    Disable<override>():void = external {}

    # Succeeds if the object is enabled, fails if it is disabled.
    IsEnabled<override>()<transacts><decides>:void = external {}