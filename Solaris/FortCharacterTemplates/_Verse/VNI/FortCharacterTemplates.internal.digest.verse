# Verse path: /Fortnite.com/Characters
using {/Verse.org/Presentation}
using {/Verse.org/Native}
using {/Verse.org/Simulation}
using {/Verse.org/SceneGraph}
@available {MinUploadedAtFNVersion := 4300}
@experimental
# Component encapsulating an amplified launch impulse when jumping from a ledge while sprinting
fort_boosted_jump_component<native><epic_internal> := class<final_super><epic_internal>(component, enableable):
    @editable {}
    # Vertical jump velocity during a boosted jump, in cm/s.
    var<private> VerticalVelocity<native><public>:float = external {}

    SetVerticalVelocity<native><public>(NewVerticalVelocity:float)<transacts>:void

    @editable {}
    # Horizontal velocity the character is instantly boosted to when performing a boosted jump, in cm/s.
    var<private> HorizontalVelocity<native><public>:float = external {}

    SetHorizontalVelocity<native><public>(NewHorizontalVelocity:float)<transacts>:void

    BoostedJumpEvent<native><public>:listenable(entity) = external {}

    Enable<native><override>():void

    Disable<native><override>():void

    IsEnabled<native><override>()<transacts><decides>:void

@available {MinUploadedAtFNVersion := 4300}
@experimental
# Component encapsulating crouch settings to drive Fortnite crouched movement
fort_crouch_component<native><epic_internal> := class<final_super><epic_internal>(component, enableable):
    @editable {}
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
fort_down_but_not_out_component<native><epic_internal> := class<final_super><epic_internal>(component, enableable):
    @editable {}
    # Maximum movement speed while in the downed state, in cm/s.
    var<private> MaxSpeed<native><public>:float = external {}

    SetMaxSpeed<native><public>(NewMaxSpeed:float)<transacts>:void

    @editable {}
    # Percentage of maximum health restored by a successful revive.
    var<private> PercentageHealthAfterRevive<native><public>:float = external {}

    SetPercentageHealthAfterRevive<native><public>(NewPercentageHealthAfterRevive:float)<transacts>:void

    @editable {}
    # Whether the character can be revived by interaction while downed.
    var<private> Revivable<native><public>:logic = external {}

    SetRevivable<native><public>(NewRevivable:logic)<transacts>:void

    @editable {}
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
fort_glide_component<native><epic_internal> := class<final_super><epic_internal>(component, enableable):
    @editable {}
    # Horizontal friction applied while gliding, damping lateral drift.
    var<private> LateralFriction<native><public>:float = external {}

    SetLateralFriction<native><public>(NewLateralFriction:float)<transacts>:void

    @editable {}
    # Maximum horizontal speed while gliding, in cm/s.
    var<private> MaxLateralSpeed<native><public>:float = external {}

    SetMaxLateralSpeed<native><public>(NewMaxLateralSpeed:float)<transacts>:void

    @editable {}
    # Maximum downward speed while gliding, in cm/s.
    var<private> TerminalVelocity<native><public>:float = external {}

    SetTerminalVelocity<native><public>(NewTerminalVelocity:float)<transacts>:void

    @editable {}
    # If true, the glider can be redeployed mid-air when the character is at a sufficient height.
    var<private> GliderRedeploy<native><public>:logic = external {}

    SetGliderRedeploy<native><public>(NewGliderRedeploy:logic)<transacts>:void

    @editable {}
    # Minimum height above the ground at which the glider can be deployed, in cm.
    var<private> MinimumDeployHeight<native><public>:float = external {}

    SetMinimumDeployHeight<native><public>(NewMinimumDeployHeight:float)<transacts>:void

    @editable {}
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
# Component encapsulating traversal over low obstacles at full forward speed
fort_hurdle_component<native><epic_internal> := class<final_super><epic_internal>(component, enableable):
    @editable {}
    # Whether the character automatically hurdles.
    var<private> AutoHurdle<native><public>:logic = external {}

    SetAutoHurdle<native><public>(NewAutoHurdle:logic)<transacts>:void

    @editable {}
    # Whether the character can hurdle over low obstacles when they can be jumped over.
    var<private> HurdleOverJumpableObjects<native><public>:logic = external {}

    SetHurdleOverJumpableObjects<native><public>(NewHurdleOverJumpableObjects:logic)<transacts>:void

    HurdleEvent<native><public>:listenable(entity) = external {}

    Enable<native><override>():void

    Disable<native><override>():void

    IsEnabled<native><override>()<transacts><decides>:void

