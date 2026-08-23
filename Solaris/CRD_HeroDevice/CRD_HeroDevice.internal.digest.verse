# Verse path: /Fortnite.com/Devices
using {/Verse.org/Simulation}
# Used to apply a temporary hero transformation to a player.
# The transformation to apply is specified on the device, as are the conditions for when the transformation will end.
hero_device<public> := class<concrete><final>(creative_device_base):
    # Applies the hero transformation to the provided `player`.
    # If the provided `player` does not pass the device's filter settings, or if another transformation is already present and the device's *Stomp Existing Transformation* option is set to false, the transformation will not be applied.
    ApplyTransformation<public>(Player:player):void = external {}

    # Removes the transformation applied by this device, if it exists, from the provided `player`.
    RemoveTransformation<public>(Player:player):void = external {}

    # Removes the transformations applied by this device, if it exists, from all players
    RemoveAllMyTransformations<public>():void = external {}

    # Removes any applied hero transformations from `player`.
    # Includes hero transformations applied by any hero device instance.
    RemoveAnyTransformation<public>(Player:player):void = external {}

    # Succeeds if the provided `player` has a hero transformation applied from this device.
    IsTransformationApplied<public>(Player:player)<transacts><decides>:void = external {}

    # Signaled when a hero transformation from this device is successfully applied to `player`.
    ApplyTransformationEvent<public>:listenable(player) = external {}

    # Signaled when a transformation applied by this device on `player` is removed.
    # Removal can occur from calling the *Remove Transformation* function, or from getting replaced by another transformation.
    # This event will not trigger if the transformation is ended due to outlined conditions or elimination.
    RemoveTransformationEvent<public>:listenable(player) = external {}

    # Signaled when a transformation applied by this device on `player` ends.
    # The second optional `agent` describes who ended the transformation if ended by elimination.
    # The conditions outlining when a transformation will end are set in the device's user options.
    TransformedPlayerEliminateEvent<public>:listenable(tuple(player, ?agent)) = external {}

    GetBPFunctionNamesForValidation<override>():[]string = external {}