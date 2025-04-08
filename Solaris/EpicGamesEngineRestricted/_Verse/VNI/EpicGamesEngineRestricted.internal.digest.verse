# Module import path: /Verse.org/Temporary/EpicGamesRestricted
EpicGamesRestricted<public> := module:
    # Module import path: /Verse.org/Temporary/EpicGamesRestricted/Network
    Network<public> := module:
        @attribscope_data
        @customattribhandler
        replicated_attribute<epic_internal> := class<computes><internal>(attribute):


        replicated<constructor><epic_internal>(ReplicationArgs:string)<computes>:replicated_attribute = external {}