using {/Verse.org/Assets}
using {/Verse.org/Native}
using {/Verse.org/SceneGraph}
using {/Verse.org/Simulation}
@available {MinUploadedAtFNVersion := 4000}
@experimental
# Data passed on activation of an ability. Holds who fired, who helped, and what got hit. 
#  Subclass to provide specific context for custom ability effects
ability_context<native><public> := class<concrete>:
    var Instigator<native><public>:?agent = external {}

    var Participants<native><public>:[]entity = external {}

    var Targets<native><public>:[]entity = external {}

@available {MinUploadedAtFNVersion := 4000}
@experimental
# Prefab to provide a central location for handling desired ability and gameplay logic.
ability_effect<native><epic_internal> := class<concrete>(entity):


@available {MinUploadedAtFNVersion := 4000}
@experimental
# Lives in the scene graph and is the high level description of an ability. 
#  Knows if an ability can run, cooldowns, distance and targeting requirements etc...
ability<native><epic_internal>(context_type:subtype(ability_context), ability_effect_type:subtype(ability_effect)) := class<abstract>(has_icon):
    (/UnrealEngine.com/Abilities/ability:)Abilities_ability_Variance<private>(:context_type, :ability_effect_type, :context_type, :context_type):tuple(ability_effect_type, context_type, ability_effect_type) = external {}

    var (/UnrealEngine.com/Abilities/ability:)Abilities_ability_VarVariance<private>:?tuple(ability_effect_type) = external {}

    Use<final><public>(AbilityEffectParent:entity, AbilityContext:context_type):?ability_effect_type = external {}

    CanUse<epic_internal>(AbilityEffectParent:entity, AbilityContext:context_type)<reads><decides>:void = external {}

    BeginUseEvent<native><public>:listenable(entity) = external {}

    EndUseEvent<native><public>:listenable(entity) = external {}

    MakeContext<epic_internal>()<transacts>:context_type

    MakeAbility<epic_internal>()<transacts>:ability_effect_type

    var<private> ActiveEffects<native><public>:[]ability_effect_type

@available {MinUploadedAtFNVersion := 4000}
@experimental
# Lightweight tag explaining why an effect ended.
cancel_reason<native><public> := class<abstract><castable>:


@available {MinUploadedAtFNVersion := 4000}
@experimental
ability_ended<public> := class<castable>(cancel_reason):


@available {MinUploadedAtFNVersion := 4000}
@experimental
# Guaranteed Ability component on Ability prefab entities. Handles Ability lifecycle.
ability_effect_component<native><epic_internal> := class<final_super>(component):
    OnBeginUse<native_callable><protected>()<transacts>:void = external {}

    OnEndUse<native><protected>(Reason:?cancel_reason)<transacts>:void

    EndUse<final><protected>()<transacts>:void = external {}

    Cancel<final><public>(Reason:cancel_reason)<transacts><decides>:void = external {}

    CanCancel<native_callable><protected>(Reason:cancel_reason)<transacts><decides>:void = external {}

    var<protected> Context<native><public>:?ability_context = external {}

    var<protected> Ability<native><public>:?ability(ability_context, ability_effect) = external {}