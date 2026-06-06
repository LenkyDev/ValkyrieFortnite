using {/Verse.org/Native}
using {/Verse.org/Temporary/EpicGamesRestricted/Network}
using {/Verse.org/Simulation}
@available {MinUploadedAtFNVersion := 4100}
@experimental
# An easing function combined with a relative time window
easing_window<native><public> := struct<concrete>:
    # Easing function to apply
    (/Verse.org/SceneGraph/easing_window:)Easing<native>:type {_(:float)<reads>:float} = external {}

    @editable
    @replicated("")
    # Duration of the easing window in seconds
    Duration<native>:float = external {}

    @editable
    @replicated("")
    # Offset of the easing window in seconds
    # The offset allows the window to be moved later or earlier relative to the easing modifier’s internal timeline.
    # For example, moving the ease-in window later (ie +Offset) would cause the blend to happen later - ie delay it.
    # For -ve offsets to ease-in and +ve offsets to ease-out, this has the effect of allowing ‘frozen’ states of targets
    # to be observed (for time-varying targets).
    Offset<native>:float = external {}

@available {MinUploadedAtFNVersion := 4100}
@experimental
# Interface used to trigger easing behaviors
easeable<public> := interface<epic_internal>(cancelable):
    # Trigger an ease-out. If an easing_window is provided here, then it will override any previous provided window.
    (/Verse.org/SceneGraph/easeable:)EaseOut<public>(EaseOutWindow:?easing_window)<transacts>:void

@import_as("/Script/EntityModifiers.UEntityEasingModifierBase")
easing_modifier_base<native><epic_internal> := class<epic_internal>:


@available {MinUploadedAtFNVersion := 4100}
@experimental
# Modifier that eases in and out based around its target modifier's timeline (internal).
# The internal timeline begins when the modifier is constructed and ends either:
# - When a timer of finite length expires.
# - When the modifier is removed from the stack via cancelable.Cancel().
# - When the modifier is eased out by calling EaseOut and the ease-out window completes.
# Target weight transitions from 0.0 to 1.0 over the duration of the ease-in window,
# then transitions from 1.0 to 0.0 over the duration of the easing away window.
# If the ease in/out windows overlap when applied relative to the target modifier's timeline,
# then the weight is the product of each window’s weight.
# The easing out window is applied when either the internal timeline reaches the window, or the modifier is
# cancelled on the stack, whichever occurs earlier.
easing_modifier<native><epic_internal>(t:type) := class<final><epic_internal>(easing_modifier_base, modifier(t), easeable):
    @available {MinUploadedAtFNVersion := 4294967041}
    (/Verse.org/SceneGraph/easing_modifier:)SceneGraph_easing_modifier_Variance_Inherited<private>(:t, :t):tuple(t, t) = external {}

    (/Verse.org/SceneGraph/easing_modifier:)SceneGraph_easing_modifier_Variance<private>(:t, :t):tuple(t, t) = external {}

    Evaluate<native><override>(InValue:t)<reads>:t

    (/Verse.org/SceneGraph/easeable:)EaseOut<native><override>((local:)EaseOutWindow:?easing_window)<transacts>:void

    Cancel<override>()<transacts>:void = external {}

    @editable
    @replicated("RepNotify")
    # Target to transition into or out from
    Target<native><epic_internal>:modifier(t)

    @replicated("")
    # Easing to apply when easing in (i.e. 'towards' the target).
    EaseInWindow<native><epic_internal>:easing_window = external {}

    @replicated("")
    # Easing to apply when easing out (i.e. 'away from' the target).
    EaseOutWindow<native><epic_internal>:easing_window = external {}