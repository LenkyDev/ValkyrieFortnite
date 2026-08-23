# Verse path: /Fortnite.com/DynamicVolume
using {/Verse.org/Simulation/Tags}
using {/Verse.org/Simulation}
using {/Verse.org/SceneGraph}
# Metadata describing the linkcode content loaded by a dynamic_volume_component.
dynamic_volume_metadata<native><epic_internal> := struct:
    CreatorName<native>:string = external {}

    Title<native>:string = external {}

    Tagline<native>:string = external {}

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
    IsLoaded<native><public>()<decides><reads>:void

    # Succeeds if the LinkCode is processing a load or unload operation.
    IsLoading<native><public>()<decides><reads>:void

    # Get the event that fires when the link content loading state begins to change.
    LoadInProgressEvent<native><public>:listenable(tuple()) = external {}

    # Get the event that fires when the link content unloading state begins to change.
    UnloadInProgressEvent<native><public>:listenable(tuple()) = external {}

    # Get the event that fires when the link content is fully loaded.
    LoadedEvent<native><public>:listenable(tuple()) = external {}

    # Get the event that fires when the link content is unloaded.
    UnloadedEvent<native><public>:listenable(tuple()) = external {}

    # Get the event that fires when an agent enters the playspace of this volume
    AgentEnteredEvent<native><public>:listenable(agent) = external {}

    # Get the event that fires when an agent exits the playspace of this volume
    AgentExitedEvent<native><public>:listenable(agent) = external {}

    # Start adopting the parent's users and add all the existing users to this playspace
    BeginAdoptParentPlayspaceUsers<native><epic_internal>()<transacts>:void

    # Stop adopting the parent's users and remove all the users not wanted by this playspace
    EndAdoptParentPlayspaceUsers<native><epic_internal>()<transacts>:void

    # Returns the cached linkcode metadata. Fails if the metadata is not ready yet.
    GetMetadata<native><epic_internal>()<decides><reads>:dynamic_volume_metadata

    # Get the event that fires when linkcode metadata becomes available.
    MetadataReadyEvent<native><epic_internal>:listenable(tuple()) = external {}

    # The time this component started loading, in seconds since Unix epoch (same source as GetSecondsSinceEpoch()). Returns 0.0 if no load is in progress.
    var<private> LoadStartTime<public>:float

    # Set to true to wait until all the clients have preloaded the required assets before loading the level. False loads it on the server as soon as the server is ready.
    var<private> PreloadContentOnAllClients<public>:logic

    # Set the visibility of the level. To have the server and the clients show the level at the same time, set this to false, PreloadContentOnAllClients to true and await on LoadedEvent before setting this back to true
    var<private> ShowLevel<public>:logic

dynamic_volume<native><public> := class(tag):


remove_when_spawned_within<native><public> := class(dynamic_volume):
