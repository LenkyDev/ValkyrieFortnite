# Verse path: /Verse.org/SceneGraph
# Users to subscribe to, or await on, a DeltaTime based callback from one of the phases in a component's `TickEvents` object.
execution_listenable<native><public> := class<epic_internal>(listenable(float)):
    # Suspends the current task until resumed by a matching call to `signalable.Signal`. Returns the event `payload`.
    Await<native><override>()<suspends>:float

    # Subscribe a callback function to this TickEvent phase. The input parameter to your function (DeltaTime) is the time that has passed between the last update and the current update.
    Subscribe<native><override>(Callback:type {_(:float):void})<transacts>:cancelable