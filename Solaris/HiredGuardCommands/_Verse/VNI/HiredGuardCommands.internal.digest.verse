# Module import path: /Fortnite.com/AI/HiredGuardCommands
HiredGuardCommands<public> := module:
    using {/UnrealEngine.com/Temporary/SpatialMath}
    using {/Fortnite.com/AI/HiredGuardCommands/PingCommand}
    using {/Verse.org/Native}
    using {/Fortnite.com/Characters}
    using {/Verse.org/SceneGraph}
    using {/Verse.org/Simulation}
    @hide_in_editor
    @experimental
    default_npc_behavior<epic_internal> := class(npc_behavior):


    @experimental
    # Fortnite NPC AI Management
    follower_actions_component<native><epic_internal> := class(fort_guard_actions_component):
        @experimental
        # Run the NPC default behavior
        RunDefaultBehavior<native><epic_internal>()<suspends>:ai_action_result

        @experimental
        IsFollowingBehaviorEnabled<native><epic_internal>()<transacts>:logic

    @experimental
    (InEntity:entity).GetAgent<native><epic_internal>()<transacts>:?agent

    @experimental
    (Agent:agent).GetTeamMembers<native><epic_internal>()<transacts>:[]agent

    @experimental
    (Character:fort_character).IsBeingDBNOCarried<native><epic_internal>()<transacts><decides>:void

    @experimental
    (Character:fort_character).GetNPCLeashRadius<native><epic_internal>()<transacts>:tuple(float, float)

    @available {MinUploadedAtFNVersion := 3200}
    @hide_in_editor
    @experimental
    hired_guard_commands<epic_internal> := class<concrete>(npc_behavior):
        OnBegin<override>()<suspends>:void = external {}

    @experimental
    ping_component<native><epic_internal> := class<final_super><epic_internal>(component):
        OnInitialized<native><override>():void

        OnUninitializing<native><override>():void

        @experimental
        AreNPCCommandsEnabled<native><epic_internal>()<transacts>:logic

        @experimental
        CanAcceptPingCommand<native><epic_internal>()<transacts>:logic

        @experimental
        EnableCommandWheel<native><epic_internal>(Enabled:logic):void

        @experimental
        GetCurrentNPCCommand<native><epic_internal>()<transacts><decides>:ping_info

        @experimental
        OnNPCCommand<native><epic_internal>()<suspends>:?ping_info

        @experimental
        DeclineNPCCommand<native><epic_internal>(PlayUnableToPerformAction:logic):void

        @experimental
        IsAttackCommandEnabled<native><epic_internal>()<transacts>:logic

        @experimental
        ConvertPingToAttack<native><epic_internal>(AttackTarget:agent):void

        @experimental
        ConvertedEvent<epic_internal>():subscribable(tuple()) = external {}

        @experimental
        UnconvertedEvent<epic_internal>():subscribable(tuple()) = external {}

    # Module import path: /Fortnite.com/AI/HiredGuardCommands/PingCommand
    PingCommand<epic_internal> := module:
        @experimental
        command_type<native><epic_internal> := enum:
            go_to
            back_to_me
            back_to_default
            hold_position
            revive
            invalid

        @experimental
        entity_type<native><epic_internal> := enum:
            pawn
            pickup
            weapon
            container
            player_built_actor
            building_actor
            undefined

    @experimental
    (/Fortnite.com/AI/HiredGuardCommands:)ToString<epic_internal>(Type:command_type)<transacts>:string = external {}

    @experimental
    (/Fortnite.com/AI/HiredGuardCommands:)ToString<epic_internal>(Type:entity_type)<transacts>:string = external {}

    @experimental
    ping_info<native><epic_internal> := struct:
        @experimental
        Type<native><public>:command_type

        @experimental
        EntityType<native><public>:entity_type

        @experimental
        Location<native><public>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3

        @experimental
        LocationOnHorizontalSurface<native><public>:logic

        @experimental
        Target<native><public>:?entity

        @experimental
        Emitter<native><public>:?agent