using {/Verse.org/Colors}
using {/Verse.org/Assets}
using {/Fortnite.com/Devices}
using {/Verse.org/Native}
using {/Verse.org/Simulation}
using {/UnrealEngine.com/Temporary/SpatialMath}
# Module import path: /Fortnite.com/FN1Native
FN1Native<public> := module:
    # Module import path: /Fortnite.com/FN1Native/FortBus
    FortBus<public> := module:
        fort_battlebus_zone<native><epic_internal> := struct<concrete>:
            @editable
            ZoneMin<native><public>:vector2 = external {}

            @editable
            ZoneMax<native><public>:vector2 = external {}

        @import_as("/Script/FN1NativeRuntime.UVerseFortniteBattlebus")
        fort_battlebus_base<native><epic_internal> := class<abstract>:


        fort_battlebus<native><epic_internal> := class<epic_internal>(fort_battlebus_base):
            StartsEnabled<native><public>:logic = external {}

            FlightHeight<native><public>:float = external {}

            FlightSpeed<native><public>:float = external {}

            DeviationAngle<native><public>:float = external {}

            DesiredDoorOpenTime<native><public>:float = external {}

            SpawnZone<native><public>:fort_battlebus_zone = external {}

            DropZone<native><public>:fort_battlebus_zone = external {}

            VolumeSource<native><public>:creative_device

            Initialize<native><public>()<transacts>:void

            StartFlightPath<native><public>()<transacts>:void

            EjectAllPassengers<native><public>()<transacts>:void

            OnFlightStarted<native><public>:listenable(tuple()) = external {}

            OnFlightEnded<native><public>:listenable(tuple()) = external {}

            OnAllPassengersExited<native><public>:listenable(tuple()) = external {}

            OnPassengerExited<native><public>:listenable(agent) = external {}

            OnDropZoneEntered<native><public>:listenable(tuple()) = external {}

            OnDropZoneExited<native><public>:listenable(tuple()) = external {}

    # Module import path: /Fortnite.com/FN1Native/GameMode
    GameMode<public> := module:
        @import_as("/Script/FN1NativeRuntime.UVerseFortGameMode")
        fort_gamemode_base<native><epic_internal> := class<abstract>:


        fort_br_gamemode<native><epic_internal> := class<epic_internal>(fort_gamemode_base):
            Initialize<native><public>():logic

            WaitingForPlayersCountdownStartedEvent<native><public>:listenable(float) = external {}

            WaitingForPlayersFinishedEvent<native><public>:listenable(tuple()) = external {}

            PlayerPawnRespawnedEvent<native><public>:listenable(agent) = external {}

            PlayerPawnEliminatedEvent<native><public>:listenable(agent) = external {}

            TeamWonEvent<native><public>:listenable(team) = external {}

            WarmupFinishedEvent<native><public>:listenable(tuple()) = external {}

            AircraftFinishedEvent<native><public>:listenable(tuple()) = external {}

            StartMatch<native><public>():logic

            StartWarmupPhase<native><public>():logic

            StartAircraftPhase<native><public>():logic

            StartSafeZonesPhase<native><public>():logic

        fort_reload_gamemode<native><epic_internal> := class<epic_internal>(fort_br_gamemode):
            TeamLivesChangedEvent<native><public>:listenable(tuple(agent, team, int, int)) = external {}

            TimeUntilTeamLivesRechargeChangedEvent<native><public>:listenable(tuple(agent, team, float, float)) = external {}

            RespawnsEnabledEvent<native><public>:listenable(tuple()) = external {}

            RespawnsDisabledEvent<native><public>:listenable(tuple()) = external {}

            RespawnsDisabledCoundownStartedEvent<native><public>:listenable(float) = external {}

            ConsumedRemainingTeamLivesEvent<native><public>:listenable(tuple(agent, int)) = external {}

            GetTeamLivesRemaining<native><public>(InTeam:team)<transacts><decides>:int

            GetTimeUntilTeamLivesRecharge<native><public>(InTeam:team)<transacts><decides>:float

            GetGameModeTeamSize<native><public>()<transacts><decides>:int

            AreRespawnsActive<native><public>()<transacts>:logic

            GetRespawnDelay<native><public>(InAgent:agent)<transacts><decides>:float

            GetTimeUntilRespawnDisabled<native><public>()<transacts>:float

            IsWaveRespawnEnabled<native><public>()<transacts>:logic

            SpawnTestPlayers<native><public>(InSquadCount:int, InPlayersPerSquad:int):logic

            AllowRespawns<native><public>(bInAllowRespawns:logic):void

            SetAllowRespawnsOutsideStormPhase<native><public>(bInAllowRespawnsOutsideStormPhase:logic):void

    # Module import path: /Fortnite.com/FN1Native/FortStorm
    FortStorm<public> := module:
        fort_storm_phase<native><public> := struct<concrete><epic_internal>:
            @editable
            WaitTime<native><public>:float = external {}

            @editable
            ShrinkTime<native><public>:float = external {}

            @editable
            Damage<native><public>:float = external {}

            @editable
            EndRadius<native><public>:float = external {}

            @editable
            OverrideEndLocation<native><public>:?(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

            @editable
            EndLocationDistanceMin<native><public>:float = external {}

            @editable
            EndLocationDistanceMax<native><public>:float = external {}

        fort_storm_volume<native><public> := struct<concrete><epic_internal>:
            @editable
            VolumeActor<native><public>:?creative_prop = external {}

            @editable
            RejectionChance<native><public>:float = external {}

        @import_as("/Script/FN1NativeRuntime.UVerseFortniteStorm")
        fort_storm_base<native><epic_internal> := class<abstract>:


        fort_storm<native><epic_internal> := class<epic_internal>(fort_storm_base):
            InitialRadius<native><public>:float

            Phases<native><public>:[]fort_storm_phase

            StormVolumes<native><public>:[]fort_storm_volume

            VolumeSource<native><public>:creative_device

            Initialize<native><epic_internal>()<transacts>:void

            PauseStorm<native><epic_internal>()<transacts>:void

            ResumeStorm<native><epic_internal>()<transacts>:void

            GetPhaseIndex<native><epic_internal>()<transacts><decides>:int

            SetCurrentPhase<native><epic_internal>(InCurrentPhase:int)<transacts>:void

    player_ui_display_info<native><epic_internal> := struct:
        Image<native>:texture

        LargeImage<native>:texture

        SmallImage<native>:texture

        SquadColor<native>:color

        CurrentXP<native>:int

    player_ui_display_info_manager<native><epic_internal> := class:
        GetDisplayInfo<native><epic_internal>(InPlayer:player)<reads>:player_ui_display_info