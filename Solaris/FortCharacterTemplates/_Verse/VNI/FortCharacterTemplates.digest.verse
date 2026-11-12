# Verse path: /Fortnite.com/Characters
using {/Verse.org/Native}
using {/Verse.org/Simulation}
using {/Verse.org/SceneGraph}
@available {MinUploadedAtFNVersion := 4300}
@experimental
# Component encapsulating crouch settings to drive Fortnite crouched movement
fort_crouch_component<native><public> := class<final_super><epic_internal>(component, enableable):
    @editable_number(float) {MinValue := option {0.000000}; MaxValue := option {10000.000000}}
    # Movement speed while crouched, in cm/s.
    var<private> CrouchSpeed<native><public>:float = external {}

    SetCrouchSpeed<native><public>(NewCrouchSpeed:float)<transacts>:void

    EnterCrouchEvent<native><public>:listenable(entity) = external {}

    ExitCrouchEvent<native><public>:listenable(entity) = external {}

    Enable<native><override>():void

    Disable<native><override>():void

    IsEnabled<native><override>()<transacts><decides>:void

@available {MinUploadedAtFNVersion := 4300}
@experimental
# Component encapsulating Down But Not Out settings for a Fortnite character
fort_down_but_not_out_component<native><public> := class<final_super><epic_internal>(component, enableable):
    @editable_number(float) {MinValue := option {0.000000}; MaxValue := option {10000.000000}}
    # Maximum movement speed while in the downed state, in cm/s.
    var<private> MaxSpeed<native><public>:float = external {}

    SetMaxSpeed<native><public>(NewMaxSpeed:float)<transacts>:void

    @editable_number(float) {MinValue := option {0.000000}; MaxValue := option {100.000000}}
    # Percentage of maximum health restored by a successful revive.
    var<private> PercentageHealthAfterRevive<native><public>:float = external {}

    SetPercentageHealthAfterRevive<native><public>(NewPercentageHealthAfterRevive:float)<transacts>:void

    @editable {}
    # Whether the character can be revived by interaction while downed.
    var<private> Revivable<native><public>:logic = external {}

    SetRevivable<native><public>(NewRevivable:logic)<transacts>:void

    @editable_number(float) {MinValue := option {0.000000}; MaxValue := option {3600.000000}}
    # Seconds a reviver must hold the revive interaction to complete it.
    var<private> TimeToRevive<native><public>:float = external {}

    SetTimeToRevive<native><public>(NewTimeToRevive:float)<transacts>:void

    EnterDBNOEvent<native><public>:listenable(entity) = external {}

    ExitDBNOEvent<native><public>:listenable(entity) = external {}

    Enable<native><override>():void

    Disable<native><override>():void

    IsEnabled<native><override>()<transacts><decides>:void

@available {MinUploadedAtFNVersion := 4300}
@experimental
# Component encapsulating a deployable glider providing steerable, speed-limited descent
fort_glide_component<native><public> := class<final_super><epic_internal>(component, enableable):
    @editable_number(float) {MinValue := option {0.000000}; MaxValue := option {100.000000}}
    # Horizontal friction applied while gliding, damping lateral drift.
    var<private> LateralFriction<native><public>:float = external {}

    SetLateralFriction<native><public>(NewLateralFriction:float)<transacts>:void

    @editable_number(float) {MinValue := option {0.000000}; MaxValue := option {10000.000000}}
    # Maximum horizontal speed while gliding, in cm/s.
    var<private> MaxLateralSpeed<native><public>:float = external {}

    SetMaxLateralSpeed<native><public>(NewMaxLateralSpeed:float)<transacts>:void

    @editable_number(float) {MinValue := option {0.000000}; MaxValue := option {10000.000000}}
    # Maximum downward speed while gliding, in cm/s.
    var<private> TerminalVelocity<native><public>:float = external {}

    SetTerminalVelocity<native><public>(NewTerminalVelocity:float)<transacts>:void

    @editable {}
    # If true, the glider can be redeployed mid-air when the character is at a sufficient height.
    var<private> GliderRedeploy<native><public>:logic = external {}

    SetGliderRedeploy<native><public>(NewGliderRedeploy:logic)<transacts>:void

    @editable_number(float) {MinValue := option {0.000000}; MaxValue := option {100000.000000}}
    # Minimum height above the ground at which the glider can be deployed, in cm.
    var<private> MinimumDeployHeight<native><public>:float = external {}

    SetMinimumDeployHeight<native><public>(NewMinimumDeployHeight:float)<transacts>:void

    @editable_number(float) {MinValue := option {0.000000}; MaxValue := option {100000.000000}}
    # Height above the ground at which the glider deploys automatically, in cm.
    var<private> AutoDeployHeight<native><public>:float = external {}

    SetAutoDeployHeight<native><public>(NewAutoDeployHeight:float)<transacts>:void

    EnterGlideEvent<native><public>:listenable(entity) = external {}

    ExitGlideEvent<native><public>:listenable(entity) = external {}

    Enable<native><override>():void

    Disable<native><override>():void

    IsEnabled<native><override>()<transacts><decides>:void

