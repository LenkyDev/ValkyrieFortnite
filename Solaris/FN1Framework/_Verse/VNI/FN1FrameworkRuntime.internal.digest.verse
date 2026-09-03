# Verse path: /Fortnite.com/Framework
# Module import path: /Fortnite.com/Framework/Competitive
Competitive<epic_internal> := module:
    using {/Verse.org/SceneGraph}
    using {/Verse.org/Simulation}
    ranked_leaderboard_params<native><epic_internal> := struct:
        GameIdOverride<native><public>:?string = external {}

        LeaderboardIdOverride<native><public>:?string = external {}

        DivisionIndexOverride<native><public>:?int = external {}

        NumDesiredResults<native><public>:int = external {}

    ranked_leaderboard_entry<native><epic_internal> := struct:
        Position<native><public>:int = external {}

        Points<native><public>:int = external {}

        DisplayName<native><public>:string = external {}

    ranked_leaderboard<native><epic_internal> := struct:
        Entries<native><public>:[]ranked_leaderboard_entry = external {}

    tournament_stat_update<native><epic_internal> := struct:
        Stat<native><public>:string = external {}

        Value<native><public>:int = external {}

    competitive_manager<native><epic_internal> := class<internal>:
        # Sends tournaments stats for this team to the Events Service
        SendTournamentStatsForTeam<native><epic_internal>(InTeam:team, StatsMap:[string]int, ?GameIdOverride:string = external {}):void

        # Sends a tournament stat HUD notification (scoring toast) to each active member of the given team.
        NotifyTournamentStat<native><epic_internal>(InTeam:team, StatUpdate:tournament_stat_update):void

        # Returns the top players for a given mode
        GetRankedLeaderboard<native><epic_internal>(LeaderboardParams:ranked_leaderboard_params)<suspends>:ranked_leaderboard

    (Entity:entity).GetCompetitiveManager<native><epic_internal>()<transacts><decides>:competitive_manager

# Module import path: /Fortnite.com/Framework/CVarUtils
CVarUtils<epic_internal> := module:
    IsCVarEnabled<native><epic_internal>(CVarName:string)<transacts><decides>:void

    GetCVarAsLogic<native><epic_internal>(CVarName:string)<transacts><decides>:logic

    GetCVarAsFloat<native><epic_internal>(CVarName:string)<transacts><decides>:float

    GetCVarAsInt<native><epic_internal>(CVarName:string)<transacts><decides>:int

# Module import path: /Fortnite.com/Framework/Analytics
Analytics<epic_internal> := module:
    using {/Verse.org/Simulation}
    # Base class for creating analytic events from Verse. This would be the only public api.
    analytics_framework_event_base<native><epic_internal> := class<persistent>:
        GetEventName<native_callable><epic_internal>():string = external {}

        Send<native><epic_internal>():void

        Send<native><epic_internal>(Agent:agent):void

    # Tags base class for creating analytic events to allow proper name and allow use of Tags to inject native data
    tags_analytics_event_base<native><epic_internal> := class<persistent>(analytics_framework_event_base):
        SendWithTags<native><epic_internal>(AddTags:[]string):void

        SendWithTags<native><epic_internal>(Agent:agent, AddTags:[]string):void

        Send<native><override>():void

        Send<native><override>(Agent:agent):void

        GetAgentId<native><epic_internal>(Agent:agent):string

    # Base class to inherit from to pass to analytics_attributes_request.AppendToAttributes to inject attributes in an analytics event
    analytics_attributes_base<native><epic_internal> := class<persistent>:


    # System to allow verse to listen for native analytic events to allow injection of custom data
    analytics_attributes_request<native><epic_internal> := class<persistent>:
        OnRequestAttributes<public>():listenable(tuple([string]agent)) = external {}

        AppendToAttributesTags<native><public>(AddTags:[]string):void

        AppendToAttributes<native><public>(FieldPrefix:string, Object:analytics_attributes_base):void

# Module import path: /Fortnite.com/Framework/AnalyticsHelper
AnalyticsHelper<epic_internal> := module:
    using {/Verse.org/Simulation}
    SendELOAnalyticForPlayer<native><epic_internal>(Player:player, MatchPoints:float, TeamPoints:float, IndividualPoints:float):void

