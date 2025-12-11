using { /Fortnite.com/AI }
using { /Verse.org }
using { /Verse.org/Colors }
using { /Verse.org/Random }
using { /Verse.org/SceneGraph }
using { /Verse.org/Simulation }
using { /Verse.org/SpatialMath }
using { /UnrealEngine.com/Temporary/Diagnostics }

# Getting started: 
# https://www.epicgames.com/fortnite/en-US/creative/docs/uefn/Verse/onboarding-guide-to-programming-with-verse-in-unreal-editor-for-fortnite
  
# Create a dedicated debug channel to draw to for this behavior
new_npc_behavior_debug_draw := class(debug_draw_channel) {}

# This module contains functions which return messages used for helpful debugging information that are
# localized and paired with the NPC ID.
new_npc_behavior_message_module:= module:

    SettingsCategory<public><localizes>:message = "Settings"

    OnBeginMessage<public><localizes>(Agent:agent):message =
        "NPC Agent = {Agent}: OnBegin triggered let's get started."
    OnEndMessage<public><localizes>(Agent:agent):message =
        "NPC Agent = {Agent}: OnEnd triggered let's cleanup."
    OnNavigateBeginMessage<public><localizes>(Agent:agent, X:float, Y:float, Z:float):message =
        "NPC Agent = {Agent}: Is moving to [{X},{Y},{Z}]"
    OnNavigateErrorMessage<public><localizes>(Agent:agent, X:float, Y:float, Z:float):message =
        "NPC Agent = {Agent}: Hit error moving to [{X},{Y},{Z}], please refer to Island Setting's Navigation debug"

