# Verse path: /Fortnite.com
# Module import path: /Fortnite.com/Weapons
Weapons<public> := module:
    # Module import path: /Fortnite.com/Weapons/TheWalkingDead
    TheWalkingDead<public> := module:
        using {/Verse.org/Presentation}
        using {/Verse.org/SceneGraph}
        using {/Verse.org/Native}
        using {/UnrealEngine.com/Itemization}
        using {/Fortnite.com/Itemization}
        @preload
        Lucille_V1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

            @available {MinUploadedAtFNVersion := 4210}
            DescriptionComponent<override>:?description_component = external {}

        @preload
        ShivaShotgun_V1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

            @available {MinUploadedAtFNVersion := 4210}
            DescriptionComponent<override>:?description_component = external {}