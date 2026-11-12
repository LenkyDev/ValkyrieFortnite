# Verse path: /UnrealEngine.com/LootPools
using {/Verse.org/Simulation}
using {/Verse.org/Native}
using {/Verse.org/SceneGraph}
@available {MinUploadedAtFNVersion := 4310}
@experimental
# Data passed to a `loot_pool` when loot is requested.
loot_context<public> := class:
    # The entity that loot is being selected for.
    Instigator<public>:?entity = external {}

    # The `lootable_component` that initiated this call to `SelectLoot`.
    Owner<public>:?lootable_component = external {}

@available {MinUploadedAtFNVersion := 4310}
@experimental
# A component for entities that can return loot on request.
lootable_component<public> := class<final_super><abstract>(component):
    # Returns loot entities, as determined by `Instigator`.
    # Fails if a loot selection cannot be made.
    SelectLoot<public>(Instigator:?entity)<transacts><decides>:[]entity

@available {MinUploadedAtFNVersion := 4310}
@experimental
# Base class of all loot-generating classes.
loot_pool<native><public> := class<abstract>:
    # Returns the entities to be granted as loot, as determined by `Context`.
    # Fails if a loot selection cannot be made.
    SelectLoot<public>(Context:loot_context)<transacts><decides>:[]entity

@available {MinUploadedAtFNVersion := 4310}
@experimental
# A `lootable_component` that contains loot pools and a selection mechanism that calls into each of them once.
basic_lootable_component<public> := class(lootable_component):
    @editable
    # The loot pools that are queried for loot on each call to `SelectLoot`.
    SourceLootPools<public>:[]loot_pool

    # Calls `SelectLoot` on each element of `SourceLootPools` and returns an array combining all of the results.
    SelectLoot<override>(Instigator:?entity)<transacts><decides>:[]entity = external {}

@available {MinUploadedAtFNVersion := 4310}
@experimental
# Calculates the selection weight of a `weighted_loot_entry`.
# Override `GetWeight` in a subclass to vary an entry's weight based on the `loot_context`.
loot_weight_calculator<public> := class<abstract>:
    # Returns the selection weight of the owning entry for `Context`, evaluated once per call to SelectLoot.
    # Entries with a weight of `0.0` or less are never selected.
    # An eligible entry with a weight of `Inf` is always selected. If several entries have a weight of `Inf`, the first one in `Options` is selected.
    GetWeight<public>(Context:loot_context)<transacts>:float

@available {MinUploadedAtFNVersion := 4310}
@experimental
# A `loot_weight_calculator` that returns the same weight for every `loot_context`.
loot_weight_calculator_fixed<public> := class<final>(loot_weight_calculator):
    @editable_number(float) {MinValue := option {0.000000}}
    # The weight returned by `GetWeight`.
    Weight<public>:type{_X:float where 0.000000 <= _X, _X <= Inf} = external {}

    # Returns `Weight`, ignoring `Context`.
    GetWeight<override><final>(Context:loot_context)<transacts>:float = external {}

@available {MinUploadedAtFNVersion := 4310}
@experimental
# Calculates how many selections a `weighted_loot_pool` makes in a single call to `SelectLoot`.
# Override `GetRollCount` in a subclass to vary the number of selections based on the `loot_context`.
loot_roll_calculator<public> := class<abstract>:
    # Returns the number of selections to make for `Context`.
    # A value of `0` or less results in no selections.
    GetRollCount<public>(Context:loot_context)<transacts>:int

@available {MinUploadedAtFNVersion := 4310}
@experimental
# A `loot_roll_calculator` that returns the same number of selections for every `loot_context`.
loot_roll_calculator_fixed<public> := class<final>(loot_roll_calculator):
    @editable_number(int) {MinValue := option {0}}
    # The number of selections returned by `GetRollCount`.
    Rolls<public>:type{_X:int where 0 <= _X} = external {}

    # Returns `Rolls`, ignoring `Context`.
    GetRollCount<override><final>(Context:loot_context)<transacts>:int = external {}

@available {MinUploadedAtFNVersion := 4310}
@experimental
# A single option in a `weighted_loot_pool`.
# Holds a selection weight and an optional limit on how many times the entry can be selected in a single call to `SelectLoot`.
# Concrete subclasses define the loot that is returned when the entry is selected.
weighted_loot_entry<public> := class<abstract>:
    @editable
    # Calculates how likely this entry is to be selected, relative to the other entries in the pool.
    # A higher weight makes this entry more likely to be selected. Defaults to a fixed weight of `1.0`.
    WeightCalculator<public>:loot_weight_calculator = external {}

    @editable_number(int) {MinValue := option {0}}
    # The maximum number of times this entry can be selected in a single call to the owning pool's `SelectLoot`.
    # A value of `false` is unlimited. A value of `0` means this entry is never selected.
    MaxSelectionCount<public>:?type{_X:int where 0 <= _X} = external {}

    # Selects this entry and returns its loot, counting the selection against `MaxSelectionCount`.
    # Fails if this entry has no selections remaining. `GetEntryValue` failing returns an empty array.
    SelectAndDecrementCount<final><public>(Context:loot_context)<transacts><decides>:[]entity = external {}

    # Instantiates and returns a set of entities when this entry is selected. Override per new entry type.
    # Fails if no loot can be produced.
    GetEntryValue<protected>(Context:loot_context)<transacts><decides>:[]entity

@available {MinUploadedAtFNVersion := 4310}
@experimental
# A `weighted_loot_entry` that returns a new instance of `EntityType` when selected.
weighted_loot_entry_item<public> := class<concrete>(weighted_loot_entry):
    @editable
    # The type of `entity` to instantiate when this entry is selected.
    EntityType<public>:castable_concrete_subtype(entity) = external {}

    # Returns an array containing one new instance of `EntityType`, constructed with default values.
    GetEntryValue<override>(Context:loot_context)<transacts><decides>:[]entity = external {}

@available {MinUploadedAtFNVersion := 4310}
@experimental
# A `weighted_loot_entry` that returns the loot selected from a nested `loot_pool`.
weighted_loot_entry_pool<public> := class<concrete>(weighted_loot_entry):
    @editable
    # The nested `loot_pool` to select from when this entry is selected. Defaults to an empty `weighted_loot_pool`.
    Pool<public>:loot_pool = external {}

    # Returns the result of `Pool.SelectLoot`.
    # Fails if `Pool.SelectLoot` fails.
    GetEntryValue<override>(Context:loot_context)<transacts><decides>:[]entity = external {}

@available {MinUploadedAtFNVersion := 4310}
@experimental
# A `loot_pool` that makes weighted random selections from `Options`.
# Entries with higher weights are selected more often. `RollCalculator` determines how many independent selections are made in a single call to `SelectLoot`.
weighted_loot_pool<public> := class<concrete>(loot_pool):
    @editable
    # Determines how many independent selections are made from `Options` in a single call to `SelectLoot`. Defaults to a fixed count of `1`.
    RollCalculator<public>:loot_roll_calculator = external {}

    @editable
    # The entries that can be selected, each with its own weight and optional selection limit.
    Options<public>:[]weighted_loot_entry = external {}

    # Makes weighted random samples from `Options` and returns the combined loot.
    # Stops early if no entry has both a positive weight and selections remaining. A selected entry whose `GetEntryValue` fails adds no loot but still uses up a selection.
    # To change how entries are weighted, use a custom `loot_weight_calculator`.
    # Fails if `Options` is empty.
    SelectLoot<override><final>(Context:loot_context)<transacts><decides>:[]entity = external {}