using {/Verse.org/Native}
@available {MinUploadedAtFNVersion := 4110}
# Module import path: /UnrealEngine.com/Progression
Progression<public> := module:
    using {/Verse.org/SceneGraph}
    register_gameplay_conditional_error<native><public> := class<epic_internal>:


    MakeRegisterGameplayConditionalSuccessResult<native_callable><epic_internal>(ListenerHandle:gameplay_conditional_listener_handle):result(gameplay_conditional_listener_handle, []register_gameplay_conditional_error) = external {}

    MakeRegisterGameplayConditionalErrorResult<native_callable><epic_internal>():result(gameplay_conditional_listener_handle, []register_gameplay_conditional_error) = external {}

    gameplay_conditional_context<native><epic_internal> := class:
        Instigator<native><epic_internal>:entity

        Delta<native><epic_internal>:float

    gameplay_conditional_listener_handle<native><final><epic_internal> := class:
        GetParticipants<native><epic_internal>()<reads>:[]entity

        AddParticipant<native><epic_internal>(Participant:entity):void

        RemoveParticipant<native><epic_internal>(Participant:entity):void

        Unregister<native><epic_internal>():void

        IsRegistered<native><epic_internal>()<transacts><decides>:void

    gameplay_conditional<native><epic_internal> := class<abstract>:
        OnInitialization<native_callable><epic_internal>(ContextAnchor:entity):void

        OnInvalidation<native_callable><epic_internal>():void

        OnParticipantAdded<native_callable><epic_internal>(Participant:entity):void

        OnParticipantRemoved<native_callable><epic_internal>(Participant:entity):void

        Execute<native><final><epic_internal>(ContextObject:gameplay_conditional_context):void

        Attributes<native><epic_internal>:[]gameplay_conditional_attribute = external {}

    gameplay_conditional_attribute<native><epic_internal> := class<abstract>:
        OnInitialization<native_callable><epic_internal>(ContextAnchor:entity):void

        OnInvalidation<native_callable><epic_internal>():void

        Evaluate<native_callable><epic_internal>()<decides>:void

    RegisterGameplayConditional<native><epic_internal>(ContextAnchor:entity, GameplayConditional:subtype(gameplay_conditional), Callback:type {_(:gameplay_conditional_context):void})<transacts>:result(gameplay_conditional_listener_handle, []register_gameplay_conditional_error)

    RegisterInstancedGameplayConditional<native><epic_internal>(ContextAnchor:entity, GameplayConditional:gameplay_conditional, Callback:type {_(:gameplay_conditional_context):void})<transacts>:result(gameplay_conditional_listener_handle, []register_gameplay_conditional_error)

    has_gameplay_conditionals<native><epic_internal> := interface<epic_internal>:
        Conditionals<epic_internal>:[]subtype(gameplay_conditional) = external {}

        OnConditionalExecuted<native_callable><epic_internal>(Context:gameplay_conditional_context):void