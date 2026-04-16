# Module import path: /Verse.org/Native
Native<public> := module:
    @attribscope_function
    @attribscope_data
    validate_asset_path_attribute<epic_internal> := class<computes><internal>(attribute):


    validate_asset_path<constructor><epic_internal>(Modifiers:string)<computes>:validate_asset_path_attribute = external {}

    @attribscope_class
    @attribscope_struct
    @attribscope_enum
    @attribscope_interface
    cpp_name_attribute<epic_internal> := class<computes><internal>(attribute):


    cpp_name<constructor><epic_internal>(CPPName:string)<computes>:cpp_name_attribute = external {}

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
    @attribscope_interface
    @attribscope_module
    import_as_attribute<epic_internal> := class<computes><internal>(attribute):


    import_as<constructor><epic_internal>(ImportName:string)<computes>:import_as_attribute = external {}

    @attribscope_class
    preload<epic_internal> := class<computes>(attribute):


    property_changed_interface<native><epic_internal> := interface:
        OnPropertyChangedFromVerse<epic_internal>(PropertyName:string)<transacts>:void

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

# Module import path: /Verse.org/Persona
Persona<epic_internal> := module:
    # From a type produce a JSON schema.
    ToJson<native><epic_internal>(__dupe___unnamed_parameter_0:type)<reads><decides><converges>:string

    # From an array of types produce a JSON schema corresponding to an object with optional fields of name 0, 1, etc., i.e. a sparse array.
    ToJson<native><epic_internal>(__dupe___unnamed_parameter_3:[]type)<reads><decides><converges>:string

    # From a JSON string conforming to the schema for a type, produce a value of that type.
    FromJson<native><epic_internal>(__dupe___unnamed_parameter_4:string, t:type)<reads><decides><converges>:t

    # From a JSON string representing a sparse array where each element, if it exists, conforms to the corresponding type element, produce array of optional values.
    FromJson<native><epic_internal>((__dupe___unnamed_parameter_7:string, __dupe___unnamed_parameter_8:[]subtype(t)) where t:type)<reads><decides><converges>:[]?t

    Cast<native><epic_internal>(__dupe___unnamed_parameter_9:any, t:type)<decides><converges>:t