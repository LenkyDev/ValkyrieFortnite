# Module import path: /Verse.org/Native
Native<public> := module:
    @attribscope_function
    @attribscope_data
    validate_asset_path_attribute<epic_internal> := class<computes><internal>(attribute):


    validate_asset_path<constructor><epic_internal>(Modifiers:string)<computes>:validate_asset_path_attribute = external {}

    @attribscope_module
    @attribscope_class
    @attribscope_struct
    @attribscope_function
    @attribscope_data
    @attribscope_enum
    @attribscope_enumerator
    @attribscope_interface
    @attribscope_typedefinition
    doc_attribute<epic_internal> := class<computes><internal>(attribute):


    doc<constructor><epic_internal>(DocumentationString:string)<computes>:doc_attribute = external {}

    @attribscope_class
    @attribscope_struct
    @attribscope_enum
    import_as_attribute<epic_internal> := class<computes><internal>(attribute):


    import_as<constructor><epic_internal>(ImportName:string)<computes>:import_as_attribute = external {}

    property_changed_interface<native><epic_internal> := interface:
        OnPropertyChangedFromVerse<epic_internal>(PropertyName:string)<transacts>:void

# Module import path: /Verse.org/Concurrency
Concurrency<public> := module:
    # A parametric interface implemented by events with a `payload` that can be waited on. Matched with `signalable.`
    awaitable<public>(payload:type) := interface:
        # Suspends the current task until resumed by a matching call to `signalable.Signal`. Returns the event `payload`.
        Await<public>()<suspends>:payload

    awaitable<public>() := awaitable(void)

    task<native><public>(t:type) := class<abstract><final>(awaitable(t)):
        Active<native><epic_internal>()<transacts><decides>:void

        Completed<native><epic_internal>()<transacts><decides>:void

        Canceling<native><epic_internal>()<transacts><decides>:void

        Canceled<native><epic_internal>()<transacts><decides>:void

        Unsettled<native><epic_internal>()<transacts><decides>:void

        Settled<native><epic_internal>()<transacts><decides>:void

        Uninterrupted<native><epic_internal>()<transacts><decides>:void

        Interrupted<native><epic_internal>()<transacts><decides>:void

        Await<native><override>()<suspends>:t

        Cancel<native><epic_internal>()<suspends>:void