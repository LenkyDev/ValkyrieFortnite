# Module import path: /Fortnite.com/FN1Native
FN1Native<public> := module:
    using {/Verse.org/SceneGraph}
    using {/Verse.org/Simulation}
    using {/Verse.org/Colors}
    using {/Verse.org/Assets}
    # Module import path: /Fortnite.com/FN1Native/FortAircraft
    FortAircraft<public> := module:
        using {/Verse.org/SceneGraph}
        using {/Verse.org/Simulation}
        using {/Verse.org/SpatialMath}
        fort_aircraft_flight_info<native><epic_internal> := class:
            @editable
            StartLocation<public>:(/Verse.org/SpatialMath:)vector3 = external {}

            @editable
            StartRotation<public>:(/Verse.org/SpatialMath:)rotation = external {}

            @editable_number(float) {MinValue := option {0.000000}}
            Speed<public>:float = external {}

            @editable_number(float) {MinValue := option {0.000000}}
            Duration<public>:float = external {}

            @editable_number(float) {MinValue := option {0.000000}}
            DropStartDelay<public>:float = external {}

            @editable_number(float) {MinValue := option {0.000000}}
            DropEndDelay<public>:float = external {}

            GetEndLocation<public>():(/Verse.org/SpatialMath:)vector3 = external {}

            GetDropStartLocation<public>():(/Verse.org/SpatialMath:)vector3 = external {}

            GetDropEndLocation<public>():(/Verse.org/SpatialMath:)vector3 = external {}

        fort_aircraft_component<native><epic_internal> := class<final_super><epic_internal>(component):
            var FlightInfo<public>:fort_aircraft_flight_info = external {}

            var StartTime<public>:float = external {}

            var EndTime<public>:float = external {}

            var DropStartTime<public>:float = external {}

            var DropEndTime<public>:float = external {}

            var IsInDropZone<public>:logic = external {}

            FlightStartedEvent<public>:subscribable_event_intrnl(fort_aircraft_component) = external {}

            FlightEndedEvent<public>:subscribable_event_intrnl(fort_aircraft_component) = external {}

            FlightEnteredDropZoneEvent<public>:subscribable_event_intrnl(fort_aircraft_component) = external {}

            FlightExitedDropZoneEvent<public>:subscribable_event_intrnl(fort_aircraft_component) = external {}

            OnEndSimulation<override>():void = external {}

            IsFlying<public>()<transacts><decides>:void = external {}

            StartFlight<public>(InFlightInfo:fort_aircraft_flight_info)<suspends>:void = external {}

            GetPassengers<public>()<reads>:[]agent = external {}

            AddPassenger<public>(Passenger:agent)<transacts><decides>:void = external {}

            RemovePassenger<public>(Passenger:agent)<transacts><decides>:void = external {}

        fort_aircraft<native><epic_internal> := class<epic_internal>(entity):


    # Module import path: /Fortnite.com/FN1Native/FortBuildMode
    FortBuildMode<public> := module:
        using {/Verse.org/SceneGraph}
        fort_build_mode_blocker_component<native><epic_internal> := class<final><final_super>(component):


    # Module import path: /Fortnite.com/FN1Native/FortBus
    FortBus<public> := module:
        using {/Fortnite.com/Devices}
        using {/Verse.org/Native}
        using {/Verse.org/Simulation}
        using {/UnrealEngine.com/Temporary/SpatialMath}
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
        using {/Verse.org/Simulation}
        using {/Verse.org/SpatialMath}
        using {/Verse.org/SceneGraph}
        using {/Verse.org/Assets}
        environment_query<native><epic_internal> := class<computes><final><epic_internal>(asset):
            AwaitEQSQuery<native><epic_internal>(Owner:entity, Params:[]tuple(string, float))<suspends>:[](/Verse.org/SpatialMath:)vector3

        (Agent:agent).TriggerAbilityByPath<native><epic_internal>(AbilityPath:string):void

        (Agent:agent).TriggerAbilityByPathWithTargets<native><epic_internal>(AbilityPath:string, Target:[]agent):void

        LoadAbilityByPath<native><epic_internal>(AbilityPath:string):void

    # Module import path: /Fortnite.com/FN1Native/Matchmaking
    Matchmaking<public> := module:
        # Module import path: /Fortnite.com/FN1Native/Matchmaking/FortSessionAttributesBridge
        FortSessionAttributesBridge<epic_internal> := module:
            using {/Verse.org/SceneGraph}
            IsRankedMatch<native><epic_internal>(ContextEntity:entity)<transacts><decides>:void

            IsBuildMode<native><epic_internal>(ContextEntity:entity)<transacts><decides>:void

            IsVKEdit<native><epic_internal>(ContextEntity:entity)<transacts><decides>:void

            GetMaxSquadSize<native><epic_internal>(ContextEntity:entity)<transacts><decides>:int

            GetMaxPlayerCount<native><epic_internal>(ContextEntity:entity)<transacts><decides>:int

    # Module import path: /Fortnite.com/FN1Native/FortSafeZone
    (/Fortnite.com/FN1Native:)FortSafeZone<public> := module:
        using {/Verse.org/SpatialMath}
        using {/Verse.org/SceneGraph}
        using {/Verse.org/Simulation}
        fort_safe_zone_damage_info<epic_internal> := class:
            @editable_number(float) {MinValue := option {0.000000}}
            DamagePerInterval<public>:float = external {}

            @editable
            DamageIsPercentageBased<public>:logic = external {}

            @editable_number(float) {MinValue := option {0.000000}}
            DamageInterval<public>:float = external {}

            @editable_number(float) {MinValue := option {0.000000}}
            DamageIncrementInitialDelay<public>:float = external {}

            @editable_number(float) {MinValue := option {0.000000}}
            DamageIncrementInterval<public>:float = external {}

            @editable_number(float) {MinValue := option {0.000000}}
            DamageIncrementAmount<public>:float = external {}

        fort_safe_zone_component<native><epic_internal> := class<final_super><epic_internal>(component):
            OnBeginSimulation<override>():void = external {}

            OnSimulate<override>()<suspends>:void = external {}

            OnEndSimulation<override>():void = external {}

            UpdateCenterAndRadius<native><public>(EndCenter:(/Verse.org/SpatialMath:)vector3, EndRadius:float, Duration:float)<suspends>:void

            SetRadius<native><public>(InRadius:float):void

            GetRadius<native><public>():float

            SetDamageInfo<public>(InDamageInfo:fort_safe_zone_damage_info):void = external {}

        fort_safe_zone<native><epic_internal> := class<epic_internal>(entity):


        (Agent:agent).MarkInSafeZone<native><epic_internal>(InSafeZone:logic):void

        (Agent:agent).SendOutsideSafeZoneCue<native><epic_internal>():void

    # Module import path: /Fortnite.com/FN1Native/FortStorm
    FortStorm<public> := module:
        using {/Verse.org/Native}
        using {/Fortnite.com/Devices}
        using {/UnrealEngine.com/Temporary/SpatialMath}
        using {/Verse.org/Simulation}
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
        AvatarLargeImage<native>:texture

        AvatarSmallImage<native>:texture

        AvatarBackgroundColor<native>:color

        AvatarHighlightColor<native>:color

        SquadColor<native>:color

    player_ui_display_info_manager<native><epic_internal> := class:
        GetDisplayInfo<native><epic_internal>(InPlayer:player)<reads>:player_ui_display_info

    reload_ui_bridge_component<native><epic_internal> := class<final><final_super>(component):


    # Module import path: /Fortnite.com/FN1Native/BattleRoyaleUtils
    BattleRoyaleUtils<public> := module:
        using {/Verse.org/SceneGraph}
        StoreGamePhaseSetup<native><epic_internal>(WorldContext:entity):void

        StoreGamePhaseWarmup<native><epic_internal>(WorldContext:entity):void

        StoreGamePhaseAircraft<native><epic_internal>(WorldContext:entity):void

        StoreGamePhaseSafeZones<native><epic_internal>(WorldContext:entity):void

        StoreGamePhaseEndGame<native><epic_internal>(WorldContext:entity):void

        ClearGamePhase<native><epic_internal>(WorldContext:entity):void

        StoreWarmupSubState<native><epic_internal>(WorldContext:entity, IsGettingReady:logic):void

        ClearWarmupSubState<native><epic_internal>(WorldContext:entity):void

        StoreAircraftSubState<native><epic_internal>(WorldContext:entity, IsLocked:logic):void

        ClearAircraftSubState<native><epic_internal>(WorldContext:entity):void

        StoreSafeZonesSubStateForming<native><epic_internal>(WorldContext:entity):void

        StoreSafeZonesSubStateHolding<native><epic_internal>(WorldContext:entity):void

        StoreSafeZonesSubStateShrinking<native><epic_internal>(WorldContext:entity):void

        ClearSafeZonesSubState<native><epic_internal>(WorldContext:entity):void

        StoreSafeZonePhaseIndex<native><epic_internal>(WorldContext:entity, SafeZonePhaseIndex:int):void

        ClearSafeZonePhaseIndex<native><epic_internal>(WorldContext:entity):void

    # Module import path: /Fortnite.com/FN1Native/FortPawnUtils
    FortPawnUtils<public> := module:
        using {/Verse.org/Simulation}
        (Agent:agent).SetAgentInvincible<native><epic_internal>(IsInvincible:logic):void

        (Agent:agent).SetAgentCanBuild<native><epic_internal>(CanBuild:logic):void

        (Agent:agent).StopCarryingPlayer<native><epic_internal>():void

    # Module import path: /Fortnite.com/FN1Native/FortPhysicsUtils
    FortPhysicsUtils<public> := module:
        using {/Verse.org/SpatialMath}
        using {/Verse.org/SceneGraph}
        (RigidBody:rigid_body).FindLineTraceHit<native><epic_internal>(TraceStart:(/Verse.org/SpatialMath:)vector3, TraceEnd:(/Verse.org/SpatialMath:)vector3)<transacts><decides>:sweep_hit

        (RigidBody:rigid_body).GetSquaredDistance<native><epic_internal>(Point:(/Verse.org/SpatialMath:)vector3)<transacts><decides>:float

    # Module import path: /Fortnite.com/FN1Native/ReloadUtils
    ReloadUtils<public> := module:
        using {/Verse.org/SceneGraph}
        using {/Verse.org/Simulation}
        NotifyTeamRespawnReward<native><epic_internal>(TeamContext:agent, RewardType:string, RewardTime:float):void

        NotifyEnemyTeamEliminated<native><epic_internal>(InstigatorTeamContext:agent):void

        StoreRespawnsEnabled<native><epic_internal>(WorldContextEntity:entity, EnableRespawns:logic)<transacts><decides>:void

        ClearRespawnsEnabled<native><epic_internal>(WorldContextEntity:entity)<transacts><decides>:void

        StoreRespawnsDisabledAtTime<native><epic_internal>(WorldContextEntity:entity, RespawnsDisabledAtTime:float)<transacts><decides>:void

        ClearRespawnsDisabledAtTime<native><epic_internal>(WorldContextEntity:entity)<transacts><decides>:void

        StoreRespawnDelay<native><epic_internal>(WorldContextEntity:entity, RespawnDelay:float)<transacts><decides>:void

        ClearRespawnDelay<native><epic_internal>(WorldContextEntity:entity)<transacts><decides>:void

        StoreTeamLives<native><epic_internal>(TeamContext:agent, TeamLives:int):void

        ClearAllTeamLives<native><epic_internal>(WorldContextEntity:entity):void

    # Module import path: /Fortnite.com/FN1Native/FortVolume
    FortVolume<public> := module:
        using {/Verse.org/SpatialMath}
        using {/Verse.org/Native}
        @import_as("/Script/FN1NativeRuntime.FVerseFortVolumeActorWrapper")
        fort_volume_actor_wrapper<native><epic_internal> := struct<concrete>:


        (Volume:fort_volume_actor_wrapper).InitializePhysics<native><epic_internal>():void

        (Volume:fort_volume_actor_wrapper).EncompassesPoint<native><epic_internal>(Point:(/Verse.org/SpatialMath:)vector3)<reads><decides>:void

        (Volume:fort_volume_actor_wrapper).GetLineTraceHit<native><epic_internal>(TraceStart:(/Verse.org/SpatialMath:)vector3, TraceEnd:(/Verse.org/SpatialMath:)vector3)<transacts><decides>:(/Verse.org/SpatialMath:)vector3