# Module import path: /Fortnite.com/Framework/Matchmaking
Matchmaking<epic_internal> := module:
    using {/Fortnite.com/Playspaces}
    using {/Verse.org/SceneGraph}
    using {/Verse.org/Simulation}
    # The struct of rank progress data for a player.
    ranked_progress<native><epic_internal> := struct<concrete>:
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

    # A player agent method to play again.
    (InAgent:agent).PlayAgain<native><epic_internal>():void

    # A player agent method indicating ready for matchmaking (used w/ PlayAgain).
    (InAgent:agent).SetReadyForMatchmaking<native><epic_internal>(IsReady:logic):void

    # Get the desired number of bots to spawn.
    (InSimulationEntity:simulation_entity).GetMatchmakingDesiredBotCount<native><epic_internal>():int

    # Get a matchmaking attribute from the session as an int
    (InSimulationEntity:simulation_entity).GetMatchmakingAttributeAsInt<native><epic_internal>(AttributeKey:string)<transacts><decides>:int

    # Get a matchmaking attribute from the session as an float
    (InSimulationEntity:simulation_entity).GetMatchmakingAttributeAsFloat<native><epic_internal>(AttributeKey:string)<transacts><decides>:float

    # Get a matchmaking attribute from the session as a logic
    (InSimulationEntity:simulation_entity).GetMatchmakingAttributeAsLogic<native><epic_internal>(AttributeKey:string)<transacts><decides>:logic

    # Get a matchmaking attribute from the session as a string
    (InSimulationEntity:simulation_entity).GetMatchmakingAttributeAsString<native><epic_internal>(AttributeKey:string)<transacts><decides>:string

    # Method to check if the match being played is ranked or not.
    IsMatchRanked<native><epic_internal>(Playspace:fort_playspace)<transacts><decides>:void

    # Method to return a players rank progress.
    GetRankProgressForPlayers<native><epic_internal>(Playspace:fort_playspace, Players:[]player)<suspends>:[]ranked_progress

    # Method to call to apply an early match ban penalty to a player.
    ApplyLeaveEarlyBanhammerPenaltyToPlayer<native><epic_internal>(Player:player, Details:string):logic

# Module import path: /Fortnite.com/Framework/Persistence
Persistence<public> := module:
    using {/Verse.org/Simulation}
    persistence_interface<native><epic_internal> := interface<epic_internal>:
        GetVictoryCrownData<native_callable><epic_internal>(Player:player):victory_crown_data

        SetVictoryCrownData<native_callable><epic_internal>(Player:player, InData:victory_crown_data):void

    victory_crown_data<native><epic_internal> := struct<epic_internal>:
        HasVictoryCrown<native>:logic = external {}

        GrantedVictoryCrownCount<native>:int = external {}

        WonWithVictoryCrownCount<native>:int = external {}

        VictoryCrownLevel<native>:int = external {}

    BindInterface<native><epic_internal>(Interface:persistence_interface):void

    UnbindInterface<native><epic_internal>(Interface:persistence_interface):void

    sprite_collection<native><epic_internal> := struct:
        SpriteIds<native><public>:[]string = external {}

        Points<native><public>:int = external {}

        Succeeded<native><public>:logic = external {}

    # Internal (1P-only) read access to a player's BR Extraction sprite collection: every collected
    # sprite entitlement id across every configured season module, plus sprite points from the current
    # season's module. Read-only: does not grant, consume, or otherwise alter BR inventory.
    # Check Succeeded before trusting an empty SpriteIds.
    # Player is any player in the playspace, not necessarily the caller — acceptable because this
    # function is epic_internal and restricted to 1P projects.
    (Player:player).GetSpriteCollection<native><epic_internal>()<suspends>:sprite_collection

# Module import path: /Fortnite.com/Framework/Spectating
Spectating<epic_internal> := module:
    using {/Verse.org/SceneGraph}
    using {/Verse.org/Simulation}
    spectator_manager<native><epic_internal> := class<internal>:
        # Get all live spectators that are part of the session
        GetLiveSpectators<native><epic_internal>()<transacts>:[]player

        # Signaled when a live spectator joins the session.
        LiveSpectatorAddedEvent<native><epic_internal>:subscribable_event_intrnl(player) = external {}

        # Signaled when a live spectator leaves the session.
        LiveSpectatorRemovedEvent<native><epic_internal>:subscribable_event_intrnl(player) = external {}

    (InEntity:entity).GetSpectatorManager<native><epic_internal>()<transacts><decides>:spectator_manager