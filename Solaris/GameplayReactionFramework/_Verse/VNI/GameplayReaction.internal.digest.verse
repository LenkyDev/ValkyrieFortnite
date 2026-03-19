using {/Verse.org/Native}
using {/Verse.org/SceneGraph}
execute_gameplay_reaction_error<native><public> := class<epic_internal>:


gameplay_reaction_context<native><epic_internal> := class:
    Source<native><epic_internal>:entity

    Target<native><epic_internal>:entity

gameplay_reaction<native><epic_internal> := class<abstract>:
    @available {MinUploadedAtFNVersion := 4000}
    Execute<native><epic_internal>(ContextObject:gameplay_reaction_context):result(void, []execute_gameplay_reaction_error)