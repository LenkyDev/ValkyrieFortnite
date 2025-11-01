# Module import path: /Verse.org/Predicts
Predicts<public> := module:
    PredictsServerRegisterObject<native><epic_internal>(__dupe___unnamed_parameter_16:any)<transacts>:any

    PredictsObjectIdOf<native><epic_internal>(__dupe___unnamed_parameter_17:any)<transacts>:any

    PredictsServerMarkObjectField<native><epic_internal>(Obj:any, FieldName:string)<transacts>:void

    PredictsIsRunningOnServer<native><epic_internal>()<transacts><decides><predicts>:void

    PredictsDebugServerMode<native><epic_internal>()<transacts>:void

    PredictsDebugClientMode<native><epic_internal>()<transacts>:void

    PredictsDebugIsFrankenServer<native><epic_internal>()<transacts><decides>:void

    PredictsDebugIsFrankenClient<native><epic_internal>()<transacts><decides>:void

    PredictsDebugIsFrankenTest<native><epic_internal>()<transacts><decides>:void

    PredictsDebugFindObjectID<native><epic_internal>(Obj:any)<transacts><decides>:int

    PredictsDebugFindObject<native><epic_internal>(ObjectID:int)<transacts><decides>:any

    PredictsDebugNameObject<native><epic_internal>(Obj:any, Name:string)<transacts><decides>:void

    PredictsDebugFindObjectNamed<native><epic_internal>(Name:string)<transacts><decides>:any

    PredictsDebugReplicateToClient<native><epic_internal>()<transacts>:void

    PredictsDebugRegisterFunc<native><epic_internal>(__dupe___unnamed_parameter_18:string, __dupe___unnamed_parameter_19:type {_()<predicts>:void})<transacts>:void

    PredictsDebugCallFunc<native><epic_internal>(__dupe___unnamed_parameter_20:string)<transacts>:void

    PredictsDebugResetAllDataAndCallbacks<native><epic_internal>()<transacts>:void

    PredictsDebugGCPinObject<native><epic_internal>(__dupe___unnamed_parameter_21:any)<transacts>:void

    PredictsDebugGCUnpinObject<native><epic_internal>(__dupe___unnamed_parameter_22:any)<transacts>:void