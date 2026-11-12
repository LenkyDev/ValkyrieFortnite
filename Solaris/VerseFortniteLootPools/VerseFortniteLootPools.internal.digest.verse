# Verse path: /Fortnite.com/LootPools
using {/Verse.org/Native}
@available {MinUploadedAtFNVersion := 4310}
@experimental
# Rolls the loot of a regular Fortnite chest.
fort_loot_pool_chest<public> := class<concrete><final>(fort_loot_pool):
    LootTierGroup<override>:string = external {}

@available {MinUploadedAtFNVersion := 4310}
@experimental
# Rolls the loot of a rare Fortnite chest, the upgraded version a regular chest can spawn as.
fort_loot_pool_chest_rare<public> := class<concrete><final>(fort_loot_pool):
    LootTierGroup<override>:string = external {}

@available {MinUploadedAtFNVersion := 4310}
@experimental
# Rolls the loot of a Fortnite ammo box.
fort_loot_pool_ammo_box<public> := class<concrete><final>(fort_loot_pool):
    LootTierGroup<override>:string = external {}

@available {MinUploadedAtFNVersion := 4310}
@experimental
# Rolls the loot of a rare Fortnite ammo box, the upgraded version an ammo box can spawn as.
fort_loot_pool_ammo_box_rare<public> := class<concrete><final>(fort_loot_pool):
    LootTierGroup<override>:string = external {}

@available {MinUploadedAtFNVersion := 4310}
@experimental
# Rolls the loot of a Fortnite supply drop.
fort_loot_pool_supply_drop<public> := class<concrete><final>(fort_loot_pool):
    LootTierGroup<override>:string = external {}

@available {MinUploadedAtFNVersion := 4310}
@experimental
# Rolls the loot of a Fortnite food box.
fort_loot_pool_food_box<public> := class<concrete><final>(fort_loot_pool):
    LootTierGroup<override>:string = external {}