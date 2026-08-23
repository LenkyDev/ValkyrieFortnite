# Verse path: /Fortnite.com
# Module import path: /Fortnite.com/Items
Items<public> := module:
    # Module import path: /Fortnite.com/Items/LEGO
    (/Fortnite.com/Items:)LEGO<public> := module:
        using {/Verse.org/SceneGraph}
        using {/Verse.org/Native}
        using {/UnrealEngine.com/Itemization}
        using {/Fortnite.com/Itemization}
        @preload
        Apple_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            StackableComponent<override>:?basic_stackable_component = external {}

        @preload
        Banana_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            StackableComponent<override>:?basic_stackable_component = external {}

        @preload
        ChronosteelShard_V1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            StackableComponent<override>:?basic_stackable_component = external {}

        @preload
        Coconut_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            StackableComponent<override>:?basic_stackable_component = external {}

        @preload
        Corn_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            StackableComponent<override>:?basic_stackable_component = external {}

        @preload
        Diamond_V1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            StackableComponent<override>:?basic_stackable_component = external {}

        @preload
        GoldStud_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            StackableComponent<override>:?basic_stackable_component = external {}

        @preload
        HealEgg_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            StackableComponent<override>:?basic_stackable_component = external {}

        @preload
        ImpulseGrenade_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            StackableComponent<override>:?basic_stackable_component = external {}

        @preload
        LegacySlurpJuice_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            StackableComponent<override>:?basic_stackable_component = external {}

        @preload
        Meat_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            StackableComponent<override>:?basic_stackable_component = external {}

        @preload
        MechanicalParts_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            StackableComponent<override>:?basic_stackable_component = external {}

        @preload
        MonsterShard_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            StackableComponent<override>:?basic_stackable_component = external {}

        @preload
        PatchworkTool_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        Pizza_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            StackableComponent<override>:?basic_stackable_component = external {}

        @preload
        Pumpkin_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            StackableComponent<override>:?basic_stackable_component = external {}

        @preload
        RedMushroom_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            StackableComponent<override>:?basic_stackable_component = external {}

        @preload
        ShockwaveGrenade_V1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            StackableComponent<override>:?basic_stackable_component = external {}

        @preload
        SlapBerry_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            StackableComponent<override>:?basic_stackable_component = external {}

        @preload
        SlapJuice_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            StackableComponent<override>:?basic_stackable_component = external {}

        @preload
        SpinjitzuScroll_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        VampireTooth_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
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
    # Module import path: /Fortnite.com/Weapons/LEGO
    (/Fortnite.com/Weapons:)LEGO<public> := module:
        using {/Verse.org/SceneGraph}
        using {/Verse.org/Native}
        using {/UnrealEngine.com/Itemization}
        using {/Fortnite.com/Itemization}
        @preload
        AmmoCrossbowAmmo_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            StackableComponent<override>:?basic_stackable_component = external {}

        @preload
        AmmoEnergyAmmo_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            StackableComponent<override>:?basic_stackable_component = external {}

        @preload
        AmmoHeavyAmmo_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            StackableComponent<override>:?basic_stackable_component = external {}

        @preload
        AmmoLauncherAmmo_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            StackableComponent<override>:?basic_stackable_component = external {}

        @preload
        AmmoLightAmmo_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            StackableComponent<override>:?basic_stackable_component = external {}

        @preload
        AmmoMediumAmmo_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            StackableComponent<override>:?basic_stackable_component = external {}

        @preload
        AmmoShellAmmo_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            StackableComponent<override>:?basic_stackable_component = external {}

        @preload
        BurstPulseRifle_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        BurstPulseRifle_V1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        BurstPulseRifle_V1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        BurstPulseRifle_V1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        BurstPulseRifle_V1_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        Crossbow_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        Crossbow_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        Crossbow_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        Crossbow_V1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        Crossbow_V1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        CXBurstLaserMk1_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        CXBurstLaserMk2_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        CXBurstLaserMk3_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        CXBurstLaserMk4_V1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        CXPulseLaserMk1_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        CXPulseLaserMk2_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        CXPulseLaserMk3_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        CXPulseLaserMk4_V1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        CXPulseLaserMk5_V1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        DoubleSaucer_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        DoubleSaucer_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        DoubleSaucer_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        DoubleSaucer_V1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        ExplosiveGooGun_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        GoodOlTrusty_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        GoodOlTrusty_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        GoodOlTrusty_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        Grappler_V1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        HandAxe_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        HandAxe_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        HandAxe_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        HandAxe_V1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        HandAxe_V1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        Katana_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        Katana_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        Katana_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        Katana_V1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        Katana_V1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        KineticBlade_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        KineticBlade_V1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        KineticBlade_V1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        KymeraRayGun_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        KymeraRayGun_V1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        KymeraRayGun_V1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        KymeraRayGun_V1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        Nunchucks_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        Nunchucks_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        Nunchucks_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        Nunchucks_V1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        Nunchucks_V1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        OverclockedCXBurstLaser_V1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        OverclockedCXPulseLaser_V1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        PropOMatic_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        PrototypePulseRifleX2_V1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        PulseRifleX2Mk1_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        PulseRifleX2Mk2_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        PulseRifleX2Mk3_V1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        RoyalStingBlaster_V1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        RoyalStingBlaster_V1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        Scythe_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        Scythe_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        Scythe_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        Scythe_V1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        Scythe_V1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        Shurikens_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        Shurikens_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        Shurikens_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        Shurikens_V1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        Shurikens_V1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        SnowballLauncher_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        SnowballLauncher_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        SnowballLauncher_V1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        SnowballLauncher_V1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        StingBlaster_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        StingBlaster_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        StingBlaster_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        SuperSaucer_V1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        SuperSaucer_V1_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        Sword_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        Sword_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        Sword_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        Sword_V1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}

        @preload
        Sword_V1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            IconComponent<override>:?icon_component = external {}

            @available {MinUploadedAtFNVersion := 4020}
            RarityComponent<override>:?rarity_component = external {}