# Verse path: /Fortnite.com
# Module import path: /Fortnite.com/Items
Items<public> := module:
    # Module import path: /Fortnite.com/Items/KPopDemonHunters
    (/Fortnite.com/Items:)KPopDemonHunters<public> := module:
        using {/Verse.org/SceneGraph}
        using {/Verse.org/Native}
        using {/UnrealEngine.com/Itemization}
        using {/Fortnite.com/Itemization}
        @preload
        MirasXTraSpicyRamyeon_V1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            StackableComponent<override>:?basic_stackable_component = external {}

        @preload
        TigersTeleportingMask_V1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        ZoeysBubbleShield_V1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            StackableComponent<override>:?basic_stackable_component = external {}

# Module import path: /Fortnite.com/Weapons
Weapons<public> := module:
    # Module import path: /Fortnite.com/Weapons/KPopDemonHunters
    (/Fortnite.com/Weapons:)KPopDemonHunters<public> := module:
        using {/Verse.org/SceneGraph}
        using {/Verse.org/Native}
        using {/UnrealEngine.com/Itemization}
        using {/Fortnite.com/Itemization}
        @preload
        RumisEmpoweredSword_V1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}