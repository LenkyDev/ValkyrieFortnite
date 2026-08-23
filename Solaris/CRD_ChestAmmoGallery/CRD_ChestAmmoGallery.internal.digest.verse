# Verse path: /Fortnite.com/Devices
using {/Verse.org/Simulation}
hero_chest_rank<public> := enum<open>:
    C
    B
    A
    S

# An indestructible chest that can be locked and unlocked.
hero_chest_device<public> := class<concrete><final>(creative_device_base, enableable):
    # Enable the device, allowing interaction.
    Enable<override>():void = external {}

    # Disable the device. While disabled, the chest can't be interacted with.
    Disable<override>():void = external {}

    # Succeeds if the device is enabled, fails if it's disabled.
    IsEnabled<override>()<transacts><decides>:void = external {}

    # Triggers whenever the chest is opened, returning the `agent` who opened it if applicable.
    OpenEvent<public>:listenable(?agent) = external {}

    # Open the chest.
    Open<public>():void = external {}

    # Succeeds if the chest is currently open, fails if it's closed.
    IsOpen<public>()<transacts><decides>:void = external {}

    # Lock the chest for everyone, and set this chest's default state to Locked.
    LockForAll<public>():void = external {}

    # Unlock the chest for everyone, and set this chest's default state to Unlocked.
    UnlockForAll<public>():void = external {}

    # Succeeds if the chest's default locked state is Locked.
    #  * The default locked state is initialized by the *Start Locked* user option and is overridden by *LockForAll* and *UnlockForAll*.
    IsLockedForAll<public>()<transacts><decides>:void = external {}

    # Lock the chest for `Agent`. Has no effect if the chest is open.
    Lock<public>(Agent:agent):void = external {}

    # Unlock the chest for `Agent`. Has no effect if the chest is open.
    Unlock<public>(Agent:agent):void = external {}

    # Succeeds if the chest is locked for `Agent`.
    IsLocked<public>(Agent:agent)<transacts><decides>:void = external {}

    # Close the chest, refresh its loot, and set the chest to its default locked state for everyone.
    #  * The default locked state is initialized by the *Start Locked* user option and is overridden by *LockForAll* and *UnlockForAll*.
    (/Fortnite.com/Devices/hero_chest_device:)Reset<public>():void = external {}

    # Determines the hologram that appears above the chest, as well as the loot the chest contains.
    #  * From low to high, the ranks are C, B, A, and S.
    var ChestRank<public>:hero_chest_rank = external {}

    # Returns the chest rank as a `string`.
    GetRankAsString<public>():string = external {}

    # Whether to show the rank hologram while the chest is closed.
    var ShowHologram<public>:logic = external {}

    # Text shown when interacting while the chest is unlocked.
    #  * By default, this says 'Loot Hero Chest'.
    var InteractText<epic_internal>:message = external {}

    # Main text shown when interacting while the chest is locked.
    #  * The default is 'Rank X Chest' where X is the value of *Rank*.
    var LockedLabel<public>:message = external {}

    # Additional text shown when interacting while the chest is locked.
    #  * By default, this says 'Unable to open'.
    var LockedSublabel<public>:message = external {}

    # Descriptive text shown when interacting while the chest is locked.
    #  * By default, this says 'You cannot open this right now.'.
    var LockedDescription<public>:message = external {}

    StringToMessage<localizes><epic_internal>(Value:string):message = external {}

    GetBPFunctionNamesForValidation<override>():[]string = external {}