# A Verse-authored NPC Behavior that can be used within an NPC Character Definition or a NPC Spawner device's NPC Behavior Script Override.
new_npc_behavior := class(npc_behavior):

    # How long to wait in seconds after the NPC navigates to a point before moving on.
    @editable_number(float):
        Categories:=array{new_npc_behavior_message_module.SettingsCategory},
        MinValue:=option{0.5},
        MaxValue:=option{10.0}
    MoveToWaitDuration:float = 5.0

    # The negative min and absolute max x & y coordinate offset in centimeters to tell the NPC to move to
    @editable_number(float):
        Categories:=array{new_npc_behavior_message_module.SettingsCategory},
        MinValue:=option{0.0}
    DistanceFromSpawnPtToMove:float = 1500.0

    # Whether to draw debug to the NPC channel when Verse Debug Draw is enabled in Island Settings.
    @editable:
        Categories:=array{new_npc_behavior_message_module.SettingsCategory}
    ShowAIDebug:logic = true

    # How long in seconds to render the debug draw location and print text. 
    # It is recommended to keep this in sync with MoveToWaitDuration otherwise the print will not be shown if a previous message is displayed.
    @editable_number(float):
        Categories:=array{new_npc_behavior_message_module.SettingsCategory},
        MinValue:=option{0.5}
    AIDebugDrawTime:float = 5.0

    # How long in seconds to render the look at arrow's debug draw.
    @editable_number(float):
        Categories:=array{new_npc_behavior_message_module.SettingsCategory},
        MinValue:=option{0.5}
    LookAtDebugDrawDuration:float = 0.5

    # Debug Draw instance.
    DebugDrawNPC:debug_draw = debug_draw{Channel := new_npc_behavior_debug_draw}

    # Used for specifying a point offset from the NPC pelvis to the head to draw the look at arrow from.
    VerticalOffsetToNPCHead<private>:float = 55.0

    # This function runs when the NPC is spawned in the world and ready to follow a behavior.
    OnBegin<override>()<suspends>:void =

        if:
            # Get the Agent (the NPC).
            Agent := GetAgent[]

            # Gets the associated Entity
            Entity := GetEntity[]

            # Get the component to execute actions on the NPC.
            NPCActionsComponent := Entity.GetComponent[npc_actions_component]

            # Save the position of your character which we'll use to generate more points to move to from.
            NPCSpawnPoint := Entity.GetComponent[transform_component].GlobalTransform.Translation

        then:
            # TODO: Now that you have the NPC actions component, replace this with your code 
            # for your desired movement, look at, and other behavior allowed by the AI module.
            if(ShowAIDebug?):
                Print(new_npc_behavior_message_module.OnBeginMessage(Agent), ?Duration := AIDebugDrawTime)


            loop:
                # Create a random offset from the spawn point to walk toward.
                GoToPoint := NPCSpawnPoint + vector3{Left := GetRandomFloat(-DistanceFromSpawnPtToMove,DistanceFromSpawnPtToMove),
                                                     Forward := GetRandomFloat(-DistanceFromSpawnPtToMove,DistanceFromSpawnPtToMove),
                                                     Up := 0.0 }
                
                if(ShowAIDebug?):
                    Print(new_npc_behavior_message_module.OnNavigateBeginMessage(Agent,GoToPoint.Left,GoToPoint.Forward,GoToPoint.Up), ?Duration := AIDebugDrawTime)

                # Create a navigation target from these two positions that the navigation interface can use.
                NavTargetStart := MakeNavigationTarget(GoToPoint)
                NavTargetEnd := MakeNavigationTarget(NPCSpawnPoint)
                
                # If the debug flag is enabled draw a box around the location the NPC is moving toward for visual
                # validation that it is where you expect.
                if(ShowAIDebug?):
                    DrawDebugLocation(GoToPoint)
            
                # Tell the navigation interface to walk to the location and store a navigation result for error checking.
                NavResultGoTo := NPCActionsComponent.NavigateTo(NavTargetStart, ?MovementType:=movement_type.Walking)
                
                # Check to see if something has interfered with the NPC reaching the intended location and print a
                # message to the output log.
                if (NavResultGoTo.GetError[]):
                    if(ShowAIDebug?):
                        Print(new_npc_behavior_message_module.OnNavigateErrorMessage(Agent,GoToPoint.Left,GoToPoint.Forward,GoToPoint.Up), ?Duration := AIDebugDrawTime)
                else:
                    # Once it arrives at its location, idle for this duration in seconds
                    NPCActionsComponent.Idle(?Duration := MoveToWaitDuration)
                 
                # Draw more debug visuals to show the point the NPC will look at and move to.
                if(ShowAIDebug?):
                    DrawDebugLocation(NPCSpawnPoint)
                
                # Leveraging concurrency to wait until the NPC reaches its destination, while the calls to look back at its origin point 
                # and drawing a debug arrow never completes, continuing, ensures only the NavigateTo can win the race.
                NavResultGoToNext := race:
                    # Move back to its starting position.
                    NPCActionsComponent.NavigateTo(NavTargetEnd)

                    # Sets NPC to look at its previous position which will make it walk backwards. 
                    # This is meant to show the utility of the focus interface.
                    block:
                        NPCActionsComponent.Focus(GoToPoint)
                        MakeError(navigation_action_error_type.Interrupted)

                    block:
                        if(ShowAIDebug?):
                            DrawDebugLookAt(Entity, GoToPoint) 
                        else:
                            Sleep(Inf)
                        MakeError(navigation_action_error_type.Interrupted)
                
                # Check again to see if something has interfered with the NPC reaching the intended location and
                # print a message to the output log.
                if (NavResultGoToNext.GetError[]):
                    if(ShowAIDebug?):
                        Print(new_npc_behavior_message_module.OnNavigateErrorMessage(Agent,GoToPoint.Left,GoToPoint.Forward,GoToPoint.Up), ?Duration := AIDebugDrawTime)
                else:
                    # This tells the NPC to wait for this amount of time in seconds.
                    NPCActionsComponent.Idle(?Duration := MoveToWaitDuration)

                # End of loop, continue the patrol back to the point.
        else:
            # If code falls here something failed when gathering the agent or its interfaces
            if(ShowAIDebug?):
                PrintNPCB("Error in NPC Behavior Script on NPC Setup",
                        ?Duration := AIDebugDrawTime, 
                        ?TextColor := NamedColors.Red )

    # This function draws a box around a specified position for a finite amount of time.
    # NOTE: To see this in game, Verse Debug Draw must be enabled in Island Settings.
    DrawDebugLocation(Location:vector3):void = 
        DebugDrawNPC.DrawPoint( Location, 
                                ?Color := NamedColors.SteelBlue, 
                                ?Thickness := 100.0, 
                                ?DrawDurationPolicy := debug_draw_duration_policy.FiniteDuration, 
                                ?Duration := AIDebugDrawTime )

    # This function draws an arrow from the Agent's head to its look at point every half a second. 
    # NOTE: To see this in game, Verse Debug Draw must be enabled in Island Settings.
    DrawDebugLookAt(Entity:entity, LookAtPoint:vector3)<suspends>:void=
        if (TransformComponent:=Entity.GetComponent[transform_component]):
            loop:
                DebugDrawNPC.DrawArrow( TransformComponent.GlobalTransform.Translation + vector3{ Up := VerticalOffsetToNPCHead}, 
                                        LookAtPoint, 
                                        ?ArrowSize := 50.0, 
                                        ?Color := NamedColors.Yellow, 
                                        ?Thickness := 5.0, 
                                        ?DrawDurationPolicy := debug_draw_duration_policy.FiniteDuration, 
                                        ?Duration := LookAtDebugDrawDuration )
                                        
                #This sleep matches the length of time the arrow is drawn to avoid duplicate draws.
                Sleep(LookAtDebugDrawDuration)
        else:
            Sleep(Inf)

    # Custom wrapper that provides a default duration and color.
    PrintNPCB(Msg:string,?Duration:float = AIDebugDrawTime, ?TextColor:color = NamedColors.Green):void =
        Print("[new_npc_behavior] {Msg}", ?Color := TextColor, ?Duration := Duration)

    # This function runs when the NPC is despawned or eliminated from the world.
    OnEnd<override>():void =
        # TODO: Replace this with your code for any cleanup that you want to happen.
        if(Agent := GetAgent[]):
            Print(new_npc_behavior_message_module.OnEndMessage(Agent), ?Duration := AIDebugDrawTime)
        else:
            PrintNPCB("OnEnd")
