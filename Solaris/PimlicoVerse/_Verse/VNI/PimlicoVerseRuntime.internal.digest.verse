using {/Verse.org/Native}
using {/Fortnite.com/Playspaces}
using {/Fortnite.com/Devices}
using {/Verse.org/Simulation}
using {/Verse.org/Assets}
using {/Verse.org/Colors}
using {/Verse.org/SpatialMath}
using {/Verse.org/SceneGraph}
@hide_in_editor
# Component added to PimlicoCharacters
pimlico_character_component<native><final><epic_internal> := class<final_super>(component):
    # Succeeds if the character is currently in Ragdoll.
    IsInRagdoll<native><epic_internal>()<transacts>:logic

    IsGettingUp<native><epic_internal>()<transacts>:logic

    IsInAir<native><epic_internal>()<transacts>:logic

    IsJumping<native><epic_internal>()<transacts>:logic

    IsTackling<native><epic_internal>()<transacts>:logic

    IsChargingShoot<native><epic_internal>()<transacts>:logic

    IsDunking<native><epic_internal>()<transacts>:logic

    IsDoubleJumping<native><epic_internal>()<transacts>:logic

    CanPerformDunk<native><epic_internal>()<transacts>:logic

    IsInDunkRange<native><epic_internal>()<transacts>:logic

    GetDunkMaxDistanceToGoal<native><epic_internal>()<transacts>:float

    # Query the internal timer that tracks the time charged for the SHOOT.
    GetCurrentShootChargeTime<native><epic_internal>()<transacts>:float

    # Config setting - if ChargeTime reaches this value then the bean will auto SHOOT.
    GetMaxShootChargeTime<native><epic_internal>()<transacts>:float

    # Config setting - if ChargeTime reaches this value then the bean apply some inaccuracy when they SHOOT.
    GetMinShootAccurateChargeTime<native><epic_internal>()<transacts>:float

    # Config setting - MAX multiplier applied to the ball as it is thrown from the bean. Lerped from min to max based upon charge time and max charge timer.
    GetShootMinPower<native><epic_internal>()<transacts>:float

    # Config setting - Min multiplier applied to the ball as it is thrown from the bean. Lerped from min to max based upon charge time and max charge timer.
    GetShootMaxPower<native><epic_internal>()<transacts>:float

    # Sets the relevant data necessary to enable features that rely on level layout.
    SetLevelInfo<native><epic_internal>(TargetGoalLocation:(/Verse.org/SpatialMath:)vector3, DefendingGoalLocation:(/Verse.org/SpatialMath:)vector3, TargetGoalForward:(/Verse.org/SpatialMath:)vector3, HalfCourtLocation:(/Verse.org/SpatialMath:)vector3)<transacts>:void

    # Sets the players cosmetic to the specified team and team member index, passed in the TeamColor and Logo.
    SetTeamCosmetic<native><epic_internal>(TeamIdentifier:string, TeamMemberIndex:int, TeamColor:color, TeamLogo:texture)<transacts>:logic

    RemoveTeamCosmetic<native><epic_internal>()<transacts>:void

    HasTeamCosmeticApplied<native><epic_internal>()<transacts>:logic

    # Applies a cosmetic accessory to the player
    ApplyCosmeticAccessory<native><epic_internal>(AccessoryIdentifier:string)<transacts>:void

    # Removes a cosmetic accessory from the player
    RemoveCosmeticAccessory<native><epic_internal>(AccessoryIdentifier:string)<transacts>:void

    # Removes all cosmetic accessories from the player
    RemoveAllCosmeticAccessories<native><epic_internal>()<transacts>:void

    TriggerRagdoll<native><epic_internal>(Force:(/Verse.org/SpatialMath:)vector3)<transacts>:void

    # Sets the camera target instantly for the given actor.
    SetCameraTargetInstant<native><epic_internal>(Target:(/Verse.org/SpatialMath:)vector3)<transacts>:void

    HasObjective<native><epic_internal>()<transacts>:logic

    SetHasObjective<native><epic_internal>(IsEnabled:logic)<transacts>:void

    TryThrowObjective<native><epic_internal>(Direction:(/Verse.org/SpatialMath:)vector3, Power:float, ShouldInheritXYVelocity:logic)<transacts>:logic

    SpawnObjective<native><epic_internal>(WorldLocation:(/Verse.org/SpatialMath:)vector3)<transacts>:logic

    SetCanSeeNameplates<native><epic_internal>(CanSeeNameplates:logic)<transacts>:void

    GetHype<native><epic_internal>()<transacts>:float

    AddHype<native><epic_internal>(HypeAddition:float)<transacts>:float

    ReduceHype<native><epic_internal>(HypeReduction:float)<transacts>:float

    ResetHype<native><epic_internal>()<transacts>:void

    IsAtMaxHype<native><epic_internal>()<transacts>:logic

    SetReadyAbility<native><epic_internal>(AbilityPath:string)<transacts>:logic

    ClearReadyAbility<native><epic_internal>()<transacts>:logic

    GrantHypeAbility<native><epic_internal>(AbilityPath:string)<transacts>:logic

    ActivateHypeAbility<native><epic_internal>()<transacts>:logic

    ClearHypeAbility<native><epic_internal>()<transacts>:logic

    PlayAgain<native><epic_internal>():void

    SetReadyForMatchmaking<native><epic_internal>(IsReady:logic):void

    # Subscribe callbacks to `OnMatchmakingFlowEvent`. Event to be notified when the Matchmaking Flow changes.
    OnMatchmakingFlowEvent<epic_internal>():subscribable(tuple(agent, string)) = external {}

    # Plays an AnimationMontage defined in a dictionary in native
    PlayAnimationMontage<native><epic_internal>(MontageName:string, PlayOnAllClients:logic, ?InPlayRate:float = external {}, ?StartSectionName:string = external {}):void

    # Subscribe callbacks to `OnPimlicoCharacterHasObjectiveChangedEvent` to react when the agent gains or loses an objective.
    OnPimlicoCharacterHasObjectiveChangedEvent<epic_internal>():subscribable(pimlico_char_objective_event) = external {}

    # Subscribe callbacks to `OnPimlicoCharacterPassEvent` to react when the agent attempts a pass.
    OnPimlicoCharacterPassEvent<epic_internal>():subscribable(pimlico_char_pass_event) = external {}

    # Subscribe callbacks to `OnPimlicoCharacterTackleEvent` to react when the agent performs a successful tackle.
    OnPimlicoCharacterTackleEvent<epic_internal>():subscribable(pimlico_char_tackle_event) = external {}

    # Subscribe callbacks to `OnPimlicoCharacterThrowEvent` to react when the agent performs a throw of their objective.
    OnPimlicoCharacterThrowEvent<epic_internal>():subscribable(pimlico_char_throw_event) = external {}

    # Subscribe callbacks to `OnPimlicoCharacterLandingEvent` to react when the agent gets a momentum boost from landing.
    OnPimlicoCharacterLandingEvent<epic_internal>():subscribable(pimlico_char_landing_event) = external {}

    # Subscribe callbacks to `OnPimlicoCharacterMomentumEvent` to react when the agent finishes the momentum.
    OnPimlicoCharacterMomentumEvent<epic_internal>():subscribable(pimlico_char_momentum_event) = external {}

    # Subscribe callbacks to `PimlicoOnObjectiveCamToggleEvent` to react when the agent toggles the objective camera.
    OnPimlicoObjectiveCamToggleEvent<epic_internal>():subscribable(pimlico_char_objective_cam_toggle_event) = external {}

    # Subscribe callbacks to `PimlicoCharacterJumpedEvent` to react when the agent jumps.
    OnPimlicoCharacterJumpedEvent<epic_internal>():subscribable(tuple(agent, logic)) = external {}

    # Toggle the custom Pimlico Input Processor.
    ToggleInputProcessor<native><epic_internal>(Enabled:logic):void

    # Subscribe callbacks to `PimlicoCharacterProceedEvent` to react when the user press the proceed action.
    OnPimlicoCharacterProceedEvent<epic_internal>():subscribable(tuple(player, logic)) = external {}

    # Subscribe callbacks to `PimlicoCharacterToLobbyEvent` to react when the user press the ToLobby action.
    OnPimlicoCharacterToLobbyEvent<epic_internal>():subscribable(tuple(player, logic)) = external {}

    # Subscribe callbacks to `PimlicoCharacterPlayAgainEvent` to react when the user press the PlayAgain action.
    OnPimlicoCharacterPlayAgainEvent<epic_internal>():subscribable(tuple(player, logic)) = external {}

