# Verse path: /Fortnite.com/LootPools
using {/Verse.org/Native}
using {/Verse.org/SceneGraph}
using {/UnrealEngine.com/LootPools}
@available {MinUploadedAtFNVersion := 4310}
@experimental
fort_loot_pool<native><epic_internal> := class<abstract>(loot_pool):
    SelectLoot<override><final>(Context:loot_context)<transacts><decides>:[]entity = external {}

    LootTierGroup<native><epic_internal>:string