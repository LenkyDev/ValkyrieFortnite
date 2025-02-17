using {/UnrealEngine.com/Temporary/SceneGraph}
using {/UnrealEngine.com/Temporary/SpatialMath}
using {/Verse.org/Simulation}
using {/Verse.org/Assets}
navigation_area<native><epic_internal> := class<computes><epic_internal>(asset):


# Defines the costs associated with entering and traversing a specific navigation area
navigation_area_cost<native><epic_internal> := struct<concrete>:
    @editable_non_concrete
    # The navigation area these costs apply to.
    NavigationArea<native><public>:subtype(navigation_area) = external {}

    @editable_number(float) {MinValue := option {0.000000}}
    # Cost incurred when entering this navigation area.
    EnteringCost<native><public>:float = external {}

    @editable_number(float) {MinValue := option {1.000000}}
    # Cost that multiplies the distance traveled inside this navigation area.
    TravelCostMultiplier<native><public>:float = external {}

# Navigation filter that will assign custom costs to each listed navigation areas
navigation_filter_area<native><epic_internal> := class<concrete>(navigation_filter):
    AreaCostOverrides<native><public>:[]navigation_area_cost = external {}

# Base class for navigation filters to be applied to a navigation query
navigation_filter<native><epic_internal> := class<abstract>:


# Navigation layers are various representations of the world that can be used by agents of different shapes and abilities
navigation_layer<native><epic_internal> := class<abstract>:


# Auto select a ground layer based on the user's collision component
navigation_layer_ground_auto<native><epic_internal> := class<concrete><final>(navigation_layer):


# Use the most granular air field available
navigation_layer_air_auto<native><epic_internal> := class<concrete><final>(navigation_layer):


# Defines the parameters of a navigation query such as finding a path or projecting a point.
navigation_query<native><epic_internal> := class<concrete><final>(asset):
    NavigationFilters<native><public>:[]navigation_filter = external {}

    @editable_number(float) {MinValue := option {0.000000}}
    # Distance from the goal which will be considered close enough for the path to complete.
    ReachRadius<native><public>:float = external {}

    @editable
    # If the destination is determined to be unreachable, should the query return a partial path.
    AllowPartialPath<native><public>:logic = external {}

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
    Location<native><public>:vector3 = external {}

# Contains the resulting path and status from a find path query.
navigation_path<native><epic_internal> := class<final><epic_internal>:
    # Returns the points that form the path. Fails if the path is invalid.
    GetPathPoints<native><public>()<transacts><decides>:[]navigation_path_point

    # Whether this path completed successfully or encountered a problem.
    Result<native><public>:navigation_find_path_result

@experimental
# Component that describes the navigation preferences of this entity and offers helpers to find paths using those preferences.
navigation_user_component<native><epic_internal> := class<final><final_super>(component):
    OnAddedToScene<native><override>():void

    OnRemovingFromScene<native><override>():void

    @editable
    # Default navigation query parameters for this entity.
    DefaultNavigationQuery<native><public>:navigation_query = external {}

    # Finds and returns the path between this entity's location and the target location.
    FindPath<native><public>(Destination:vector3, ?Query:navigation_query = external {})<suspends>:navigation_path