@available {MinUploadedAtFNVersion := 4300}
@experimental
# Component encapsulating jumping settings to drive Fortnite movement settings
fort_jump_component<native><public> := class<final_super><epic_internal>(component, enableable):
    @editable_number(float) {MinValue := option {0.000000}; MaxValue := option {10000.000000}}
    # Initial vertical velocity applied when the pawn jumps, in cm/s.
    var<private> JumpVelocity<native><public>:float = external {}

    SetJumpVelocity<native><public>(NewJumpVelocity:float)<transacts>:void

    @editable_number(float) {MinValue := option {0.000000}; MaxValue := option {3600.000000}}
    # The max time between jumps, sequencing through values in the JumpChainVelocityScalars.
    var<private> JumpChainInterval<native><public>:float = external {}

    SetJumpChainInterval<native><public>(NewJumpChainInterval:float)<transacts>:void

    @editable
    # Penalty applied to the `JumpVelocity` when jumping in quick succession. Index 0 is the first jump.
    var<private> JumpChainVelocityScalars<native><public>:[]float = external {}

    SetJumpChainVelocityScalars<native><public>(NewJumpChainVelocityScalars:[]float)<transacts>:void

    JumpEvent<native><public>:listenable(entity) = external {}

    Enable<native><override>():void

    Disable<native><override>():void

    IsEnabled<native><override>()<transacts><decides>:void

@available {MinUploadedAtFNVersion := 4300}
@experimental
# Component encapsulating base movement capability: ground speeds and airborne directional control
fort_locomotion_component<native><public> := class<final_super><epic_internal>(component):
    @editable_number(float) {MinValue := option {0.000000}; MaxValue := option {10000.000000}}
    # Minimum movement speed (cm/s) the character can move. Clamps at 0.0.
    var<private> WalkSpeed<native><public>:float = external {}

    SetWalkSpeed<native><public>(NewWalkSpeed:float)<transacts>:void

    @editable_number(float) {MinValue := option {0.000000}; MaxValue := option {10000.000000}}
    # Ground speed while moving without sprinting, in cm/s. The character is always sprinting when moving forward, so this applies when it isn't, such as backwards.
    var<private> RunSpeed<native><public>:float = external {}

    SetRunSpeed<native><public>(NewRunSpeed:float)<transacts>:void

    @editable_number(float) {MinValue := option {0.000000}; MaxValue := option {10000.000000}}
    # Ground speed while sprinting, in cm/s. By default, the character is always considered to be sprinting when moving forward, so this is the forward speed.
    var<private> SprintSpeed<native><public>:float = external {}

    SetSprintSpeed<native><public>(NewSprintSpeed:float)<transacts>:void

    @editable_number(float) {MinValue := option {0.000000}; MaxValue := option {100000.000000}}
    # Sets the maximum acceleration, which is the rate of change of velocity.
    var<private> Acceleration<native><public>:float = external {}

    SetAcceleration<native><public>(NewAcceleration:float)<transacts>:void

    @editable_number(float) {MinValue := option {0.000000}; MaxValue := option {1.000000}}
    # Degree of horizontal control, from 0.0 to 1.0, the character has while airborne.
    var<private> AirControl<native><public>:float = external {}

    SetAirControl<native><public>(NewAirControl:float)<transacts>:void

    EnterInAirEvent<native><public>:listenable(entity) = external {}

    ExitInAirEvent<native><public>:listenable(entity) = external {}

@available {MinUploadedAtFNVersion := 4300}
@experimental
# Component encapsulating free-fall descent with lateral steering and a capped fall speed
fort_skydive_component<native><public> := class<final_super><epic_internal>(component, enableable):
    @editable_number(float) {MinValue := option {0.000000}; MaxValue := option {100000.000000}}
    # Maximum acceleration achievable while skydiving, in cm/s^2.
    var<private> MaxAcceleration<native><public>:float = external {}

    SetMaxAcceleration<native><public>(NewMaxAcceleration:float)<transacts>:void

    @editable_number(float) {MinValue := option {0.000000}; MaxValue := option {100.000000}}
    # Horizontal friction applied while skydiving, damping lateral drift.
    var<private> LateralFriction<native><public>:float = external {}

    SetLateralFriction<native><public>(NewLateralFriction:float)<transacts>:void

    @editable_number(float) {MinValue := option {0.000000}; MaxValue := option {10000.000000}}
    # Maximum horizontal speed while skydiving, in cm/s.
    var<private> MaxLateralSpeed<native><public>:float = external {}

    SetMaxLateralSpeed<native><public>(NewMaxLateralSpeed:float)<transacts>:void

    @editable_number(float) {MinValue := option {0.000000}; MaxValue := option {10000.000000}}
    # Maximum downward speed while skydiving, in cm/s.
    var<private> TerminalVelocity<native><public>:float = external {}

    SetTerminalVelocity<native><public>(NewTerminalVelocity:float)<transacts>:void

    EnterSkydiveEvent<native><public>:listenable(entity) = external {}

    ExitSkydiveEvent<native><public>:listenable(entity) = external {}

    Enable<native><override>():void

    Disable<native><override>():void

    IsEnabled<native><override>()<transacts><decides>:void

@available {MinUploadedAtFNVersion := 4300}
@experimental
# Component encapsulating surface water traversal with a dedicated movement speed
fort_swim_component<native><public> := class<final_super><epic_internal>(component, enableable):
    @editable_number(float) {MinValue := option {0.000000}; MaxValue := option {10000.000000}}
    # Maximum speed while swimming, in cm/s.
    var<private> SwimSpeed<native><public>:float = external {}

    SetSwimSpeed<native><public>(NewSwimSpeed:float)<transacts>:void

    EnterSwimEvent<native><public>:listenable(entity) = external {}

    ExitSwimEvent<native><public>:listenable(entity) = external {}

    Enable<native><override>():void

    Disable<native><override>():void

    IsEnabled<native><override>()<transacts><decides>:void