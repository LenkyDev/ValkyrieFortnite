# Verse path: /Fortnite.com
# Module import path: /Fortnite.com/Items
Items<public> := module:
    # Module import path: /Fortnite.com/Items/StarWars
    (/Fortnite.com/Items:)StarWars<public> := module:
        using {/Verse.org/Native}
        using {/UnrealEngine.com/Itemization}
        using {/Fortnite.com/Itemization}
        @available {MinUploadedAtFNVersion := 4020}
        @preload
        Jetpack_V1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        # Force Lightning as an augment item. Only usable with a lightsaber equipped.
        ForcePowerLightning_LightsaberAugment_V1<native><public> := class<concrete><final>(fort_item_definition_entity_base):


        @available {MinUploadedAtFNVersion := 4020}
        @preload
        # Force Push as an augment item. Only usable with a lightsaber equipped.
        ForcePowerPush_LightsaberAugment_V1<native><public> := class<concrete><final>(fort_item_definition_entity_base):


        @available {MinUploadedAtFNVersion := 4020}
        @preload
        # Force Pull as an augment item. Only usable with a lightsaber equipped.
        ForcePowerPull_LightsaberAugment_V1<native><public> := class<concrete><final>(fort_item_definition_entity_base):


        @available {MinUploadedAtFNVersion := 4020}
        @preload
        # Force Throw as an augment item. Only usable with a lightsaber equipped.
        ForcePowerThrow_LightsaberAugment_V1<native><public> := class<concrete><final>(fort_item_definition_entity_base):


        @available {MinUploadedAtFNVersion := 4020}
        @preload
        # Force Shield as an augment item. Only usable with a lightsaber equipped.
        ForcePowerShield_LightsaberAugment_V1<native><public> := class<concrete><final>(fort_item_definition_entity_base):


        @available {MinUploadedAtFNVersion := 4020}
        @preload
        # Force Heal as an augment item. Only usable with a lightsaber equipped.
        ForcePowerHeal_LightsaberAugment_V1<native><public> := class<concrete><final>(fort_item_definition_entity_base):


        @available {MinUploadedAtFNVersion := 4020}
        @preload
        # Force Training (Jump & Sprint) as an augment item.
        ForcePowerTraining_Augment_V1<native><public> := class<concrete><final>(fort_item_definition_entity_base):


        @available {MinUploadedAtFNVersion := 4020}
        @preload
        # Force Awareness as an augment item. Only usable with a lightsaber equipped.
        ForcePowerAwareness_LightsaberAugment_V1<native><public> := class<concrete><final>(fort_item_definition_entity_base):


        @available {MinUploadedAtFNVersion := 4020}
        @preload
        # Force Mind Trick as an augment item. Only usable with a lightsaber equipped.
        ForcePowerTrick_LightsaberAugment_V1<native><public> := class<concrete><final>(fort_item_definition_entity_base):


        @available {MinUploadedAtFNVersion := 4020}
        @preload
        # Force Distraction as an augment item. Only usable with a lightsaber equipped.
        ForcePowerDistraction_LightsaberAugment_V1<native><public> := class<concrete><final>(fort_item_definition_entity_base):


        @available {MinUploadedAtFNVersion := 4020}
        @preload
        # Force Saber Throw as an augment item. Only usable with a lightsaber equipped.
        ForcePowerSaberThrow_LightsaberAugment_V1<native><public> := class<concrete><final>(fort_item_definition_entity_base):


