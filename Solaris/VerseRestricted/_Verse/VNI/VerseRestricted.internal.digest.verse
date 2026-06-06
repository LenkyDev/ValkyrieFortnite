# Module import path: /Verse.org/Restricted
Restricted<public> := module:
    using {/Verse.org/Native}
    sticky_event<native><public>(t:type) := class(event(t)):
        @available {MinUploadedAtFNVersion := 4294967041}
        (/Verse.org/Restricted/sticky_event:)Restricted_sticky_event_Variance_Inherited<private>(:t, :t, :t):tuple(t, t, t) = external {}

        (/Verse.org/Restricted/sticky_event:)Restricted_sticky_event_Variance<private>(:t):tuple(t) = external {}

        IsSignaled<native><public>()<reads><decides>:void

        ClearSignal<native><public>()<writes>:void

        Await<native><override>()<suspends>:t

        Signal<native><override>(__dupe___unnamed_parameter_2:t):void

    sticky_event<public>() := sticky_event(void)