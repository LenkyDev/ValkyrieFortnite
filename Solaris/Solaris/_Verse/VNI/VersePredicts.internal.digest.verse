# Module import path: /Verse.org/Predicts
Predicts<public> := module:
    PredictsServerRegisterObject<native><epic_internal>(__dupe___unnamed_parameter_0:any)<transacts>:any

    PredictsServerMarkObjectField<native><epic_internal>(Obj:any, FieldName:string)<transacts>:void

    PredictsIsRunningOnServer<native><epic_internal>()<transacts><decides><predicts>:void

    PredictsDebugServerMode<native><epic_internal>()<transacts>:void

    PredictsDebugClientMode<native><epic_internal>(NodeID:int)<transacts><decides>:void

    PredictsDebugIsFrankenServer<native><epic_internal>()<transacts><decides>:void

    PredictsDebugIsFrankenClient<native><epic_internal>()<transacts><decides>:void

    PredictsDebugIsFrankenTest<native><epic_internal>()<transacts><decides>:void

    PredictsDebugAddClientWithID<native><epic_internal>(ClientID:int)<transacts>:void

    PredictsDebugRemoveClientWithID<native><epic_internal>(ClientID:int)<transacts>:void

    PredictsDebugFindObjectID<native><epic_internal>(Obj:any)<transacts><decides>:int

    PredictsDebugFindObject<native><epic_internal>(ObjectID:int)<transacts><decides>:any

    PredictsDebugNameObject<native><epic_internal>(Obj:any, Name:string)<transacts><decides>:void

    PredictsDebugFindObjectNamed<native><epic_internal>(Name:string)<transacts><decides>:any

    PredictsDebugNameID<native><epic_internal>(ID:int, Name:string)<transacts>:void

    PredictsDebugFindNamedID<native><epic_internal>(Name:string)<transacts><decides>:int

    PredictsDebugReplicateToClients<native><epic_internal>()<transacts>:void

    PredictsDebugUseReachabilityBasedReplication<native><epic_internal>()<transacts>:void

    PredictsDebugRegisterFunc<native><epic_internal>(__dupe___unnamed_parameter_0:int, __dupe___unnamed_parameter_1:type {_()<predicts>:void})<transacts>:int

    PredictsDebugUnregisterFunc<native><epic_internal>(__dupe___unnamed_parameter_0:int)<transacts>:void

    PredictsDebugCallFunc<native><epic_internal>(__dupe___unnamed_parameter_0:int)<transacts>:void

    PredictsDebugTryCallFunc<native><epic_internal>(__dupe___unnamed_parameter_0:int)<transacts>:logic

    PredictsDebugResetAllDataAndCallbacks<native><epic_internal>()<transacts>:void

    PredictsDebugGCPinObject<native><epic_internal>(__dupe___unnamed_parameter_0:any)<transacts>:void

    PredictsDebugGCUnpinObject<native><epic_internal>(__dupe___unnamed_parameter_0:any)<transacts>:void

    PredictsDebugCheckClientAbortedContentScopeAndReset<native><epic_internal>()<transacts><decides>:void