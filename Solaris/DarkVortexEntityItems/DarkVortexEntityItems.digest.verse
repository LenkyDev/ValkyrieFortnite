# Verse path: /Fortnite.com
using {/Verse.org/Native}
@available {MinUploadedAtFNVersion := 4000}
# Module import path: /Fortnite.com/Weapons
Weapons<public> := module:
    # Module import path: /Fortnite.com/Weapons/TheWalkingDead
    TheWalkingDead<public> := module:
        using {/Verse.org/SceneGraph}
        Lucille_V1_Mythic<public> := class<concrete>(entity):


        ShivaShotgun_V1_Mythic<public> := class<concrete>(entity):
