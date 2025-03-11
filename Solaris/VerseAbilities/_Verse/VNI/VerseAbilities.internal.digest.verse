using {/Verse.org/SceneGraph}
ability<native><public> := class:
    GameplayAbilityPath<native><epic_internal>:?string = external {}

    Activate<native><protected>()<suspends>:void

@experimental
ability_component<native><public> := class<final_super>(component):
    GiveAbility<native><public>(ability_type:subtype(ability))<transacts><decides>:void

    ActivateAbility<native><public>(ability_type:subtype(ability)):void

    GiveAbility<native><epic_internal>(Ability:ability)<transacts><decides>:void

    ActivateAbility<native><epic_internal>(Ability:ability):void

@attribscope_data
@customattribhandler
ability_link<epic_internal> := class<computes>(attribute):
    Name<epic_internal>:string = external {}