@available {MinUploadedAtFNVersion := 4300}
@experimental
# Component encapsulating jumping settings to drive Fortnite movement settings
fort_jump_component<native><epic_internal> := class<final_super><epic_internal>(component, enableable):
    @editable {}
    # Initial vertical velocity applied when the pawn jumps, in cm/s.
    var<private> JumpVelocity<native><public>:float = external {}

    SetJumpVelocity<native><public>(NewJumpVelocity:float)<transacts>:void

    @editable
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

@available {MinUploadedAtFNVersion := 4300}
@experimental
# Component encapsulating traversal onto ledges above hurdle height
fort_mantle_component<native><epic_internal> := class<final_super><epic_internal>(component, enableable):
    @editable {}
    # Minimum ledge height the character can mantle onto, in cm.
    var<private> MinLedgeHeight<native><public>:float = external {}

    SetMinLedgeHeight<native><public>(NewMinLedgeHeight:float)<transacts>:void

    @editable {}
    # Minimum ledge height the character can mantle onto while in water, in cm.
    var<private> MinLedgeHeightInWater<native><public>:float = external {}

    SetMinLedgeHeightInWater<native><public>(NewMinLedgeHeightInWater:float)<transacts>:void

    MantleEvent<native><public>:listenable(entity) = external {}

    Enable<native><override>():void

    Disable<native><override>():void

    IsEnabled<native><override>()<transacts><decides>:void

@available {MinUploadedAtFNVersion := 4300}
@experimental
# Component encapsulating free-fall descent with lateral steering and a capped fall speed
fort_skydive_component<native><epic_internal> := class<final_super><epic_internal>(component, enableable):
    @editable {}
    # Maximum acceleration achievable while skydiving, in cm/s^2.
    var<private> MaxAcceleration<native><public>:float = external {}

    SetMaxAcceleration<native><public>(NewMaxAcceleration:float)<transacts>:void

    @editable {}
    # Horizontal friction applied while skydiving, damping lateral drift.
    var<private> LateralFriction<native><public>:float = external {}

    SetLateralFriction<native><public>(NewLateralFriction:float)<transacts>:void

    @editable {}
    # Maximum horizontal speed while skydiving, in cm/s.
    var<private> MaxLateralSpeed<native><public>:float = external {}

    SetMaxLateralSpeed<native><public>(NewMaxLateralSpeed:float)<transacts>:void

    @editable {}
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
# Component encapsulating a momentum-preserving slide with optional slide-kick functionality
fort_slide_component<native><epic_internal> := class<final_super><epic_internal>(component, enableable):
    @editable {}
    # Maximum speed the character can reach while sliding, in cm/s.
    var<private> MaxSlideSpeed<native><public>:float = external {}

    SetMaxSlideSpeed<native><public>(NewMaxSlideSpeed:float)<transacts>:void

    @editable {}
    # If true, the character's slide impacts enemies, performing Slide Kick damage.
    var<private> SlideKick<native><public>:logic = external {}

    SetSlideKick<native><public>(NewSlideKick:logic)<transacts>:void

    EnterSlideEvent<native><public>:listenable(entity) = external {}

    ExitSlideEvent<native><public>:listenable(entity) = external {}

    Enable<native><override>():void

    Disable<native><override>():void

    IsEnabled<native><override>()<transacts><decides>:void

