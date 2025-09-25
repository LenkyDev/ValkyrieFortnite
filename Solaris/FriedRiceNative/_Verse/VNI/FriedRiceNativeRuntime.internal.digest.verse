using {/Verse.org/Simulation}
using {/Verse.org/Colors}
using {/Verse.org/Assets}
# Module import path: /Fortnite.com/FriedRice/UI
UI<public> := module:
    fr_player_ui_display_info<native><epic_internal> := struct:
        AvatarLargeImage<native>:texture

        AvatarSmallImage<native>:texture

        AvatarBackgroundColor<native>:color

        AvatarHighlightColor<native>:color

        SquadColor<native>:color

    fr_player_ui_display_info_manager<native><epic_internal> := class:
        GetDisplayInfo<native><epic_internal>(InPlayer:player)<reads>:fr_player_ui_display_info