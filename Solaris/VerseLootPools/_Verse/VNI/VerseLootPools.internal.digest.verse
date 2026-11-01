# Verse path: /UnrealEngine.com/LootPools
using {/Verse.org/Simulation}
using {/Verse.org/Native}
using {/Verse.org/SceneGraph}
@available {MinUploadedAtFNVersion := 4310}
@experimental
# Data passed to a `loot_pool` when loot is requested.
loot_context<epic_internal> := class:
    # The entity that loot is being selected for.
    Instigator<epic_internal>:?entity = external {}

    # The `lootable_component` that initiated this call to `SelectLoot`.
    Owner<epic_internal>:?lootable_component = external {}

@available {MinUploadedAtFNVersion := 4310}
@experimental
# A component for entities that can return loot on request.
lootable_component<epic_internal> := class<final_super><abstract>(component):
    # Returns loot entities, as determined by `Instigator`.
    SelectLoot<epic_internal>(Instigator:?entity)<transacts><decides>:[]entity

@available {MinUploadedAtFNVersion := 4310}
@experimental
# Base class of all loot-generating classes.
loot_pool<epic_internal> := class<abstract>:
    # Returns the entities to be granted as loot, as determined by `Context`.
    SelectLoot<epic_internal>(Context:loot_context)<transacts><decides>:[]entity

@available {MinUploadedAtFNVersion := 4310}
@experimental
# A `lootable_component` that contains loot pools and a selection mechanism that calls into each of them once.
basic_lootable_component<epic_internal> := class(lootable_component):
    @editable
    # The loot pools that are queried for loot on each call to `SelectLoot`.
    SourceLootPools<epic_internal>:[]loot_pool

    # Calls `SelectLoot` on each element of `SourceLootPools` and returns an array combining all of the results.
    SelectLoot<override>(Instigator:?entity)<transacts><decides>:[]entity = external {}