# Contextual information when obtaining the objective.
objective_change_cause<native><epic_internal> := enum<open>:
    Unknown
    NeutralSpawn
    PickupCollect
    PickupCatch
    PassCatch
    PassInterceptByCatch
    PassCollect
    PassInterceptByCollect
    ThrowCollect
    ThrowInterceptByCollect
    ThrowCatch
    ThrowInterceptByCatch
    Throw
    Tackle
    Pass

# Contextual information on the result of a tackle.
tackle_result<native><epic_internal> := enum<open>:
    Blocked
    Success
    Clash
    Parry

# The parameters of the Pimlico character event for gaining or losing an objective.
pimlico_char_objective_event<native><epic_internal> := struct<concrete>:
    # The agent of this event.
    Agent<native><public>:agent = external {}

    # Whether the agent now has the objective or not.
    HasObjective<native><public>:logic = external {}

    # Contextual information regarding how this agent gained the objective.
    ObjectiveChangeCause<native><public>:objective_change_cause = external {}

# The parameters of the Pimlico character event for attempting a pass.
pimlico_char_pass_event<native><epic_internal> := struct<concrete>:
    # The agent of this event.
    Agent<native><public>:agent = external {}

    # The agent that was intended to receive the pass.
    TargetAgent<native><public>:agent = external {}

    # The power of the thrown pass.
    ThrowPower<native><public>:float = external {}

