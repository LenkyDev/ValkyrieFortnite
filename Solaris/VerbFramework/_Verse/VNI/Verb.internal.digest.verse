using {/Verse.org/SceneGraph}
using {/Verse.org/Native}
@available {MinUploadedAtFNVersion := 3800}
MakeRegisterVerbSuccessResult<native_callable><epic_internal>(ListenerHandle:verb_listener_handle):result(verb_listener_handle, []register_verb_error) = external {}

@available {MinUploadedAtFNVersion := 3800}
MakeRegisterVerbErrorResult<native_callable><epic_internal>():result(verb_listener_handle, []register_verb_error) = external {}

register_verb_error<native><public> := class<epic_internal>:


verb_filter<native><public> := class<abstract><epic_internal>:
    Evaluate<native_callable><epic_internal>(SceneEvent:scene_event)<decides>:void

    GetDelta<native_callable><epic_internal>(SceneEvent:scene_event):float

verb_listener_handle<native><final><public> := class<epic_internal>:
    GetParticipants<native><epic_internal>()<reads>:[]entity

    AddParticipant<native><epic_internal>(Entity:entity)<transacts>:void

    RemoveParticipant<native><epic_internal>(Entity:entity)<transacts>:void

    Unregister<native><epic_internal>():void

    IsRegistered<native><epic_internal>()<transacts><decides>:void

@available {MinUploadedAtFNVersion := 4000}
RegisterVerbMessage<native><epic_internal>(VerbMessageType:subtype(scene_event), Callback:type {_(:entity, :scene_event):void})<transacts>:result(verb_listener_handle, []register_verb_error)

@available {MinUploadedAtFNVersion := 4000}
RegisterVerbFilter<native><epic_internal>(VerbFilterType:subtype(verb_filter), Callback:type {_(:entity, :scene_event, :float):void})<transacts>:result(verb_listener_handle, []register_verb_error)

@available {MinUploadedAtFNVersion := 4000}
RegisterSharedVerbFilter<native><epic_internal>(VerbFilter:verb_filter, Callback:type {_(:entity, :scene_event, :float):void})<transacts>:result(verb_listener_handle, []register_verb_error)

@available {MinUploadedAtFNVersion := 4000}
RegisterInstancedVerbFilter<native><epic_internal>(VerbFilter:verb_filter, Callback:type {_(:entity, :scene_event, :float):void})<transacts>:result(verb_listener_handle, []register_verb_error)

BroadcastVerbMessage<native><epic_internal>(Author:entity, SceneEvent:scene_event):void

verb_router_component<native><public> := class<final_super><epic_internal>(component):
    @available {MinUploadedAtFNVersion := 4000}
    OnReceive<override>(SceneEvent:scene_event):logic = external {}