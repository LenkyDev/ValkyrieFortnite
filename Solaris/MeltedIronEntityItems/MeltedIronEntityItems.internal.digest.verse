# Verse path: /Fortnite.com
# Module import path: /Fortnite.com/Items
Items<public> := module:
    # Module import path: /Fortnite.com/Items/TMNT
    (/Fortnite.com/Items:)TMNT<public> := module:
        using {/Verse.org/SceneGraph}
        using {/Verse.org/Native}
        using {/UnrealEngine.com/Itemization}
        using {/Fortnite.com/Itemization}
        @preload
        TMNTPizzaParty_V1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

# Module import path: /Fortnite.com/Weapons
Weapons<public> := module:
    # Module import path: /Fortnite.com/Weapons/TMNT
    (/Fortnite.com/Weapons:)TMNT<public> := module:
        using {/Verse.org/SceneGraph}
        using {/Verse.org/Native}
        using {/UnrealEngine.com/Itemization}
        using {/Fortnite.com/Itemization}
        @preload
        DonatellosStaff_V1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        LeonardosKatanas_V1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        MichelangelosNunchaku_V1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        RaphaelsSai_V1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}