# The parameters of the Pimlico character event for successful tackles.
pimlico_char_tackle_event<native><epic_internal> := struct<concrete>:
    # The agent of this event.
    Agent<native><public>:agent = external {}

    # The agent that was tackled during this event.
    TackledAgent<native><public>:agent = external {}

    # Contextual information regarding the result of this attempted tackle.
    TackleResult<native><public>:tackle_result = external {}

# The parameters of the Pimlico character event for throwing objectives.
pimlico_char_throw_event<native><epic_internal> := struct<concrete>:
    # The agent of this event.
    Agent<native><public>:agent = external {}

    # The direction of the throw.
    ThrowDirection<native><public>:(/Verse.org/SpatialMath:)vector3 = external {}

    # The power of the throw.
    ThrowPower<native><public>:float = external {}

# The parameters of the Pimlico character event when gaining a momentum boost from a landing.
pimlico_char_landing_event<native><epic_internal> := struct<concrete>:
    # The agent of this event.
    Agent<native><public>:agent = external {}

    # The agents resultant momentum multiplier.
    NewMomentumMultiplier<native><public>:float = external {}

    # The difference between the agents momentum multiplier after the landing boost.
    MomentumMultiplierIncrease<native><public>:float = external {}

# The parameters of the Pimlico character event when momentum is completed.
pimlico_char_momentum_event<native><epic_internal> := struct<concrete>:
    # The agent of this event.
    Agent<native><public>:agent = external {}

    # The momentum distance.
    MomentumDuration<native><public>:float = external {}

# The parameters of the Pimlico character event when the objective camera is toggled.
pimlico_char_objective_cam_toggle_event<native><epic_internal> := struct<concrete>:
    # The agent of this event.
    Agent<native><public>:agent = external {}

    # Whether the agent now has the objective camera enabled
    IsEnabled<native><public>:logic = external {}

# Module import path: /Fortnite.com/Pimlico/PimlicoInput
PimlicoInput<epic_internal> := module:
    using {/Verse.org/Assets}
    IA_Hype<epic_internal>:input_action(logic) = external {}

    IA_Stats<epic_internal>:input_action(logic) = external {}

(InAgent:agent).TriggerRagdoll<native><epic_internal>(Force:(/Verse.org/SpatialMath:)vector3)<transacts>:void

(InAgent:agent).IsInRagdoll<native><epic_internal>()<transacts>:logic

(InAgent:agent).SpawnObjective<native><epic_internal>(WorldLocation:(/Verse.org/SpatialMath:)vector3)<transacts>:logic

(InAgent:agent).SpawnObjectiveType<native><epic_internal>(WorldLocation:(/Verse.org/SpatialMath:)vector3, ObjectiveType:int)<transacts>:logic

(InAgent:agent).SetUpArcThrow<native><epic_internal>(bUseArcThow:logic, ArcDrawTime:float, ViewOffset:(/Verse.org/SpatialMath:)vector3, PitchAngle:float)<transacts>:void

(InAgent:agent).GetObjectiveLocation<native><epic_internal>()<transacts>:(/Verse.org/SpatialMath:)vector3

(InAgent:agent).SetHasObjective<native><epic_internal>(IsEnabled:logic)<transacts>:void

