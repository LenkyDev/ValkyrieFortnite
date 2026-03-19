using {/Verse.org/Native}
subscribable_event<epic_internal>(t:type) := class(subscribable_event_intrnl(t)):
    @available {MinUploadedAtFNVersion := 4294967041}
    (/Verse.org/subscribable_event:)subscribable_event_Variance_Inherited<private>(:t):tuple(t) = external {}

    (/Verse.org/subscribable_event:)subscribable_event_Variance<private>(:t):tuple() = external {}

    Broadcast<epic_internal>(Val:t):void = external {}