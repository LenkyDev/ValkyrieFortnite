# Verse path: /UnrealEngine.com/AINavigation
using {/Verse.org/Native}
using {/UnrealEngine.com/Temporary/SpatialMath}
using {/Verse.org/Assets}
using {/Verse.org/Simulation}
using {/Verse.org/SceneGraph}
@experimental
@hide_in_editor
# This class adds the navigation system to the world simulation entity.
# This class adds the navigation system to the world simulation entity.
navigation_system_component<native><epic_internal> := class<final_super>(component):


# Navigation layers are various representations of the world that can be used by agents of different shapes and abilities
navigation_layer<native><epic_internal> := class<abstract>(asset):


# Auto select a ground layer based on the user's collision component
navigation_layer_ground_auto<native><epic_internal> := class<concrete><final>(navigation_layer):


# Use the most granular air field available
navigation_layer_air_auto<native><epic_internal> := class<concrete><final>(navigation_layer):


# Result of a navigation request
navigation_find_path_result<native><epic_internal> := enum:
    # A valid navigation path was found.
    PathFound
    # The destination is unreachable. The path leads to the reachable location closest to the destination.
    PartialUnreachable
    # Search limit was reached before a path could be found. The path leads to the closest location to the destination that the search had time to visit.
    PartialReachedLimit
    # The request contains invalid or missing data.
    InvalidRequest
    # The origin location cannot be associated to the query's navigation_layer.
    StartLocationNonNavigable
    # The destination cannot be associated to the query's navigation_layer.
    DestinationNonNavigable
    # There is no path that connect the start and end location using the query parameters.
    DestinationUnreachable

# Describes the location and characteristics of a point along a navigation path.
navigation_path_point<native><epic_internal> := struct<concrete>:
    @editable
    # Position of the point in the world.
    Location<native><public>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

# Contains the resulting path and status from a find path query.
navigation_path<native><epic_internal> := class<final><epic_internal>:
    # Returns the points that form the path. Fails if the path is invalid.
    GetPathPoints<native><public>()<transacts><decides>:[]navigation_path_point

    # Whether this path completed successfully or encountered a problem.
    Result<native><public>:navigation_find_path_result

@import_as("/Script/AINavigation.UCompositeNavigationQuery")
# Defines the parameters of a navigation query such as finding a path or projecting a point.
navigation_query<native><epic_internal> := class<concrete><final>:


@experimental
# Component that describes the navigation preferences of this entity and offers helpers to find paths using those preferences.
navigation_user_component<native><epic_internal> := class<final><final_super>(component):
    OnAddedToScene<native><override>():void

    OnRemovingFromScene<native><override>():void

    @editable
    # Default navigation query parameters for this entity.
    DefaultNavigationQuery<native><public>:navigation_query

@experimental
# Finds and returns the path between this entity's location and the target location.
(InEntity:entity).FindPath<native><epic_internal>(Destination:(/UnrealEngine.com/Temporary/SpatialMath:)vector3)<suspends>:navigation_path

@experimental
# Finds and returns the path between this entity's location and the target location, filtering the path using supplied Query
(InEntity:entity).FindPath<native><epic_internal>(Destination:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, Query:navigation_query)<suspends>:navigation_path