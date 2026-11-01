# Verse path: /Fortnite.com/Characters
using {/Verse.org/Native}
using {/Verse.org/Simulation}
using {/Verse.org/SceneGraph}
@available {MinUploadedAtFNVersion := 4300}
@experimental
# Component encapsulating base movement capability: ground speeds and airborne directional control
fort_locomotion_component<native><public> := class<final_super><epic_internal>(component):
    @editable {}
    # Minimum movement speed (cm/s) the character can move. Clamps at 0.0.
    var<private> WalkSpeed<native><public>:float = external {}

    SetWalkSpeed<native><public>(NewWalkSpeed:float)<transacts>:void

    @editable {}
    # Ground speed while moving without sprinting, in cm/s. The character is always sprinting when moving forward, so this applies when it isn't, such as backwards.
    var<private> RunSpeed<native><public>:float = external {}

    SetRunSpeed<native><public>(NewRunSpeed:float)<transacts>:void

    @editable {}
    # Ground speed while sprinting, in cm/s. By default, the character is always considered to be sprinting when moving forward, so this is the forward speed.
    var<private> SprintSpeed<native><public>:float = external {}

    SetSprintSpeed<native><public>(NewSprintSpeed:float)<transacts>:void

    @editable
    # Sets the maximum acceleration, which is the rate of change of velocity.
    var<private> Acceleration<native><public>:float = external {}

    SetAcceleration<native><public>(NewAcceleration:float)<transacts>:void

    @editable {}
    # Degree of horizontal control, from 0.0 to 1.0, the character has while airborne.
    var<private> AirControl<native><public>:float = external {}

    SetAirControl<native><public>(NewAirControl:float)<transacts>:void

    EnterInAirEvent<native><public>:listenable(entity) = external {}

    ExitInAirEvent<native><public>:listenable(entity) = external {}