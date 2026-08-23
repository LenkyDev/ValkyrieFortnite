# Verse path: /Fortnite.com
# Module import path: /Fortnite.com/QuestUtilities
QuestUtilities<public> := module:
    using {/Verse.org/Simulation/Tags}
    using {/Verse.org/Simulation}
    BroadcastCustomVerb<native><epic_internal>(Author:agent, CustomVerbNameTag:tag, Amount:int):void

    BroadcastCustomVerb<native><epic_internal>(Author:agent, CustomVerbTagString:string, Amount:int):void