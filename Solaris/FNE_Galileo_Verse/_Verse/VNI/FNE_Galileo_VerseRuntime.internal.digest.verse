using {/Verse.org/Colors}
using {/Verse.org/SceneGraph}
using {/UnrealEngine.com/Itemization}
force_power_item_component<native><public> := class<abstract><epic_internal>(item_component):


# Represents an item that gives its holder the Force Lightning power.
force_power_lightning_component<native><public> := class<epic_internal>(force_power_item_component, has_merge_rules):
    AllowMergeInto<override>(TargetEntity:entity)<reads><decides>:void = external {}

    var Damage<public>:float = external {}

    var BuildingDamage<public>:float = external {}

    var Duration<public>:float = external {}

    var Cooldown<public>:float = external {}

# Represents an item that gives its holder the Force Push power.
force_power_push_component<native><public> := class<epic_internal>(force_power_item_component, has_merge_rules):
    AllowMergeInto<override>(TargetEntity:entity)<reads><decides>:void = external {}

    var PushForce<public>:float = external {}

    var Cooldown<public>:float = external {}

# Represents an item that gives its holder the Force Pull power.
force_power_pull_component<native><public> := class<epic_internal>(force_power_item_component, has_merge_rules):
    AllowMergeInto<override>(TargetEntity:entity)<reads><decides>:void = external {}

    var PullForce<epic_internal>:float = external {}

    var Cooldown<public>:float = external {}

# Represents an item that gives its holder the Force Throw power.
force_power_throw_component<native><public> := class<epic_internal>(force_power_item_component, has_merge_rules):
    AllowMergeInto<override>(TargetEntity:entity)<reads><decides>:void = external {}

    var Damage<public>:float = external {}

    var BuildingDamage<public>:float = external {}

    var Cooldown<public>:float = external {}

    var MaxRange<epic_internal>:float = external {}

# Represents an item that gives its holder the Force Shield power.
force_power_shield_component<native><public> := class<epic_internal>(force_power_item_component, has_merge_rules):
    AllowMergeInto<override>(TargetEntity:entity)<reads><decides>:void = external {}

    var Energy<public>:float = external {}

    var Cooldown<public>:float = external {}

    var DrainRate<public>:float = external {}

    var RechargeRate<public>:float = external {}

    var RechargeDelay<public>:float = external {}

    var KnockbackForce<public>:float = external {}

# Represents an item that gives its holder the Force Heal power.
force_power_heal_component<native><public> := class<epic_internal>(force_power_item_component, has_merge_rules):
    AllowMergeInto<override>(TargetEntity:entity)<reads><decides>:void = external {}

    var Energy<epic_internal>:float = external {}

    var Cooldown<public>:float = external {}

    var DrainRate<public>:float = external {}

    var RechargeRate<public>:float = external {}

    var RechargeDelay<public>:float = external {}

    var HealStrength<public>:float = external {}

# Represents an item that gives its holder the Force Training power (Jump and Sprint).
force_power_training_component<native><public> := class<epic_internal>(force_power_item_component, has_merge_rules):
    AllowMergeInto<override>(TargetEntity:entity)<reads><decides>:void = external {}

    var JumpStaminaCost<public>:float = external {}

    var StaminaCost<public>:float = external {}

# Represents an item that gives its holder the Force Awareness power.
force_power_awareness_component<native><public> := class<epic_internal>(force_power_item_component, has_merge_rules):
    AllowMergeInto<override>(TargetEntity:entity)<reads><decides>:void = external {}

    var Duration<public>:float = external {}

    var Cooldown<public>:float = external {}

# Represents an item that gives its holder the Force Mind Trick power.
force_power_trick_component<native><public> := class<epic_internal>(force_power_item_component, has_merge_rules):
    AllowMergeInto<override>(TargetEntity:entity)<reads><decides>:void = external {}

    var Duration<public>:float = external {}

    var TimesHit<epic_internal>:int = external {}

    var Cooldown<public>:float = external {}

# Represents an item that gives its holder the Force Distraction power.
force_power_distraction_component<native><public> := class<epic_internal>(force_power_item_component, has_merge_rules):
    AllowMergeInto<override>(TargetEntity:entity)<reads><decides>:void = external {}

    var Health<public>:float = external {}

    var Duration<public>:float = external {}

# Represents an item that gives its holder the Force Saber Throw power.
force_power_saber_throw_component<native><public> := class<epic_internal>(force_power_item_component, has_merge_rules):
    AllowMergeInto<override>(TargetEntity:entity)<reads><decides>:void = external {}

    var Damage<public>:float = external {}

    var BuildingDamage<public>:float = external {}

    var Cooldown<public>:float = external {}

    var Speed<epic_internal>:float = external {}

    var (/Fortnite.com/StarWars/force_power_saber_throw_component:)Distance<epic_internal>:float = external {}

# Module import path: /Fortnite.com/StarWars/GalileoItemUtils
GalileoItemUtils<epic_internal> := module:
    using {/Verse.org/SceneGraph}
    AddKyberCrystalComponent<native><epic_internal>(InEntity:entity, InComponent:subtype(kyber_crystal_component))<converges>:void

kyber_crystal_component<native><public> := class<abstract><final_super><internal>(component):
    var<private> Color<public>:color = external {}

    var<private> EmissiveIntensity<public>:float = external {}

    var ArcIntensity<public>:float = external {}

    var Stability<public>:float = external {}

kyber_crystal_blue_component<public> := class(kyber_crystal_component):


kyber_crystal_green_component<public> := class(kyber_crystal_component):


kyber_crystal_purple_component<public> := class(kyber_crystal_component):


kyber_crystal_red_component<public> := class(kyber_crystal_component):


kyber_crystal_red_unstable_component<public> := class(kyber_crystal_red_component):


kyber_crystal_red_damaged_component<public> := class(kyber_crystal_red_component):


kyber_crystal_orange_component<public> := class(kyber_crystal_component):


kyber_crystal_yellow_component<public> := class(kyber_crystal_component):


kyber_crystal_white_component<public> := class(kyber_crystal_component):


lightsaber_item_component<native><public> := class<abstract><epic_internal>(item_component):


lightsaber_item_single<native><public> := class<abstract><epic_internal>(lightsaber_item_component, has_merge_rules):
    AllowMergeInto<override>(TargetEntity:entity)<reads><decides>:void = external {}

lightsaber_item_crossguard<native><public> := class<abstract><epic_internal>(lightsaber_item_component, has_merge_rules):
    AllowMergeInto<override>(TargetEntity:entity)<reads><decides>:void = external {}

lightsaber_item_kenobi<public> := class<final><epic_internal>(lightsaber_item_single):


lightsaber_item_ren<public> := class<final><epic_internal>(lightsaber_item_crossguard):


lightsaber_item_rey<public> := class<final><epic_internal>(lightsaber_item_single):


lightsaber_item_skywalker<public> := class<final><epic_internal>(lightsaber_item_single):


lightsaber_item_vader<public> := class<final><epic_internal>(lightsaber_item_single):


lightsaber_item_windu<public> := class<final><epic_internal>(lightsaber_item_single):


lightsaber_item_jedi_padawan_a<public> := class<final><epic_internal>(lightsaber_item_single):


lightsaber_item_jedi_padawan_b<public> := class<final><epic_internal>(lightsaber_item_single):


lightsaber_item_jedi_training<public> := class<final><epic_internal>(lightsaber_item_single):


lightsaber_item_sith_apprentice<public> := class<final><epic_internal>(lightsaber_item_single):
