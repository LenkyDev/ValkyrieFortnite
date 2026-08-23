# Verse path: /Fortnite.com/Abilities
using {/Verse.org}
using {/Verse.org/Assets}
using {/Verse.org/SpatialMath}
using {/Verse.org/Simulation}
using {/UnrealEngine.com/Abilities}
using {/Verse.org/SceneGraph}
using {/Verse.org/Native}
@available {MinUploadedAtFNVersion := 4200}
@experimental
@import_as("/Script/VerseFortniteAbilities.FFortItemAbilityComponentData")
fort_item_ability_component_data<native><public> := struct<concrete>:


@available {MinUploadedAtFNVersion := 4200}
@experimental
fort_item_ability_component<native><final><public> := class<final_super>(component):
    @editable {}
    var<private> ItemAbilities<native><public>:[]?ability(ability_context, ability_effect) = external {}

    AddItemAbility<native><public>(InAbility:ability(ability_context, ability_effect))<transacts>:void

    @editable {}
    var<private> ItemEquippedAbilities<native><public>:[]?ability(ability_context, ability_effect) = external {}

    AddItemEquippedAbility<native><public>(InAbility:ability(ability_context, ability_effect))<transacts>:void

    var<private> ComponentData<native><public>:fort_item_ability_component_data = external {}

    var<private> Equipped<native><public>:logic = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
# Result payload for a projectile impact.
projectile_impact_result<native><public> := struct<concrete>:
    # World-space location of the impact.
    Location<native><public>:(/Verse.org/SpatialMath:)vector3 = external {}

    # World-space surface normal at the impact point.
    Normal<native><public>:(/Verse.org/SpatialMath:)vector3 = external {}

    # The entity that was hit, if the impact was against one (false for world geometry).
    HitEntity<native><public>:?entity = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
# The base projectile component defining its behavior.
fort_projectile_component<native><public> := class<final_super>(component):
    # The agent that fired this projectile.
    GetInstigator<native><public>()<transacts><decides>:agent

    # The entity this projectile originated from (e.g. the weapon/launcher or ability effect).
    GetSource<native><public>()<transacts><decides>:entity

    @editable
    # Speed the projectile travels (cm/s).
    var<private> Speed<native><public>:float = external {}

    SetSpeed<native><public>(Val:float):void

    @editable
    # Distance before the projectile is cleared from the scene (cm).
    var<private> Range<native><public>:float = external {}

    SetRange<native><public>(Val:float):void

    @editable
    # Fall rate (cm/s^2). 0 = no gravity.
    var<private> Gravity<native><public>:float = external {}

    SetGravity<native><public>(Val:float):void

    # Method to tell the component a collision happened
    HandleCollision<native><public>(Result:projectile_impact_result):void

    # Event that is signaled upon impact
    OnImpactEvent<native><final><public>:listenable(projectile_impact_result) = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
# Base entity for a spawnable projectile.
projectile_template<native><public> := class<concrete><internal>(entity):
    # Projectile component required to define the behavior of the projectile. Can be changed in derived entities.
    ProjectileComponent<native><public>:?fort_projectile_component = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
@import_as("/Script/GameplayAbilities.FGameplayAbilitySpecHandle")
fort_ability_spec_handle<native><public> := struct<concrete>:


@available {MinUploadedAtFNVersion := 4200}
@experimental
# Prefab to provide a central location for handling desired ability and gameplay logic.
fort_template_ability_effect<native><public> := class<concrete>(ability_effect):
    AbilityComponent<override>:ability_effect_component = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
fort_template_ability_effect_component<native><public> := class(ability_effect_component):
    OnBeginUse<override><native><final>()<transacts>:void

    OnEndUse<override><native><final>(Reason:?cancel_reason)<transacts>:void

    CanCancel<override>(Reason:cancel_reason)<transacts><decides>:void = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
fort_template_ability<native><public>(context_type:subtype(ability_context), prefab_type:subtype(fort_template_ability_effect)) := class<abstract>(ability(context_type, prefab_type)):
    @available {MinUploadedAtFNVersion := 4294967041}
    (/Fortnite.com/Abilities/fort_template_ability:)Abilities_fort_template_ability_Variance_Inherited<private>(:context_type, :prefab_type, :context_type, :context_type):tuple(prefab_type, context_type, prefab_type, context_type, prefab_type) = external {}

    var (/Fortnite.com/Abilities/fort_template_ability:)Abilities_fort_template_ability_VarVariance_Inherited<private>:?tuple(prefab_type, prefab_type) = external {}

    (/Fortnite.com/Abilities/fort_template_ability:)Abilities_fort_template_ability_Variance<private>(:context_type):tuple() = external {}

    @editable {}
    var InputTrigger<native><public>:?input_action(logic) = external {}

    @editable {}
    var TargetQuery<native><public>:?ability_target_query = external {}

    @editable {}
    var AbilityElements<native><public>:[](/Verse.org:)Timeline.timeline_element = external {}

    var SpecHandle<native><public>:fort_ability_spec_handle = external {}

    OnRep_SpecHandle<native><public>():void

@available {MinUploadedAtFNVersion := 4200}
@experimental
fort_ability_attach_socket<native><public> := enum:
    Root
    LeftHand
    RightHand
    Head
    Chest
    LeftFoot
    RightFoot

@available {MinUploadedAtFNVersion := 4200}
@experimental
fort_cancel_reason_ended<native><final><public> := class<castable>(cancel_reason):


@available {MinUploadedAtFNVersion := 4200}
@experimental
fort_cancel_reason_canceled<native><final><public> := class<castable>(cancel_reason):


@available {MinUploadedAtFNVersion := 4200}
@experimental
fort_cancel_reason_invalid<native><final><public> := class<castable>(cancel_reason):


@available {MinUploadedAtFNVersion := 4200}
@experimental
fort_damage_behavior<native><public> := enum<open>:
    EffectiveDamage
    Health
    Shield

@available {MinUploadedAtFNVersion := 4200}
@experimental
fort_ability_damage_point<native><public> := class<concrete>(fort_ability_timeline_element_point):
    @editable {}
    Amount<native><public>:float = external {}

    @editable {}
    Behavior<native><public>:fort_damage_behavior = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
fort_ability_timeline_element_point<native><public> := class<concrete>((/Verse.org:)Timeline.timeline_element_point):
    var Time<override>:float = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
fort_ability_particle_system_element_point<native><public> := class(fort_ability_timeline_element_point):
    @editable {}
    ParticleSystem<native><public>:particle_system = external {}

    @editable {}
    var ParticleAttachment<native><public>:fort_ability_attach_socket = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
fort_ability_sound_element_point<native><public> := class(fort_ability_timeline_element_point):
    @editable {}
    Sound<native><public>:sound_wave = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
fort_ability_status_effect_point<native><public> := class(fort_ability_timeline_element_point):
    @editable {}
    var StatusEffectDuration<native><public>:float = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
fort_ability_status_effect_icy_feet_point<native><public> := class<final>(fort_ability_status_effect_point):


@available {MinUploadedAtFNVersion := 4200}
@experimental
fort_ability_status_effect_slap_point<native><public> := class<final>(fort_ability_status_effect_point):


@available {MinUploadedAtFNVersion := 4200}
@experimental
fort_ability_status_effect_pepper_point<native><public> := class<final>(fort_ability_status_effect_point):


@available {MinUploadedAtFNVersion := 4200}
@experimental
fort_ability_status_effect_burn_point<native><public> := class<final>(fort_ability_status_effect_point):


@available {MinUploadedAtFNVersion := 4200}
@experimental
fort_ability_timeline_element_span<native><public> := class<concrete>((/Verse.org:)Timeline.timeline_element_span):
    @editable {}
    var BeginTime<override>:float = external {}

    @editable {}
    var EndTime<override>:float = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
fort_ability_anim_layer<native><public> := enum:
    FullBody
    UpperBody

@available {MinUploadedAtFNVersion := 4200}
@experimental
fort_ability_animation_element_span<native><public> := class<concrete>(fort_ability_timeline_element_span):
    @editable {}
    Animation<native><public>:animation_sequence = external {}

    @editable {}
    AnimationLayer<native><public>:fort_ability_anim_layer = external {}

    @editable {}
    (/Fortnite.com/Abilities/fort_ability_animation_element_span:)EaseIn<native><public>:float = external {}

    @editable {}
    (/Fortnite.com/Abilities/fort_ability_animation_element_span:)EaseOut<native><public>:float = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
fort_ability_particle_system_element_span<native><public> := class<concrete>(fort_ability_timeline_element_span):
    @editable {}
    ParticleSystem<native><public>:particle_system = external {}

    @editable {}
    var ParticleAttachment<native><public>:fort_ability_attach_socket = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
fort_ability_sound_element_span<native><public> := class<concrete>(fort_ability_timeline_element_span):
    @editable {}
    Sound<native><public>:sound_wave = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
fort_heal_behavior<native><public> := enum<open>:
    EffectiveHealth
    Health
    Shield

@available {MinUploadedAtFNVersion := 4200}
@experimental
fort_ability_heal_point<native><public> := class<concrete>(fort_ability_timeline_element_point):
    @editable {}
    Amount<native><public>:float = external {}

    @editable {}
    Behavior<native><public>:fort_heal_behavior = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
# Fires a projectile defined by a projectile_template.
fort_ability_projectile_point<native><public> := class<concrete>(fort_ability_timeline_element_point):
    @editable {}
    # Which projectile to spawn (class handle; defaults to the base template).
    Projectile<native><public>:concrete_subtype(projectile_template) = external {}

    @editable {}
    # Local offset from the spawn socket. Use to nudge the muzzle position/rotation.
    SpawnOffset<native><public>:(/Verse.org/SpatialMath:)transform = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
fort_ability_remove_item_participant_point<native><public> := class<concrete>(fort_ability_timeline_element_point):


@available {MinUploadedAtFNVersion := 4200}
@experimental
ability_target_query<native><public> := class:


@available {MinUploadedAtFNVersion := 4200}
@experimental
self_ability_target_query<native><public> := class(ability_target_query):


@available {MinUploadedAtFNVersion := 4200}
@experimental
fort_target_query_affiliation<native><public> := enum:
    Any
    Friendly
    Hostile

@available {MinUploadedAtFNVersion := 4200}
@experimental
fort_reticle_ability_target_query<native><public> := class<concrete>(ability_target_query):
    @editable {}
    Target<native><public>:fort_target_query_affiliation = external {}

    @editable {}
    Range<native><public>:float = external {}

@available {MinUploadedAtFNVersion := 4200}
@experimental
fort_wedge_ability_target_query<native><public> := class<concrete>(ability_target_query):
    @editable {}
    Target<native><public>:fort_target_query_affiliation = external {}

    @editable {}
    Radius<native><public>:float = external {}

    @editable {}
    CentralAngle<native><public>:float = external {}