# Module import path: /UnrealEngine.com/Temporary/Curves
Curves<public> := module:
    editable_curve<native><public> := class<final><concrete>:
        # Evaluates this float curve at the specified time and returns the result as a float
        Evaluate<native><public>(Time:float):float

# Module import path: /UnrealEngine.com/Temporary/Diagnostics
Diagnostics<public> := module:
    using {/UnrealEngine.com/Temporary/SpatialMath}
    using {/Verse.org/Colors}
    using {/Verse.org/SpatialMath}
    # Enumerated presets for policies describing a desired draw duration.
    debug_draw_duration_policy<native><public> := enum:
        SingleFrame
        FiniteDuration
        Persistent

    # debug_draw_channel is the base class used to define debug draw channels.
    debug_draw_channel<native><public> := class<abstract>:


    # debug draw class to draw debug shapes on screen.
    debug_draw<native><public> := class:
        # Channel will be used to clear specific debug draw.
        Channel<native><public>:subtype(debug_draw_channel) = external {}

        # Show Debug Draw for the channel for all users.
        ShowChannel<native><public>()<transacts>:void

        # Hide Debug Draw for the channel for all users.
        HideChannel<native><public>()<transacts>:void

        # Clears all debug draw for the channel.
        ClearChannel<native><public>()<transacts>:void

        # Clears all debug draw from this debug_draw instance.
        Clear<native><public>()<transacts>:void

        # Draws a sphere at the named location, and using the provided draw parameters.
        DrawSphere<native><public>(Center:(/Verse.org/SpatialMath:)vector3, ?Radius:float = external {}, ?Color:color = external {}, ?NumSegments:int = external {}, ?Thickness:float = external {}, ?DrawDurationPolicy:debug_draw_duration_policy = external {}, ?Duration:float = external {})<transacts>:void

        # Draws a sphere at the named location, and using the provided draw parameters.
        DrawSphere<public>(Center:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, ?Radius:float = external {}, ?Color:color = external {}, ?NumSegments:int = external {}, ?Thickness:float = external {}, ?DrawDurationPolicy:debug_draw_duration_policy = external {}, ?Duration:float = external {})<transacts>:void = external {}

        # Draws a box at the named location, and using the provided draw parameters
        DrawBox<native><public>(Center:(/Verse.org/SpatialMath:)vector3, Rotation:(/Verse.org/SpatialMath:)rotation, ?Extent:(/Verse.org/SpatialMath:)vector3 = external {}, ?Color:color = external {}, ?Thickness:float = external {}, ?DrawDurationPolicy:debug_draw_duration_policy = external {}, ?Duration:float = external {})<transacts>:void

        # Draws a box at the named location, and using the provided draw parameters
        DrawBox<public>(Center:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, Rotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation, ?Extent:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}, ?Color:color = external {}, ?Thickness:float = external {}, ?DrawDurationPolicy:debug_draw_duration_policy = external {}, ?Duration:float = external {})<transacts>:void = external {}

        # Draws a capsule at the named location, and using the provided draw parameters.
        DrawCapsule<native><public>(Center:(/Verse.org/SpatialMath:)vector3, Rotation:(/Verse.org/SpatialMath:)rotation, ?Height:float = external {}, ?Radius:float = external {}, ?Color:color = external {}, ?Thickness:float = external {}, ?DrawDurationPolicy:debug_draw_duration_policy = external {}, ?Duration:float = external {})<transacts>:void

        # Draws a capsule at the named location, and using the provided draw parameters.
        DrawCapsule<public>(Center:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, Rotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation, ?Height:float = external {}, ?Radius:float = external {}, ?Color:color = external {}, ?Thickness:float = external {}, ?DrawDurationPolicy:debug_draw_duration_policy = external {}, ?Duration:float = external {})<transacts>:void = external {}

        # Draws a cone at the named location, and using the provided draw parameters.
        DrawCone<native><public>(Origin:(/Verse.org/SpatialMath:)vector3, Direction:(/Verse.org/SpatialMath:)vector3, ?Height:float = external {}, ?NumSides:int = external {}, ?AngleWidthRadians:float = external {}, ?AngleHeightRadians:float = external {}, ?Color:color = external {}, ?Thickness:float = external {}, ?DrawDurationPolicy:debug_draw_duration_policy = external {}, ?Duration:float = external {})<transacts>:void

        # Draws a cone at the named location, and using the provided draw parameters.
        DrawCone<public>(Origin:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, Direction:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, ?Height:float = external {}, ?NumSides:int = external {}, ?AngleWidthRadians:float = external {}, ?AngleHeightRadians:float = external {}, ?Color:color = external {}, ?Thickness:float = external {}, ?DrawDurationPolicy:debug_draw_duration_policy = external {}, ?Duration:float = external {})<transacts>:void = external {}

        # Draws a cylinder at the named location, and using the provided draw parameters.
        DrawCylinder<native><public>(Start:(/Verse.org/SpatialMath:)vector3, End:(/Verse.org/SpatialMath:)vector3, ?NumSegments:int = external {}, ?Radius:float = external {}, ?Color:color = external {}, ?Thickness:float = external {}, ?DrawDurationPolicy:debug_draw_duration_policy = external {}, ?Duration:float = external {})<transacts>:void

        # Draws a cylinder at the named location, and using the provided draw parameters.
        DrawCylinder<public>(Start:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, End:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, ?NumSegments:int = external {}, ?Radius:float = external {}, ?Color:color = external {}, ?Thickness:float = external {}, ?DrawDurationPolicy:debug_draw_duration_policy = external {}, ?Duration:float = external {})<transacts>:void = external {}

        # Draws a line from Start to End locations, and using the provided draw parameters.
        DrawLine<native><public>(Start:(/Verse.org/SpatialMath:)vector3, End:(/Verse.org/SpatialMath:)vector3, ?Color:color = external {}, ?Thickness:float = external {}, ?DrawDurationPolicy:debug_draw_duration_policy = external {}, ?Duration:float = external {})<transacts>:void

        # Draws a line from Start to End locations, and using the provided draw parameters.
        DrawLine<public>(Start:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, End:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, ?Color:color = external {}, ?Thickness:float = external {}, ?DrawDurationPolicy:debug_draw_duration_policy = external {}, ?Duration:float = external {})<transacts>:void = external {}

        # Draws a point at the named location, and using the provided draw parameters.
        DrawPoint<native><public>(Position:(/Verse.org/SpatialMath:)vector3, ?Color:color = external {}, ?Thickness:float = external {}, ?DrawDurationPolicy:debug_draw_duration_policy = external {}, ?Duration:float = external {})<transacts>:void

        # Draws a point at the named location, and using the provided draw parameters.
        DrawPoint<public>(Position:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, ?Color:color = external {}, ?Thickness:float = external {}, ?DrawDurationPolicy:debug_draw_duration_policy = external {}, ?Duration:float = external {})<transacts>:void = external {}

        # Draws an arrow pointing from Start to End locations, and using the provided draw parameters.
        DrawArrow<native><public>(Start:(/Verse.org/SpatialMath:)vector3, End:(/Verse.org/SpatialMath:)vector3, ?ArrowSize:float = external {}, ?Color:color = external {}, ?Thickness:float = external {}, ?DrawDurationPolicy:debug_draw_duration_policy = external {}, ?Duration:float = external {})<transacts>:void

        # Draws an arrow pointing from Start to End locations, and using the provided draw parameters.
        DrawArrow<public>(Start:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, End:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, ?ArrowSize:float = external {}, ?Color:color = external {}, ?Thickness:float = external {}, ?DrawDurationPolicy:debug_draw_duration_policy = external {}, ?Duration:float = external {})<transacts>:void = external {}

        # Draws a 3D text using the provided draw parameters.
        DrawText<native><public>(Text:string, Position:(/Verse.org/SpatialMath:)vector3, ?Color:color = external {}, ?DrawDurationPolicy:debug_draw_duration_policy = external {}, ?Duration:float = external {}, ?FontScale:float = external {}, ?DrawDropShadow:logic = external {})<transacts>:void

        # Draws a 3D text using the provided draw parameters.
        DrawText<public>(Text:string, Position:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, ?Color:color = external {}, ?DrawDurationPolicy:debug_draw_duration_policy = external {}, ?Duration:float = external {}, ?FontScale:float = external {}, ?DrawDropShadow:logic = external {})<transacts>:void = external {}

    # log levels available for various log commands
    log_level<native><public> := enum:
        Debug
        Verbose
        Normal
        Warning
        Error

    # log_channel is the base class used to define log channels. When printing a message to a log, the log channel class name will be prefixed to the output message.
    log_channel<native><public> := class<abstract>:


    # log class to send messages to the default log
    log<native><public> := class:
        # Channel class name will be added as a prefix used when printing the message e.g. '[log_channel]: #Message
        Channel<native><public>:subtype(log_channel)

        # Sets the default log level of the displayed message. See log_level enum for more info on log levels. Defaults to log_level.Normal.
        DefaultLevel<native><public>:log_level = external {}

        # Print `Message` using the given log level.
        (/UnrealEngine.com/Temporary/Diagnostics/log:)Print<public>(Message:string, ?Level:log_level = external {})<computes>:void = external {}

        # Print `Message` diagnostic using the given log level.
        (/UnrealEngine.com/Temporary/Diagnostics/log:)Print<public>(Message:diagnostic, ?Level:log_level = external {})<computes>:void = external {}

        # Prints the current script call stack using the given log level.
        PrintCallStack<native><public>(?Level:log_level = external {})<computes>:void

# Module import path: /UnrealEngine.com/Temporary/Testing
Testing<public> := module:
