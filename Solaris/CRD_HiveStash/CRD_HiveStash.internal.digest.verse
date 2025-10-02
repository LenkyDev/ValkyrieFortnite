using {/Verse.org/Simulation}
using {/Fortnite.com/Game}
hive_stash_style<public> := enum<open>:
    Empty
    Loot
    Trapped

# A strange organic object that may have something or someone inside of it.
hive_stash_device<public> := class<concrete><final>(creative_device_base, enableable, healthful):
    # Enable the device, allowing players to interact with it.
    Enable<override>():void = external {}

    # Disable the device, preventing players from interacting with it. Changes to health and state, such as those caused by damage, can still be applied.
    Disable<override>():void = external {}

    # Succeeds if the device is enabled, fails if it's disabled.
    IsEnabled<override>()<transacts><decides>:void = external {}

    # Get the device's current health.
    GetHealth<override>()<transacts>:float = external {}

    # Set the device's current health.
    SetHealth<override>(Health:float)<transacts>:void = external {}

    # Get the device's current maximum health.
    GetMaxHealth<override>()<transacts>:float = external {}

    # Set the device's current maximum health.
    SetMaxHealth<override>(MaxHealth:float)<transacts>:void = external {}

    # Triggers whenever the hive stash is opened, returning the instigating `agent` if applicable.
    OpenEvent<public>:listenable(?agent) = external {}

    # Triggers whenever an `agent` is rescued, either by the hive stash opening with a linked spawner, or by calling *RescueAgent* while the hive stash is closed.
    #  * Returns the rescued `agent`.
    RescueEvent<public>:listenable(agent) = external {}

    # Triggers when the rescue animation ends.
    #  * Returns the rescued `agent`.
    RescueAnimationEndEvent<public>:listenable(agent) = external {}

    # If `Agent` was spawned by a `guard_spawner_device` or `npc_spawner_device`, link the hive stash to that spawner. This overrides the hive stash's existing link if one exists.
    #  * Fails if `Agent` is not from a `guard_spawner_device` or `npc_spawner_device`, or if `Agent` was already eliminated.
    #  * If the hive stash opens with a linked spawner, trigger the spawner and rescue the resulting `agent` from the hive stash.
    #  * The rescued `agent` respects its spawner's events, functions, spawn count, and spawn limits.
    SetLinkedSpawnerFromAgent<public>(Agent:agent)<transacts><decides>:void = external {}

    # Link the hive stash to `GuardSpawner`. This overrides the hive stash's existing link if one exists.
    #  * If the hive stash opens with a linked spawner, trigger the spawner and rescue the resulting `agent` from the hive stash.
    #  * The rescued `agent` respects its spawner's events, functions, spawn count, and spawn limits.
    SetLinkedSpawner<public>(GuardSpawner:guard_spawner_device):void = external {}

    # Link the hive stash to `NPCSpawner`. This overrides the hive stash's existing link if one exists.
    #  * If the hive stash opens with a linked spawner, trigger the spawner and rescue the resulting `agent` from the hive stash.
    #  * The rescued `agent` respects its spawner's events, functions, spawn count, and spawn limits.
    SetLinkedSpawner<public>(NPCSpawner:npc_spawner_device):void = external {}

    # Clear the link between the hive stash and a spawner device.
    ClearSpawnerLink<public>():void = external {}

    # Succeeds if the device currently has a linked spawner, fails otherwise.
    HasLinkedSpawner<public>()<transacts><decides>:void = external {}

    # Open the hive stash. If a spawner is linked, trigger it and rescue the resulting `agent` from the hive stash.
    #  * When the `agent` is rescued, if *ShouldPlayRescuedAnimation* is `true`, they will play a short animation to get off the hive stash.
    Open<public>():void = external {}

    # Succeeds if the hive stash is currently open, fails otherwise.
    IsOpen<public>()<transacts><decides>:void = external {}

    # Teleport `Agent` to the hive stash. If *ShouldPlayRescuedAnimation* is `true`, they will play a short animation to get off the hive stash.
    #  * If the hive stash is closed, it will burst open first, ignoring a linked spawner. This will not clear a linked spawner.
    #  * Has no effect if `Agent` cannot be teleported for any reason, such as not being in the game anymore.
    RescueAgent<public>(Agent:agent):void = external {}

    # Reset the hive stash. This closes it, sets it to full health, and sets *ShouldPlayRescuedAnimation*, *CanBeDamaged*, *CanDropItems*, *InteractTextOverride*, and *HiveStashStyle* to their initial values.
    #  * This can also clear the link to a spawner depending on *ShouldKeepLinkOnReset*. 
    #  * The hive stash will not reset if the rescue animation is currently playing.
    Reset<public>():void = external {}

    # Whether to keep or clear a spawner link when *Reset* is called. Links can always be cleared with *ClearSpawnerLink*.
    #  * `true` by default.
    var ShouldKeepLinkOnReset<public>:logic = external {}

    # Whether an `agent` spawned from registered data or teleported by *FreeAgent* plays a short animation to get them off the hive stash.
    #  * The animation may not work properly on skeletons other than the average player skeleton.
    #  * `true` by default.
    var ShouldPlayRescuedAnimation<public>:logic = external {}

    # Whether the hive stash can be damaged.
    #  * `true` by default.
    var CanBeDamaged<public>:logic = external {}

    # Whether the hive stash drops items when opened. This can happen in addition to an `agent` being rescued.
    #  * `true` by default.
    var CanDropItems<public>:logic = external {}

    # If set, this overrides the text shown when interacting while the hive stash is closed.
    var InteractTextOverride<public>:message = external {}

    # Determines what players can see inside the hive stash, as well as its interaction text. This does not affect what happens when it opens.
    #  * `Empty` shows nothing and says `Break Open`.
    #  * `Loot` shows a chest and says `Break Open`.
    #  * `Trapped` shows a floating character and says `Rescue`.
    var HiveStashStyle<public>:hive_stash_style = external {}

    StringToMessage<localizes><epic_internal>(Value:string):message = external {}