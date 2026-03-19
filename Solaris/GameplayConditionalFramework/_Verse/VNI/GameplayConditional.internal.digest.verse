using {/Verse.org/Native}
using {/Verse.org/SceneGraph}
register_gameplay_conditional_error<native><public> := class<epic_internal>:


gameplay_conditional_context<native><epic_internal> := class:
    Instigator<native><epic_internal>:entity

    Delta<native><epic_internal>:float

gameplay_conditional_listener_handle<native><final><epic_internal> := class:
    AddParticipant<native><epic_internal>(Participant:entity):void

    RemoveParticipant<native><epic_internal>(Participant:entity):void

    Unregister<native><epic_internal>():void

gameplay_conditional<native><epic_internal> := class<abstract>:
    OnInitialization<native><epic_internal>(ContextAnchor:entity):void

    OnInvalidation<native><epic_internal>():void

    OnParticipantAdded<native><epic_internal>(Participant:entity):void

    OnParticipantRemoved<native><epic_internal>(Participant:entity):void

    Execute<native><final><epic_internal>(ContextObject:gameplay_conditional_context):void

    Attributes<native><epic_internal>:[]gameplay_conditional_attribute = external {}

gameplay_conditional_attribute<native><epic_internal> := class<abstract>:
    OnInitialization<native><epic_internal>(ContextAnchor:entity):void

    OnInvalidation<native><epic_internal>():void

    Evaluate<native><epic_internal>()<decides>:void

@available {MinUploadedAtFNVersion := 4000}
RegisterGameplayConditional<native><epic_internal>(ContextAnchor:entity, GameplayConditional:gameplay_conditional, Callback:type {_(:gameplay_conditional_context):void})<transacts>:result(gameplay_conditional_listener_handle, []register_gameplay_conditional_error)