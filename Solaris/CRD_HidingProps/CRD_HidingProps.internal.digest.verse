using {/Verse.org/Simulation}
# The hiding prop device can be used to give players a place to hide, or to allow players a special way to commence a Hidden Travel to another Hiding prop.
hiding_prop_device<public> := class<concrete><final>(creative_device_base, enableable):
    # Enable this device.
    #  When this device is enabled, it can be interacted with.
    Enable<override>():void = external {}

    # Disable this device.
    #  When this device is disabled, it cannot be interacted with.
    Disable<override>():void = external {}

    # Succeeds if the object is enabled, fails if it's disabled.
    IsEnabled<override>()<transacts><decides>:void = external {}

    # Eject a specific player from this hiding prop.
    EjectHiddenPlayer<public>(Player:player)<transacts><decides>:void = external {}

    # Eject all players hiding in this hiding prop.
    #  Returns an array of all players that were ejected.
    EjectAllHiddenPlayers<public>():[]player = external {}

    # Hides all players within the provided meters of a hiding prop.
    #  Returns an array of all players that were hidden.
    #  This event will not allow more players than is specified in 'MaxNumberOfOccupants' to be hidden in this device.
    HideNearbyPlayers<public>(DistanceInMeters:float):[]player = external {}

    # Signaled when a player hides in this Hiding prop.
    BeginPlayerHideEvent<public>:listenable(player) = external {}

    # Signaled when a player stops hiding in this hiding prop.
    EndPlayerHideEvent<public>:listenable(player) = external {}

    # Signaled when a hidden travel completes to another hiding prop.
    PlayerHiddenTravelEvent<public>:listenable(tuple(player, hiding_prop_device)) = external {}

    # This value maps to the 'Max Number Of Occupants' user option.
    #  Determines how many players can hide in this prop at one time.
    #  Modifying this value will not eject any players who are currently hiding, but will otherwise take effect immediately.
    var MaxNumberOfOccupants<public>:int = external {}

    # This value maps to the 'Should Wobble While Hiding' user option.
    #  Modifying this value will take effect the next time a player hides inside of this device.
    #  By default, the prop alerts other players with sound and animation that a player is hiding in the prop. Set this to Off to disable these effects.
    var ShouldWobbleWhileHiding<public>:logic = external {}

    # This value maps to the 'Max Hiding Time' user option.
    #  Sets a maximum amount of time a player can hide in the prop before being ejected.
    #  Setting this value to False will disable any limit to how long a player can hide.
    #  Modifying this value will instantly take effect, if any players hiding are now exceeding the Max Hiding time, they will be immediately ejected.
    var MaxHideTime<public>:?float = external {}

    # This value maps to the 'Block Hide Time' user option.
    #  When a player leaves the prop, this determines the amount of time another player must wait before they can hide in the prop.
    #  Modifying this value will not affect any player who is currently blocked from hiding, but will affect all players who eject from the hiding prop after it has been modified.
    var BlockHideTime<public>:float = external {}

    # This value maps to the 'Hidden Travel Group' user option.
    #  To make use of the hidden travel feature, you must assign this hiding prop to a Hidden Travel Group.
    #  Modifying this value will take effect the next time a player attempts a hidden travel.
    #  Leaving this value unset will make it so other hiding_prop_device are ineligible to travel to this one.
    var HiddenTravelGroup<public>:?int = external {}

    # This value maps to the 'Hidden Travel Target Group' user option.
    #  Determines which group of hiding props can be targeted as a hidden travel destination.
    #  You can set this to the same value as the Hidden Travel Group option, or if you have multiple groups of hiding props you can target a different group.
    #  Modifying this value will take effect the next time a player attempts a hidden travel.
    #  Leaving this value unset means that this hiding_prop_device will not be able to cause a Hidden Travel when players hide inside of it.
    var HiddenTravelTargetGroup<public>:?int = external {}

    # This value maps to the 'Attempt No Repeat Destinations' user option.
    #  If this is set to On, the prop will avoid sending a player to the previous hiding prop twice in a row, unless there is no other hiding prop available.
    #  Modifying this value will take effect the next time a player attempts a hidden travel.
    #  Leaving this value unset means that this hiding_prop_device will not be able to initiate hidden travel.
    var AttemptNoRepeatDestinations<public>:logic = external {}

    # This value controls whether or not Hidden Travel is enabled or disabled
    #  Modifying this value will take effect the next time a player attempts a hidden travel.
    var EnableHiddenTravel<public>:logic = external {}

    GetBPFunctionNamesForValidation<override>():[]string = external {}