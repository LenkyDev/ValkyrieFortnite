# Verse path: /Verse.org
using {/Verse.org/Native}
@available {MinUploadedAtFNVersion := 4110}
# Module import path: /Verse.org/Progression
Progression<public> := module:
    @experimental
    quest_lifecycle_event_observer<native><epic_internal> := class<epic_internal>:
        var<private> Subscriptions<native><epic_internal>:[]cancelable = external {}

        # Subscribes to Quest's lifecycle events. Additive -- watching a second quest keeps the first.
        Watch<native_callable><epic_internal>(Quest:quest)<transacts>:void = external {}

        # Cancels every subscription made by Watch.
        Unwatch<native_callable><epic_internal>()<transacts>:void = external {}

        OnJoin<native><final><epic_internal>(Membership:quest_membership):void

        OnAbandon<native><final><epic_internal>(Membership:quest_membership):void

        OnComplete<native><final><epic_internal>(Quest:quest):void

        OnQuestStateChanged<native><final><epic_internal>(Quest:quest, OldState:quest_state, NewState:quest_state):void

        OnStateChanged<final><epic_internal>(Transition:tuple(quest, quest_state, quest_state)):void = external {}