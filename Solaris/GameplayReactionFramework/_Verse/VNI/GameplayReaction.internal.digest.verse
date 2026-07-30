using {/Verse.org/Native}
@available {MinUploadedAtFNVersion := 4110}
# Module import path: /UnrealEngine.com/Progression
Progression<public> := module:
    using {/Verse.org/SceneGraph}
    execute_gameplay_reaction_error<native><public> := class<epic_internal>:


    gameplay_reaction_context<native><epic_internal> := class:
        Source<native><epic_internal>:entity

        Target<native><epic_internal>:entity

    gameplay_reaction<native><epic_internal> := class<abstract>:
        Execute<native_callable><epic_internal>(ContextObject:gameplay_reaction_context)<transacts>:result(void, []execute_gameplay_reaction_error)

    has_gameplay_reactions<native><epic_internal> := interface<epic_internal>:
        Reactions<epic_internal>:[]gameplay_reaction = external {}

        TriggerReactions<epic_internal>(Context:gameplay_reaction_context)<transacts>:void = external {}