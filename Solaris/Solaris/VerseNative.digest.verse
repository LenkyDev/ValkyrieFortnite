# Module import path: /Verse.org/Native
Native<public> := module:
    @attribscope_class
    @attribscope_struct
    import_as_attribute<epic_internal> := class<computes><internal>(attribute):


    import_as<constructor><epic_internal>(ImportName:string)<computes>:import_as_attribute = external {}

# Module import path: /Verse.org/Concurrency
Concurrency<public> := module:
    # A parametric interface implemented by events with a `payload` that can be waited on. Matched with `signalable.`
    awaitable<public>(payload:type) := interface:
        # Suspends the current task until resumed by a matching call to `signalable.Signal`. Returns the event `payload`.
        Await<public>()<suspends>:payload

    awaitable<public>() := awaitable(void)

    task<native><public>(t:type) := class<abstract><final>(awaitable(t)):
        Await<native><override>()<suspends>:t