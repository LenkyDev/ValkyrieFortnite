using {/Verse.org/Native}
using {/Verse.org/Simulation}
@available {MinUploadedAtFNVersion := 4100}
@experimental
# An easing function combined with a relative time window
easing_window<native><public> := struct<concrete>:
    # Easing function to apply
    (/Verse.org/SceneGraph/easing_window:)Easing<native>:type {_(:float)<reads>:float} = external {}

    @editable
    # Duration of the easing window in seconds
    Duration<native>:float = external {}

    @editable
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