# Module import path: /UnrealEngine.com/EpicGamesRestricted
EpicGamesRestricted<public> := module:
    # Module import path: /UnrealEngine.com/EpicGamesRestricted/Network
    Network<public> := module:
        @attribscope_data
        @customattribhandler
        replicated_attribute<epic_internal> := class<computes><internal>(attribute):


        replicated<constructor><epic_internal>(ReplicationArgs:string)<computes>:replicated_attribute = external {}