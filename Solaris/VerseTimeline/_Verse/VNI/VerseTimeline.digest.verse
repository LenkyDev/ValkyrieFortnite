# Verse path: /Verse.org
using {/Verse.org/Native}
@available {MinUploadedAtFNVersion := 4200}
# Module import path: /Verse.org/Timeline
Timeline<public> := module:
    using {/Verse.org/Native}
    using {/Verse.org/Simulation}
    @available {MinUploadedAtFNVersion := 4200}
    # Abstract definition of any element that can be added to a timeline.See timeline_element_point and timeline_element_span.
    timeline_element<native><public> := class<abstract>(cancelable):
        @editable
        # Defines how this element's behavior should be ordered along with other elements on the same timeline.Element Begin/Update functions are sorted in ascending order using `Order`, while End functions are sorted in descending order.
        Order<native><public>:rational = external {}

    @available {MinUploadedAtFNVersion := 4200}
    # A timeline element that occupies a single point in time.Guaranteed to only update once when updated with continuous update ranges.
    timeline_element_point<native><public> := class<abstract>(timeline_element):
        @editable
        @editable {}
        # The time of this point. May be +/-Inf.NaN will never be updated or queried.
        var<private> Time<native><public>:float

        # Sets this point's time.
        SetTime<native><public>(NewTime:float)<transacts>:void

    @available {MinUploadedAtFNVersion := 4200}
    # A timeline element that spans a range of time.Begin/Update/End will be called in that order for each element. For any given update of its owning timeline, span events are called with the following semantics:    - End is called on any elements that have ended this update    - For each element existing at the current range, Begin is called (if necessary), then UpdateZero-duration spans will never have Begin/Update/End called on them.Therefore, spans are guaranteed to have at least one Update call in-between a Begin and End call
    timeline_element_span<native><public> := class<abstract>(timeline_element):
        @editable
        @editable {}
        # The time this span begins. Defaults to 0.0.Must be <> NaN and <= EndTime in order for it to be updated or queriedMay be +/- Inf
        var<private> BeginTime<native><public>:float = external {}

        @editable
        @editable {}
        # The time this span ends. Defaults to Inf.Must be <> NaN and >= BeginTime in order for it to be updated or queriedMay be +/- Inf.
        var<private> EndTime<native><public>:float = external {}

        # Called to modify the timeline's range by assigning its begin and end times.
        SetRange<native><public>(NewBeginTime:float, NewEndTime:float)<transacts>:void