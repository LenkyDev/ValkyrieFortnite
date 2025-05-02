using {/Verse.org/Colors}
using {/Verse.org/Assets}
using {/Fortnite.com/Playspaces}
using {/UnrealEngine.com/Temporary/SpatialMath}
using {/Verse.org/Native}
using {/Verse.org/Simulation}
# Base class for creating analytic events from Verse. This would be the only public api, feral_analytics* would not be made public.
analytics_event_base<native><epic_internal> := class<persistent>:
    GetEventName<native_callable><epic_internal>():string = external {}

    Send<native><epic_internal>():void

    Send<native><epic_internal>(Agent:agent):void

# Feral base class for creating analytic events to allow proper name and allow use of Tags to inject native data
feral_analytics_event_base<native><epic_internal> := class<persistent>(analytics_event_base):
    SendWithTags<native><epic_internal>(AddTags:[]string):void

    SendWithTags<native><epic_internal>(Agent:agent, AddTags:[]string):void

    Send<native><override>():void

    Send<native><override>(Agent:agent):void

    GetAgentId<native><epic_internal>(Agent:agent):string

# Base class to inherit from to pass to feral_analytics_attributes_request.AppendToAttributes to inject attributes in an analytics event
feral_analytics_attributes_base<native><epic_internal> := class<persistent>:


# System to allow verse to listen for native analytic events to allow injection of custom data
feral_analytics_attributes_request<native><epic_internal> := class<persistent>:
    OnRequestAttributes<public>():listenable(tuple([string]agent)) = external {}

    AppendToAttributesTags<native><public>(AddTags:[]string):void

    AppendToAttributes<native><public>(FieldPrefix:string, Object:feral_analytics_attributes_base):void

# Module import path: /Fortnite.com/FeralCorgi/AnalyticsBridge
AnalyticsBridge<epic_internal> := module:
    SendELOAnalyticForPlayer<native><epic_internal>(Player:player, MatchPoints:float, TeamPoints:float, IndividualPoints:float):void

apparatus_bridge<native><epic_internal> := class:
    Setup<native><public>():void

    EnablePlanting<native><epic_internal>(Agent:agent):void

    DisablePlanting<native><epic_internal>(Agent:agent):void

    EnableDisabling<native><epic_internal>(Agent:agent):void

    DisableDisabling<native><epic_internal>(Agent:agent):void

    ResetApparatus<native><epic_internal>():void

    SetApparatusTimerRemaining<native><epic_internal>(Time:int):void

    GetResidualDisablingProgressSeconds<native><epic_internal>():float

    NativeStateChangedEvent<public>():listenable([]char) = external {}

    NativeStateChangedEventWithAgent<public>():listenable(tuple(string, ?agent)) = external {}

# Module import path: /Fortnite.com/FeralCorgi/BackfillControlBridge
BackfillControlBridge<epic_internal> := module:
    EmptyFunction<native><epic_internal>():void

@import_as("/Script/FeralCorgiGameplayRuntime.UCheatBridge")
cheat_bridge_base<native><epic_internal> := class<abstract><epic_internal>:


cheat_bridge<native><epic_internal> := class<concrete>(cheat_bridge_base):
    NativeCheatEvent<public>():listenable(tuple(player, string, float)) = external {}

# Module import path: /Fortnite.com/FeralCorgi/CommonBridge
CommonBridge<epic_internal> := module:
    AgentRespawnCleanup<native><epic_internal>(Agent:agent, RespawnPosition:(/UnrealEngine.com/Temporary/SpatialMath:)vector3):void

    GetVersePlayerId<native><epic_internal>(Player:player)<transacts>:int

    SendTestEvent<native><epic_internal>(EventName:string, TargetAgents:[]agent, Params:[string]float)<transacts><decides>:void

    IsCVarEnabled<native><epic_internal>(CVarName:string)<transacts><decides>:void

