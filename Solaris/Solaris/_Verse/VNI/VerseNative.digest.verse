# Module import path: /Verse.org/Native
Native<public> := module:
    @attribscope_class
    @attribscope_struct
    @attribscope_enum
    @attribscope_interface
    @attribscope_module
    import_as_attribute<epic_internal> := class<computes><internal>(attribute):


    import_as<constructor><epic_internal>(ImportName:string)<computes>:import_as_attribute = external {}

# Module import path: /Verse.org/Concurrency
Concurrency<public> := module:
    using {/Verse.org/Native}
    # A parametric interface implemented by events with a `payload` that can be waited on. Matched with `signalable.`
    awaitable<public>(payload:type) := interface:
        (/Verse.org/Concurrency/awaitable:)Concurrency_awaitable_Variance<private>():tuple(payload) = external {}

        # Suspends the current task until resumed by a matching call to `signalable.Signal`. Returns the event `payload`.
        Await<public>()<suspends>:payload

    awaitable<public>() := awaitable(void)

    task<native><public>(t:type) := class<abstract><final>(awaitable(t)):
        @available {MinUploadedAtFNVersion := 4294967041}
        (/Verse.org/Concurrency/task:)Concurrency_task_Variance_Inherited<private>():tuple(t) = external {}

        (/Verse.org/Concurrency/task:)Concurrency_task_Variance<private>():tuple(t) = external {}

        Await<native><override>()<suspends>:t