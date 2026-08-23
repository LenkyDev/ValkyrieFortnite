# Verse path: /Fortnite.com
# Module import path: /Fortnite.com/SquareClubFNENative
SquareClubFNENative<public> := module:
    # Module import path: /Fortnite.com/SquareClubFNENative/Abilities
    (/Fortnite.com/SquareClubFNENative:)Abilities<public> := module:
        using {/Verse.org/SpatialMath}
        using {/Verse.org/SceneGraph}
        using {/Verse.org/Simulation}
        (Agent:agent).TriggerAbilityByPath<native><epic_internal>(AbilityPath:string):void

        (Agent:agent).TriggerAbilityByPathWithTargets<native><epic_internal>(AbilityPath:string, Target:[]agent):void

        LoadAbilityByPath<native><epic_internal>(AbilityPath:string):void

        ConvertPlayerBuildsInAreaNeutral<native><epic_internal>(Entity:entity, Center:(/Verse.org/SpatialMath:)vector3, VerseRotation:(/Verse.org/SpatialMath:)rotation, VerseDimensions:(/Verse.org/SpatialMath:)vector3):void

        RemovePlayerBuildsInArea<native><epic_internal>(Entity:entity, Center:(/Verse.org/SpatialMath:)vector3, VerseRotation:(/Verse.org/SpatialMath:)rotation, VerseDimensions:(/Verse.org/SpatialMath:)vector3):void

        RemovePlayerBuildsInAreaOverTime<native><epic_internal>(Entity:entity, Center:(/Verse.org/SpatialMath:)vector3, VerseRotation:(/Verse.org/SpatialMath:)rotation, VerseDimensions:(/Verse.org/SpatialMath:)vector3, TimeBetween:float):void