(InAgent:agent).HasObjective<native><epic_internal>()<transacts>:logic

(InAgent:agent).TryThrowObjective<native><epic_internal>(Direction:(/Verse.org/SpatialMath:)vector3, Power:float, ShouldInheritXYVelocity:logic)<transacts>:logic

(InAgent:agent).GetHype<native><epic_internal>()<transacts>:float

(InAgent:agent).ReadAndConsumeMostRecentHypeAddition<native><epic_internal>()<transacts>:float

(InAgent:agent).AddHype<native><epic_internal>(HypeAddition:float)<transacts>:void

(InAgent:agent).ReduceHype<native><epic_internal>(HypeReduction:float)<transacts>:void

(InAgent:agent).ResetHype<native><epic_internal>()<transacts>:void

(InAgent:agent).IsAtMaxHype<native><epic_internal>()<transacts>:logic

(InAgent:agent).TryActivateScaleUp<native><epic_internal>()<transacts>:logic

(InAgent:agent).TryActivatePartyCrasher<native><epic_internal>()<transacts>:logic

(InAgent:agent).TryActivatePaintBomb<native><epic_internal>()<transacts>:logic

(InAgent:agent).IsScaledUp<native><epic_internal>()<transacts>:logic

(InAgent:agent).GetCurrentScaleUpStateIndex<native><epic_internal>()<transacts>:int

(InAgent:agent).DeactivateScaleUp<native><epic_internal>()<transacts>:void

(InAgent:agent).SetLevelInfo<native><epic_internal>(TargetGoalLocation:(/Verse.org/SpatialMath:)vector3, DefendingGoalLocation:(/Verse.org/SpatialMath:)vector3, TargetGoalForward:(/Verse.org/SpatialMath:)vector3, HalfCourtLocation:(/Verse.org/SpatialMath:)vector3)<transacts>:void

(InAgent:agent).SetPimlicoShootTargetData<native><epic_internal>(ShootTargetWorldLocation:(/Verse.org/SpatialMath:)vector3, HalfCourtWorldLocation:(/Verse.org/SpatialMath:)vector3):void

(InAgent:agent).NotifyGameStateChanged<native><epic_internal>(NewGameState:string)<transacts>:void

(InAgent:agent).OverridePimlicoCharacterProperties<native><epic_internal>(Blob:string)<transacts>:void

(InAgent:agent).DebugSetPimlicoCharacterProperties<native><epic_internal>(Blob:string, ?ComponentName:string = external {})<transacts>:void

(InAgent:agent).DebugSetPimlicoCharacterAttributes<native><epic_internal>(Blob:string)<transacts>:void

(InAgent:agent).DebugSetPimlicoCharacterTeam<native><epic_internal>(TeamIndex:int)<transacts>:void

(InAgent:agent).SetPimlicoCharacterVisibilityExcludingObjective<native><epic_internal>(Visible:logic):void

(InAgent:agent).SetObjectiveForcedLaunchHomingLocation<native><epic_internal>(HomingLocation:(/Verse.org/SpatialMath:)vector3):void

(InVolume:creative_device_base).GetNumObjectivesInsideVolume<native><epic_internal>(AutoDestroyObjectives:logic)<transacts>:int

(InVolume:creative_device_base).GetLocationsOfObjectivesInsideVolume<native><epic_internal>(AutoDestroyObjectives:logic)<transacts>:[](/Verse.org/SpatialMath:)vector3

(InAgent:agent).DebugRunCommand<native><epic_internal>(CommandString:string, SendToClientsToo:logic)<transacts>:void

(InAgent:agent).AddTagToPlayer<native><epic_internal>(TagName:string)<transacts>:void

(InAgent:agent).RemoveTagFromPlayer<native><epic_internal>(TagName:string)<transacts>:void

(InPlayspace:fort_playspace).SetPimlicoNameplatesVisible<native><epic_internal>(AreNowVisible:logic)<transacts>:void

(InPlayspace:fort_playspace).SetPimlicoWidgetsVisible<native><epic_internal>(AreNowVisible:logic)<transacts>:void

@import_as("/Script/PimlicoVerseRuntime.UPimlicoVerseCheatBridge")
pimlico_cheat_bridge_base<native><epic_internal> := class<abstract><epic_internal>:


pimlico_cheat_bridge<native><epic_internal> := class<concrete>(pimlico_cheat_bridge_base):
    NativeCheatEvent<public>():listenable(tuple(player, string, float)) = external {}