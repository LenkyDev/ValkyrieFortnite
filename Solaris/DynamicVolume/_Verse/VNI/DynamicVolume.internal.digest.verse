using {/Verse.org/Simulation/Tags}
using {/Verse.org/SceneGraph}
# Used to dynamically load a UEFN level at runtime.
dynamic_volume_component<native><epic_internal> := class<final_super>(component, enableable):
    OnBeginSimulationInternal<native><override>():void

    OnEndSimulationInternal<native><override>():void

    # Enables this volume and load any associated linkcode content.
    Enable<native><override>():void

    # Disables this volume and unloads any associated linkcode content.
    Disable<native><override>():void

    # Succeeds if the component is enabled, fails if it's disabled.
    IsEnabled<native><override>()<transacts><decides>:void

    # The link code for the content to load. This will auto-load if it is set when the component is enabled and unload when it is disabled.
    var LinkCode<public>:string

    # Succeeds if the LinkCode is fully loaded.
    IsLoaded<native><public>()<reads><decides>:void

    # Succeeds if the LinkCode is processing a load or unload operation.
    IsLoading<native><public>()<reads><decides>:void

    # Get the event that fires when the link content loading state begins to change.
    LoadInProgressEvent<native><public>:listenable(tuple()) = external {}

    # Get the event that fires when the link content unloading state begins to change.
    UnloadInProgressEvent<native><public>:listenable(tuple()) = external {}

    # Get the event that fires when the link content is fully loaded.
    LoadedEvent<native><public>:listenable(tuple()) = external {}

    # Get the event that fires when the link content is unloaded.
    UnloadedEvent<native><public>:listenable(tuple()) = external {}

    # Start adopting the parent's users and add all the existing users to this playspace
    BeginAdoptParentPlayspaceUsers<native><epic_internal>()<transacts>:void

    # Stop adopting the parent's users and remove all the users not wanted by this playspace
    EndAdoptParentPlayspaceUsers<native><epic_internal>()<transacts>:void

dynamic_volume<native><public> := class(tag):


remove_when_spawned_within<native><public> := class(dynamic_volume):
