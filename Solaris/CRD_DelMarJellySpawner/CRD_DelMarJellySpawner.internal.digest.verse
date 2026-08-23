# Verse path: /Fortnite.com/Devices
using {/Verse.org/Simulation}
# Used to created an EMP Hazard that slows vehicles.
del_mar_emp_hazard_device<epic_internal> := class<concrete><final>(creative_device_base):
    # Signaled when a vehicle triggers the EMP Hazard.Sends the `agent` that controls the vehicle.
    EMPHazardTriggeredEvent<public>:listenable(agent) = external {}