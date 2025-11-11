# Module import path: /Fortnite.com/FN1Native
FN1Native<public> := module:
    using {/Verse.org/Simulation}
    using {/Verse.org/Colors}
    using {/Verse.org/Assets}
    # Module import path: /Fortnite.com/FN1Native/FortAircraft
    FortAircraft<public> := module:
        using {/Verse.org/Native}
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

            GetStartTransform<native_callable><public>():(/Verse.org/SpatialMath:)transform = external {}

            GetEndLocation<public>():(/Verse.org/SpatialMath:)vector3 = external {}

            GetDropStartLocation<public>():(/Verse.org/SpatialMath:)vector3 = external {}

            GetDropEndLocation<public>():(/Verse.org/SpatialMath:)vector3 = external {}

        @import_as("/Script/VerseFortnite.UVerseFortniteActorWrapper")
        fort_aircraft_base<native><epic_internal> := class<abstract>:


        fort_aircraft<native><epic_internal> := class<concrete><unique><castable><epic_internal>(fort_aircraft_base):
            Despawn<native><protected>():void

            SetInitialFlightPath<native><protected>(StartLocation:(/Verse.org/SpatialMath:)vector3, StartRotation:(/Verse.org/SpatialMath:)rotation, Speed:float, Duration:float, DropStartDelay:float, DropEndDelay:float):void

            StartFlightPath<native><protected>(FlightStartTime:float):void

            SetFlightTimes<native><protected>(FlightElapsedTime:float, FlightTimestamp:float):void

            SetLocation<native><protected>(Position:(/Verse.org/SpatialMath:)vector3):void

            AddPassengerNative<native><protected>(Agent:agent)<transacts><decides>:void

            RemovePassengerNative<native><protected>(Agent:agent)<transacts><decides>:void

            var FlightInfo<public>:fort_aircraft_flight_info = external {}

            var StartTime<public>:float = external {}

            var EndTime<public>:float = external {}

            var DropStartTime<public>:float = external {}

            var DropEndTime<public>:float = external {}

            var IsInDropZone<public>:logic = external {}

            FlightStartedEvent<public>:subscribable_event_intrnl(fort_aircraft) = external {}

            FlightEndedEvent<public>:subscribable_event_intrnl(fort_aircraft) = external {}

            FlightEnteredDropZoneEvent<public>:subscribable_event_intrnl(fort_aircraft) = external {}

            FlightExitedDropZoneEvent<public>:subscribable_event_intrnl(fort_aircraft) = external {}

            Deinitialize<public>():void = external {}

            GetFlightInfo<native_callable><public>():fort_aircraft_flight_info = external {}

            IsFlying<public>()<decides>:void = external {}

            StartFlight<public>()<suspends>:void = external {}

            GetPassengers<public>()<reads>:[]agent = external {}

            AddPassenger<public>(Passenger:agent)<transacts><decides>:void = external {}

            RemovePassenger<public>(Passenger:agent)<transacts><decides>:void = external {}

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
        using {/Verse.org/SpatialMath}
        using {/Verse.org/SceneGraph}
        using {/Verse.org/Assets}
        environment_query<native><epic_internal> := class<computes><final><epic_internal>(asset):
            AwaitEQSQuery<native><epic_internal>(Owner:entity, Params:[]tuple(string, float))<suspends>:[](/Verse.org/SpatialMath:)vector3

    # Module import path: /Fortnite.com/FN1Native/Matchmaking
    Matchmaking<public> := module:
        # Module import path: /Fortnite.com/FN1Native/Matchmaking/FortSessionAttributesBridge
        FortSessionAttributesBridge<epic_internal> := module:
            using {/Fortnite.com/Playspaces}
            IsRankedMatch<native><epic_internal>(Playspace:fort_playspace)<transacts><decides>:void

            GetMaxSquadSize<native><epic_internal>(Playspace:fort_playspace)<transacts><decides>:int

            GetMaxPlayerCount<native><epic_internal>(Playspace:fort_playspace)<transacts><decides>:int

    # Module import path: /Fortnite.com/FN1Native/FortSafeZone
    (/Fortnite.com/FN1Native:)FortSafeZone<public> := module:
        using {/Fortnite.com/Playspaces}
        using {/UnrealEngine.com/Temporary/SpatialMath}
        using {/Verse.org/Native}
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

        @import_as("/Script/VerseFortnite.UVerseFortniteActorWrapper")
        fort_safe_zone_base<native><epic_internal> := class<abstract>:


        fort_safe_zone<native><epic_internal> := class<epic_internal>(fort_safe_zone_base):
            Despawn<native><protected>():void

            SetCenterAndRadius<native><public>(InCenter:vector2, InRadius:float):void

            UpdateCenterAndRadius<native><public>(EndCenter:vector2, EndRadius:float, Duration:float)<suspends>:void

            GetCenter<native><public>():vector2

            GetRadius<native><public>():float

            var PlayspaceInstance<public>:?fort_playspace = external {}

            Initialize<public>(Playspace:fort_playspace):void = external {}

            Deinitialize<public>()<suspends>:void = external {}

            SetDamageInfo<public>(InDamageInfo:fort_safe_zone_damage_info):void = external {}

            UpdateAgents<public>()<suspends>:void = external {}

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