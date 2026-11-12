# Verse path: /UnrealEngine.com/Characters/Cosmetics
using {/Verse.org/SceneGraph}
using {/Verse.org/Assets}
using {/Verse.org/Native}
@available {MinUploadedAtFNVersion := 4300}
@experimental
# A slot in a cosmetic loadout. Categories are unique, named, module-level instances compared by identity.
cosmetic_category<native><public> := class<unique><final><allocates><epic_internal>:


@experimental
cosmetic<native><public> := class<abstract><unique><epic_internal>(asset):
    # Display name, read from the backing uasset.
    GetName<native><public>()<reads>:message

    # Full description, read from the backing uasset.
    GetDescription<native><public>()<reads>:message

    # Short description, read from the backing uasset.
    GetShortDescription<native><public>()<reads>:message

    # Icon, if the backing uasset has one.
    GetIcon<native><public>()<reads>:?texture

@available {MinUploadedAtFNVersion := 4300}
@experimental
# Lives on the base character entity
cosmetic_loadout_component<public> := class<final_super><epic_internal>(component):
    var<private> CosmeticLoadout<public>:[cosmetic_category]cosmetic = external {}

    # Put NewCosmetic in Category, replacing whatever occupied it.
    SetCosmetic<final><public>(Category:cosmetic_category, NewCosmetic:cosmetic):void = external {}

    # Applies the authored loadout through the same path a runtime change takes.
    OnAddedToScene<override>():void = external {}