execution_subscription<native><epic_internal> := class(cancelable):
    Cancel<native><override>()<transacts>:void

    RunAfter<native><epic_internal>(__dupe___unnamed_parameter_57:execution_subscription):void

    RunBefore<native><epic_internal>(__dupe___unnamed_parameter_58:execution_subscription):void

# Users to subscribe to, or await on, a DeltaTime based callback from one of the phases in a component's `TickEvents` object.'
# 
# IMPORTANT: You must keep a pointer on your component to the returned `cancelable`. Otherwise the GC will eventually clean up your subscription and your callback will stop being invoked.
execution_listenable<native><public> := class<epic_internal>(listenable(float)):
    # Suspends the current task until resumed by a matching call to `signalable.Signal`. Returns the event `payload`.
    Await<native><override>()<suspends>:float

    # Subscribe a callback function to this TickEvent phase. The input parameter to your function (DeltaTime) is the time that has passed between the last update and the current update.
    Subscribe<native><override>(Callback:type {_(:float):void})<transacts>:cancelable

# Used to subscribe a callback or await an event based callback '
# 
# IMPORTANT: You must keep a pointer on your component to the returned `cancelable`. Otherwise the GC will eventually clean up your subscription and your callback will stop being invoked.
execution_event<native><epic_internal> := class<epic_internal>(listenable(tuple())):
    # Suspends the current task until resumed by a matching call to `signalable.Signal`.
    Await<native><override>()<suspends>:tuple()

    # Subscribe a callback function to this event.
    Subscribe<native><override>(Callback:type {_():void})<transacts>:cancelable