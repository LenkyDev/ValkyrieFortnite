using {/Verse.org/Native}
@import_as("/Script/VerseTimeline.UVerseTimelineElementBase")
timeline_element_base<native><epic_internal> := class<epic_internal>:


timeline_element_base_cancelable<native><epic_internal> := class(timeline_element_base, cancelable):
    Cancel<override>()<transacts>:void = external {}

# Abstract definition of any element that can be added to a timeline.See timeline_element_point and timeline_element_span.
timeline_element<native><epic_internal> := class(timeline_element_base_cancelable):


# A timeline element that occupies a single point in time.
timeline_element_point<native><epic_internal> := class<abstract>(timeline_element):
    # The time of this point. May be +/-Inf.NaN will never be updated or queried.
    var<private> Time<native><public>:float

    SetTime<native><public>(NewTime:float)<transacts>:void

# A timeline element that spans a range of time.
timeline_element_span<native><epic_internal> := class<abstract>(timeline_element):
    # The time this span begins. Defaults to 0.0.Must be <> NaN and <= EndTime in order for it to be updated or queriedMay be +/- Inf
    var<private> BeginTime<native><public>:float = external {}

    # The time this span ends. Defaults to Inf.Must be <> NaN and >= BeginTime in order for it to be updated or queriedMay be +/- Inf.
    var<private> EndTime<native><public>:float = external {}

    # Called to modify the timeline's range by assigning its begin and end times.
    SetRange<native><public>(NewBeginTime:float, NewEndTime:float)<transacts>:void