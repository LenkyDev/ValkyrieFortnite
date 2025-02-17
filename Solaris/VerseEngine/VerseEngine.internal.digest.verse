# Module import path: /Verse.org/VerseEngine
VerseEngine<public> := module:
    no_param_delegate_signature<public> := type {__():void}

    logic_param_delegate_signature<public> := type {__(:logic):void}

    int_param_delegate_signature<public> := type {__(:int):void}

    float_param_delegate_signature<public> := type {__(:float):void}

    string_param_delegate_signature<public> := type {__(:string):void}

    multicast_delegate_base<native><public> := class:


    multicast_delegate<native><public>(t:type) := class(multicast_delegate_base, subscribable(t)):
        Subscribe<native><override>(Callback:type {__(:t):void})<transacts>:cancelable

        Broadcast<native><public>(__dupe___unnamed_parameter_25:t):void

        Empty<native><public>():void

    multicast_delegate<public>() := multicast_delegate(tuple())

    subscribable_event<native><epic_internal>(t:type) := class(multicast_delegate(t), listenable(t)):
        Await<native><override>()<suspends>:t

        Broadcast<native><override>(__dupe___unnamed_parameter_26:t):void

    subscribable_event<epic_internal>() := subscribable_event(tuple())