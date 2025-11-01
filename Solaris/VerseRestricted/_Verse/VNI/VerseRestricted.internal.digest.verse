# Module import path: /Verse.org/Restricted
Restricted<public> := module:
    sticky_event<native><public>(t:type) := class(event(t)):
        (/Verse.org/Restricted/sticky_event:)Restricted_sticky_event_Variance<private>:?type {_(:t):tuple(t)} = external {}

        IsSignaled<native><public>()<decides>:void

        ClearSignal<native><public>():void

        Await<native><override>()<suspends>:t

        Signal<native><override>(__dupe___unnamed_parameter_52:t):void

    sticky_event<public>() := sticky_event(void)