game_state_component_bridge<native><epic_internal> := class<concrete>:
    SendEvent<native><epic_internal>(EventName:string, TargetAgents:[]agent, Params:[string]float)<transacts><decides>:void

    OnReceivedEvent<public>():listenable(tuple(string, []agent, [string]float)) = external {}

# Module import path: /Fortnite.com/FeralCorgi/PlayerLoadingStatusBridge
PlayerLoadingStatusBridge<epic_internal> := module:
    AwaitPlayersLoading<native><epic_internal>(Playspace:fort_playspace)<suspends>:void

    IsPlayerLoading<native><epic_internal>(Playspace:fort_playspace, Player:player)<transacts><decides>:void

    GetPlayersLoading<native><epic_internal>(Playspace:fort_playspace)<reads>:[]player

    GetNumPlayersLoading<native><epic_internal>(Playspace:fort_playspace)<reads>:int

# Module import path: /Fortnite.com/FeralCorgi/ReservationHoldingBridge
ReservationHoldingBridge<epic_internal> := module:
    EnableLeavingPlayerReservationHolding<native><epic_internal>(Playspace:fort_playspace, HoldingTime:float):void

    RestoreSessionReservationHoldingSettings<native><epic_internal>(Playspace:fort_playspace):void

    FreeHeldReservation<native><epic_internal>(Playspace:fort_playspace, Player:player):logic

ranked_track_progress<native><epic_internal> := struct<concrete>:
    GameId<native><public>:string = external {}

    TrackGUID<native><public>:string = external {}

    AccountId<native><public>:string = external {}

    HabaneroType<native><public>:string = external {}

    HabaneroLastUpdatedTime<native><public>:int = external {}

    LastQueriedTime<native><public>:float = external {}

    CurrentHabanero<native><public>:int = external {}

    HighestHabanero<native><public>:int = external {}

    CurrentPlayerPosition<native><public>:int = external {}

    ProgressTowardsNextHabanero<native><public>:float = external {}

    bProgressIsStale<native><public>:logic = external {}

    bSkippedRequestDueToTTL<native><public>:logic = external {}

# Module import path: /Fortnite.com/FeralCorgi/SessionAttributesBridge
SessionAttributesBridge<epic_internal> := module:
    IsRankedMatch<native><epic_internal>(Playspace:fort_playspace)<transacts><decides>:void

    IsVKEdit<native><epic_internal>(Playspace:fort_playspace)<transacts><decides>:void

    IsPlaytest<native><epic_internal>(Playspace:fort_playspace)<transacts><decides>:void

    IsPrivateMatch<native><epic_internal>(Playspace:fort_playspace)<transacts><decides>:void

    IsUsingCustomMatchKeys<native><epic_internal>(Playspace:fort_playspace)<transacts><decides>:void

    IsInEditMode<native><epic_internal>(Playspace:fort_playspace)<transacts><decides>:void

    IsInPlayMode<native><epic_internal>(Playspace:fort_playspace)<transacts><decides>:void

    IsMinigameInProgress<native><epic_internal>(Playspace:fort_playspace)<transacts><decides>:void

    IsQABackend<native><epic_internal>()<transacts><decides>:void

    EndMatch<native><epic_internal>(Playspace:fort_playspace)<transacts><decides>:void

    GetMinigameRound<native><epic_internal>(Playspace:fort_playspace)<transacts>:int

    GetTotalMinigameRounds<native><epic_internal>(Playspace:fort_playspace)<transacts>:int

    ApplyMatchEarlyLeaveBanhammerToPlayer<native><epic_internal>(Player:player, Details:string):logic

    GetUpdatedRankForPlayers<native><epic_internal>(Playspace:fort_playspace, Players:[]player)<suspends>:[]ranked_track_progress

player_display_info<native><epic_internal> := struct:
    Image<native>:texture

    LargeImage<native>:texture

    SmallImage<native>:texture

    SquadColor<native>:color

    CurrentXP<native>:int

player_display_info_manager<native><epic_internal> := class:
    GetDisplayInfo<native><epic_internal>(InPlayer:player)<reads>:player_display_info