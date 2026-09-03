# Verse path: /Verse.org
# Module import path: /Verse.org/Verse
Verse<public> := module:
    using {/Verse.org/Concurrency}
    using {/Verse.org/Native}
    # Makes a flattened `array` by concatenating the elements of `Arrays`.
    Concatenate<public>(Arrays:[][]t where t:type)<computes>:[]t = external {}

    # Makes an `array` containing `Input`'s elements from `StartIndex` to `StopIndex-1`.
    # Fails unless `0 <= StartIndex <= StopIndex <= Input.Length`.
    (Input:[]t where t:type).Slice<public>(StartIndex:int, StopIndex:int)<computes><decides>:[]t = external {}

    # Makes an `array` containing `Input`'s elements from `StartIndex` to `Input.Length-1`.
    # Succeeds if `0 <= StartIndex <= Input.Length`.
    (Input:[]t where t:type).Slice<public>(StartIndex:int)<computes><decides>:[]t = external {}

    # Makes an `array` by inserting `ElementsToInsert` into `Input` such that the first element of `ElementsToInsert` is at `InsertionIndex`.
    (Input:[]t where t:type).Insert<public>(InsertionIndex:int, ElementsToInsert:[]t)<computes><decides>:[]t = external {}

    # Makes an `array` by removing the element at `IndexToRemove` from `Input`.
    # Succeeds if `0 <= IndexToRemove <= Input.Length-1`.
    (Input:[]t where t:type).RemoveElement<public>(IndexToRemove:int)<computes><decides>:[]t = external {}

    # Makes an `array` by removing the element at the lowest index that equals `ElementToRemove` from `Input`.
    # Fails if `Input` did not contain any instances of `ElementToRemove`.
    (Input:[]t where t:subtype(comparable)).RemoveFirstElement<public>(ElementToRemove:t)<computes><decides>:[]t = external {}

    # Makes an `array` by removing all elements that equal `ElementToRemove` from `Input`.
    (Input:[]t where t:subtype(comparable)).RemoveAllElements<public>(ElementToRemove:t)<computes>:[]t = external {}

    # Makes an `array` by replacing the element at `IndexToReplace` with `ElementToReplaceWith` in `Input`.
    # Succeeds if `0 <= IndexToReplace <= Input.Length-1`.
    (Input:[]t where t:type).ReplaceElement<public>(IndexToReplace:int, ElementToReplaceWith:t)<computes><decides>:[]t = external {}

    # Makes an `array` by replacing the element at the lowest index that equals `ElementToReplace` with `ElementToReplaceWith` in `Input`.
    # Fails if `Input` did not contain any instances of `ElementToReplace`.
    (Input:[]t where t:subtype(comparable)).ReplaceFirstElement<public>(ElementToReplace:t, ElementToReplaceWith:t)<computes><decides>:[]t = external {}

    # Makes an `array` by replacing all elements that equal `ElementToReplace` with `ElementToReplaceWith` in `Input`.
    (Input:[]t where t:subtype(comparable)).ReplaceAllElements<public>(ElementToReplace:t, ElementToReplaceWith:t)<computes>:[]t = external {}

    # Makes an `array` by replacing all ranges of elements that equal `ElementsToReplace` with `Replacement` in `Input`.
    # When there are multiple overlapping instances of `ElementsToReplace` in `Input`, only the position with the lowest index is replaced.
    (Input:[]t where t:subtype(comparable)).ReplaceAll<public>(ElementsToReplace:[]t, Replacement:[]t)<transacts>:[]t = external {}

    # Makes an `array` by removing `Input`'s elements from `StartIndex` to `StopIndex-1`.
    # Succeeds if `0 <= StartIndex <= StopIndex <= Input.Length`.
    (Input:[]t where t:type).Remove<public>(StartIndex:int, StopIndex:int)<computes><decides>:[]t = external {}

    # Returns the first index whose element in `Input` equals `ElementToFind`.
    # Fails if ElementToFind does not exist in the array.
    (Input:[]t where t:subtype(comparable)).Find<public>(ElementToFind:t)<computes><decides>:int = external {}

    CanCallerAccessEpicInternal_Impl<native><epic_internal>()<transacts>:logic

    # Returns whether the Verse code that called the currently-executing function can access epic_internal definitions (i.e. is Epic-authored, or belongs to an internal-user package).
    CanCallerAccessEpicInternal<native_callable><epic_internal>()<transacts>:logic = external {}

    # Implemented by classes that allow users to cancel an operation. For example, calling `subscribable.Subscribe` with a callback returns a `cancelable` object. Calling `Cancel` on the return object unsubscribes the callback.
    cancelable<native><public> := interface:
        # Prevents any current or future work from completing.
        Cancel<native_callable><public>()<transacts>:void

    @available {MinUploadedAtFNVersion := 3300}
    # Return an immediate subclass of base_type that is <castable> and <final_super> and is also shared with Instance. Otherwise failure.
    GetCastableFinalSuperClass<native><epic_internal>(base_type:type, Instance:base_type)<decides><reads>:castable_subtype(base_type)

    @available {MinUploadedAtFNVersion := 3300}
    # Return an immediate subclass of base_type that is <castable> and <final_super> and is also shared with sub_type. Otherwise failure.
    GetCastableFinalSuperClassFromType<native><epic_internal>(base_type:type, sub_type:subtype(base_type))<decides><reads>:castable_subtype(base_type)

    @experimental
    # A `classifiable_subset` is a container that holds a set of elements. A classifiable_subset can hold multiple elements of the same type.
    classifiable_subset<native><public>(element_type:type) := class<final><computes><internal>(diagnosable):
        (/Verse.org/Verse/classifiable_subset:)Verse_classifiable_subset_Variance<private>():tuple(element_type, element_type, element_type) = external {}

        # Temporary function for constraining variance correctly.
        CovarianceConstraint<protected>():?element_type = external {}

        GetDiagnostic<override><native>()<reads>:diagnostic

    @experimental
    # A `classifiable_subset_key` is used to remove dynamically added elements from a `classifiable_subset`. The returned key will also work in resulting sets from usage of the `+` operator as well as `FilterByType`.
    classifiable_subset_key<native><epic_internal>(element_type:type) := class<final><unique><transacts><internal>(diagnosable):
        (/Verse.org/Verse/classifiable_subset_key:)Verse_classifiable_subset_key_Variance<private>():tuple(element_type) = external {}

        # Temporary function for constraining variance correctly.
        CovarianceConstraint<protected>():?element_type = external {}

        GetDiagnostic<override><native>()<reads>:diagnostic

    @experimental
    # Constructs a `classifiable_subset` containing the `InElements`.
    MakeClassifiableSubset<native><public>(InElements:[]t where t:type)<converges>:classifiable_subset(t)

    @available {MinUploadedAtFNVersion := 3800}
    @experimental
    # Succeeds if `element_type` is present in `InSet`.
    (InSet:classifiable_subset(t) where t:castable_subtype(k), k:type).Contains<public>(element_type:castable_subtype(k))<decides><reads>:void = external {}

    @available {MinUploadedAtFNVersion := 3800}
    @experimental
    # Succeeds if all the `element_types` are present in `InSet`.
    (InSet:classifiable_subset(t) where t:castable_subtype(k), k:type).ContainsAll<public>(element_types:[]castable_subtype(k))<decides><reads>:void = external {}

    @available {MinUploadedAtFNVersion := 3800}
    @experimental
    # Succeeds if any of the `element_types` are present in `InSet`.
    (InSet:classifiable_subset(t) where t:castable_subtype(k), k:type).ContainsAny<public>(element_types:[]castable_subtype(k))<decides><reads>:void = external {}

    @experimental
    # Returns a new set that is the union of all elements in `InSetL` set and `InSetR`.
    operator'+'<native><public>((InSetL:classifiable_subset(t), InSetR:classifiable_subset(t)) where t:type)<transacts>:classifiable_subset(t)

    @available {MinUploadedAtFNVersion := 3800}
    @experimental
    # Returns a new set that contains all the elements in `InSet` that are of type `element_type`.
    (InSet:classifiable_subset(t) where t:castable_subtype(k), k:type).FilterByType<native><public>(element_type:castable_subtype(k))<transacts>:classifiable_subset(t)

    @experimental
    # TEMPORARY. Acts as a wrapper class for a classifiable_subset until `ref` keyword exists. This wrapper class will be removed once https://jira.it.epicgames.com/browse/SOL-7982 is complete.
    classifiable_subset_var<native><epic_internal>(element_type:type) := class<final><reads><internal>(diagnosable):
        (/Verse.org/Verse/classifiable_subset_var:)Verse_classifiable_subset_var_Variance<private>(:element_type):tuple(element_type) = external {}

        # Returns the underlying `classifiable_subset`.
        Read<native><public>()<reads>:classifiable_subset(element_type)

        # Writes `InSet` to the underlying `classifiable_subset`.
        Write<native><public>(InSet:classifiable_subset(element_type))<writes>:void

        GetDiagnostic<override>()<reads>:diagnostic = external {}

    @experimental
    # TEMPORARY. Constructs a `classifiable_subset_var` containing the `InElements`.
    MakeClassifiableSubsetVar<native><epic_internal>(InElements:[]t where t:type)<reads><converges>:classifiable_subset_var(t)

    @experimental
    # TEMPORARY. Adds `InElement` to `InSet` and returns a `classifiable_subset_key` for removing that very element from `InSet` again. This function will operate directly on classifiable_subset once https://jira.it.epicgames.com/browse/SOL-7982 is complete.
    (InSet:classifiable_subset_var(t) where t:type).Add<native><epic_internal>(InElement:t)<transacts>:classifiable_subset_key(t)

    @experimental
    # TEMPORARY. Removes the element corresponding to `InKey` from `InSet`, fails if the element was not present in `InSet` before trying to remove it. This function will operate directly on classifiable_subset once https://jira.it.epicgames.com/browse/SOL-7982 is complete.
    (InSet:classifiable_subset_var(t) where t:type).Remove<native><epic_internal>(InKey:classifiable_subset_key(t))<transacts><decides>:void

    @available {MinUploadedAtFNVersion := 3800}
    @experimental
    # TEMPORARY. Succeeds if `element_type` is present in `InSet`.
    (InSet:classifiable_subset_var(t) where t:castable_subtype(k), k:type).Contains<epic_internal>(element_type:castable_subtype(k))<decides><reads>:void = external {}

    @available {MinUploadedAtFNVersion := 3800}
    @experimental
    # TEMPORARY. Succeeds if all the `element_types` are present in `InSet`.
    (InSet:classifiable_subset_var(t) where t:castable_subtype(k), k:type).ContainsAll<epic_internal>(element_types:[]castable_subtype(k))<decides><reads>:void = external {}

    @available {MinUploadedAtFNVersion := 3800}
    @experimental
    # TEMPORARY. Succeeds if any of the `element_types` are present in `InSet`.
    (InSet:classifiable_subset_var(t) where t:castable_subtype(k), k:type).ContainsAny<epic_internal>(element_types:[]castable_subtype(k))<decides><reads>:void = external {}

    @experimental
    # TEMPORARY. Returns a new set that is the union of all elements in `InSetL` set and `InSetR`.
    operator'+'<epic_internal>((InSetL:classifiable_subset_var(t), InSetR:classifiable_subset_var(t)) where t:type)<transacts>:classifiable_subset(t) = external {}

    @available {MinUploadedAtFNVersion := 3800}
    @experimental
    # TEMPORARY. Returns a new set that contains all the elements in `InSet` that are of type `element_type`.
    (InSet:classifiable_subset_var(t) where t:castable_subtype(k), k:type).FilterByType<epic_internal>(element_type:castable_subtype(k))<transacts>:classifiable_subset(t) = external {}

    accessor<native><epic_internal> := enum:
        Dummy

    # An opaque diagnostic message that only shows up in diagnostic logs. The format of the diagnostic may change at any time without warning and may not be inspected by Verse code.
    diagnostic<native><public> := class<computes><epic_internal>(diagnosable):
        String<native><epic_internal>:string

        GetDiagnostic<override>()<reads>:diagnostic = external {}

    # Concatenates two diagnostic messages.
    operator'+'<public>(Lhs:diagnostic, Rhs:diagnostic)<computes>:diagnostic = external {}

    # Concatenates a diagnostic message with a normal string, yielding a diagnostic message.
    operator'+'<public>(Lhs:diagnostic, Rhs:string)<computes>:diagnostic = external {}

    # Concatenates a normal string with a diagnostic message, yielding a diagnostic message.
    operator'+'<public>(Lhs:string, Rhs:diagnostic)<computes>:diagnostic = external {}

    # Converts any Verse value into an opaque diagnostic message.
    ToDiagnostic<native><public>(Value:any)<reads>:diagnostic

    # Provides a hook for class-specific ToDiagnostic behavior; ToDiagnostic will call this interface when provided a class that implements it.
    diagnosable<native><epic_internal> := interface<computes>:
        GetDiagnostic<native_callable><epic_internal>()<reads>:diagnostic

    # Implemented by classes whose instances have limited lifetimes.
    disposable<native><public> := interface:
        # Cleans up this object.
        Dispose<public>():void

    @available {MinUploadedAtFNVersion := 4100}
    # Module import path: /Verse.org/Verse/Easing
    Easing<public> := module:
        using {/Verse.org/Native}
        @available {MinUploadedAtFNVersion := 4100}
        @experimental
        # Make a cubic bezier interpolation function.
        CubicBezier<native><public>(X1:float, Y1:float, X2:float, Y2:float)<converges>:type {_(:float)<reads>:float}

        @available {MinUploadedAtFNVersion := 4100}
        @experimental
        # Linear interpolation function. `Linear` animations move at a constant speed.
        Linear<native_callable><public>(Value:float)<reads>:float = external {}

        @available {MinUploadedAtFNVersion := 4100}
        @experimental
        # Ease interpolation function. `Ease` animations start slowly, speed up, then end slowly. The speed of the animation is slightly slower at the end than the start.
        Ease<native_callable><public>(Value:float)<reads>:float = external {}

        @available {MinUploadedAtFNVersion := 4100}
        @experimental
        # Ease-in interpolation function. `EaseIn` animations start slow, then speed up towards the end.
        EaseIn<native_callable><public>(Value:float)<reads>:float = external {}

        @available {MinUploadedAtFNVersion := 4100}
        @experimental
        # Ease-out interpolation function. `EaseOut` animations start fast, then slow down towards the end.
        EaseOut<native_callable><public>(Value:float)<reads>:float = external {}

        @available {MinUploadedAtFNVersion := 4100}
        @experimental
        # Ease-in-out interpolation function. `EaseInOut` animations are similar to `Ease` but the start and end animation speed is symmetric.
        EaseInOut<native_callable><public>(Value:float)<reads>:float = external {}

    # Implemented by classes whose instances can be enabled and disabled.
    enableable<native><public> := interface<public>:
        # Enable this object.
        Enable<public>():void

        # Disable this object.
        Disable<public>():void

        # Succeeds if the object is enabled, fails if it’s disabled.
        IsEnabled<public>()<transacts><decides>:void

    # Halts the Verse runtime with error `Message`.
    Err<native><public>(Message:string)<computes>:false

    # Prints the Verse runtime callstack with warning `Message`.
    Warn<native><epic_internal>(Message:string)<computes>:void

    event_base_intrnl<native><epic_internal> := class:


    # A *recurring*, successively signaled parametric `event` with a `payload` allowing a simple mechanism to coordinate between concurrent tasks.
    event<native><public>(t:type) := class(event_base_intrnl, signalable(t), awaitable(t)):
        @available {MinUploadedAtFNVersion := 4210}
        (/Verse.org/Verse/event:)Verse_event_Variance_Inherited<private>(:t):tuple(t, t) = external {}

        (/Verse.org/Verse/event:)Verse_event_Variance<private>(:t):tuple(t) = external {}

        # Suspends the current task until another task calls `Signal`.
        # If called during another invocation of `Signal`, the the task will still suspend and resume during the next call to `Signal`.
        Await<native><override>()<suspends>:t

        # Concurrently resumes the tasks that were suspended by `Await` calls before this call to `Signal`.
        # 
        # Tasks are resumed in the order they were suspended. Each task will perform as much work as it can until it encounters a blocking call, whereupon it will transfer control to the next suspended task.
        Signal<native><override>(Val:t):void

    # A *recurring*, successively signaled event allowing a simple mechanism to coordinate between concurrent tasks.
    event<public>() := event(tuple())

    subscribable_event_intrnl<native><epic_internal>(t:type) := class(event(t), listenable(t)):
        @available {MinUploadedAtFNVersion := 4210}
        (/Verse.org/Verse/subscribable_event_intrnl:)Verse_subscribable_event_intrnl_Variance_Inherited<private>(:t):tuple(t, t, t) = external {}

        (/Verse.org/Verse/subscribable_event_intrnl:)Verse_subscribable_event_intrnl_Variance<private>(:t):tuple(t) = external {}

        # Registers `Callback` to be invoked each time `Signal` is called.
        # Call `Cancel` on the returned `cancelable` to unregister `Callback`.
        Subscribe<native><override>(Callback:type {_(:t):void})<transacts>:cancelable

        Signal<native><override>(Val:t):void

    subscribable_event_intrnl<epic_internal>() := subscribable_event_intrnl(tuple())

    # Returns the smallest `int` that is greater than or equal to `Val`.
    # Fails if `not IsFinite(Val)`.
    Ceil<native><public>(Val:float)<decides><reads>:int

    # Returns the largest `int` that is less than or equal to `Val`.
    # Fails if `not IsFinite(Val)`.
    Floor<native><public>(Val:float)<decides><reads>:int

    # Returns `Val` rounded to the nearest `int`. When the fractional part of `Val` is `0.5`, rounds to the nearest *even* `int` (per the IEEE-754 default rounding mode).
    # Fails if `not IsFinite(Val)`.
    Round<native><public>(Val:float)<decides><reads>:int

    # Returns the `int` that equals `Val` without the fractional part.
    # Fails if `not IsFinite(val)`.
    Int<native><public>(Val:float)<decides><reads>:int

    # Makes a `string` representation of `Val`.
    ToString<native><public>(Val:float)<reads>:string

    # Returns the number of seconds since January 1, 1970 UTC, ignoring leap seconds. I.e, this function implements Unix time. This function always returns the same value within the same transaction.
    GetSecondsSinceEpoch<native><public>()<reads>:float

    # Makes a printable `string` representation of `Val`.
    ToString<native><public>(Val:int)<computes>:string

    # Implemented by classes whose instances can become invalid at runtime.
    invalidatable<native><public> := interface(disposable):
        # Succeeds if this object is still valid.
        IsValid<public>()<transacts><decides>:void

    # A parametric interface combining `awaitable` and `subscribable`.
    listenable<native><public>(payload:type) := interface(awaitable(payload), subscribable(payload)):
        @available {MinUploadedAtFNVersion := 4210}
        (/Verse.org/Verse/listenable:)Verse_listenable_Variance_Inherited<private>():tuple(payload, payload, payload) = external {}

    # A parameterless interface combining `awaitable` and `subscribable`.
    listenable<public>() := listenable(tuple())

    # Used for message localization.
    locale<native><public> := struct<epic_internal>:


    # A localizable text message.
    message<native><public> := class<epic_internal>:
        Key<native><epic_internal>:string = external {}

        DefaultText<native><epic_internal>:string = external {}

        Substitutions<native><epic_internal>:[string]localizable_value = external {}

    # Makes a `string` by localizing `Message` based on the current `locale`.
    Localize<native><public>(Message:message)<reads>:string

    @available {MinUploadedAtFNVersion := 4100}
    # Makes a `message` by concatenating `Separator` between the elements of `Messages`.
    Join<native><public>(Messages:[]message, Separator:message)<transacts>:message

    localizable_value<native><epic_internal> := class:


    localizable_string<native><epic_internal> := class<internal>(localizable_value):


    MakeLocalizableValue<epic_internal>(V:string):localizable_string = external {}

    localizable_int<native><epic_internal> := class<internal>(localizable_value):


    MakeLocalizableValue<epic_internal>(V:int):localizable_int = external {}

    localizable_float<native><epic_internal> := class<internal>(localizable_value):


    MakeLocalizableValue<epic_internal>(V:float):localizable_float = external {}

    localizable_message<native><epic_internal> := class<internal>(localizable_value):


    MakeLocalizableValue<epic_internal>(V:message):localizable_message = external {}

    MakeMessageInternal<native><epic_internal>(K:string, D:string, S:[string]localizable_value)<converges>:message

    # Pi, the ratio of the circumference of a circle to its diameter.
    PiFloat<public>:float = external {}

    # Constrains the value of `Val` between `A` and `B`. Robustly handles different argument orderings.
    # Returns the median of `Val`, `A`, and `B`, such that comparisons with `NaN` operate as if `NaN > +Inf`.
    Clamp<public>(Val:float, A:float, B:float)<computes>:float = external {}

    @rtfm_always_open
    # Constrains the value of `Val` between `A` and `B`. Robustly handles different argument orderings.
    # Returns the median of `Val`, `A`, and `B`.
    Clamp<native><public>(Val:int, A:int, B:int)<computes>:int

    # Returns the minimum of `X` and `Y`.
    Min<public>(X:int, Y:int)<computes>:int = external {}

    # Returns the maximum of `X` and `Y`.
    Max<public>(X:int, Y:int)<computes>:int = external {}

    # Returns the minimum of `X` and `Y` unless either are `NaN`.
    # Returns `NaN` if either `X` or `Y` are `NaN`.
    Min<public>(X:float, Y:float)<computes>:float = external {}

    # Returns the maximum of `X` and `Y` unless either are `NaN`.
    # Returns `NaN` if either `X` or `Y` are `NaN`.
    Max<public>(X:float, Y:float)<computes>:float = external {}

    @vm_no_effect_token
    @rtfm_always_open
    # Returns the square root of `X` if `X >= 0.0`.
    # Returns `NaN` if `X < 0.0`.
    Sqrt<native><public>(X:float)<reads>:float

    @vm_no_effect_token
    @rtfm_always_open
    # Returns the sine of `X`, where `X` is interpreted as a value in radians, if `IsFinite[X]`.
    # Returns `NaN` if `not IsFinite[X]`.
    Sin<native><public>(X:float)<reads>:float

    @vm_no_effect_token
    @rtfm_always_open
    # Returns the cosine of `X`, where `X` is interpreted as a value in radians, if `IsFinite[X]`.
    # Returns `NaN` if `not IsFinite[X]`.
    Cos<native><public>(X:float)<reads>:float

    @vm_no_effect_token
    @rtfm_always_open
    # Returns the tangent of `X`, where `X` is interpreted as a value in radians, if `IsFinite[X]`.
    # Returns `NaN` if `not IsFinite[X]`.
    Tan<native><public>(X:float)<reads>:float

    @vm_no_effect_token
    @rtfm_always_open
    # Returns the inverse sine (arcsine) of `X` as a value in radians if `-1.0 <= X <= 1.0`.
    ArcSin<native><public>(X:float)<reads>:float

    @vm_no_effect_token
    @rtfm_always_open
    # Returns the inverse cosine (arccosine) of `X` as a value in radians if `-1.0 <= X <= 1.0`.
    ArcCos<native><public>(X:float)<reads>:float

    @vm_no_effect_token
    @rtfm_always_open
    # Returns the inverse tangent (arctangent) of `X` as a value in radians such that:`-PiFloat/2.0 <= ArcTan(x) <= PiFloat/2.0`.
    ArcTan<native><public>(X:float)<reads>:float

    @vm_no_effect_token
    @rtfm_always_open
    # Returns the angle in radians at the origin between a ray pointing to `(X, Y)` and the positive `X` axis such that `-PiFloat < ArcTan(Y, X) <= PiFloat`.
    # Returns `0.0` if `X=0.0 and Y=0.0`.
    ArcTan<native><public>(Y:float, X:float)<reads>:float

    @vm_no_effect_token
    @rtfm_always_open
    # Returns the hyperbolic sine of `X`.
    Sinh<native><public>(X:float)<reads>:float

    @vm_no_effect_token
    @rtfm_always_open
    # Returns the hyperbolic cosine of `X`.
    Cosh<native><public>(X:float)<reads>:float

    @vm_no_effect_token
    @rtfm_always_open
    # Returns the hyperbolic tangent of `X`.
    Tanh<native><public>(X:float)<reads>:float

    @vm_no_effect_token
    @rtfm_always_open
    # Returns the inverse hyperbolic sine of `X` if `IsFinite(X)`.
    ArSinh<native><public>(X:float)<reads>:float

    @vm_no_effect_token
    @rtfm_always_open
    # Returns the inverse hyperbolic cosine of `X` if `1.0 <= X`.
    ArCosh<native><public>(X:float)<reads>:float

    @vm_no_effect_token
    @rtfm_always_open
    # Returns the inverse hyperbolic tangent of `X` if `IsFinite(X)`.
    ArTanh<native><public>(X:float)<reads>:float

    @vm_no_effect_token
    @rtfm_always_open
    # Returns `A` to the power of `B`.
    Pow<native><public>(A:float, B:float)<reads>:float

    # Returns `X` if `X` is finite.
    # Fails if `X` is one of:`
    #  * `+Inf`
    #  * `-Inf`
    #  * `NaN`
    (X:float).IsFinite<public>()<computes><decides>:float = external {}

    @rtfm_always_open
    # Returns the quotient `X/Y` as defined by Euclidean division, i.e.:
    #  * `Quotient[X/Y] = Floor[X/Y]` when `Y > 0`
    #  * `Quotient[X/Y] = Ceil[X/Y]` when `Y < 0`
    #  * `Quotient[X/Y] * Y + Mod[X,Y] = X`
    # Fails if `Y = 0`.
    Quotient<native><public>(X:int, Y:int)<computes><decides>:int

    @rtfm_always_open
    # Returns the remainder of `X/Y` as defined by Euclidean division, i.e.:
    #  * `Mod[X,Y] = X - Quotient(X/Y)*Y`
    #  * `0 <= Mod[X,Y] < Abs(Y)`
    # Fails if `Y=0`.
    Mod<native><public>(X:int, Y:int)<computes><decides>:int

    @vm_no_effect_token
    @rtfm_always_open
    # Returns the natural exponent of `X`.
    Exp<native><public>(X:float)<reads>:float

    @vm_no_effect_token
    @rtfm_always_open
    # Returns the natural logarithm of `X`.
    Ln<native><public>(X:float)<reads>:float

    # Returns the base `B` logarithm of `X`.
    Log<public>(B:float, X:float)<reads>:float = external {}

    @vm_no_effect_token
    @rtfm_always_open
    # Used to linearly interpolate/extrapolate between `From` (when `Parameter = 0.0`) and `To` (when `Parameter = 1.0`). Expects that all arguments are finite.
    # Returns `From*(1 - Parameter) + To*Parameter`.
    Lerp<native><public>(From:float, To:float, Parameter:float)<reads>:float

    # Returns the sign of `Val`:
    #   * `1` if `Val > 0`
    #  * `0` if `Val = 0`
    #  * `-1` if `Val < 0`
    Sgn<public>(Val:int)<computes>:int = external {}

    # Returns the sign of `Val`:
    #  * `1.0` if `Val > 0.0`
    #  * `0.0` if `Val = 0.0`
    #  * `-1.0` if `Val < 0.0`
    #  * `NaN` if `Val = NaN`
    Sgn<public>(Val:float)<computes>:float = external {}

    # Succeeds if `Val` is within `AbsoluteTolerance` of `0.0`.
    (Val:float).IsAlmostZero<public>(AbsoluteTolerance:float)<computes><decides>:void = external {}

    # Succeeds if `Val1` and `Val2` are within `AbsoluteTolerance` of each other.
    IsAlmostEqual<public>(Val1:float, Val2:float, AbsoluteTolerance:float)<computes><decides>:void = external {}

    @available {MinUploadedAtFNVersion := 3800}
    # Implemented by classes that provide a result for an operation, which can fail or be successful
    result<native><public>(success_type:type, error_type:type) := interface<computes><internal>:
        (/Verse.org/Verse/result:)Verse_result_Variance<private>():tuple(success_type, error_type) = external {}

        # Returns the success data of the specified type.
        GetSuccess<native_callable><public>()<computes><decides>:success_type

        # Returns the error data of the specified type.
        GetError<native_callable><public>()<computes><decides>:error_type

    @available {MinUploadedAtFNVersion := 3800}
    MakeSuccess<public>(Result:success_type where success_type:type)<computes>:result(success_type, false) = external {}

    @available {MinUploadedAtFNVersion := 3800}
    MakeError<public>(Result:error_type where error_type:type)<computes>:result(false, error_type) = external {}

    # Implemented by classes whose instances can change visibility to be shown or hidden.
    showable<native><public> := interface:
        # Set this value to hide or show the class.
        var Show<public>:logic

    # A parametric interface implemented by events with a `payload` that can be signaled.
    # Can be used with `awaitable`, `subscribable`, or both (see: `listenable`).
    signalable<native><public>(payload:type) := interface:
        (/Verse.org/Verse/signalable:)Verse_signalable_Variance<private>(:payload):tuple() = external {}

        # Concurrently resumes the tasks waiting for this event in `awaitable.Await` and synchronously invokes any callbacks added to this event by `subscribable.Subscribe`.
        Signal<native_callable><public>(Val:payload):void

    # Makes a `string` by concatenating `Separator` between the elements of `Strings`.
    Join<native><public>(Strings:[]string, Separator:string)<computes>:string

    # Returns `String` without modification.
    ToString<public>(String:string)<computes>:string = external {}

    # Makes a `string` from `Character`.
    ToString<native><public>(Character:char)<computes>:string

    # Makes a `string` by converting `Character` to UTF-8 from UTF-32.
    ToString<native><epic_internal>(Character:char32)<computes>:string

    # A parametric interface implemented by events with a `payload` that can be subscribed to.
    # Matched with `signalable.`
    subscribable<native><public>(t:type) := interface:
        (/Verse.org/Verse/subscribable:)Verse_subscribable_Variance<private>():tuple(t) = external {}

        # Registers `Callback` to be invoked on matching calls to `signable.Signal`.
        # Returns an unsubscriber object. Call `cancelable.Cancel` on the unsubscriber to unregister `Callback`.
        Subscribe<public>(Callback:type {_(:t):void})<transacts>:cancelable

    # A parameterless interface implemented by events that can be subscribed to.
    subscribable<public>() := subscribable(tuple())

# Module import path: /Verse.org/Random
Random<public> := module:
    # Returns a uniformly distributed, cryptographically-secure random `float` between `Low` and `High`, inclusive. (`Low` and `High` can be out of order.)
    GetRandomFloat<native><public>(Low:float, High:float)<transacts>:float

    # Returns a uniformly distributed, cryptographically-secure random `int` between `Low` and `High`, inclusive. (`Low` and `High` can be out of order.)
    GetRandomInt<native><public>(Low:int, High:int)<transacts>:int

    # Makes an `array` with the same elements as `Input` shuffled in a random order.
    Shuffle<public>(Input:[]t where t:type)<transacts>:[]t = external {}