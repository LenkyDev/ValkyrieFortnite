# Module import path: /Verse.org/Predicts
Predicts<public> := module:
    PredictsServerRegisterObject<native><epic_internal>(__dupe___unnamed_parameter_4:any)<transacts>:any

    PredictsObjectIdOf<native><epic_internal>(__dupe___unnamed_parameter_5:any)<transacts>:any

    PredictsInitObjectField<native><epic_internal>(SelfID:any, FieldName:string, Value:any)<transacts>:void

    Dictate<native><epic_internal>()<suspends><predicts>:void

    PredictsDebugServerMode<native><epic_internal>()<transacts>:void

    PredictsDebugClientMode<native><epic_internal>()<transacts>:void

    PredictsDebugFindObjectID<native><epic_internal>(Obj:any)<decides>:int

    PredictsDebugFindObject<native><epic_internal>(ObjectID:int)<decides>:any

    PredictsDebugObjectFieldEquals<native><epic_internal>(ObjectID:int, FieldName:string, Value:any)<decides>:void

    PredictsDebugReplicateToClient<native><epic_internal>()<transacts>:void

    PredictsDebugRegisterFunc<native><epic_internal>(__dupe___unnamed_parameter_6:string, __dupe___unnamed_parameter_7:type {_()<suspends><predicts>:void})<transacts>:void

    PredictsDebugCallFunc<native><epic_internal>(__dupe___unnamed_parameter_8:string)<transacts>:void

    PredictsDebugResetAllDataAndCallbacks<native><epic_internal>()<transacts>:void