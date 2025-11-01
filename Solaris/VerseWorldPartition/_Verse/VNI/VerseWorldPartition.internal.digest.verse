# Module import path: /UnrealEngine.com/Temporary/WorldPartition/VerseWorldPartition
VerseWorldPartition<public> := module:
    using {/UnrealEngine.com/Temporary/SpatialMath}
    using {/Verse.org/Assets}
    data_layer_asset<native><epic_internal> := class<concrete><computes><final><epic_internal>(asset):


    # Unloaded: Associated content is unloaded. Loaded: Associated content is loaded but not visible. Activated: Associated content is loaded and visible. Represents possible Streaming Sources runtime states.
    world_partition_streaming_runtime_state<native><epic_internal> := enum:
        # Unloaded
        Unloaded
        # Loaded (meaning loaded but not visible)
        Loaded
        # Activated (meaning loaded and visible)
        Activated

    world_partition_streaming_source_target_behavior<native><epic_internal> := enum:
        Include
        Exclude

    world_partition_streaming_definition<native><epic_internal> := class<concrete><epic_internal>:
        # Source Location
        var Location<native><public>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

        # Source orientation (can impact streaming cell prioritization)
        var Rotation<native><public>:(/UnrealEngine.com/Temporary/SpatialMath:)rotation = external {}

        # Defines how TargetGrids/TargetHLODLayers will be applied to this streaming source.
        var TargetBehavior<native><public>:world_partition_streaming_source_target_behavior = external {}

        # When set, this will change how this streaming source is applied to the provided runtime streaming grids based on the TargetBehavior.
        var TargetGrids<native><public>:[]string = external {}

        # Source internal shapes. When none are provided, a sphere is automatically used. It's radius is equal to grid's loading range and center equals source's location.
        var Shapes<native><public>:[]world_partition_streaming_source_shape = external {}

        # If true, this streaming source will force intersecting cells in 2D
        var Force2D<native><public>:logic = external {}

        SetAsCircle<public>(Range:float)<transacts>:void = external {}

        SetAsSphere<public>(Range:float)<transacts>:void = external {}

    world_partition_streaming_source_priority<native><epic_internal> := enum:
        Highest
        High
        Normal
        Low
        Lowest

    world_partition_streaming_source<native><epic_internal> := class(world_partition_streaming_definition):
        # Source unique name
        var Name<native><public>:string = external {}

        # Streaming source priority
        var Priority<native><public>:world_partition_streaming_source_priority = external {}

        # Use velocity contribution to streaming cells priority streaming.
        var UseVelocityContributionToCellsSorting<native><public>:logic = external {}

        # Whether this source will be considered when world partition detects slow loading and waits for cell streaming to complete
        var BlockOnSlowLoading<native><public>:logic = external {}

        # Target streaming state
        var TargetState<native><public>:world_partition_streaming_runtime_state = external {}

    world_partition_streaming_query_source<native><epic_internal> := class(world_partition_streaming_definition):
        # If False, Location/Radius will not be used to find the cells. Only AlwaysLoaded cells will be returned by the query.
        var SpatialQuery<native><public>:logic = external {}

        # The list of layers to consider for this query
        var DataLayers<native><public>:[]data_layer_asset = external {}

    world_partition_streaming_source_shape<native><epic_internal> := class<concrete>:
        # If True, streaming source shape radius is bound to loading range radius.
        var UseGridLoadingRange<native><public>:logic = external {}

        # Applies a scale to the grid's loading range (used if bUseGridLoadingRange is True)
        var LoadingRangeScale<native><public>:float = external {}

        # Custom streaming source shape radius (not used if bUseGridLoadingRange is True).
        var Radius<native><public>:float = external {}

        # Whether the source shape is a spherical sector instead of a regular sphere source.
        var IsSector<native><public>:logic = external {}

        # Shape's spherical sector angle in degree (not used if bIsSector is False)
        var SectorAngle<native><public>:float = external {}

        # Streaming source shape location (local to streaming source).
        var Location<native><public>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

        # Streaming source shape rotation (local to streaming source).
        var Rotation<native><public>:(/UnrealEngine.com/Temporary/SpatialMath:)rotation = external {}

    world_partition_streaming_source_subscription<native><epic_internal> := class(cancelable):
        Cancel<native><override>()<transacts>:void

    world_partition_helper<native><epic_internal> := class<concrete>:
        # Sets data layer runtime state.
        SetDataLayerRuntimeState<native><public>(DataLayerAsset:data_layer_asset, State:world_partition_streaming_runtime_state, IsRecursive:logic)<transacts>:logic

        # Returns data layer effective runtime state.
        GetDataLayerEffectiveRuntimeState<native><public>(DataLayerAsset:data_layer_asset)<transacts>:world_partition_streaming_runtime_state

        # Adds a streaming source provider callback. The callback is responsible for filling and updating the streaming source when invoked.
        AddStreamingSourceProvider<native><public>(UpdateStreamingSourceCallback:type {_(:world_partition_streaming_source):void})<transacts>:cancelable

        # Adds a static streaming source.
        AddStreamingSource<native><public>(StreamingSource:world_partition_streaming_source)<transacts>:cancelable

        # Returns whether an array of streaming sources has finished streaming. If no array is passed, the state of all currently added streaming source is queryed.
        IsStreamingCompleted<native><public>(Sources:?[]world_partition_streaming_source)<transacts>:logic

        # Returns whether an array of streaming query sources satisfies the passed state.
        IsStreamingCompleted<native><public>(Sources:[]world_partition_streaming_query_source, QueryState:world_partition_streaming_runtime_state)<transacts>:logic

    GetWorldPartitionHelper<native><epic_internal>()<transacts>:?world_partition_helper