# Module import path: /Verse.org/VerseEngine
VerseEngine<public> := module:
    subscribable_event<epic_internal>(t:type) := class(subscribable_event_intrnl(t)):
        Broadcast<epic_internal>(Val:t):void = external {}