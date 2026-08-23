# Verse path: /Fortnite.com/Armory
using {/Verse.org/SceneGraph}
using {/Verse.org/Assets}
using {/Verse.org/SpatialMath}
using {/Verse.org/Simulation}
# The multi trace specific subtype of trace_weapon_component which adds multiple traces per shot properties
fort_multi_trace_weapon_component<native><public> := class<final_super><internal>(fort_trace_weapon_component):
    @editable_number(int) {MinValue := option {1}; MaxValue := option {20}}
    # The number of bullets to fire per shot
    var<private> BulletsPerShot<native><public>:int = external {}

    SetBulletsPerShot<native><public>(Val:int):void

# Struct that defines a range based damage multiplier
fort_range_damage_multiplier<native><public> := struct<concrete>:
    @editable_number(float) {MinValue := option {0.000000}}
    # The distance at which to apply the damage multiplier
    Range<native><public>:float = external {}

    @editable_number(float) {MinValue := option {0.000000}; MaxValue := option {10.000000}}
    # The multiplier applied to the damage at the specified range
    DamageMultiplier<native><public>:float = external {}

# The component on weapons entities like pistols and assault rifles for tweaking weapon properties
fort_trace_weapon_component<native><public> := class<internal>(fort_weapon_component):
    OnRemovingFromScene<native><override>():void

    @editable_number(float) {MinValue := option {0.000000}; MaxValue := option {1000.000000}}
    # The damage dealt by the weapon
    var<private> Damage<native><public>:float = external {}

    SetDamage<native><public>(Val:float):void

    @editable_number(float) {MinValue := option {0.000000}; MaxValue := option {10.000000}}
    # The damage multiplier for the environment
    var<private> EnvironmentalDamageMultiplier<native><public>:float = external {}

    SetEnvironmentalDamageMultiplier<native><public>(Val:float):void

    @editable {}
    # Range based damage multiplier
    var<private> RangeDamageMultiplier<native><public>:[]fort_range_damage_multiplier = external {}

    SetRangeDamageMultiplier<native><public>(Val:[]fort_range_damage_multiplier):void

    @editable_number(float) {MinValue := option {0.000000}}
    # The max range of the weapon
    var<private> MaxRange<native><public>:float = external {}

    SetMaxRange<native><public>(Val:float):void

    @editable_number(float) {MinValue := option {0.000000}; MaxValue := option {25.000000}}
    # The fire rate of the weapon
    var<private> FireRate<native><public>:float = external {}

    SetFireRate<native><public>(Val:float):void

    @editable_number(float) {MinValue := option {0.000000}; MaxValue := option {10.000000}}
    # The reload time of the weapon
    var<private> ReloadTime<native><public>:float = external {}

    SetReloadTime<native><public>(Val:float):void

    @editable_number(float) {MinValue := option {0.000000}; MaxValue := option {10.000000}}
    # The multiplier that affects the weapon spread expansion per shot
    var<private> ExpansionRateMultiplierPerShot<native><public>:float = external {}

    SetExpansionRateMultiplierPerShot<native><public>(Val:float):void

    @editable_number(float) {MinValue := option {0.000000}; MaxValue := option {10.000000}}
    # The multiplier that affects the weapon spread cooldown over time when not shooting
    var<private> CooldownRateMultiplierOverTime<native><public>:float = external {}

    SetCooldownRateMultiplierOverTime<native><public>(Val:float):void

    @editable_number(float) {MinValue := option {0.000000}; MaxValue := option {10.000000}}
    # The multiplier that affects the weapon spread while idle
    var<private> IdleSpreadMultiplier<native><public>:float = external {}

    SetIdleSpreadMultiplier<native><public>(Val:float):void

    @editable_number(float) {MinValue := option {0.000000}; MaxValue := option {10.000000}}
    # The multiplier that affects the weapon spread while moving
    var<private> MovingSpreadMultiplier<native><public>:float = external {}

    SetMovingSpreadMultiplier<native><public>(Val:float):void

    @editable_number(float) {MinValue := option {0.000000}; MaxValue := option {10.000000}}
    # The multiplier that affects the weapon spread while crouching
    var<private> CrouchingSpreadMultiplier<native><public>:float = external {}

    SetCrouchingSpreadMultiplier<native><public>(Val:float):void

    @editable_number(float) {MinValue := option {0.000000}; MaxValue := option {10.000000}}
    # The multiplier that affects the weapon spread while sliding
    var<private> SlidingSpreadMultiplier<native><public>:float = external {}

    SetSlidingSpreadMultiplier<native><public>(Val:float):void

    @editable_number(float) {MinValue := option {0.000000}; MaxValue := option {10.000000}}
    # The multiplier that affects the weapon spread while sprinting
    var<private> SprintingSpreadMultiplier<native><public>:float = external {}

    SetSprintingSpreadMultiplier<native><public>(Val:float):void

    @editable_number(float) {MinValue := option {0.000000}; MaxValue := option {10.000000}}
    # The multiplier that affects the weapon spread while aiming down sights
    var<private> AimDownSightSpreadMultiplier<native><public>:float = external {}

    SetAimDownSightSpreadMultiplier<native><public>(Val:float):void

    @editable_number(float) {MinValue := option {0.000000}; MaxValue := option {10.000000}}
    # The multiplier that affects the recoil of the weapon
    var<private> RecoilMultiplier<native><public>:float = external {}

    SetRecoilMultiplier<native><public>(Val:float):void

    @editable_number(float) {MinValue := option {0.000000}; MaxValue := option {10.000000}}
    # The multiplier that affects the recoil of the weapon when aiming down sights
    var<private> AimDownSightRecoilMultiplier<native><public>:float = external {}

    SetAimDownSightRecoilMultiplier<native><public>(Val:float):void

    @editable_number(int) {MinValue := option {1}; MaxValue := option {1000}}
    # The magazine size of the weapon
    var<private> MagazineCapacity<native><public>:int = external {}

    SetMagazineCapacity<native><public>(Val:int):void

    @editable_number(int) {MinValue := option {0}; MaxValue := option {10}}
    # The amount of ammo consumed per shot
    var<private> ShotAmmoCost<native><public>:int = external {}

    SetShotAmmoCost<native><public>(Val:int):void

    @editable {}
    # The transform by which to offset the weapon muzzle
    var<private> MuzzleOffset<native><public>:(/Verse.org/SpatialMath:)transform = external {}

    SetMuzzleOffset<native><public>(Val:(/Verse.org/SpatialMath:)transform):void

    @editable {}
    # The particle system to use for weapon muzzle flash
    var<private> MuzzleFlash<native><public>:?particle_system = external {}

    SetMuzzleFlash<native><public>(Val:?particle_system):void

    @editable {}
    # The particle system to use for weapon bullet tracers. The FX system's HitDistance parameter will update with impact distance or max range of the weapon.
    var<private> BulletTracer<native><public>:?particle_system = external {}

    SetBulletTracer<native><public>(Val:?particle_system):void

    @editable {}
    # The transform by which to offset the bullet shell ejection FX
    var<private> EjectionPortOffset<native><public>:(/Verse.org/SpatialMath:)transform = external {}

    SetEjectionPortOffset<native><public>(Val:(/Verse.org/SpatialMath:)transform):void

    @editable {}
    # The particle system to use for weapon bullet shells
    var<private> BulletShells<native><public>:?particle_system = external {}

    SetBulletShells<native><public>(Val:?particle_system):void

    @editable {}
    # The sounds to use when firing the weapon
    var<private> WeaponFireSound<native><public>:[]sound_wave = external {}

    SetWeaponFireSound<native><public>(Val:[]sound_wave):void

    @editable {}
    # The sounds to use when equipping the weapon
    var<private> EquipSound<native><public>:[]sound_wave = external {}

    SetEquipSound<native><public>(Val:[]sound_wave):void

    @editable {}
    # The sounds to use when starting aiming down sights
    var<private> AimingDownSightsStartSound<native><public>:[]sound_wave = external {}

    SetAimingDownSightsStartSound<native><public>(Val:[]sound_wave):void

    @editable {}
    # The sounds to use when ending aiming down sights
    var<private> AimingDownSightsEndSound<native><public>:[]sound_wave = external {}

    SetAimingDownSightsEndSound<native><public>(Val:[]sound_wave):void

    @editable {}
    # The sounds to use when starting a reload
    var<private> ReloadStartSound<native><public>:[]sound_wave = external {}

    SetReloadStartSound<native><public>(Val:[]sound_wave):void

    @editable {}
    # The sounds to use when inserting a magazine during reload
    var<private> ReloadInsertSound<native><public>:[]sound_wave = external {}

    SetReloadInsertSound<native><public>(Val:[]sound_wave):void

    @editable {}
    # The sounds to use when finishing a reload
    var<private> ReloadEndSound<native><public>:[]sound_wave = external {}

    SetReloadEndSound<native><public>(Val:[]sound_wave):void

    @editable {}
    # The sounds to use when the weapon is out of ammo
    var<private> OutOfAmmoSound<native><public>:[]sound_wave = external {}

    SetOutOfAmmoSound<native><public>(Val:[]sound_wave):void

# Base component for weapon related properties
fort_weapon_component<native><public> := class<abstract><final_super><internal>(component):
    OnAddedToScene<native><override>():void

    # Indicates whether the weapon is currently holstered
    var<private> IsHolstered<native><public>:logic = external {}

    # Event that is signalled when the weapon holster state changes
    HolsterChangedEvent<native><final><public>:listenable(tuple()) = external {}

pistol_mesh<public> := class<final>(mesh_component):


# The entity prefab for a creator customizable pistol
pistol_template<public> := class<concrete><final>(entity):


assault_rifle_mesh<public> := class<final>(mesh_component):


# The entity prefab for a creator customizable assault rifle
assault_rifle_template<public> := class<concrete><final>(entity):


sub_machine_gun_mesh<public> := class<final>(mesh_component):


# The entity prefab for a creator customizable SMG
sub_machine_gun_template<public> := class<concrete><final>(entity):


shotgun_mesh<public> := class<final>(mesh_component):


# The entity prefab for a creator customizable shotgun
shotgun_template<public> := class<concrete><final>(entity):
