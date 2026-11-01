# Verse path: /Verse.org
using {/Verse.org/Native}
@available {MinUploadedAtFNVersion := 4200}
# Module import path: /Verse.org/Timeline
Timeline<public> := module:
    using {/Verse.org/Simulation}
    using {/Verse.org/Native}
    @available {MinUploadedAtFNVersion := 4300}
    # Base class for all finish reasons that are supplied to timeline.End.
    timeline_finish_reason<native><epic_internal> := class:


    @available {MinUploadedAtFNVersion := 4300}
    # Class that indicates the reason behind why a timeline's update was interrupted.
    timeline_update_interrupt<native><epic_internal> := class:


    @available {MinUploadedAtFNVersion := 4300}
    # Indicates that a timeline update was interrupted by a re-entrant update call.
    timeline_reentrant_update_interrupt<native><epic_internal> := class(timeline_update_interrupt):


    @available {MinUploadedAtFNVersion := 4300}
    # Indicates that a timeline update was not run because the timeline is currently being ended.
    timeline_end_in_progress_update_interrupt<native><epic_internal> := class(timeline_update_interrupt):


    @available {MinUploadedAtFNVersion := 4300}
    # Structure used to represent a playback range within a timeline, encoding both the range and direction as two floatsNote that PreviousTime will be >= CurrentTime when playing in reverse.+/- Inf are valid values.The presence of any NaN is considered invalid. Such ranges will yield no new updates, and will `End` any spans that have been Begun.
    timeline_update_range<native><epic_internal> := struct<computes>:
        # The start of the range. Note this can be >= EndTime when playing in reverse
        PreviousTime<native><public>:float

        # The current time. Note this can be <= EndTime when playing in reverse
        CurrentTime<native><public>:float

    @available {MinUploadedAtFNVersion := 4200}
    @import_as("/Script/VerseTimeline.UVerseTimelineElementBase")
    timeline_element_base<native><epic_internal> := class<epic_internal>:


    @available {MinUploadedAtFNVersion := 4200}
    timeline_element_base_cancelable<native><epic_internal> := class(timeline_element_base, cancelable):
        Cancel<override>()<transacts>:void = external {}

    @available {MinUploadedAtFNVersion := 4200}
    # Abstract definition of any element that can be added to a timeline.See timeline_element_point and timeline_element_span.
    timeline_element<native><public> := class<abstract>(timeline_element_base_cancelable):
        @editable
        # Defines how this element's behavior should be ordered along with other elements on the same timeline.Element Begin/Update functions are sorted in ascending order using `Order`, while End functions are sorted in descending order.
        Order<native><public>:rational = external {}

    @available {MinUploadedAtFNVersion := 4200}
    # A timeline element that occupies a single point in time.Guaranteed to only update once when updated with continuous update ranges.
    timeline_element_point<native><public> := class<abstract>(timeline_element):
        @editable
        # Indicates whether this point should be updated when thetimeline is being updated in a forwards direction
        CanUpdateForwards<native><epic_internal>:logic = external {}

        @editable
        # Indicates whether this point should be updated when thetimeline is being updated in a backwards direction
        CanUpdateBackwards<native><epic_internal>:logic = external {}

        @editable
        @editable {}
        # The time of this point. May be +/-Inf.NaN will never be updated or queried.
        var<private> Time<native><public>:float

        # Sets this point's time.
        SetTime<native><public>(NewTime:float)<transacts>:void

        @available {MinUploadedAtFNVersion := 4300}
        # Called when the timeline is updated with a range that overlaps this point.Returns an optional interrupt reason that prematurely terminates the current update loop when set.
        Update<native><native_callable><epic_internal>():?timeline_update_interrupt

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

        @available {MinUploadedAtFNVersion := 4300}
        # Called when the timeline's update range, specified by `Range` first enters this element's spanReturns an optional interrupt reason that prematurely terminates the current update when set.
        Begin<native><native_callable><epic_internal>():?timeline_update_interrupt

        @available {MinUploadedAtFNVersion := 4300}
        # Called when the timeline is updated with a range that overlaps this span's range.Returns an optional interrupt reason that prematurely terminates the current update loop when set.
        Update<native><native_callable><epic_internal>(Range:timeline_update_range):?timeline_update_interrupt

        @available {MinUploadedAtFNVersion := 4300}
        # Called when this element will no longer update having previously had `Begin` called.This may happen if an Update occurs that causes the time to leave this span, or if the timeline itself is ended.If this span is being ended by way of a call to `(timeline:)Update` with a well defined range, `Range` specifies what was supplied, otherwise it is unset.`Reason` specifies an optional reason for the element being ended, which includes being interrupted or terminated prematurely.
        End<native><native_callable><epic_internal>(Reason:?timeline_finish_reason):void

    @available {MinUploadedAtFNVersion := 4300}
    @import_as("/Script/VerseTimeline.UVerseTimelineBase")
    timeline_base<native><epic_internal> := class:


    @available {MinUploadedAtFNVersion := 4300}
    # A timeline is a 1-dimensional arrangement of elements that pertain to specific times or ranges of time that define update behaviorbased on a given update range or delta-time. `timeline` can only be updated with an explicit range and has no discernable 'current'time or other state, allowing them to be composed together.See `playable_timeline` for a timeline implementation that supports playback.
    timeline<native><epic_internal> := class(timeline_base):
        # Specifies the order of the first element that can possibly be updated in this timeline. 0 if the timeline is empty.
        var<private> FirstElementOrder<native><epic_internal>:rational = external {}

        # Specifies the order of the last element that can possibly be updated in this timeline. 0 if the timeline is empty.
        var<private> LastElementOrder<native><epic_internal>:rational = external {}

        # Add an timeline element to this timeline.To be replaced by AddDynamicField<timeline_element_field> once field reflection is available.
        AddElement<native><final><epic_internal>(Element:timeline_element)<transacts><decides>:cancelable

        # Retrieve all the elements on this timeline
        GetElements<native><final><epic_internal>()<reads>:[]timeline_element

        # Update this timeline by processing all elements for the specified range, and any end events relating to elements that overlapped the previous update range, but not the new range (if any).The provided range will be dissected at the time of any `timeline_element_point` or `timeline_element_span` Begin/End, with each dissection resulting in a full update of the timelineEvents are raised in chronological order from `Range.BeginTime` to `Range.EndTime`.Recursion/re-entrancy is supported and well defined: outer calls to this function will be immediately interrupted and return an error result,allowing timeline elements to 'jump' to a different time and have the current update cycle be interrupted.
        Update<native><final><epic_internal>(Range:timeline_update_range)<transacts>:result(void, ?timeline_update_interrupt)

        # End this timeline by calling End on any `timeline_element_span` that has had `Begin` called on it, but has not been ended yet.An optional reason can be provided, indicating why the timeline has ended.
        End<native><final><epic_internal>(Reason:?timeline_finish_reason):void

    @available {MinUploadedAtFNVersion := 4300}
    MakeTimelineUpdateSuccessResult<native_callable><epic_internal>():result(void, ?timeline_update_interrupt) = external {}

    @available {MinUploadedAtFNVersion := 4300}
    MakeTimelineUpdateErrorResult<native_callable><epic_internal>(Interrupt:?timeline_update_interrupt):result(void, ?timeline_update_interrupt) = external {}