# Module import path: /Fortnite.com/Items
Items<public> := module:
    using {/Verse.org/SceneGraph}
    using {/Verse.org/Native}
    using {/UnrealEngine.com/Itemization}
    using {/Fortnite.com/Itemization}
    @preload
    Acorn_Creative_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    ActivePowercell_Creative_V1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    AdhesiveResin_Creative_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    AirStrike_BR_CH1S9_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    AlienNanites_BR_CH2S7_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    AmmoArrows_BR_CH2S6_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    AmmoHeavyBullets_BR_PreSeason_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    AmmoLightBullets_BR_PreSeason_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    AmmoMediumBullets_BR_PreSeason_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    AmmoRockets_BR_PreSeason_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    AmmoShells_BR_PreSeason_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    AnimalBones_BR_CH2S6_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    Apple_BR_CH1S4_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    ArmoredWall_BR_CH2S8_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    AuthorityKeycard_BR_CH2S3_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Bacon_Creative_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    Balloons_BR_CH1S6_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    Banana_BR_CH1S8_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    BananaOfTheGods_BR_CH5S2_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    Bandage_BR_PreSeason_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    Bandage_BR_CH5S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    BandageBazooka_BR_CH2S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Batteries_Creative_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    BigBushBomb_BR_CH4S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    BirthdayPresents_BR_CH1S9_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    BlastPowder_Creative_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    BlizzardGrenade_BR_CH6S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    BoarHair_Creative_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    BoogieBomb_BR_CH1S2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    BoomBox_BR_CH1S7_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    BottleRockets_BR_CH1S7_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    Bouncer_BR_CH1S4_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    BrickABunker_BR_CH7S2_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    BubbleShield_Ballistic_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    Bush_BR_CH1S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    BusinessTurret_BR_CH4S4_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    Butter_Creative_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    Cabbage_BR_CH2S3_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    CandyCorn_BR_CH2S4_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    CattyCornerKeycard_BR_CH2S3_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    CeilingZapper_OG_CH1S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @deprecated
    @preload
    # Deprecated. Please use CeilingZapper_OG_CH1S1_Rare instead.
    CeilingZapper_BR_CH4MS1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @deprecated
    @preload
    # Deprecated. Please use CeilingZapper_OG_CH1S1_Rare instead.
    CeilingZapper_BR_CH1S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    ChiliChugSplash_BR_CH2S8_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    Chiller_BR_CH1S6_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    ChillerGrenade_BR_CH1S7_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    ChugCannon_BR_CH2S5_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ChugJug_BR_CH1S2_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    OceansBottomlessChugJug_BR_CH2S3_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ChugJug_BR_CH6S2_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ChugSplash_BR_CH1S9_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    Clinger_BR_CH1S3_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    CloakGauntlets_BR_CH4S3_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    WildguardReliksCloakGauntlets_BR_CH4S3_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ClusterClinger_BR_CH5S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    Coconut_BR_CH1S8_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    CommandCavernKeycard_BR_CH3S2_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Corn_BR_CH2S3_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    CozyCampfire_BR_CH1S2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    CrashPad_BR_CH2S2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    CrashPadJr_BR_CH4S4_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    CreepinCardboard_BR_CH2S2_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    QuartzCrystal_Creative_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    RainbowCrystal_Creative_V1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    ShadowshardCrystal_Creative_V1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    SunbeamCrystal_Creative_V1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    CuddleFish_BR_CH2S6_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    Currency_Ballistic_V1_Common<epic_internal> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    DamageTrap_BR_CH1S2_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    Decoy_BR_CH2S2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    DialADrop_BR_CH3S4_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Diamond_Creative_V1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    WhiteDinoEgg_Creative_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    BrownDinoEgg_Creative_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    GreenDinoEgg_Creative_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    WhiteSpeckledDinoEgg_Creative_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    BrownSpeckledDinoEgg_Creative_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    BlueSpeckledDinoEgg_Creative_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    WhiteMarbledDinoEgg_Creative_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    PinkMarbledDinoEgg_Creative_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    GreenMarbledDinoEgg_Creative_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    BlueFleckedDinoEgg_Creative_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    RedFleckedDinoEgg_Creative_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    GreenFleckedDinoEgg_Creative_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    WhiteShimmeringDinoEgg_Creative_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    BlueShimmeringDinoEgg_Creative_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    RedShimmeringDinoEgg_Creative_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    GrayEruptionDinoEgg_Creative_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    RedEruptionDinoEgg_Creative_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    YellowEruptionDinoEgg_Creative_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    DuctTape_Creative_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    Dynamite_BR_CH1S6_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    EnhancedHarpoonGun_BR_CH7S2_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    EstateVaultKeycard_BR_CH4S4_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ExoticSlapBerryFizz_BR_CH6S4_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    FalconScout_BR_CH4S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    FibrousHerbs_Creative_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    FireflyJar_BR_CH2S3_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    FireGrenade_Ballistic_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    FireTrap_BR_CH2S4_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    CreativeFishingRod_Creative_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    CreativeProFishingRod_Creative_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Flag_Creative_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Flashbang_Ballistic_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    Flashlight_Creative_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Flopper_BR_CH2S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    FlowBerry_BR_CH5S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    FlowBerryFizz_BR_CH5S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    FlowBerryMistGrenade_BR_CH7S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    FlowerPetals_Creative_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    FortillaKeycard_BR_CH2S3_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    FragGrenade_Ballistic_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    FriendZoneBubble_BR_CH7S3_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    FrozenIcecreamCone_BR_CH3S3_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    GasCan_BR_CH2S3_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Gliders_BR_CH1S7_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Gold_BR_CH2S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    GoldSplash_BR_CH6S2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    GrappleGlider_BR_CH3S4_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    GrappleGlove_BR_CH3S3_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Grappler_BR_CH1S5_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Grenade_BR_PreSeason_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    Grenade_BR_CH7S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    Grenade_OG_CH1S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @deprecated
    @preload
    # Deprecated. Please use Grenade_OG_CH1S1_Common instead.
    Grenade_BR_CH4MS1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    GrottoKeycard_BR_CH2S2_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Grub_Creative_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    GuardianShield_BR_CH4S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    GuzzleJuice_BR_CH3S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    GuzzlingIcecreamCone_BR_CH3S3_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    HarpoonGun_BR_CH2S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HealEgg_BR_CH4S2_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    Herb_Creative_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    HolidayPresents_BR_CH2S5_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    Honey_Creative_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    HopDrop_BR_CH2S4_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    HopEgg_BR_CH4S2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    HopFlopper_BR_CH2S4_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    IcecreamCone_BR_CH3S3_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    IcyGrappler_BR_CH2S8_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ImpulseGrenade_BR_CH1S2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    ImpulseGrenade_Ballistic_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    InflateABull_BR_CH2S7_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    InstantLargeShield_Ballistic_V1_Exotic<epic_internal> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    InstantShield_Ballistic_V1_Exotic<epic_internal> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    JellyBean_BR_CH2S4_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    Jellyfish_BR_CH2S4_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    Jetpack_BR_CH1S4_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Jewel_Creative_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    JulesGliderGun_BR_CH2S3_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    JunkRift_BR_CH1SX_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    Key_BR_CH3S4_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    LaunchPad_BR_CH3S4_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    SuperLaunchPad_Creative_V1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    LawlessRiftLauncher_BR_CH6S2_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    LawlessSlapCannon_BR_CH6S2_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    LawlessSlapJug_BR_CH6S2_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    LemonLime_Creative_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    LilWhipsSpecialServe_BR_CH3S3_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    LimitlessSevenSliders_BR_CH7S3_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    LumpOfCoal_BR_CH2S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    MapleSyrup_Creative_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    Meat_BR_CH2S6_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    MechanicalParts_BR_CH2S6_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    RustyMechanicalParts_Creative_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    SimpleMechanicalParts_Creative_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    SturdyMechanicalParts_Creative_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    SleekMechanicalParts_Creative_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    EfficientMechanicalParts_Creative_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    VindertechMechanicalParts_Creative_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    MedMist_BR_CH3S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MedMistSmokeGrenade_BR_CH6S2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    MedMistSmokeGrenade_Ballistic_V1_Common<epic_internal> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    MedKit_BR_PreSeason_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    MedKit_BR_CH5S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    Metal_BR_PreSeason_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    MidasFlopper_BR_CH2S4_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    Milk_Creative_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    RoughMineralPowder_Creative_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    SimpleMineralPowder_Creative_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    FineGrainMineralPowder_Creative_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    CharBlackMineralPowder_Creative_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    OxidizedMineralPowder_Creative_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    MonsterParts_BR_CH2S8_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    BlueMushroom_Creative_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    PinkMushroom_Creative_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    RedMushroom_Creative_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    WhiteMushroom_Creative_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    YellowMushroom_Creative_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    MystForm_BR_CH6S3_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MythicGoldfish_BR_CH2S1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    NitroSplash_BR_CH5S3_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    OrangePaintGrenade_BR_CH2S2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    RoughOre_Creative_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    Coal_Creative_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    BrightcoreOre_Creative_V1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    CopperOre_Creative_V1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    MalachiteOre_Creative_V1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    ObsidianOre_Creative_V1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    SilverOre_Creative_V1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    SpectroliteOre_Creative_V1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    Overdrive_Ballistic_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    OverdriveGrenade_BR_CH7S2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    PatchworkTool_Creative_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Pepper_BR_CH1S8_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    PepperMint_BR_CH2S4_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    PizzaParty_BR_CH3S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PizzaSlice_BR_CH3S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    Planks_Creative_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    PoisonDartTrap_BR_CH1S8_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    PortABunker_BR_CH3S4_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    PortACover_BR_CH6S2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    PortAFort_BR_CH1S3_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    PortAFortress_BR_CH1S5_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PrecisionAirStrike_BR_CH6S4_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Presents_BR_CH1S7_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    PropOMatic_Creative_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ProximityMine_BR_CH2S2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    ProximityMine_Ballistic_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    PulseScanner_BR_CH6S2_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    Pumpkin_Creative_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    PurplePaintGrenade_BR_CH2S2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    RaptorEye_Creative_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    ReconGrenade_Ballistic_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    RemoteExplosives_BR_CH1S3_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    RepairTorch_BR_CH3S2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    RiftToGo_BR_CH1S5_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    RiftFish_BR_CH2S5_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    RiftPointDevice_Ballistic_V1_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    RigKeycard_BR_CH2S2_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    RoastedChicken_Creative_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    RotatingGizmo_Creative_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    RustyCan_BR_CH2S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    SevenSliders_BR_CH7S3_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ShadowBomb_BR_CH1S8_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    ShadowFlopper_BR_CH2S8_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    SharkKeycard_BR_CH2S2_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SharkTooth_Creative_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    ShieldBreakerEMP_BR_CH4S4_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    ShieldBubble_BR_CH1SX_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    ShieldBubbleJr_BR_CH5S2_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    ShieldFish_BR_CH2S4_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    ShieldKeg_BR_CH3S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    ShieldMushroom_BR_CH1S4_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    ShieldPotion_BR_PreSeason_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    ShieldPotion_BR_CH5S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    ShockRock_BR_CH7S3_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    ShockwaveGrenade_BR_CH1S5_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    Shove_Creative_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SignalRemote_Creative_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SignalRemoteA_Creative_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SignalRemoteB_Creative_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SignalRemoteC_Creative_V1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SignalRemoteD_Creative_V1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SkyesGrappler_BR_CH2S2_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SkylineDeployer_BR_CH7S2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SlapBerry_BR_CH4S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    SlapJuice_BR_CH4S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    SlapperoniPizza_BR_CH7S2_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SlapperoniSlice_BR_CH7S2_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    SlapSplash_BR_CH4S3_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    SuperSlapSplash_BR_CH4S3_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    Slurpfish_BR_CH2S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    SlurpJuice_BR_CH1S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    SlurpJuice_BR_CH6S4_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    SlurpMushroom_BR_CH2S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    SmallFry_BR_CH2S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    SmallShieldPotion_BR_CH1S2_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    SmallShieldPotion_BR_CH5S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    SmokeCloud_BR_CH7S3_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    SmokeGrenade_BR_CH1S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    SmokeGrenade_Ballistic_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    SneakySnowman_BR_CH2S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SneakySnowman_OG_CH1S7_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    SnowyFlopper_BR_CH2S5_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    SpeedBoostLow_Creative_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    SpeedBoostMedium_Creative_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    SpeedBoostHigh_Creative_V1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    SpicyFish_BR_CH2S4_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    SpicyIcecreamCone_BR_CH3S3_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    SpireJumpboots_BR_CH2S6_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    StealthSplash_BR_CH7S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    StinkBomb_BR_CH1S4_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    StinkFish_BR_CH2S6_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    StinkSac_BR_CH2S6_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    Stone_BR_PreSeason_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    StormFlip_BR_CH1S9_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SurfCube_BR_CH6S3_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    LightridersSurfCube_BR_CH6S3_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ThermalFish_BR_CH2S4_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    ThermalTaffy_BR_CH2S4_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    Thermite_BR_CH6S2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    TheWall_Ballistic_V1_Common<epic_internal> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    ThunderboltOfZeus_BR_CH5S2_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Torch_Creative_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TrackingVisor_BR_CH6S3_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    StringyTwine_Creative_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    SimpleTwine_Creative_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    SturdyTwine_Creative_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    PeakyTwine_Creative_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    CarvedTwine_Creative_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    SpectralTwine_Creative_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    UnstableBounceGrenade_BR_CH6S3_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    VehicleModCowCatcher_BR_CH3S2_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    VehicleModOffRoadTires_BR_CH2S6_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    VendettaFlopper_BR_CH2S4_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    VoidOniMask_BR_CH6S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    NightRosesVoidOniMask_BR_CH6S1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    WallDynamo_OG_CH1S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @deprecated
    @preload
    # Deprecated. Please use WallDynamo_OG_CH1S1_Rare instead.
    WallDynamo_BR_CH4MS1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @deprecated
    @preload
    # Deprecated. Please use WallDynamo_OG_CH1S1_Rare instead.
    WallDynamo_BR_CH1S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    Wheat_Creative_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    WildwaspJar_BR_CH4S3_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    WingsOfIcarus_BR_CH5S2_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Wingsuit_BR_CH7S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    WitchBroom_BR_CH2S4_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    WolfTooth_Creative_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    Wood_BR_PreSeason_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    ZeroPointFish_BR_CH2S5_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        StackableComponent<override>:?basic_stackable_component = external {}

    @preload
    ZeroPointPretzel_BR_CH2S8_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
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
    using {/Verse.org/SceneGraph}
    using {/Verse.org/Native}
    using {/UnrealEngine.com/Itemization}
    using {/Fortnite.com/Itemization}
    @preload
    AnvilRocketLauncher_BR_CH3S2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    AnvilRocketLauncher_BR_CH3S2_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    AnvilRocketLauncher_BR_CH3S2_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ArcLightningGun_BR_CH7S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ArcLightningGun_BR_CH7S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HumanBillsArcLightningGun_BR_CH7S1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    AscendedMyst_BR_CH6S3_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    AssaultRifle_BR_PreSeason_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    AssaultRifle_BR_PreSeason_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    AssaultRifle_BR_PreSeason_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    AssaultRifle_BR_PreSeason_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    AssaultRifle_BR_PreSeason_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SkyesAssaultRifle_BR_CH2S2_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    AssaultRifle_BR_CH4S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    AssaultRifle_BR_CH4S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    AssaultRifle_BR_CH4S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    AssaultRifle_BR_CH4S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    AssaultRifle_BR_CH4S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    EnhancedAssaultRifle_BR_CH6S4_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    AutomaticSniperRifle_BR_CH1SX_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    AutomaticSniperRifle_BR_CH1SX_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    AutomaticSniperRifle_BR_CH1SX_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    AutomaticSniperRifle_BR_CH2S5_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    AutoShotgun_BR_CH3S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    AutoShotgun_BR_CH3S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    AutoShotgun_BR_CH3S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    AutoShotgun_BR_CH3S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    AutoShotgun_BR_CH3S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    AutoShotgun_BR_CH3S1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    BallisticShield_BR_CH5S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    BankShotPistol_BR_CH7S3_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    BankShotPistol_BR_CH7S3_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    BankShotPistol_BR_CH7S3_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    BankShotPistol_BR_CH7S3_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    BankShotPistol_BR_CH7S3_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    BasicHammer_Creative_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    BasicSword_Creative_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    BassBoost_BR_CH6S3_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    BassBoost_BR_CH6S3_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    BassBoost_BR_CH6S3_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    BoltActionSniperRifle_BR_PreSeason_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    BoltActionSniperRifle_BR_PreSeason_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    BoltActionSniperRifle_BR_PreSeason_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    BoltActionSniperRifle_BR_CH2S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    BoltActionSniperRifle_BR_CH2S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularBoomBolt_BR_CH5S3_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularBoomBolt_BR_CH5S3_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularBoomBolt_BR_CH5S3_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    RingmastersModularBoomBolt_BR_CH5S3_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    BoomBow_BR_CH1S8_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    BoomSniperRifle_BR_CH2S5_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    BugBlaster_BR_CH6S4_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    BugBlaster_BR_CH6S4_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    BugBlaster_BR_CH6S4_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    BurstAR_Ballistic_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    BurstAssaultRifle_BR_PreSeason_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    BurstAssaultRifle_BR_PreSeason_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    BurstAssaultRifle_BR_PreSeason_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    BurstAssaultRifle_BR_CH1S4_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    BurstAssaultRifle_BR_CH1S4_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    OceansBurstAssaultRifle_BR_CH2S3_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SlonesBurstAssaultRifle_BR_CH2S8_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    BurstAssaultRifle_OG_CH1S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @deprecated
    @preload
    # Deprecated. Please use BurstAssaultRifle_OG_CH1S1_Common instead.
    BurstAssaultRifle_BR_CH4MS1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    BurstAssaultRifle_OG_CH1S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @deprecated
    @preload
    # Deprecated. Please use BurstAssaultRifle_OG_CH1S1_Uncommon instead.
    BurstAssaultRifle_BR_CH4MS1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    BurstAssaultRifle_OG_CH1S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @deprecated
    @preload
    # Deprecated. Please use BurstAssaultRifle_OG_CH1S1_Rare instead.
    BurstAssaultRifle_BR_CH4MS1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    BurstAssaultRifle_OG_CH1S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @deprecated
    @preload
    # Deprecated. Please use BurstAssaultRifle_OG_CH1S1_Epic instead.
    BurstAssaultRifle_BR_CH4MS1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    BurstAssaultRifle_OG_CH1S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @deprecated
    @preload
    # Deprecated. Please use BurstAssaultRifle_OG_CH1S1_Legendary instead.
    BurstAssaultRifle_BR_CH4MS1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    BurstQuadLauncher_BR_CH2S5_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    BurstSMG_BR_CH1S9_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    BurstSMG_BR_CH1S9_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    BurstSMG_BR_CH1S9_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Chainsaw_BR_CH5S4_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ChainsOfHades_BR_CH5S2_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ChaosExploderRifle_BR_CH7S3_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ChaosExploderRifle_BR_CH7S3_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ChaosExploderRifle_BR_CH7S3_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ChaosExploderRifle_BR_CH7S3_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ChaosExploderRifle_BR_CH7S3_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ChaosReloaderShotgun_BR_CH7S2_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ChaosReloaderShotgun_BR_CH7S2_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ChaosReloaderShotgun_BR_CH7S2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ChaosReloaderShotgun_BR_CH7S2_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ChaosReloaderShotgun_BR_CH7S2_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DarkVoyagersObliterator_BR_CH7S2_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ChargeShotgun_BR_CH2S3_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ChargeShotgun_BR_CH2S3_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ChargeShotgun_BR_CH2S3_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ChargeShotgun_BR_CH2S3_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ChargeShotgun_BR_CH2S3_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    KitsChargeShotgun_BR_CH2S3_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ChargeSMG_BR_CH3S3_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ChargeSMG_BR_CH3S3_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ChargeSMG_BR_CH3S3_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ChargeSMG_BR_CH3S3_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ChargeSMG_BR_CH3S3_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ChargeSMG_BR_CH3S3_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    CobraDMR_BR_CH3S4_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    CobraDMR_BR_CH3S4_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    CobraDMR_BR_CH3S4_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    CobraDMR_BR_CH3S4_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    CobraDMR_BR_CH3S4_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    CobraDMR_BR_CH3S4_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    CollateralDamageAssaultRifle_BR_CH6S2_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    CollateralDamageAssaultRifle_BR_CH6S2_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    CollateralDamageAssaultRifle_BR_CH6S2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    CollateralDamageAssaultRifle_BR_CH6S2_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    CollateralDamageAssaultRifle_BR_CH6S2_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    EnhancedCollateralDamageAR_BR_CH6S2_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    LawlessTrinityAssaultRifle_BR_CH6S2_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    CombatAssaultRifle_BR_CH2S8_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    CombatAssaultRifle_BR_CH2S8_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    CombatAssaultRifle_BR_CH2S8_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    CombatAssaultRifle_BR_CH2S8_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    CombatAssaultRifle_BR_CH2S8_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularCombatAssaultRifle_BR_CH5S3_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularCombatAssaultRifle_BR_CH5S3_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularCombatAssaultRifle_BR_CH5S3_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularCombatAssaultRifle_BR_CH5S3_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularCombatAssaultRifle_BR_CH5S3_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TheMachinistsModularCombatAssaultRifle_BR_CH5S3_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    CombatAssaultRifle_BR_CH7S2_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    CombatAssaultRifle_BR_CH7S2_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    CombatAssaultRifle_BR_CH7S2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    CombatAssaultRifle_BR_CH7S2_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    CombatAssaultRifle_BR_CH7S2_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    CombatPistol_BR_CH2S8_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    CombatPistol_BR_CH2S8_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    CombatPistol_BR_CH2S8_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    CombatPistol_BR_CH2S8_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    CombatPistol_BR_CH2S8_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    CombatShotgun_BR_CH1S9_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    CombatShotgun_BR_CH1S9_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    CombatShotgun_BR_CH1S9_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    CombatShotgun_BR_CH2S8_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    CombatShotgun_BR_CH4S2_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularCombatShotgun_BR_CH5S3_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularCombatShotgun_BR_CH5S3_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularCombatShotgun_BR_CH5S3_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularCombatShotgun_BR_CH5S3_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularCombatShotgun_BR_CH5S3_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MegaloDonsModularCombatShotgun_BR_CH5S3_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    CombatSMG_BR_CH3S2_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    CombatSMG_BR_CH3S2_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    CombatSMG_BR_CH3S2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    CombatSMG_BR_CH3S2_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    CombatSMG_BR_CH3S2_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    CombatSMG_BR_CH3S2_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    CompactSMG_BR_CH1S5_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    CompactSMG_BR_CH1S5_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    CompactSMG_BR_CH6MS2_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    CompactSMG_BR_CH6MS2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    EnhancedCompactSMG_BR_CH6MS2_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Crossbow_BR_CH1S3_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Crossbow_BR_CH1S3_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    CubeRifle_BR_CH7S2_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    CubeRifle_BR_CH7S2_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    CubeRifle_BR_CH7S2_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    CupidsCrossbow_BR_CH1S2_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    EmpoweredCupidsCrossbow_BR_CH7S1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DarkVoyagersChaosRifle_BR_CH7S3_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DeadeyeAssaultRifle_BR_CH7S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DeadeyeAssaultRifle_BR_CH7S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DeadeyeAssaultRifle_BR_CH7S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DeadeyeAssaultRifle_BR_CH7S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DeadeyeAssaultRifle_BR_CH7S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HushsDeadeyeAssaultRifle_BR_CH7S1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DeadeyeDMR_BR_CH6S3_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DeadeyeDMR_BR_CH6S3_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DeadeyeDMR_BR_CH6S3_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DeadeyeDMR_BR_CH6S3_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DeadeyeDMR_BR_CH6S3_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    KorsDeadeyeDMR_BR_CH6S3_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    UnstableThunderclapDMR_BR_CH6S3_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DMR_BR_CH3S3_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DMR_BR_CH3S3_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DMR_BR_CH3S3_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DMR_BR_CH3S3_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DMR_BR_CH3S3_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DMR_BR_CH3S3_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Double_BR_CH6S4_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DoubleBarrelShotgun_BR_CH1S5_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DoubleBarrelShotgun_BR_CH1S5_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DragonsBreathShotgun_BR_CH6S2_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DragonsBreathShotgun_BR_CH6S2_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DragonsBreathSniper_BR_CH2S5_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DragonsBreathShotgun_BR_CH2S5_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DragonsBreathShotgun_BR_CH2S5_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DrumGun_BR_CH1S4_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DrumGun_BR_CH1S4_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MidasDrumGun_BR_CH2S2_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    JulesDrumGun_BR_CH2S3_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ShadowMidasDrumGun_BR_CH2S4_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularDrumGun_BR_CH5S2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularDrumGun_BR_CH5S2_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularDrumGun_BR_CH5S2_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MidasModularDrumGun_BR_CH5S2_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MidasGildedEyeDrumGun_BR_CH6S2_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DrumGun_BR_CH6MS2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DrumGun_BR_CH6MS2_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DrumGun_BR_CH6MS2_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DrumGun_Ballistic_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DrumShotgun_BR_CH1S9_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DrumShotgun_BR_CH1S9_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DrumShotgun_BR_CH1S9_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DrumShotgun_BR_CH3S2_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DrumShotgun_BR_CH3S2_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    EnhancedDrumShotgun_BR_CH4S3_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DualFiendHunters_BR_CH2S8_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DualFiendHunters_BR_CH2S8_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DualFiendHunters_BR_CH2S8_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DualFiendHunters_BR_CH2S8_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DualFiendHunters_BR_CH2S8_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DualMicroSMGs_BR_CH5S4_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DualMicroSMGs_BR_CH5S4_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DualMicroSMGs_BR_CH5S4_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DualMicroSMGs_BR_CH5S4_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DualMicroSMGs_BR_CH5S4_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DualMicroSMGs_BR_CH7S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DualMicroSMGs_BR_CH7S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DualMicroSMGs_BR_CH7S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DualMicroSMGs_BR_CH7S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DualMicroSMGs_BR_CH7S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DualPistols_BR_CH1S4_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DualPistols_BR_CH1S4_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DualPistols_BR_CH2S6_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DualPistols_BR_CH2S6_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DualPistols_BR_CH2S6_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DualSuppressedPistols_BR_CH3S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DualSuppressedPistols_BR_CH3S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DualSuppressedPistols_BR_CH3S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DualSuppressedPistols_BR_CH3S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    EggLauncher_BR_CH1S3_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    EggLauncher_BR_CH1S3_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    EggLauncher_BR_CH1S3_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    EggLauncher_BR_CH2S6_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularEnforcerAR_BR_CH5S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularEnforcerAR_BR_CH5S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularEnforcerAR_BR_CH5S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularEnforcerAR_BR_CH5S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularEnforcerAR_BR_CH5S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    EnforcerAR_BR_CH7S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    EnforcerAR_BR_CH7S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    EnforcerAR_BR_CH7S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    EnforcerAR_BR_CH7S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    EnforcerAR_BR_CH7S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    EnforcerAR_Ballistic_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    EvoChromeBurstRifle_BR_CH3S4_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    EvoChromeBurstRifle_BR_CH3S4_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    EvoChromeBurstRifle_BR_CH3S4_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    EvoChromeBurstRifle_BR_CH3S4_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    EvoChromeBurstRifle_BR_CH3S4_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    EvoChromeBurstRifle_BR_CH3S4_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    EvoChromeShotgun_BR_CH3S4_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    EvoChromeShotgun_BR_CH3S4_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    EvoChromeShotgun_BR_CH3S4_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    EvoChromeShotgun_BR_CH3S4_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    EvoChromeShotgun_BR_CH3S4_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    EvoChromeShotgun_BR_CH3S4_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ExCaliberRifle_BR_CH4S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ExCaliberRifle_BR_CH4S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ExCaliberRifle_BR_CH4S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ExCaliberRifle_BR_CH4S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ExCaliberRifle_BR_CH4S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TheAgelessChampionsExCaliberRifle_BR_CH4S1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ExoticLeapingLightningGun_BR_CH7S2_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ExplosiveGooGun_BR_CH3S4_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ExplosiveRepeaterRifle_BR_CH4S3_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ExplosiveRepeaterRifle_BR_CH4S3_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ExplosiveRepeaterRifle_BR_CH4S3_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ExplosiveRepeaterRifle_BR_CH4S3_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ExplosiveRepeaterRifle_BR_CH4S3_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ExplosiveRepeaterRifle_BR_CH4S3_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ExtendingFocusShotgun_BR_CH7S3_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ExtendingFocusShotgun_BR_CH7S3_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ExtendingFocusShotgun_BR_CH7S3_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ExtendingFocusShotgun_BR_CH7S3_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ExtendingFocusShotgun_BR_CH7S3_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    FalconEyeSniper_BR_CH6S2_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    FalconEyeSniper_BR_CH6S2_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    FalconEyeSniper_BR_CH6S2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    FalconEyeSniper_BR_CH6S2_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    FalconEyeSniper_BR_CH6S2_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    EnhancedFalconEyeSniper_BR_CH6S2_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    FiendHunterCrossbow_BR_CH1S6_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    FireOniMask_BR_CH6S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ShogunXsFireOniMask_BR_CH6S1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    FireworkFlareGun_BR_CH3S3_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    FlapjackRifle_BR_CH4S3_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    FlapjackRifle_BR_CH4S3_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    FlapjackRifle_BR_CH4S3_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    FlapjackRifle_BR_CH4S3_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    FlapjackRifle_BR_CH4S3_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    EnhancedFlapJackRifle_BR_CH4S3_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    FlareGun_BR_CH2S3_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    FlashlightPistol_Creative_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    FlexSMG_BR_CH7S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    FlexSMG_BR_CH7S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    FlexSMG_BR_CH7S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    FlexSMG_BR_CH7S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    FlexSMG_BR_CH7S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    BigfootsFlexSMG_BR_CH7S1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    FlintKnockPistol_BR_CH1S8_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    FlintKnockPistol_BR_CH1S8_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularFrenzyAutoShotgun_BR_CH5S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularFrenzyAutoShotgun_BR_CH5S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularFrenzyAutoShotgun_BR_CH5S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularFrenzyAutoShotgun_BR_CH5S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularFrenzyAutoShotgun_BR_CH5S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    OscarsModularFrenzyAutoShotgun_BR_CH5S1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    FrenzyAutoShotgun_Ballistic_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    FuryAssaultRifle_BR_CH6S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    FuryAssaultRifle_BR_CH6S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    FuryAssaultRifle_BR_CH6S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    FuryAssaultRifle_BR_CH6S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    FuryAssaultRifle_BR_CH6S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    EnhancedFuryAssaultRifle_BR_CH6S1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    EradicatorHopRockFuryAssaultRifle_BR_CH6S4_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularGatekeeperShotgun_BR_CH5S2_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularGatekeeperShotgun_BR_CH5S2_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularGatekeeperShotgun_BR_CH5S2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularGatekeeperShotgun_BR_CH5S2_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularGatekeeperShotgun_BR_CH5S2_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    CerberusModularGatekeeperShotgun_BR_CH5S2_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    GrappleBlade_BR_CH5S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    GrapplerBow_BR_CH2S6_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    GrenadeLauncher_BR_PreSeason_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    GrenadeLauncher_BR_PreSeason_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    GrenadeLauncher_BR_PreSeason_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    GuidedMissile_OG_CH1S3_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @deprecated
    @preload
    # Deprecated. Please use GuidedMissile_OG_CH1S3_Epic instead.
    GuidedMissile_BR_CH4MS1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    GuidedMissile_OG_CH1S3_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @deprecated
    @preload
    # Deprecated. Please use GuidedMissile_OG_CH1S3_Legendary instead.
    GuidedMissile_BR_CH4MS1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HammerAssaultRifle_BR_CH3S3_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HammerAssaultRifle_BR_CH3S3_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HammerAssaultRifle_BR_CH3S3_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HammerAssaultRifle_BR_CH3S3_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HammerAssaultRifle_BR_CH3S3_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HammerAssaultRifle_BR_CH3S3_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularHammerPumpShotgun_BR_CH5S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularHammerPumpShotgun_BR_CH5S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularHammerPumpShotgun_BR_CH5S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularHammerPumpShotgun_BR_CH5S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularHammerPumpShotgun_BR_CH5S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HammerPumpShotgun_Ballistic_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HammerRevolver_BR_CH7S2_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HammerRevolver_BR_CH7S2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HammerRevolver_BR_CH7S2_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HammerRevolver_BR_CH7S2_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HammerRevolver_BR_CH7S2_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HandCannon_BR_CH1S3_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HandCannon_BR_CH1S3_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HandCannon_BR_CH2S2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularHandCannon_BR_CH5S2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularHandCannon_BR_CH5S2_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularHandCannon_BR_CH5S2_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularConductorHandCannon_BR_CH5S3_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HandCannon_Ballistic_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularHarbingerSMG_BR_CH5S2_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularHarbingerSMG_BR_CH5S2_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularHarbingerSMG_BR_CH5S2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularHarbingerSMG_BR_CH5S2_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularHarbingerSMG_BR_CH5S2_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HadesModularHarbingerSMG_BR_CH5S2_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HavocPumpShotgun_BR_CH4S2_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HavocPumpShotgun_BR_CH4S2_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HavocPumpShotgun_BR_CH4S2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HavocPumpShotgun_BR_CH4S2_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HavocPumpShotgun_BR_CH4S2_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    EnhancedHavocShotgun_BR_CH4S2_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HavocSuppressedAssaultRifle_BR_CH4S2_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HavocSuppressedAssaultRifle_BR_CH4S2_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HavocSuppressedAssaultRifle_BR_CH4S2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HavocSuppressedAssaultRifle_BR_CH4S2_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HavocSuppressedAssaultRifle_BR_CH4S2_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HavocSuppressedAssaultRifle_BR_CH4S2_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HighcardsHavocSuppressedRifle_BR_CH4S2_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HeartsHavocSuppressedRifle_BR_CH4S4_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HeavyAssaultRifle_BR_CH1S6_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HeavyAssaultRifle_BR_CH1S6_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HeavyAssaultRifle_BR_CH1S6_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HeavyAssaultRifle_BR_CH1S8_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HeavyAssaultRifle_BR_CH1S8_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HeavyImpactSniperRifle_BR_CH5S3_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HeavyImpactSniperRifle_BR_CH5S3_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HeavyImpactSniperRifle_BR_CH5S3_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    LawlessHeavyImpactTrackingRifle_BR_CH6S2_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    LawfulHeavyImpactTrackingRifle_BR_CH7S2_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HeavyShotgun_BR_CH3S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HeavyShotgun_BR_CH3S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HeavyShotgun_BR_CH3S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HeavyShotgun_BR_CH3S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HeavyShotgun_BR_CH3S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HeistedBreacherShotgun_BR_CH4S1_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HeavyShotgun_OG_CH1S3_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HeavyShotgun_OG_CH1S3_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HeavySniperRifle_BR_CH1S5_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HeavySniperRifle_BR_CH1S5_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HeavySniperRifle_BR_CH3S3_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HoloRushSMG_BR_CH7S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HoloRushSMG_BR_CH7S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HoloRushSMG_BR_CH7S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HoloRushSMG_BR_CH7S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HoloRushSMG_BR_CH7S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    YuleTroopersHoloRushSMG_BR_CH7S1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HoloTwisterAssaultRifle_BR_CH6S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HoloTwisterAssaultRifle_BR_CH6S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HoloTwisterAssaultRifle_BR_CH6S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HoloTwisterAssaultRifle_BR_CH6S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HoloTwisterAssaultRifle_BR_CH6S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    EnhancedHoloTwisterAssaultRifle_BR_CH6S1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HopRockDualies_BR_CH2S5_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HunterBoltActionSniper_BR_CH3S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HunterBoltActionSniper_BR_CH3S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HunterBoltActionSniper_BR_CH3S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HunterBoltActionSniper_BR_CH3S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HunterBoltActionSniper_BR_CH3S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HuntingRifle_BR_CH1S3_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HuntingRifle_BR_CH1S3_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HuntingRifle_BR_CH2S3_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HuntingRifle_BR_CH2S3_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HuntingRifle_BR_CH6S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HuntingRifle_BR_CH6S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HuntingRifle_BR_CH6S1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    LawlessStinkRifle_BR_CH6S2_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularHuntressDMR_BR_CH5S2_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularHuntressDMR_BR_CH5S2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularHuntressDMR_BR_CH5S2_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularHuntressDMR_BR_CH5S2_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularZeusHuntressDMR_BR_CH5S2_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HyperburstPistol_BR_CH6S3_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HyperburstPistol_BR_CH6S3_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HyperburstPistol_BR_CH6S3_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HyperburstPistol_BR_CH6S3_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HyperburstPistol_BR_CH6S3_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    EnhancedHyperburstPistol_BR_CH6S3_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    UnstableVoltageBurstPistol_BR_CH6S3_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularHyperSMG_BR_CH5S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularHyperSMG_BR_CH5S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularHyperSMG_BR_CH5S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularHyperSMG_BR_CH5S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularHyperSMG_BR_CH5S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ValeriasModularHyperSMG_BR_CH5S1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HyperSMG_Ballistic_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    IceKingsGauntlets_BR_CH7S2_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    InfantryRifle_BR_CH1S7_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    InfantryRifle_BR_CH1S7_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    InfantryRifle_BR_CH1S7_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    InfantryRifle_BR_CH1S8_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    InfantryRifle_BR_CH1S8_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    InfantryRifle_BR_CH6MS2_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    InfantryRifle_BR_CH6MS2_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    InfiltratorPumpShotgun_BR_CH4S4_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    InfiltratorPumpShotgun_BR_CH4S4_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    InfiltratorPumpShotgun_BR_CH4S4_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    InfiltratorPumpShotgun_BR_CH4S4_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    InfiltratorPumpShotgun_BR_CH4S4_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    EnhancedInfiltratorPumpShotgun_BR_CH4S4_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    InfinityBlade_BR_CH1S7_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    IronPumpShotgun_BR_CH7S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    IronPumpShotgun_BR_CH7S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    IronPumpShotgun_BR_CH7S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    IronPumpShotgun_BR_CH7S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    IronPumpShotgun_BR_CH7S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PinpointIronPumpShotgun_BR_CH7S1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    KillswitchsRevolvers_BR_CH6S3_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    KillswitchRevolvers_BR_CH6S3_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    KillswitchRevolvers_BR_CH6S3_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    KillswitchRevolvers_BR_CH6S3_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    KineticBlade_BR_CH4S2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    KineticBlade_BR_CH4S2_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ThornesVampiricBlade_BR_CH4S4_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    KineticBoomerang_BR_CH4S3_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    KymeraRayGun_BR_CH2S7_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    KymeraRayGun_BR_CH2S7_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    KymeraRayGun_BR_CH2S7_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ZygAndChoppysRayGun_BR_CH2S7_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    LawfulAccelerantHoloTwisterAR_BR_CH7S2_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    LawfulShockwaveRocketLauncher_BR_CH7S2_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    LawlessAccelerantHoloTwisterAR_BR_CH6S2_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    LawlessFinalMarkRifle_BR_CH6S2_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    LawlessShockwaveRocketLauncher_BR_CH6S2_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Leadspitter3000_BR_CH6S4_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Leadspitter3000_BR_CH6S4_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Leadspitter3000_BR_CH6S4_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    LeverActionRifle_BR_CH2S5_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    LeverActionRifle_BR_CH2S5_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    LeverActionRifle_BR_CH2S5_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    LeverActionRifle_BR_CH2S5_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    LeverActionShotgun_BR_CH2S5_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    LeverActionShotgun_BR_CH2S5_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    LeverActionShotgun_BR_CH2S5_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    LeverActionShotgun_BR_CH2S5_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    LeverActionShotgun_BR_CH2S5_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    LightMachineGun_BR_CH1S3_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    LightMachineGun_BR_CH1S3_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    LightMachineGun_BR_CH3S2_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    LightMachineGun_BR_CH3S2_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    LightMachineGun_BR_CH3S2_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    LockOnAssaultRifle_BR_CH7S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    LockOnAssaultRifle_BR_CH7S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    LockOnAssaultRifle_BR_CH7S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    LockOnAssaultRifle_BR_CH7S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    LockOnAssaultRifle_BR_CH7S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    LockOnPistol_BR_CH4S2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MachinePistol_Ballistic_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MachineSMG_BR_CH3S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MachineSMG_BR_CH3S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MachineSMG_BR_CH3S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MachineSMG_BR_CH3S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MachineSMG_BR_CH3S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MakeshiftBow_BR_CH2S6_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MakeshiftRevolver_BR_CH2S6_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MakeshiftRevolver_BR_CH2S6_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MakeshiftRevolver_BR_CH2S6_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MakeshiftRifle_BR_CH2S6_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MakeshiftRifle_BR_CH2S6_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MakeshiftRifle_BR_CH2S6_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MakeshiftShotgun_BR_CH2S6_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MakeshiftShotgun_BR_CH2S6_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MakeshiftShotgun_BR_CH2S6_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MakeshiftSubmachineGun_BR_CH2S6_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MakeshiftSubmachineGun_BR_CH2S6_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MakeshiftSubmachineGun_BR_CH2S6_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MammothPistol_BR_CH4S3_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MammothPistol_BR_CH4S3_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MammothPistol_BR_CH4S3_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MammothPistol_BR_CH4S3_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MammothPistol_BR_CH4S3_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    BaronsDoubleDownPistol_BR_CH6S2_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    LawlessExplosiveMammothPistol_BR_CH6S2_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    LawfulExplosiveMammothPistol_BR_CH7S2_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MarksmanSixShooter_BR_CH2S6_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MavenAutoShotgun_BR_CH4S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MavenAutoShotgun_BR_CH4S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MavenAutoShotgun_BR_CH4S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MavenAutoShotgun_BR_CH4S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MavenAutoShotgun_BR_CH4S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HeistedAccelerantShotgun_BR_CH4S1_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MechanicalBow_BR_CH2S6_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MechanicalExplosiveBow_BR_CH2S6_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MechanicalExplosiveBow_BR_CH2S6_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MechanicalExplosiveBow_BR_CH2S6_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    RazsExplosiveBow_BR_CH2S6_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MechanicalShockwaveBow_BR_CH2S6_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MechanicalShockwaveBow_BR_CH2S6_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MechanicalShockwaveBow_BR_CH2S6_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MeowsclesPeowPeowRifle_BR_CH2S2_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Minigun_BR_CH1S2_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Minigun_BR_CH1S2_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    BrutusMinigun_BR_CH2S2_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Minigun_BR_CH5S3_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MKAlphaAssaultRifle_BR_CH4S2_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MKAlphaAssaultRifle_BR_CH4S2_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MKAlphaAssaultRifle_BR_CH4S2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MKAlphaAssaultRifle_BR_CH4S2_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MKAlphaAssaultRifle_BR_CH4S2_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MKSevenAssaultRifle_BR_CH3S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MKSevenAssaultRifle_BR_CH3S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MKSevenAssaultRifle_BR_CH3S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MKSevenAssaultRifle_BR_CH3S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MKSevenAssaultRifle_BR_CH3S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ReliksMKAlphaAssaultRifle_BR_CH4S2_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TheFoundationsMKSevenAssaultRifle_BR_CH3S1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularMonarchPistol_BR_CH5S4_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularMonarchPistol_BR_CH5S4_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularMonarchPistol_BR_CH5S4_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularMonarchPistol_BR_CH5S4_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularMonarchPistol_BR_CH5S4_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MystGauntlets_BR_CH6S3_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularNemesisAR_BR_CH5S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularNemesisAR_BR_CH5S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularNemesisAR_BR_CH5S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularNemesisAR_BR_CH5S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularNemesisAR_BR_CH5S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MontaguesModularNemesisAR_BR_CH5S1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    NemesisAR_BR_CH7S2_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    NemesisAR_BR_CH7S2_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    NemesisAR_BR_CH7S2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    NemesisAR_BR_CH7S2_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    NemesisAR_BR_CH7S2_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    NemesisAR_Ballistic_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    NightHawk_BR_CH2S5_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    NitroFists_BR_CH5S3_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    MegaloDonsNitroFists_BR_CH5S3_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    OXRRifle_BR_CH6S4_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    OXRRifle_BR_CH6S4_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    OXRRifle_BR_CH6S4_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    OXRRifle_BR_CH6S4_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    OXRRifle_BR_CH6S4_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    OXRRifle_BR_CH6S4_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    OniShotgun_BR_CH6S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    OniShotgun_BR_CH6S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    OniShotgun_BR_CH6S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    OniShotgun_BR_CH6S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    OniShotgun_BR_CH6S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    EnhancedOniShotgun_BR_CH6S1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    OrangePaintLauncher_BR_CH2S2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    OutlawShotgun_BR_CH6S2_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    OutlawShotgun_BR_CH6S2_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    OutlawShotgun_BR_CH6S2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    OutlawShotgun_BR_CH6S2_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    OutlawShotgun_BR_CH6S2_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    EnhancedOutlawShotgun_BR_CH6S2_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    UnstableYoinkShotgun_BR_CH6S3_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    EradicatorOXRRifle_BR_CH6S4_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Pistol_BR_CH4MS1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Pistol_BR_CH4MS1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Pistol_BR_CH4MS1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Pistol_BR_CH7S2_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Pistol_BR_CH7S2_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Pistol_BR_CH7S2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Pistol_BR_CH7S2_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Pistol_BR_CH7S2_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PlasmaBurstLaser_BR_CH6S2_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PlasmaCannon_BR_CH2S7_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PrimalBow_BR_CH2S6_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PrimalFlameBow_BR_CH2S6_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PrimalFlameBow_BR_CH2S6_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PrimalFlameBow_BR_CH2S6_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PrimalPistol_BR_CH2S6_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PrimalPistol_BR_CH2S6_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PrimalPistol_BR_CH2S6_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PrimalPistol_BR_CH2S6_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PrimalRifle_BR_CH2S6_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PrimalRifle_BR_CH2S6_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PrimalRifle_BR_CH2S6_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PrimalRifle_BR_CH2S6_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SpireGuardiansPrimalAssaultRifle_BR_CH2S6_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PrimalShotgun_BR_CH2S6_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PrimalShotgun_BR_CH2S6_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PrimalShotgun_BR_CH2S6_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PrimalShotgun_BR_CH2S6_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SpireAssassinsPrimalShotgun_BR_CH2S6_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PrimalSMG_BR_CH2S6_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PrimalSMG_BR_CH2S6_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PrimalSMG_BR_CH2S6_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PrimalSMG_BR_CH2S6_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PrimalStinkBow_BR_CH2S6_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PrimalStinkBow_BR_CH2S6_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PrimalStinkBow_BR_CH2S6_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PrimeShotgun_BR_CH3S3_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PrimeShotgun_BR_CH3S3_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PrimeShotgun_BR_CH3S3_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PrimeShotgun_BR_CH3S3_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PrimeShotgun_BR_CH3S3_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PrimeShotgun_BR_CH3S3_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ProximityGrenadeLauncher_BR_CH1S9_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ProximityGrenadeLauncher_BR_CH1S9_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PulseRifle_BR_CH2S7_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PulseRifle_BR_CH2S7_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PulseRifle_BR_CH2S7_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SlonesPulseRifle_BR_CH2S7_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    BurstPulseRifle_BR_CH2S7_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    OverclockedPulseRifle_BR_CH4S2_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PulseRifle_BR_CH7S2_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    OverdrivePulseRifle_BR_CH7S2_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PumpDump_BR_CH6S2_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PumpDump_BR_CH6S2_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PumpDump_BR_CH6S2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PumpDump_BR_CH6S2_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PumpDump_BR_CH6S2_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PumpDump_BR_CH6S2_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    LawlessBlinkPumpDump_BR_CH6S2_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PumpkinLauncher_BR_CH1S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PumpkinLauncher_BR_CH1S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PumpkinLauncher_BR_CH1S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PumpkinLauncher_BR_CH2S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PumpkinLauncher_BR_CH6S4_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PumpkinLauncher_BR_CH6S4_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PumpkinLauncher_BR_CH6S4_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PumpShotgun_BR_PreSeason_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PumpShotgun_BR_PreSeason_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PumpShotgun_BR_CH1S6_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PumpShotgun_BR_CH1S6_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PumpShotgun_BR_CH2S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PumpShotgun_OG_CH1S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @deprecated
    @preload
    # Deprecated. Please use PumpShotgun_OG_CH1S1_Common instead.
    PumpShotgun_BR_CH4MS1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PumpShotgun_OG_CH1S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @deprecated
    @preload
    # Deprecated. Please use PumpShotgun_OG_CH1S1_Uncommon instead.
    PumpShotgun_BR_CH4MS1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PumpShotgun_OG_CH1S3_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @deprecated
    @preload
    # Deprecated. Please use PumpShotgun_OG_CH1S3_Rare instead.
    PumpShotgun_BR_CH4MS1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PumpShotgun_OG_CH1S6_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @deprecated
    @preload
    # Deprecated. Please use PumpShotgun_OG_CH1S6_Epic instead.
    PumpShotgun_BR_CH4MS1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PumpShotgun_OG_CH1S6_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @deprecated
    @preload
    # Deprecated. Please use PumpShotgun_OG_CH1S6_Legendary instead.
    PumpShotgun_BR_CH4MS1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    PurplePaintLauncher_BR_CH2S2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    QuadLauncher_BR_CH1S6_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    QuadLauncher_BR_CH1S6_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    RailGun_BR_CH2S7_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    RailGun_BR_CH2S7_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    RailGun_BR_CH2S7_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    RangerAssaultRifle_BR_CH3S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    RangerAssaultRifle_BR_CH3S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    RangerAssaultRifle_BR_CH3S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    RangerAssaultRifle_BR_CH3S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    RangerAssaultRifle_BR_CH3S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    RangerAssaultRifle_BR_CH3S1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularRangerPistol_BR_CH5S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularRangerPistol_BR_CH5S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularRangerPistol_BR_CH5S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularRangerPistol_BR_CH5S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularRangerPistol_BR_CH5S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    RangerPistol_Ballistic_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    RangerShotgun_BR_CH3S2_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    RangerShotgun_BR_CH3S2_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    RangerShotgun_BR_CH3S2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    RangerShotgun_BR_CH3S2_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    RangerShotgun_BR_CH3S2_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    RapidFireSMG_BR_CH2S2_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    RapidFireSMG_BR_CH2S2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    RapidFireSMG_BR_CH2S3_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    RapidFireSMG_BR_CH2S3_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    RapidFireSMG_BR_CH2S3_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    RapidFireSMG_BR_CH3S4_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ReacherExtendingShotgun_BR_CH7S3_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ReaperModularSniperRifle_BR_CH5S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ReaperModularSniperRifle_BR_CH5S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ReaperModularSniperRifle_BR_CH5S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ReaperModularSniperRifle_BR_CH5S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ReaperSniperRifle_Ballistic_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ReconBow_BR_CH7S2_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @deprecated
    @preload
    # Deprecated. Please use ReconBow_BR_CH7S2_Exotic instead.
    ExoticReconBow_BR_CH7S2_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ReconScanner_BR_CH2S7_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Recycler_BR_CH2S6_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Recycler_BR_CH2S6_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Recycler_BR_CH2S6_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SpireAssassinsRecycler_BR_CH2S6_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    RedEyeAssaultRifle_BR_CH4S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    RedEyeAssaultRifle_BR_CH4S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    RedEyeAssaultRifle_BR_CH4S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    RedEyeAssaultRifle_BR_CH4S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    RedEyeAssaultRifle_BR_CH4S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HeistedExplosiveAssaultRifle_BR_CH4S1_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Revolver_BR_PreSeason_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Revolver_BR_PreSeason_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Revolver_BR_PreSeason_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Revolver_BR_CH1S9_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Revolver_BR_CH1S9_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Revolver_OG_CH1S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @deprecated
    @preload
    # Deprecated. Please use Revolver_OG_CH1S1_Common instead.
    Revolver_BR_CH4MS1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Revolver_OG_CH1S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @deprecated
    @preload
    # Deprecated. Please use Revolver_OG_CH1S1_Uncommon instead.
    Revolver_BR_CH4MS1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Revolver_OG_CH1S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @deprecated
    @preload
    # Deprecated. Please use Revolver_OG_CH1S1_Rare instead.
    Revolver_BR_CH4MS1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Revolver_OG_CH1S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @deprecated
    @preload
    # Deprecated. Please use Revolver_OG_CH1S1_Epic instead.
    Revolver_BR_CH4MS1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Revolver_OG_CH1S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @deprecated
    @preload
    # Deprecated. Please use Revolver_OG_CH1S1_Legendary instead.
    Revolver_BR_CH4MS1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    RipsawLauncher_BR_CH3S3_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    RocketDrill_BR_CH6S2_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    RocketLauncher_BR_PreSeason_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    RocketLauncher_BR_PreSeason_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    RocketLauncher_BR_PreSeason_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    RocketLauncher_BR_CH2S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    RocketLauncher_BR_CH2S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    RocketRam_BR_CH4S4_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ScopedAssaultRifle_BR_PreSeason_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ScopedAssaultRifle_BR_PreSeason_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ScopedAssaultRifle_BR_CH2S4_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ScopedAssaultRifle_BR_CH2S4_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ScopedBurstSMG_BR_CH4S4_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ScopedBurstSMG_BR_CH4S4_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ScopedBurstSMG_BR_CH4S4_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ScopedBurstSMG_BR_CH4S4_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ScopedBurstSMG_BR_CH4S4_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ThornesScopedBurstSMG_BR_CH4S4_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ScopedRevolver_BR_CH1S7_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ScopedRevolver_BR_CH1S7_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SemiAutoPistol_BR_PreSeason_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SemiAutoPistol_BR_PreSeason_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SemiAutoPistol_BR_PreSeason_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SemiAutoPistol_BR_CH2S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SemiAutoPistol_BR_CH2S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SemiAutoSniperRifle_BR_PreSeason_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SemiAutoSniperRifle_BR_PreSeason_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SemiAutoSniperRifle_BR_CH2S2_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SemiAutoSniperRifle_BR_CH2S2_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SemiAutoSuppressedPistol_BR_CH1S2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SemiAutoSuppressedPistol_BR_CH1S2_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SemiAutoSuppressedPistol_BR_CH3S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SemiAutoSuppressedPistol_BR_CH3S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SentinelPumpShotgun_BR_CH6S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SentinelPumpShotgun_BR_CH6S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SentinelPumpShotgun_BR_CH6S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SentinelPumpShotgun_BR_CH6S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SentinelPumpShotgun_BR_CH6S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    EnhancedSentinelPumpShotgun_BR_CH6S1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SevenClusterCannon_BR_CH7S2_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SevenClusterCannon_BR_CH7S2_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SevenPowerGloves_BR_CH7S2_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    FoundationsPowerGloves_BR_CH7S2_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ShadowTracker_BR_CH2S5_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SharpToothShotgun_BR_CH4S3_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SharpToothShotgun_BR_CH4S3_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SharpToothShotgun_BR_CH4S3_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SharpToothShotgun_BR_CH4S3_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ShockwaveHammer_BR_CH4S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TheAgelessChampionsShockwaveHammer_BR_CH4S1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    KitsShockwaveLauncher_BR_CH2S3_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ShockwaveLauncher_BR_CH2S8_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ShockwaveLauncher_BR_CH6S4_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    EradicatorShockNSlowShockwaveLauncher_BR_CH6S4_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SidearmPistol_BR_CH3S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SidearmPistol_BR_CH3S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SidearmPistol_BR_CH3S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SidearmPistol_BR_CH3S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SidearmPistol_BR_CH3S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SidewaysMinigun_BR_CH2S8_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SidewaysMinigun_BR_CH2S8_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SidewaysMinigun_BR_CH2S8_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SidewaysMinigun_BR_CH2S8_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SidewaysMinigun_BR_CH2S8_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SidewaysMinigun_BR_CH2S8_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SidewaysRifle_BR_CH2S8_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SidewaysRifle_BR_CH2S8_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SidewaysRifle_BR_CH2S8_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SidewaysRifle_BR_CH2S8_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SidewaysRifle_BR_CH2S8_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SidewaysRifle_BR_CH2S8_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SidewaysScythe_BR_CH2S8_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SidewaysScythe_BR_CH2S8_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SidewaysScythe_BR_CH2S8_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SidewaysScythe_BR_CH2S8_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SidewaysScythe_BR_CH2S8_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SidewaysScythe_BR_CH2S8_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SixShooter_BR_CH1S6_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SixShooter_BR_CH1S6_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SixShooter_BR_CH1S6_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SixShooter_BR_CH7S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SnowballLauncher_BR_CH1S2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SnowballLauncher_BR_CH1S2_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SnowballLauncher_BR_CH1S2_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SnowballLauncher_BR_CH2S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularSovereignShotgun_BR_CH5S4_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularSovereignShotgun_BR_CH5S4_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularSovereignShotgun_BR_CH5S4_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularSovereignShotgun_BR_CH5S4_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularSovereignShotgun_BR_CH5S4_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SovereignShotgun_BR_CH7S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SovereignShotgun_BR_CH7S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SovereignShotgun_BR_CH7S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SovereignShotgun_BR_CH7S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SovereignShotgun_BR_CH7S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SovereignSniper_Ballistic_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SpireRifle_BR_CH6S3_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SpireRifle_BR_CH6S3_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SpireRifle_BR_CH6S3_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SpireRifle_BR_CH6S3_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SpireRifle_BR_CH6S3_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    EnhancedSpireRifle_BR_CH6S3_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    StickyGrenadeLauncher_BR_CH4S4_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    StickyGrenadeLauncher_BR_CH4S4_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    StingerSMG_BR_CH3S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    StingerSMG_BR_CH3S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    StingerSMG_BR_CH3S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    StingerSMG_BR_CH3S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    StingerSMG_BR_CH3S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    GunnarsStingerSMG_BR_CH3S1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    StormScout_BR_CH2S5_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    StormScoutSniperRifle_BR_CH1S9_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    StormScoutSniperRifle_BR_CH1S9_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularStrikerAR_BR_CH5S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularStrikerAR_BR_CH5S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularStrikerAR_BR_CH5S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularStrikerAR_BR_CH5S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularStrikerAR_BR_CH5S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    NishasModularStrikerAR_BR_CH5S1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    StrikerAR_BR_CH6MS2_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    StrikerAR_BR_CH6MS2_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    StrikerAR_BR_CH6MS2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    StrikerAR_BR_CH6MS2_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    StrikerAR_BR_CH6MS2_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    StrikerAR_Ballistic_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    StrikerBurstRifle_BR_CH3S2_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    StrikerBurstRifle_BR_CH3S2_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    StrikerBurstRifle_BR_CH3S2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    StrikerBurstRifle_BR_CH3S2_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    StrikerBurstRifle_BR_CH3S2_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    StrikerBurstRifle_BR_CH3S2_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SlonesStrikerBurstRifle_BR_CH3S2_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularStrikerBurstRifle_BR_CH5S4_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularStrikerBurstRifle_BR_CH5S4_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularStrikerBurstRifle_BR_CH5S4_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularStrikerBurstRifle_BR_CH5S4_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularStrikerBurstRifle_BR_CH5S4_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    StrikerPumpShotgun_BR_CH3S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    StrikerPumpShotgun_BR_CH3S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    StrikerPumpShotgun_BR_CH3S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    StrikerPumpShotgun_BR_CH3S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    StrikerPumpShotgun_BR_CH3S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    StrikerPumpShotgun_BR_CH3S1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SubmachineGun_BR_CH1S5_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SubmachineGun_BR_CH1S5_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SubmachineGun_BR_CH1S5_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SubmachineGun_BR_CH2S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SubmachineGun_BR_CH2S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HeistedRunNGunSMG_BR_CH4S1_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SubmachineGun_BR_CH4S2_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SubmachineGun_BR_CH4S2_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SubmachineGun_OG_CH1S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @deprecated
    @preload
    # Deprecated. Please use SubmachineGun_OG_CH1S1_Common instead.
    SubmachineGun_BR_CH4MS1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SubmachineGun_OG_CH1S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @deprecated
    @preload
    # Deprecated. Please use SubmachineGun_OG_CH1S1_Uncommon instead.
    SubmachineGun_BR_CH4MS1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SubmachineGun_OG_CH1S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @deprecated
    @preload
    # Deprecated. Please use SubmachineGun_OG_CH1S1_Rare instead.
    SubmachineGun_BR_CH4MS1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SuperShredder_BR_CH7S2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SuperShredder_BR_CH7S2_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SuperShredder_BR_CH7S2_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SuppressedAssaultRifle_BR_CH1S5_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SuppressedAssaultRifle_BR_CH1S5_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SuppressedAssaultRifle_BR_CH2S2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SuppressedAssaultRifle_BR_CH6MS2_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SuppressedAssaultRifle_BR_CH6MS2_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SuppressedPistol_BR_CH4S4_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SuppressedPistol_BR_CH4S4_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SuppressedPistol_BR_CH4S4_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SuppressedPistol_BR_CH4S4_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SuppressedPistol_BR_CH4S4_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SuppressedPistol_BR_CH6S2_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SuppressedSniperRifle_BR_CH1S7_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SuppressedSniperRifle_BR_CH1S7_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SuppressedSniperRifle_BR_CH2S2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SuppressedSubmachineGun_BR_PreSeason_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SuppressedSubmachineGun_BR_PreSeason_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SuppressedSubmachineGun_BR_PreSeason_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SuppressedSubmachineGun_BR_CH3S4_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SuppressedSubmachineGun_BR_CH3S4_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    InkquisitorsSuppressedSMG_BR_CH3S4_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SurgefireSMG_BR_CH6S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SurgefireSMG_BR_CH6S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SurgefireSMG_BR_CH6S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SurgefireSMG_BR_CH6S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SurgefireSMG_BR_CH6S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    EnhancedSurgefireSMG_BR_CH6S1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SurgicalBurstRifle_BR_CH7S3_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @deprecated
    @preload
    # Deprecated. Please use SurgicalBurstRifle_BR_CH7S3_Common instead.
    VanguardBurstRifle_BR_CH7S3_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SurgicalBurstRifle_BR_CH7S3_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @deprecated
    @preload
    # Deprecated. Please use SurgicalBurstRifle_BR_CH7S3_Uncommon instead.
    VanguardBurstRifle_BR_CH7S3_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SurgicalBurstRifle_BR_CH7S3_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @deprecated
    @preload
    # Deprecated. Please use SurgicalBurstRifle_BR_CH7S3_Rare instead.
    VanguardBurstRifle_BR_CH7S3_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SurgicalBurstRifle_BR_CH7S3_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @deprecated
    @preload
    # Deprecated. Please use SurgicalBurstRifle_BR_CH7S3_Epic instead.
    VanguardBurstRifle_BR_CH7S3_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SurgicalBurstRifle_BR_CH7S3_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @deprecated
    @preload
    # Deprecated. Please use SurgicalBurstRifle_BR_CH7S3_Legendary instead.
    VanguardBurstRifle_BR_CH7S3_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Swarmstrike_BR_CH6S4_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Swarmstrike_BR_CH6S4_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SweeperShotgun_BR_CH6S4_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SweeperShotgun_BR_CH6S4_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SweeperShotgun_BR_CH6S4_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SweeperShotgun_BR_CH6S4_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SweeperShotgun_BR_CH6S4_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    SweeperShotgun_BR_CH6S4_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TacticalAssaultRifle_BR_CH1S9_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TacticalAssaultRifle_BR_CH1S9_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TacticalAssaultRifle_BR_CH1S9_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TacticalAssaultRifle_BR_CH4S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TacticalAssaultRifle_BR_CH4S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularTacticalAssaultRifle_BR_CH5S2_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularTacticalAssaultRifle_BR_CH5S2_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularTacticalAssaultRifle_BR_CH5S2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularTacticalAssaultRifle_BR_CH5S2_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularTacticalAssaultRifle_BR_CH5S2_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TacticalAssaultRifle_BR_CH7S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TacticalAssaultRifle_BR_CH7S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TacticalAssaultRifle_BR_CH7S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TacticalAssaultRifle_BR_CH7S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TacticalAssaultRifle_BR_CH7S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TacticalDMR_BR_CH4S4_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TacticalDMR_BR_CH4S4_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TacticalDMR_BR_CH4S4_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TacticalDMR_BR_CH4S4_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TacticalDMR_BR_CH4S4_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TacticalPistol_BR_CH4S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TacticalPistol_BR_CH4S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TacticalPistol_BR_CH4S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TacticalPistol_BR_CH4S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TacticalPistol_BR_CH4S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TacticalPistol_BR_CH4S1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TacticalPistol_BR_CH7S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TacticalPistol_BR_CH7S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TacticalPistol_BR_CH7S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TacticalPistol_BR_CH7S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TacticalPistol_BR_CH7S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    OverdriveTacticalPistol_BR_CH7S1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TacticalShotgun_BR_PreSeason_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TacticalShotgun_BR_PreSeason_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TacticalShotgun_BR_PreSeason_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TacticalShotgun_BR_CH1S9_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TacticalShotgun_BR_CH1S9_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TacticalShotgun_BR_CH6MS2_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TacticalShotgun_BR_CH6MS2_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TacticalSubmachineGun_BR_PreSeason_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TacticalSubmachineGun_BR_PreSeason_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TacticalSubmachineGun_BR_PreSeason_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TacticalSubmachineGun_BR_CH1SX_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TheBigChill_BR_CH2S5_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TheDub_BR_CH2S5_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TheFoundationsRiftRifle_BR_CH7S2_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TheKneecapper_BR_CH6S2_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ThermalDMR_BR_CH4S3_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ThermalDMR_BR_CH4S3_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ThermalDMR_BR_CH4S3_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ThermalDMR_BR_CH4S3_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ThermalDMR_BR_CH4S3_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ThermalDMR_BR_CH4S3_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    DiamondsThermalDMR_BR_CH4S4_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ThermalScopedAssaultRifle_BR_CH1S4_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ThermalScopedAssaultRifle_BR_CH1S4_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HuntmasterSabersThermalRifle_BR_CH3S2_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TheVoidbladesBurstRifle_BR_CH7S3_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularThunderBurstSMG_BR_CH5S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularThunderBurstSMG_BR_CH5S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularThunderBurstSMG_BR_CH5S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularThunderBurstSMG_BR_CH5S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularThunderBurstSMG_BR_CH5S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ThunderBurstSMG_Ballistic_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ThunderShotgun_BR_CH4S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ThunderShotgun_BR_CH4S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ThunderShotgun_BR_CH4S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ThunderShotgun_BR_CH4S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ThunderShotgun_BR_CH4S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TNTinasKaBoomBow_BR_CH2S2_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TowHookCannon_BR_CH5S3_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Trouble_BR_CH6S4_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TwinfireAutoShotgun_BR_CH6S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TwinfireAutoShotgun_BR_CH6S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TwinfireAutoShotgun_BR_CH6S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TwinfireAutoShotgun_BR_CH6S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TwinfireAutoShotgun_BR_CH6S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    EnhancedTwinfireAutoShotgun_BR_CH6S1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    LawlessTwinfireSlapShotgun_BR_CH6S2_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TwinHammerShotguns_BR_CH7S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TwinHammerShotguns_BR_CH7S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TwinHammerShotguns_BR_CH7S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TwinHammerShotguns_BR_CH7S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TwinHammerShotguns_BR_CH7S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    BrutusTwinHammerShotguns_BR_CH7S1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TwinMagAssaultRifle_BR_CH4S4_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TwinMagAssaultRifle_BR_CH4S4_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TwinMagAssaultRifle_BR_CH4S4_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TwinMagAssaultRifle_BR_CH4S4_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TwinMagAssaultRifle_BR_CH4S4_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TwinMagSMG_BR_CH4S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TwinMagSMG_BR_CH4S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TwinMagSMG_BR_CH4S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TwinMagSMG_BR_CH4S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TwinMagSMG_BR_CH4S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HeistedBlinkMagSMG_BR_CH4S1_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TwoShotShotgun_BR_CH3S3_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TwoShotShotgun_BR_CH3S3_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TwoShotShotgun_BR_CH3S3_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TwoShotShotgun_BR_CH3S3_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TwoShotShotgun_BR_CH3S3_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TwoShotShotgun_BR_CH3S3_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TyphoonBlade_BR_CH6S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    TyphoonBlade_BR_CH6S1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    UnstableBow_BR_CH2S6_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    UnstableFrostfireShotgun_BR_CH6S3_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Vector7DMR_BR_CH7S2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Vector7DMR_BR_CH7S2_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Vector7DMR_BR_CH7S2_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    VeiledPrecisionSMG_BR_CH6S1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    VeiledPrecisionSMG_BR_CH6S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    VeiledPrecisionSMG_BR_CH6S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    VeiledPrecisionSMG_BR_CH6S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    VeiledPrecisionSMG_BR_CH6S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    NightRoseVeiledPrecisionSMG_BR_CH6S1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    EradicatorShadowPrecisionSMG_BR_CH6S4_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    VeiledPrecisionSMG_Ballistic_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    VengefulSniperRifle_BR_CH7S1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    VengefulSniperRifle_BR_CH7S1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    VengefulSniperRifle_BR_CH7S1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    VengefulSniperRifle_BR_CH7S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularWarforgedAssaultRifle_BR_CH5S2_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularWarforgedAssaultRifle_BR_CH5S2_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularWarforgedAssaultRifle_BR_CH5S2_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularWarforgedAssaultRifle_BR_CH5S2_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    ModularWarforgedAssaultRifle_BR_CH5S2_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    AresModularWarforgedAssaultRifle_BR_CH5S2_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    WoodStakeShotgun_BR_CH4S4_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    WoodStakeShotgun_BR_CH4S4_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    WoodStakeShotgun_BR_CH4S4_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    HighStakesShotgun_BR_CH4S4_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    WreckerRevolver_BR_CH6S4_Common<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    WreckerRevolver_BR_CH6S4_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    WreckerRevolver_BR_CH6S4_Rare<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    WreckerRevolver_BR_CH6S4_Epic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    WreckerRevolver_BR_CH6S4_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    EnhancedWreckerRevolver_BR_CH6S4_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    EradicatorMarksmanWreckerRevolver_BR_CH6S4_Exotic<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @preload
    Zapotron_OG_CH1S2_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}

    @deprecated
    @preload
    # Deprecated. Please use Zapotron_OG_CH1S2_Legendary instead.
    Zapotron_OG_CH1S1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
        @available {MinUploadedAtFNVersion := 4000}
        ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        IconComponent<override>:?icon_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        RarityComponent<override>:?rarity_component = external {}