# Module import path: /Verse.org/Containers
Containers<epic_internal> := module:
    using {/Verse.org/Simulation}
    using {/Verse.org/Temporary/EpicGamesRestricted/Network}
    using {/Verse.org/Native}
    @experimental
    modifier_base<native><epic_internal> := interface:


    @experimental
    # Implemented by classes to provide a method for modification evaluation.
    modifier<epic_internal>(t:type) := interface(modifier_base):
        (/Verse.org/Containers/modifier:)Containers_modifier_Variance<private>(:t):tuple(t) = external {}

        Evaluate<epic_internal>(InValue:t)<reads>:t = external {}

    stack_position<epic_internal> := rational

    @experimental
    # Modifier stacks provide an ordered application of modifiers.
    modifier_stack<native><epic_internal>(t:type) := class(modifier(t), modifier_stack_base):
        @available {MinUploadedAtFNVersion := 4294967041}
        (/Verse.org/Containers/modifier_stack:)Containers_modifier_stack_Variance_Inherited<private>(:t):tuple(t) = external {}

        (/Verse.org/Containers/modifier_stack:)Containers_modifier_stack_Variance<private>(:t):tuple(t) = external {}

        # Returns a t which is the input evaluated against each modifier in the stack, executed in position order.
        Evaluate<override>(InValue:t)<reads>:t = external {}

        # Insert a Modifier at Position in the stack.
        # If multiple modifiers are added at the same position, they are applied such that the most recently added is the last evaluated.
        # Returns a cancelable which can be used to remove Modifier from the stack.
        AddModifier<epic_internal>(Modifier:modifier(t), Position:stack_position)<transacts>:cancelable = external {}

    @experimental
    modifier_stack_entry<native><epic_internal> := class<epic_internal>(cancelable):
        Cancel<override>()<transacts>:void = external {}

        GetModifier<native><epic_internal>(Type:t where t:type)<reads>:modifier(t)

        @replicated("")
        @editable
        Modifier<native><epic_internal>:modifier_base

        @replicated("")
        Stack<native><epic_internal>:modifier_stack_base

        @replicated("")
        Position<native><epic_internal>:stack_position = external {}

    @experimental
    modifier_stack_base<native><epic_internal> := class<epic_internal>(modifier_stack_base_internal):
        RemoveEntryInternal<native><epic_internal>(EntryToRemove:modifier_stack_entry)<transacts>:void

        AddModifierInternal<native><epic_internal>(Modifier:any, Position:stack_position)<transacts>:cancelable

        var<private> FirstPosition<native><public>:stack_position = external {}

        var<private> LastPosition<native><public>:stack_position = external {}

        @replicated("RepNotify")
        @editable
        var Entries<native><epic_internal>:[]modifier_stack_entry = external {}

    @experimental
    @import_as("/Script/VerseModifier.UVerseModifierStackBaseInternal")
    modifier_stack_base_internal<native><epic_internal> := class<epic_internal>:
