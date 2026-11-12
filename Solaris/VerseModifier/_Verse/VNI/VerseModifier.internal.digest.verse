# Verse path: /Verse.org
# Module import path: /Verse.org/Verse
Verse<public> := module:
    using {/Verse.org/Simulation}
    using {/Verse.org/Temporary/EpicGamesRestricted/Network}
    using {/Verse.org/Native}
    @available {MinUploadedAtFNVersion := 4100}
    @experimental
    # Implemented by classes to provide a method for modification evaluation.
    modifier<native><public>(t:type) := interface<computes>:
        (/Verse.org/Verse/modifier:)Verse_modifier_Variance<private>(:t):tuple(t) = external {}

        Evaluate<native_callable><public>(InValue:t)<reads>:t

    @available {MinUploadedAtFNVersion := 4100}
    @experimental
    # Modifier stacks provide an ordered application of modifiers.
    modifier_stack<native><public>(t:type) := class(modifier(t)):
        @available {MinUploadedAtFNVersion := 4210}
        (/Verse.org/Verse/modifier_stack:)Verse_modifier_stack_Variance_Inherited<private>(:t):tuple(t) = external {}

        (/Verse.org/Verse/modifier_stack:)Verse_modifier_stack_Variance<private>(:t, :t, :t, :t, :t):tuple(t, t, t, t, t) = external {}

        # Returns a t which is the input evaluated against each modifier in the stack, executed in stack order.
        Evaluate<override>(InValue:t)<reads>:t = external {}

        # Add a Modifier to the end of the stack, so it is evaluated after all existing modifiers.
        # Returns a cancelable which can be used to remove Modifier from the stack.
        AddModifier<public>(Modifier:modifier(t))<transacts>:cancelable = external {}

        AddModifierToStart<native><epic_internal>(Modifier:modifier(t))<transacts>:cancelable

        @replicated("RepNotify")
        @editable
        var Entries<native><epic_internal>:[]modifier_stack_entry = external {}

    @available {MinUploadedAtFNVersion := 4100}
    @experimental
    modifier_stack_entry<native><epic_internal> := class<epic_internal>(cancelable):
        Cancel<override>()<transacts>:void = external {}

        @replicated("RepNotify")
        @editable
        Modifier<native><epic_internal>:modifier(any)

        @replicated("")
        Stack<native><epic_internal>:modifier_stack(any)