using {/Verse.org/Assets}
using {/Verse.org/Native}
using {/Verse.org/SceneGraph}
using {/Verse.org/Simulation}
# Use ability_component and ability_effect_component from Verse Ability API instead
ability<native><public> := class:
    GameplayAbilityPath<native><epic_internal>:?string = external {}

    Activate<native><protected>()<suspends>:void

@available {MinUploadedAtFNVersion := 4000}
# Data passed on activation of an ability. Holds who fired, who helped, and what got hit. 
#  Subclass to provide specific context for custom ability effects
ability_context<native><public> := class<castable>:
    Instigator<native><public>:?agent

    Participants<native><public>:[]entity

    Targets<native><public>:[]entity

@available {MinUploadedAtFNVersion := 4000}
# Lives in the scene graph and is the high level description of an ability. 
#  Knows if an ability can run, cooldowns, distance and targeting requirements etc...
ability_component<native><epic_internal> := class<abstract><final_super>(component, has_icon):
    @editable
    EffectPrefabType<public>:concrete_subtype(entity)

    Use<final><public>(Owner:entity, AbilityContext:ability_context)<transacts><decides>:entity = external {}

    CanUse<protected>(Owner:entity, AbilityContext:ability_context)<reads><decides>:void = external {}

    BeginUseEvent<native><public>:listenable(entity) = external {}

    EndUseEvent<native><public>:listenable(entity) = external {}

    var<private> ActiveEffects<native><public>:[]ability_effect_component = external {}

@available {MinUploadedAtFNVersion := 4000}
# Lightweight tag explaining why an effect ended.
cancel_reason<native><public> := class<abstract><castable>:


@available {MinUploadedAtFNVersion := 4000}
ability_ended<public> := class<castable>(cancel_reason):


@available {MinUploadedAtFNVersion := 4000}
# Attached to Ability Entity prefabs. Provides a central location for handling desired ability and gameplay logic.
ability_effect_component<native><epic_internal> := class<abstract><final_super>(component):
    OnBeginUse<native_callable><protected>()<transacts>:void = external {}

    OnEndUse<native><protected>(Reason:?cancel_reason)<transacts>:void

    EndUse<final><protected>()<transacts>:void = external {}

    Cancel<final><public>(Reason:cancel_reason)<transacts><decides>:void = external {}

    CanCancel<native_callable><protected>(Reason:cancel_reason)<transacts><decides>:void = external {}

    var Context<native><public>:?ability_context = external {}

    var Ability<native><public>:?ability_component = external {}

@experimental
# Use ability_component and ability_effect_component from Verse Ability API instead
old_ability_component<native><public> := class<final_super>(component):
    GiveAbility<native><public>(ability_type:subtype(ability))<transacts><decides>:void

    ActivateAbility<native><public>(ability_type:subtype(ability)):void

    GiveAbility<native><epic_internal>(Ability:ability)<transacts><decides>:void

    ActivateAbility<native><epic_internal>(Ability:ability):void

@attribscope_data
@customattribhandler
ability_link<epic_internal> := class<computes>(attribute):
    Name<epic_internal>:string = external {}

# Use ability_component and ability_effect_component from Verse Ability API instead
ability_asset<native><epic_internal> := class<computes>(asset):


@available {MinUploadedAtFNVersion := 4000}
# Template ability specific context so that we play abilities on the owner, 
#  subclass for template specific dynamic parameters to be passed to the native ability
template_context<native><epic_internal> := class<castable>(ability_context):
    AbilityOwner<native><public>:?agent

@available {MinUploadedAtFNVersion := 4000}
template_cancel_reason_ended<native><final><public> := class<castable>(cancel_reason):


@available {MinUploadedAtFNVersion := 4000}
template_cancel_reason_canceled<native><final><public> := class<castable>(cancel_reason):


@available {MinUploadedAtFNVersion := 4000}
template_cancel_reason_invalid<native><final><public> := class<castable>(cancel_reason):


@available {MinUploadedAtFNVersion := 4000}
# GAS template ability effect component
template_ability_effect_component<native><epic_internal> := class(ability_effect_component):
    OnBeginUse<override><native><final>()<transacts>:void

    OnEndUse<override><native><final>(Reason:?cancel_reason)<transacts>:void

    CanCancel<override>(Reason:cancel_reason)<transacts><decides>:void = external {}

    AbilityClass<native><epic_internal>:ability_asset