using {/Verse.org/Native}
using {/UnrealEngine.com/Itemization}
using {/Fortnite.com/Itemization}
using {/Fortnite.com/Devices}
using {/Verse.org/Simulation}
using {/Verse.org/SceneGraph}
# Used with `telekineticon_component.HoldPoint` to determine where on an object the object is held.
telekineticon_hold_point<native><public> := enum<open>:
    # The point on the object from the reticle to the object through the camera when the object is grabbed.
    GrabPoint
    # The point of the object representing the object`s balance point.
    CenterOfMass

# Used with `telekineticon_component.HoldOrientation` to determine the object`s rotation when held.
telekineticon_hold_orientation<native><public> := enum<open>:
    # The object maintains its orientation relative to when it was held.
    AsGrabbed
    # The object does not have a set rotation. Instead, it is rotated as forces interact with it.
    None

telekineticon_component<native><public> := class<final_super>(component):
    @editable
    # The distance, in cm, objects can be grabbed. If `0.0`, `NaN`, or a negative value is provided, there is no range. If `Inf` is provided, any object in the playspace can be affected.
    var GrabRange<public>:float = external {}

    @editable
    # The distance in front of the grabbing agent, in cm, the physical prop is held, along the agent`s forward vector. If false, the object stays where it was grabbed relative to the agent`s position. If `0.0`, `NaN`, or a negative value is provided, the object is held at a distance of `0.0` cm. If `Inf` is provided, the object is held at a distance as far as can be supported.
    var StartingGrabDistance<public>:?float = external {}

    @editable
    # The current distance, in cm, from the grabbing agent to the physical prop, along the agent`s forward vector. If false, no physical prop is currently being held. If set to false and a prop is being held, the prop is dropped. If `0.0`, `NaN`, or a negative value is provided, the object is held at a distance of `0.0` cm. If `Inf` is provided, the object is held at a distance as far as can be supported.
    var CurrentHoldDistance<public>:?float = external {}

    @editable
    # Determines where on the object the object is grabbed.
    var HoldPointType<public>:telekineticon_hold_point = external {}

    @editable
    # Determines the object`s rotation when grabbed.
    var HoldOrientationType<public>:telekineticon_hold_orientation = external {}

    @editable
    # The strength of the acceleration, in cm/second^2, that holds the physical prop. With a 1kg prop - ~`1.0` would allow the object to be dragged on the ground when the player moves. ~`10.0` causes the object to be lifted off the ground when pointing upwards, but up to a distance. ~`100.0` holds the object with some wobble. ~`1000.0` stiffly holds the object with very little wobble If `0.0`, `NaN`, or a negative value is provided, the value is clamped to `0.0`. If `Inf` is provided, the hold is rigid and forces do not affect the object being held.
    var HoldStiffness<public>:float = external {}

    @editable
    # The strength of the force, in kg*m/second^2, which forces the hold to break.  With a 1kg prop ~`1.0` causes nearly any force to break the hold. ~`10.0` is a strong hold on the object that can withstand significant forces. Allows objects to push into a wall around 1m ~`100.0` is almost unbreakable. Supports a distance of around 15m, will go through most walls - depending on how wide they are If `0.0`, `NaN`, or a negative value is provided, any physical interaction will cause the object to be dropped. If `Inf` is provided, the hold on the object cannot be broken.
    var BreakHoldStiffness<public>:float = external {}

    # If the item has a grabbed object, drop it. Fails if no object is being grabbed.
    (/Fortnite.com/Items/telekineticon_component:)Drop<native><public>()<transacts><decides>:void

    # Get the current object being grabbed. Fails if no object is being grabbed.
    GetHeldProp<native><public>()<transacts><decides>:creative_prop

    # Called when an object is grabbed. Provides the held `creative_prop`.
    GrabPropEvent<native><final><public>:listenable(creative_prop) = external {}

    # Called when a grabbed object is dropped. Provides the dropped `creative_prop`.
    DropPropEvent<native><final><public>:listenable(creative_prop) = external {}

    # Called when the hold on a grabbed object is broken by forces being applied to it.  Provides the `creative_prop` that is no longer being grabbed.
    BreakHoldPropEvent<native><final><public>:listenable(creative_prop) = external {}

    GrabProp<native><epic_internal>(Agent:agent, PropToGrab:creative_prop)<transacts><decides>:void

Telekineticon_Creative_V1_Common<native><public> := class<final><concrete>(fort_item_definition_entity):
    ItemDefinitionID<override>:string = external {}

    @available {MinUploadedAtFNVersion := 4000}
    ItemComponent<override>:item_component = external {}

    @field("Components")
    @available {MinUploadedAtFNVersion := 4100}
    TelekineticonComponent<native><protected>:telekineticon_component = external {}