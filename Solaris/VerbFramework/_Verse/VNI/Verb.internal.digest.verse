using {/Verse.org/Native}
using {/Verse.org/SceneGraph}
register_verb_error<native><public> := class<epic_internal>:


@experimental
verb_filter<native><public> := class<abstract><epic_internal>:
    Evaluate<native><epic_internal>(SceneEvent:scene_event)<decides>:void

    GetDelta<native><epic_internal>(SceneEvent:scene_event):float

verb_listener_handle<native><final><public> := class<epic_internal>:
    AddParticipant<native><epic_internal>(Entity:entity)<transacts>:void

    RemoveParticipant<native><epic_internal>(Entity:entity)<transacts>:void

    Unregister<native><epic_internal>():void

@available {MinUploadedAtFNVersion := 4000}
@experimental
RegisterVerbFilter<native><epic_internal>(VerbFilter:verb_filter, Callback:type {_(:entity, :scene_event, :float):void})<transacts>:result(verb_listener_handle, []register_verb_error)

@experimental
BroadcastVerbMessage<native><epic_internal>(Author:entity, SceneEvent:scene_event):void

@experimental
verb_router_component<native><public> := class<final_super><epic_internal>(component):
    @available {MinUploadedAtFNVersion := 4000}
    OnReceive<override>(SceneEvent:scene_event):logic = external {}