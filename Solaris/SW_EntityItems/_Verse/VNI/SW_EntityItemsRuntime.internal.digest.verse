# Module import path: /Fortnite.com/Items/ForcePower
ForcePower<public> := module:
    # Module import path: /Fortnite.com/Items/ForcePower/StarWars
    (/Fortnite.com/Items/ForcePower:)StarWars<public> := module:
        using {/Fortnite.com/Itemization}
        @experimental
        # Force Lightning as a weapon item. Must be equipped to use.
        ForcePowerLightning_Weapon<native><public> := class<concrete><final>(fort_item_definition_entity_base):
            ItemDefinitionID<override>:string = external {}

        @experimental
        # Force Lightning as an augment item. Only usable with a lightsaber equipped.
        ForcePowerLightning_LightsaberAugment<native><public> := class<concrete><final>(fort_item_definition_entity_base):
            ItemDefinitionID<override>:string = external {}

        @experimental
        # Force Push as a weapon item. Must be equipped to use.
        ForcePowerPush_Weapon<native><public> := class<concrete><final>(fort_item_definition_entity_base):
            ItemDefinitionID<override>:string = external {}

        @experimental
        # Force Push as an augment item. Only usable with a lightsaber equipped.
        ForcePowerPush_LightsaberAugment<native><public> := class<concrete><final>(fort_item_definition_entity_base):
            ItemDefinitionID<override>:string = external {}

        @experimental
        # Force Pull as a weapon item. Must be equipped to use.
        ForcePowerPull_Weapon<native><public> := class<concrete><final>(fort_item_definition_entity_base):
            ItemDefinitionID<override>:string = external {}

        @experimental
        # Force Pull as an augment item. Only usable with a lightsaber equipped.
        ForcePowerPull_LightsaberAugment<native><public> := class<concrete><final>(fort_item_definition_entity_base):
            ItemDefinitionID<override>:string = external {}

        @experimental
        # Force Throw as a weapon item. Must be equipped to use.
        ForcePowerThrow_Weapon<native><public> := class<concrete><final>(fort_item_definition_entity_base):
            ItemDefinitionID<override>:string = external {}

        @experimental
        # Force Throw as an augment item. Only usable with a lightsaber equipped.
        ForcePowerThrow_LightsaberAugment<native><public> := class<concrete><final>(fort_item_definition_entity_base):
            ItemDefinitionID<override>:string = external {}

        @experimental
        # Force Shield as a weapon item. Must be equipped to use.
        ForcePowerShield_Weapon<native><public> := class<concrete><final>(fort_item_definition_entity_base):
            ItemDefinitionID<override>:string = external {}

        @experimental
        # Force Shield as an augment item. Only usable with a lightsaber equipped.
        ForcePowerShield_LightsaberAugment<native><public> := class<concrete><final>(fort_item_definition_entity_base):
            ItemDefinitionID<override>:string = external {}

        @experimental
        # Force Heal as a weapon item. Must be equipped to use.
        ForcePowerHeal_Weapon<native><public> := class<concrete><final>(fort_item_definition_entity_base):
            ItemDefinitionID<override>:string = external {}

        @experimental
        # Force Heal as an augment item. Only usable with a lightsaber equipped.
        ForcePowerHeal_LightsaberAugment<native><public> := class<concrete><final>(fort_item_definition_entity_base):
            ItemDefinitionID<override>:string = external {}

        @experimental
        # Force Training (Jump & Sprint) as an augment item.
        ForcePowerTraining_Augment<native><public> := class<concrete><final>(fort_item_definition_entity_base):
            ItemDefinitionID<override>:string = external {}

        @experimental
        # Force Awareness as a weapon item. Must be equipped to use.
        ForcePowerAwareness_Weapon<native><public> := class<concrete><final>(fort_item_definition_entity_base):
            ItemDefinitionID<override>:string = external {}

        @experimental
        # Force Awareness as an augment item. Only usable with a lightsaber equipped.
        ForcePowerAwareness_LightsaberAugment<native><public> := class<concrete><final>(fort_item_definition_entity_base):
            ItemDefinitionID<override>:string = external {}

        @experimental
        # Force Mind Trick as a weapon item. Must be equipped to use.
        ForcePowerTrick_Weapon<native><public> := class<concrete><final>(fort_item_definition_entity_base):
            ItemDefinitionID<override>:string = external {}

        @experimental
        # Force Mind Trick as an augment item. Only usable with a lightsaber equipped.
        ForcePowerTrick_LightsaberAugment<native><public> := class<concrete><final>(fort_item_definition_entity_base):
            ItemDefinitionID<override>:string = external {}

        @experimental
        # Force Distraction as a weapon item. Must be equipped to use.
        ForcePowerDistraction_Weapon<native><public> := class<concrete><final>(fort_item_definition_entity_base):
            ItemDefinitionID<override>:string = external {}

        @experimental
        # Force Distraction as an augment item. Only usable with a lightsaber equipped.
        ForcePowerDistraction_LightsaberAugment<native><public> := class<concrete><final>(fort_item_definition_entity_base):
            ItemDefinitionID<override>:string = external {}

        @experimental
        # Force Saber Throw as a weapon item. Must be equipped to use.
        ForcePowerSaberThrow_Weapon<native><public> := class<concrete><final>(fort_item_definition_entity_base):
            ItemDefinitionID<override>:string = external {}

        @experimental
        # Force Saber Throw as an augment item. Only usable with a lightsaber equipped.
        ForcePowerSaberThrow_LightsaberAugment<native><public> := class<concrete><final>(fort_item_definition_entity_base):
            ItemDefinitionID<override>:string = external {}

# Module import path: /Fortnite.com/Items/Lightsaber
Lightsaber<public> := module:
    # Module import path: /Fortnite.com/Items/Lightsaber/StarWars
    (/Fortnite.com/Items/Lightsaber:)StarWars<public> := module:
        using {/Fortnite.com/Itemization}
        @experimental
        LightsaberKenobi<native><public> := class<final><concrete>(fort_item_definition_entity_base):
            ItemDefinitionID<override>:string = external {}

        @experimental
        LightsaberRen<native><public> := class<concrete><final>(fort_item_definition_entity_base):
            ItemDefinitionID<override>:string = external {}

        @experimental
        LightsaberRey<native><public> := class<concrete><final>(fort_item_definition_entity_base):
            ItemDefinitionID<override>:string = external {}

        @experimental
        LightsaberSkywalker<native><public> := class<concrete><final>(fort_item_definition_entity_base):
            ItemDefinitionID<override>:string = external {}

        @experimental
        LightsaberVader<native><public> := class<concrete><final>(fort_item_definition_entity_base):
            ItemDefinitionID<override>:string = external {}

        @experimental
        LightsaberWindu<native><public> := class<concrete><final>(fort_item_definition_entity_base):
            ItemDefinitionID<override>:string = external {}

        @experimental
        LightsaberJediPadawanA<native><public> := class<concrete><final>(fort_item_definition_entity_base):
            ItemDefinitionID<override>:string = external {}

        @experimental
        LightsaberJediPadawanB<native><public> := class<concrete><final>(fort_item_definition_entity_base):
            ItemDefinitionID<override>:string = external {}

        @experimental
        LightsaberJediTraining<native><public> := class<concrete><final>(fort_item_definition_entity_base):
            ItemDefinitionID<override>:string = external {}

        @experimental
        LightsaberSithApprentice<native><public> := class<concrete><final>(fort_item_definition_entity_base):
            ItemDefinitionID<override>:string = external {}