@available {MinUploadedAtFNVersion := 4300}
@experimental
# Component encapsulating surface water traversal with a dedicated movement speed
fort_swim_component<native><epic_internal> := class<final_super><epic_internal>(component, enableable):
    @editable {}
    # Maximum speed while swimming, in cm/s.
    var<private> SwimSpeed<native><public>:float = external {}

    SetSwimSpeed<native><public>(NewSwimSpeed:float)<transacts>:void

    EnterSwimEvent<native><public>:listenable(entity) = external {}

    ExitSwimEvent<native><public>:listenable(entity) = external {}

    Enable<native><override>():void

    Disable<native><override>():void

    IsEnabled<native><override>()<transacts><decides>:void

@available {MinUploadedAtFNVersion := 4300}
@experimental
# Component encapsulating tactical sprint settings to drive Fortnite sprinting movement
fort_tactical_sprint_component<native><epic_internal> := class<final_super><epic_internal>(component, enableable):
    @editable {}
    # Sets the maximum acceleration, which is the rate of change of velocity.
    var<private> TacticalSprintAcceleration<native><public>:float = external {}

    SetTacticalSprintAcceleration<native><public>(NewAcceleration:float)<transacts>:void

    @editable {}
    # Energy consumption per second, when actively Sprinting.
    var<private> TacticalSprintEnergyCost<native><public>:float = external {}

    SetTacticalSprintEnergyCost<native><public>(NewSprintEnergyCost:float)<transacts>:void

    @editable {}
    # Energy consumed each time the character jumps while sprinting.
    var<private> TacticalSprintJumpEnergyCost<native><public>:float = external {}

    SetTacticalSprintJumpEnergyCost<native><public>(NewSprintJumpEnergyCost:float)<transacts>:void

    @editable {}
    # Determines if a character can shoulder bash through closed doors while sprinting.
    var<private> ShoulderBash<native><public>:logic = external {}

    SetShoulderBash<native><public>(NewShoulderBash:logic)<transacts>:void

    EnterSprintEvent<native><public>:listenable(entity) = external {}

    ExitSprintEvent<native><public>:listenable(entity) = external {}

    Enable<native><override>():void

    Disable<native><override>():void

    IsEnabled<native><override>()<transacts><decides>:void

@available {MinUploadedAtFNVersion := 4300}
@experimental
@preload
# The entity prefab to customize a player character
fort_player_character<native><epic_internal> := class<concrete>(entity):
    @field("Components")
    # Provides the icon representing this character in developer-facing UI.
    IconComponent<native><public>:icon_component = external {}

    @field("Components")
    # Provides the name and descriptions representing this character in developer-facing UI.
    DescriptionComponent<native><public>:description_component = external {}

    @field("Components")
    # Enables possession and control of this character.
    PossessableComponent<native><public>:possessable_component = external {}

    @field("Components")
    # Core locomotion for the character, which includes ground movement and falling.
    LocomotionComponent<native><public>:fort_locomotion_component = external {}

    @field("Components")
    # Grants the character the ability to traverse water at the surface.
    SwimComponent<native><public>:fort_swim_component = external {}

    @field("Components")
    # Grants a vertical launch.
    JumpComponent<native><public>:fort_jump_component = external {}

    @field("Components")
    # Grants Sprint: a raised movement speed sustained by energy.
    TacticalSprintComponent<native><public>:fort_tactical_sprint_component = external {}

    @field("Components")
    # Grants a crouched stance with a reduced movement speed and collision profile.
    CrouchComponent<native><public>:fort_crouch_component = external {}

    @field("Components")
    # Grants a momentum-preserving slide out of a run.
    SlideComponent<native><public>:fort_slide_component = external {}

    @field("Components")
    # Grants an amplified vertical and horizontal launch when jumping from a ledge while sprinting.
    BoostedJumpComponent<native><public>:fort_boosted_jump_component = external {}

    @field("Components")
    # Grants traversal over low obstacles without loss of forward speed.
    HurdleComponent<native><public>:fort_hurdle_component = external {}

    @field("Components")
    # Grants traversal onto ledges above hurdle height.
    MantleComponent<native><public>:fort_mantle_component = external {}

    @field("Components")
    # Grants a deployable glider providing steerable, speed-limited descent.
    GlideComponent<native><public>:fort_glide_component = external {}

    @field("Components")
    # Grants controlled free-fall.
    SkydiveComponent<native><public>:fort_skydive_component = external {}