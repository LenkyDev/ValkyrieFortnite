subscribable_event<epic_internal>(t:type) := class(subscribable_event_intrnl(t)):
    (/Verse.org/subscribable_event:)subscribable_event_Variance<private>:?type {_(:t):tuple()} = external {}

    Broadcast<epic_internal>(Val:t):void = external {}