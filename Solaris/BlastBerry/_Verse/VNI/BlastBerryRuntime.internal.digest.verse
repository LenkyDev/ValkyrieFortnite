# Verse path: /Fortnite.com
# Module import path: /Fortnite.com/Blastberry
Blastberry<public> := module:
    # Module import path: /Fortnite.com/Blastberry/Respawn
    Respawn<public> := module:
        using {/Fortnite.com/Playspaces}
        using {/Verse.org/Native}
        using {/UnrealEngine.com/Temporary/SpatialMath}
        using {/Verse.org/Simulation}
        using {/Fortnite.com/FortSafeZone}
        team_translation_group<epic_internal> := class:
            SafeZone<epic_internal>:fort_storm_safe_zone

            var Agents<public>:[]agent = external {}

            var CachedGroupWeight<public>:?int = external {}

            InRangeOfGroup<public>(InAgent:agent, RangeSq:float)<transacts>:logic = external {}

            GetAverageTranslation<public>()<transacts><decides>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

            InSafeZone<public>(SafeZoneCenter:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, SafeZoneRadius:float)<transacts>:logic = external {}

            GetGroupWeight<public>()<transacts>:int = external {}

            ResetCachedData<public>()<transacts>:void = external {}

        respawn_information<native><public> := struct<epic_internal>:
            SpawnLocation<public>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3

            DeathLocation<public>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3

        @import_as("/Script/BlastBerryRuntime.UBlastBerryVerseRespawnLogic")
        blastberry_respawn_logic_base<native><epic_internal> := class<abstract>:


        blastberry_respawn_logic<native><epic_internal> := class<concrete><epic_internal>(blastberry_respawn_logic_base):
            Initialize<native_callable><epic_internal>(InPlayspace:fort_playspace):void = external {}

            PlayerRespawned<native_callable><epic_internal>(RespawnedAgent:agent):void = external {}

            EQSQueryCompleted<native_callable><epic_internal>(ResultAgent:agent, ResultLoc:(/UnrealEngine.com/Temporary/SpatialMath:)vector3):(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

            RunSoloEQSQuery<native><epic_internal>(RespawningAgent:agent, SpawnLocation:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, SafeZoneRadius:float, SafeZoneCenter:(/UnrealEngine.com/Temporary/SpatialMath:)vector3):void

            CalculateRespawnLocation<native_callable><epic_internal>(RespawningAgent:agent, WholeTeamDead:logic, DebugRandRange:float, DebugRandAngle:float):(/UnrealEngine.com/Temporary/SpatialMath:)transform = external {}

        (InAgent:agent).GetTimeRemainingForRespawn<native><epic_internal>()<transacts><decides>:float

        (InAgent:agent).GetDeathLocation<native><epic_internal>()<transacts><decides>:(/UnrealEngine.com/Temporary/SpatialMath:)transform