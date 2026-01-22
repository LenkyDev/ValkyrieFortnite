using {/Verse.org/Simulation}
using {/UnrealEngine.com/Temporary/SpatialMath}
using {/Verse.org/SpatialMath}
using {/Fortnite.com/AI}
# Pimlico NPC Component
pimlico_npc_component<native><final><epic_internal> := class<final_super>(fort_npc_component):
    # Temp for testing if the component works in UEFN, TODO Remove once confirmed
    DebugTestInterop<native><epic_internal>(TestValue:int):void

    TryJumpStart<native><epic_internal>():void

    JumpStop<native><epic_internal>():void

    TryTackleStart<native><epic_internal>():void

    TackleStop<native><epic_internal>():void

    TryShootStart<native><epic_internal>():void

    ShootStop<native><epic_internal>():void

    SetShootTargetWorldPosition<native><epic_internal>(Target:(/Verse.org/SpatialMath:)vector3):void

    SetShootTargetWorldPosition<epic_internal>(Target:(/UnrealEngine.com/Temporary/SpatialMath:)vector3):void = external {}

    TryPassStart<native><epic_internal>():void

    PassStop<native><epic_internal>():void

    SetBotPassTargetBean<native><epic_internal>(Agent:agent):void

    TryCatchStart<native><epic_internal>():void

    CatchStop<native><epic_internal>():void

    TryDunkStart<native><epic_internal>():void

    DunkStop<native><epic_internal>():void