# Module import path: /Fortnite.com/Weapons
Weapons<public> := module:
    # Module import path: /Fortnite.com/Weapons/StarWars
    (/Fortnite.com/Weapons:)StarWars<public> := module:
        using {/Verse.org/Native}
        using {/UnrealEngine.com/Itemization}
        using {/Fortnite.com/Itemization}
        @available {MinUploadedAtFNVersion := 4020}
        @preload
        AmbanSniperRifle_V1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        AmbanSniperRifle_InfiniteAmmo_V1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        E11BlasterRifle_V1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        DC15BlasterRifle_V1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        BARMST12ScatterBlaster_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        BARMST12ScatterBlaster_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        BARMST12ScatterBlaster_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        BARMST12ScatterBlaster_V1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        BARMST12ScatterBlaster_V1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        BARMST12ScatterBlaster_V1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        CR2Blaster_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        CR2Blaster_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        CR2Blaster_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        CR2Blaster_V1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        CR2Blaster_V1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        CR2Blaster_V1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        DLT19BlasterRifle_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        DLT19BlasterRifle_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        DLT19BlasterRifle_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        DLT19BlasterRifle_V1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        DLT19BlasterRifle_V1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        DLT19BlasterRifle_V1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        ACPScatterBlaster_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        ACPScatterBlaster_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        ACPScatterBlaster_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        ACPScatterBlaster_V1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        ACPScatterBlaster_V1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        ACPScatterBlaster_V1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        A280CFEBlasterRifle_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        A280CFEBlasterRifle_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        A280CFEBlasterRifle_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        A280CFEBlasterRifle_V1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        A280CFEBlasterRifle_V1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        A280CFEBlasterRifle_V1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        CA87JawaScatterBlaster_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        CA87JawaScatterBlaster_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        CA87JawaScatterBlaster_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        CA87JawaScatterBlaster_V1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        CA87JawaScatterBlaster_V1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        CA87JawaScatterBlaster_V1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        WESTAR34BlasterPistols_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        WESTAR34BlasterPistols_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        WESTAR34BlasterPistols_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        WESTAR34BlasterPistols_V1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        WESTAR34BlasterPistols_V1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        WESTAR34BlasterPistols_V1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        IQA11MarksmanBlasterRifle_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        IQA11MarksmanBlasterRifle_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        IQA11MarksmanBlasterRifle_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        IQA11MarksmanBlasterRifle_V1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        IQA11MarksmanBlasterRifle_V1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        IQA11MarksmanBlasterRifle_V1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        DL44BlasterPistol_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        DL44BlasterPistol_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        DL44BlasterPistol_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        DL44BlasterPistol_V1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        DL44BlasterPistol_V1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        DL44BlasterPistol_V1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        F11DBlaster_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        F11DBlaster_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        F11DBlaster_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        F11DBlaster_V1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        F11DBlaster_V1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        F11DBlaster_V1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        WookieeBowcaster_V1_Common<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        WookieeBowcaster_V1_Uncommon<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        WookieeBowcaster_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        WookieeBowcaster_V1_Epic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        WookieeBowcaster_V1_Legendary<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        WookieeBowcaster_V1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        ThermalImploder_V1_Rare<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        ThermalImploder_V1_Mythic<public> := class<final><concrete>(fort_item_definition_entity):
            @available {MinUploadedAtFNVersion := 4000}
            ItemComponent<override>:item_component = external {}

        @available {MinUploadedAtFNVersion := 4020}
        @preload
        # Force Lightning as a weapon item. Must be equipped to use.
        ForcePowerLightning_Weapon_V1<native><public> := class<concrete><final>(fort_item_definition_entity_base):


        @available {MinUploadedAtFNVersion := 4020}
        @preload
        # Force Push as a weapon item. Must be equipped to use.
        ForcePowerPush_Weapon_V1<native><public> := class<concrete><final>(fort_item_definition_entity_base):


        @available {MinUploadedAtFNVersion := 4020}
        @preload
        # Force Pull as a weapon item. Must be equipped to use.
        ForcePowerPull_Weapon_V1<native><public> := class<concrete><final>(fort_item_definition_entity_base):


        @available {MinUploadedAtFNVersion := 4020}
        @preload
        # Force Throw as a weapon item. Must be equipped to use.
        ForcePowerThrow_Weapon_V1<native><public> := class<concrete><final>(fort_item_definition_entity_base):


        @available {MinUploadedAtFNVersion := 4020}
        @preload
        # Force Shield as a weapon item. Must be equipped to use.
        ForcePowerShield_Weapon_V1<native><public> := class<concrete><final>(fort_item_definition_entity_base):


        @available {MinUploadedAtFNVersion := 4020}
        @preload
        # Force Heal as a weapon item. Must be equipped to use.
        ForcePowerHeal_Weapon_V1<native><public> := class<concrete><final>(fort_item_definition_entity_base):


        @available {MinUploadedAtFNVersion := 4020}
        @preload
        # Force Awareness as a weapon item. Must be equipped to use.
        ForcePowerAwareness_Weapon_V1<native><public> := class<concrete><final>(fort_item_definition_entity_base):


        @available {MinUploadedAtFNVersion := 4020}
        @preload
        # Force Mind Trick as a weapon item. Must be equipped to use.
        ForcePowerTrick_Weapon_V1<native><public> := class<concrete><final>(fort_item_definition_entity_base):


        @available {MinUploadedAtFNVersion := 4020}
        @preload
        # Force Distraction as a weapon item. Must be equipped to use.
        ForcePowerDistraction_Weapon_V1<native><public> := class<concrete><final>(fort_item_definition_entity_base):


        @available {MinUploadedAtFNVersion := 4020}
        @preload
        # Force Saber Throw as a weapon item. Must be equipped to use.
        ForcePowerSaberThrow_Weapon_V1<native><public> := class<concrete><final>(fort_item_definition_entity_base):


        @available {MinUploadedAtFNVersion := 4020}
        @preload
        LightsaberKenobi_V1<native><public> := class<final><concrete>(fort_item_definition_entity_base):


        @available {MinUploadedAtFNVersion := 4020}
        @preload
        LightsaberRen_V1<native><public> := class<concrete><final>(fort_item_definition_entity_base):


        @available {MinUploadedAtFNVersion := 4020}
        @preload
        LightsaberRey_V1<native><public> := class<concrete><final>(fort_item_definition_entity_base):


        @available {MinUploadedAtFNVersion := 4020}
        @preload
        LightsaberSkywalker_V1<native><public> := class<concrete><final>(fort_item_definition_entity_base):


        @available {MinUploadedAtFNVersion := 4020}
        @preload
        LightsaberVader_V1<native><public> := class<concrete><final>(fort_item_definition_entity_base):


        @available {MinUploadedAtFNVersion := 4020}
        @preload
        LightsaberWindu_V1<native><public> := class<concrete><final>(fort_item_definition_entity_base):


        @available {MinUploadedAtFNVersion := 4020}
        @preload
        LightsaberJediPadawanA_V1<native><public> := class<concrete><final>(fort_item_definition_entity_base):


        @available {MinUploadedAtFNVersion := 4020}
        @preload
        LightsaberJediPadawanB_V1<native><public> := class<concrete><final>(fort_item_definition_entity_base):


        @available {MinUploadedAtFNVersion := 4020}
        @preload
        LightsaberJediTraining_V1<native><public> := class<concrete><final>(fort_item_definition_entity_base):


        @available {MinUploadedAtFNVersion := 4020}
        @preload
        LightsaberSithApprentice_V1<native><public> := class<concrete><final>(fort_item_definition_entity_base):
