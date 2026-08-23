# Verse path: /Fortnite.com
# Module import path: /Fortnite.com/Items
Items<public> := module:
    # Module import path: /Fortnite.com/Items/SquidGame
    SquidGame<public> := module:
        using {/Verse.org/SceneGraph}
        using {/Verse.org/Native}
        using {/UnrealEngine.com/Itemization}
        using {/Fortnite.com/Itemization}
        @preload
        DdakjiBlue_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            StackableComponent<override>:?basic_stackable_component = external {}

        @preload
        DdakjiRed_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            StackableComponent<override>:?basic_stackable_component = external {}

        @preload
        DisguiseFrontMan_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        DisguiseGamesGuardManager_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        DisguiseGamesGuardSoldier_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        DisguiseGamesGuardWorker_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        DisguiseGamesManager_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        DisguiseGamesPlayer_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        FlyingStone_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            StackableComponent<override>:?basic_stackable_component = external {}

        @preload
        Invitation_V1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}