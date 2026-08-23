# Verse path: /Fortnite.com
# Module import path: /Fortnite.com/VerseNPC
VerseNPC<public> := module:
    using {/Verse.org/Native}
    using {/Fortnite.com/Animation/PlayAnimation}
    using {/Verse.org/Presentation}
    using {/Verse.org/Simulation}
    using {/Verse.org/SceneGraph}
    using {/Fortnite.com/AI}
    default_behavior<epic_internal> := class(npc_behavior):


    @available {MinUploadedAtFNVersion := 4200}
    # The entity prefab for a creator customizable wildlife
    wildlife_template<native><epic_internal> := class<concrete>(entity):
        @field("Components")
        NPCComponent<native><epic_internal>:fort_npc_component = external {}

        @field("Components")
        IconComponent<native><public>:icon_component = external {}

        @field("Components")
        DescriptionComponent<native><public>:description_component = external {}

        @field("Components")
        PlayAnimationComponent<native><epic_internal>:fort_npc_play_animation_component = external {}

        @field("Components")
        ActionsComponent<native><public>:npc_actions_component = external {}

        @field("Components")
        AwarenessComponent<native><public>:npc_awareness_component = external {}

        @field("Components")
        NPCBehaviorComponent<native><epic_internal>:npc_behavior_component = external {}