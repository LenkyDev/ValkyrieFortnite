# Verse path: /Verse.org/VehicleFramework
using {/Verse.org/Native}
using {/Verse.org/Temporary/EpicGamesRestricted/Network}
using {/Verse.org/Simulation}
using {/Verse.org/SceneGraph}
@available {MinUploadedAtFNVersion := 4400}
# A generic seat (derives possessable_component)
seat_component<native><epic_internal> := class<final_super>(possessable_component, enableable):
    Enable<native><override>():void

    Disable<native><override>():void

    IsEnabled<native><override>()<transacts><decides>:void

    # Fires when this seat is enabled or disabled.
    SeatEnabledChangedEvent<native><final><public>:listenable(seat_component) = external {}

    @editable {}
    @category("Seat")
    @replicated("RepNotify")
    # Whether this seat can be occupied. A disabled seat is skipped by the entry seat search.
    var Enabled<native><epic_internal>:logic = external {}

@available {MinUploadedAtFNVersion := 4400}
# the component that makes an entity a vehicle
vehicle_component<native><epic_internal> := class<final_super>(component):
    OnBeginSimulation<native><override>():void

    OnEndSimulation<native><override>():void

    OnAddedToScene<native><override>():void

    OnRemovingFromScene<native><override>():void

@available {MinUploadedAtFNVersion := 4400}
# Empty base class for vehicle suspension components. Derive from this instead of component directly
#  so that code can GetComponent[vehicle_suspension_component] to find any suspension component
#  regardless of its concrete type.
vehicle_suspension_component<native><epic_internal> := class<final_super>(component):


@available {MinUploadedAtFNVersion := 4400}
wheel_position<native><epic_internal> := enum:
    FrontLeft
    FrontRight
    RearLeft
    RearRight
    Front
    Rear

@available {MinUploadedAtFNVersion := 4400}
# Empty base class for vehicle wheel components. Derive from this instead of component directly so
#  that code can GetComponent[vehicle_wheel_component] to find any wheel component regardless of its
#  concrete type.
vehicle_wheel_component<native><epic_internal> := class<abstract><final_super>(component):
