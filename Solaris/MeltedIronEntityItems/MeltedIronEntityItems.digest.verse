# Verse path: /Fortnite.com
using {/Verse.org/Native}
@available {MinUploadedAtFNVersion := 4000}
# Module import path: /Fortnite.com/Items
Items<public> := module:
    # Module import path: /Fortnite.com/Items/TMNT
    (/Fortnite.com/Items:)TMNT<public> := module:
        using {/Verse.org/SceneGraph}
        TMNTPizzaParty_V1_Epic<public> := class<concrete>(entity):


@available {MinUploadedAtFNVersion := 4000}
# Module import path: /Fortnite.com/Weapons
Weapons<public> := module:
    # Module import path: /Fortnite.com/Weapons/TMNT
    (/Fortnite.com/Weapons:)TMNT<public> := module:
        using {/Verse.org/SceneGraph}
        DonatellosStaff_V1_Mythic<public> := class<concrete>(entity):


        LeonardosKatanas_V1_Mythic<public> := class<concrete>(entity):


        MichelangelosNunchaku_V1_Mythic<public> := class<concrete>(entity):


        RaphaelsSai_V1_Mythic<public> := class<concrete>(entity):
