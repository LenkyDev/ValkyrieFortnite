# Copyright Epic Games, Inc. All Rights Reserved.
#################################################
# Generated Digest of Verse API
# DO NOT modify this manually!
# Generated from build: ++Fortnite+Release-34.40-CL-41753727
#################################################

using {/Verse.org/Assets}
using {/Verse.org/SceneGraph}
# Module import path: /UnrealEngine.com/BasicShapes
BasicShapes<public> := module:
    @experimental
    cube<public> := class<final><public>(mesh_component):
        Mesh<override>:mesh = external {}

    @experimental
    sphere<public> := class<final><public>(mesh_component):
        Mesh<override>:mesh = external {}

    @experimental
    plane<public> := class<final><public>(mesh_component):
        Mesh<override>:mesh = external {}

    @experimental
    cone<public> := class<final><public>(mesh_component):
        Mesh<override>:mesh = external {}

    @experimental
    cylinder<public> := class<final><public>(mesh_component):
        Mesh<override>:mesh = external {}

Temporary<public> := module:
    WorldPartition<public> := module:
        using {/UnrealEngine.com/Temporary/SpatialMath}
        using {/Verse.org/Assets}
        # Module import path: /UnrealEngine.com/Temporary/WorldPartition/VerseWorldPartition
        VerseWorldPartition<public> := module:
            data_layer_asset<native><epic_internal> := class<concrete><computes><final><epic_internal>(asset):

            # Unloaded: Associated content is unloaded. Loaded: Associated content is loaded but not visible. Activated: Associated content is loaded and visible. Represents possible Streaming Sources runtime states.
            world_partition_streaming_runtime_state<native><epic_internal> := enum:
                # Unloaded
                Unloaded
                # Loaded (meaning loaded but not visible)
                Loaded
                # Activated (meaning loaded and visible)
                Activated

            world_partition_streaming_source_target_behavior<native><epic_internal> := enum:
                Include
                Exclude

            world_partition_streaming_definition<native><epic_internal> := class<concrete><epic_internal>:
                # Source Location
                var Location<native><public>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

                # Source orientation (can impact streaming cell prioritization)
                var Rotation<native><public>:(/UnrealEngine.com/Temporary/SpatialMath:)rotation = external {}

                # Defines how TargetGrids/TargetHLODLayers will be applied to this streaming source.
                var TargetBehavior<native><public>:world_partition_streaming_source_target_behavior = external {}

                # When set, this will change how this streaming source is applied to the provided runtime streaming grids based on the TargetBehavior.
                var TargetGrids<native><public>:[]string = external {}

                # Source internal shapes. When none are provided, a sphere is automatically used. It's radius is equal to grid's loading range and center equals source's location.
                var Shapes<native><public>:[]world_partition_streaming_source_shape = external {}

                # If true, this streaming source will force intersecting cells in 2D
                var Force2D<native><public>:logic = external {}

                SetAsCircle<public>(Range:float)<transacts>:void = external {}

                SetAsSphere<public>(Range:float)<transacts>:void = external {}

            world_partition_streaming_source_priority<native><epic_internal> := enum:
                Highest
                High
                Normal
                Low
                Lowest

            world_partition_streaming_source<native><epic_internal> := class(world_partition_streaming_definition):
                # Source unique name
                var Name<native><public>:string = external {}

                # Streaming source priority
                var Priority<native><public>:world_partition_streaming_source_priority = external {}

                # Use velocity contribution to streaming cells priority streaming.
                var UseVelocityContributionToCellsSorting<native><public>:logic = external {}

                # Whether this source will be considered when world partition detects slow loading and waits for cell streaming to complete
                var BlockOnSlowLoading<native><public>:logic = external {}

                # Target streaming state
                var TargetState<native><public>:world_partition_streaming_runtime_state = external {}

            world_partition_streaming_query_source<native><epic_internal> := class(world_partition_streaming_definition):
                # If False, Location/Radius will not be used to find the cells. Only AlwaysLoaded cells will be returned by the query.
                var SpatialQuery<native><public>:logic = external {}

                # The list of layers to consider for this query
                var DataLayers<native><public>:[]data_layer_asset = external {}

            world_partition_streaming_source_shape<native><epic_internal> := class<concrete>:
                # If True, streaming source shape radius is bound to loading range radius.
                var UseGridLoadingRange<native><public>:logic = external {}

                # Applies a scale to the grid's loading range (used if bUseGridLoadingRange is True)
                var LoadingRangeScale<native><public>:float = external {}

                # Custom streaming source shape radius (not used if bUseGridLoadingRange is True).
                var Radius<native><public>:float = external {}

                # Whether the source shape is a spherical sector instead of a regular sphere source.
                var IsSector<native><public>:logic = external {}

                # Shape's spherical sector angle in degree (not used if bIsSector is False)
                var SectorAngle<native><public>:float = external {}

                # Streaming source shape location (local to streaming source).
                var Location<native><public>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

                # Streaming source shape rotation (local to streaming source).
                var Rotation<native><public>:(/UnrealEngine.com/Temporary/SpatialMath:)rotation = external {}

            world_partition_streaming_source_subscription<native><epic_internal> := class(cancelable):
                Cancel<native><override>()<transacts>:void

            world_partition_helper<native><epic_internal> := class<concrete>:
                # Sets data layer runtime state.
                SetDataLayerRuntimeState<native><public>(DataLayerAsset:data_layer_asset, State:world_partition_streaming_runtime_state, IsRecursive:logic)<transacts>:logic

                # Returns data layer effective runtime state.
                GetDataLayerEffectiveRuntimeState<native><public>(DataLayerAsset:data_layer_asset)<transacts>:world_partition_streaming_runtime_state

                # Adds a streaming source provider callback. The callback is responsible for filling and updating the streaming source when invoked.
                AddStreamingSourceProvider<native><public>(UpdateStreamingSourceCallback:type {_(:world_partition_streaming_source):void})<transacts>:cancelable

                # Adds a static streaming source.
                AddStreamingSource<native><public>(StreamingSource:world_partition_streaming_source)<transacts>:cancelable

                # Returns whether an array of streaming sources has finished streaming. If no array is passed, the state of all currently added streaming source is queryed.
                IsStreamingCompleted<native><public>(Sources:?[]world_partition_streaming_source)<transacts>:logic

                # Returns whether an array of streaming query sources satisfies the passed state.
                IsStreamingCompleted<native><public>(Sources:[]world_partition_streaming_query_source, QueryState:world_partition_streaming_runtime_state)<transacts>:logic

            GetWorldPartitionHelper<native><epic_internal>()<transacts>:?world_partition_helper

    using {/Verse.org/Assets}
    using {/Verse.org/Colors}
    using {/UnrealEngine.com/Temporary/SpatialMath}
    using {/Verse.org/Simulation}
    using {/Verse.org/SceneGraph}
    # Module import path: /UnrealEngine.com/Temporary/UI
    UI<public> := module:
        @experimental
        local_hud_component<epic_internal> := class<final_super>(component):
            var Canvas<public>:canvas

            var UISlot<public>:player_ui_slot

            OnBeginSimulation<override>():void = external {}

            OnEndSimulation<override>():void = external {}

            @experimental
            Show<public>(Player:player):void = external {}

            @experimental
            Hide<public>(Player:player):void = external {}

        # Returns the `player_ui` associated with `Player`.
        # Fails if there is no `player_ui` associated with `Player`.
        GetPlayerUI<native><public>(Player:player)<transacts><decides>:player_ui

        # The main interface for adding and removing `widget`s to a player's UI.
        player_ui<native><public> := class<final><epic_internal>:
            # Adds `Widget` to this `player_ui` using default `player_ui_slot` configuration options.
            AddWidget<native><public>(Widget:widget):void

            # Adds `Widget` to this `player_ui` using `Slot` for configuration options.
            AddWidget<native><public>(Widget:widget, Slot:player_ui_slot):void

            # Removes `Widget` from this `player_ui`.
            RemoveWidget<native><public>(Widget:widget):void

            # Sets the user's focus on this widget. The target widget must be focusable, otherwise this has no effect.
            SetFocus<native><epic_internal>(Widget:widget):void

        # Base class for all UI elements drawn on the `player`'s screen.
        widget<native><public> := class<abstract><unique><epic_internal>:
            # Shows or hides the `widget` without removing itself from the containing `player_ui`.
            # See `widget_visibility` for details.
            SetVisibility<native><public>(InVisibility:widget_visibility):void

            # Returns the current `widget_visibility` state.
            GetVisibility<native><public>():widget_visibility

            # Enables or disables whether the `player` can interact with this `widget`.
            SetEnabled<native><public>(InIsEnabled:logic):void

            # `true` if this `widget` can be modified interactively by the player.
            IsEnabled<native><public>():logic

            # Enables or disables whether this `widget` consumes input when `widget_visibility` is Visible.
            SetHitTestVisible<native><epic_internal>(InIsHitTestVisible:logic):void

            # `true` if this `widget` consumes input when `widget_visibility` is Visible.
            IsHitTestVisible<native><epic_internal>():logic

            # Sets the render opacity of the widget.
            SetRenderOpacity<native><epic_internal>(InRenderOpacity:float):void

            # Gets the render opacity of the widget.
            GetRenderOpacity<native><epic_internal>():float

            # Returns the `widget`'s parent `widget`.
            # Fails if no parent exists, such as if this `widget` is not in the `player_ui` or is itself the root `widget`.
            GetParentWidget<native><public>()<transacts><decides>:widget

            # Returns the `widget` that added this `widget` to the `player_ui`. The root `widget` will return itself.
            # Fails if this `widget` is not in the `player_ui`.
            GetRootWidget<native><public>()<transacts><decides>:widget

        # `widget` creation configuration options.
        player_ui_slot<native><public> := struct:
            # Controls `widget` rendering order. Greater values will be draw in front of lesser values.
            ZOrder<native><public>:type {_X:int where 0 <= _X, _X <= 2147483647} = external {}

            # Controls `widget` input event consumption.
            InputMode<native><public>:ui_input_mode = external {}

        # `widget` input consumption mode.
        ui_input_mode<native><public> := enum:
            # `widget` does not consume any input.
            None
            # `widget` consumes all inputs
            All

        # Parameters for `event`s signalled by a `widget`.
        widget_message<native><public> := struct:
            # The `player` that triggered the `event`.
            Player<native><public>:player

            # The `widget` that triggered the `event`.
            Source<native><public>:widget

        # Used by `widget.SetVisibility` determine how a `widget` is shown in the user interface.
        widget_visibility<native><public> := enum:
            # The `widget` is visible and occupies layout space.
            Visible
            # The `widget` is invisible and does not occupy layout space.
            Collapsed
            # The `widget` is invisible and occupies layout space.
            Hidden

        # Used by`widget` orientation modes.
        orientation<native><public> := enum:
            # Orient `widget`s from left to right.
            Horizontal
            # Orient `widget`s from top to bottom.
            Vertical

        # `widget` horizontal alignment mode.
        horizontal_alignment<native><public> := enum:
            # Center `widget` horizontally within the slot.
            Center
            # Align `widget` to the left of the slot.
            Left
            # Align `widget` to the right of the slot.
            Right
            # `widget` fills the slot horizontally.
            Fill

        # `widget` vertical alignment mode.
        vertical_alignment<native><public> := enum:
            # Center `widget` vertically within the slot.
            Center
            # Align `widget` to the top of the slot.
            Top
            # Align `widget` to the bottom of the slot.
            Bottom
            # `widget` fills the slot vertically.
            Fill

        # The anchors of a `widget` determine its the position and sizing relative to its parent.
        # `anchor`s range from `(0.0, 0.0)` (left, top) to `(1.0, 1.0)` (right, bottom).
        anchors<native><public> := struct:
            # Holds the minimum anchors, (left, top). The valid range is between `0.0` and `1.0`.
            Minimum<native><public>:vector2 = external {}

            # Holds the maximum anchors, (right, bottom). The valid range is between `0.0` and `1.0`.
            Maximum<native><public>:vector2 = external {}

        # Specifies the gap outside each edge separating a `widget` from its neighbors.
        # Distance is measured in units where `1.0` unit is the width of a pixel at 1080p resolution.
        margin<native><public> := struct:
            # The left edge spacing.
            Left<native><public>:float = external {}

            # The top edge spacing.
            Top<native><public>:float = external {}

            # The right edge spacing.
            Right<native><public>:float = external {}

            # The bottom edge spacing.
            Bottom<native><public>:float = external {}

        # Button is a container of a single child widget slot and fires the OnClick event when the button is clicked.
        button<native><public> := class<final>(widget):
            # The child widget of the button. Used only during initialization of the widget and not modified by SetSlot.
            Slot<native><public>:button_slot

            # Sets the child widget slot.
            SetWidget<native><public>(InSlot:button_slot):void

            # Subscribable event that fires when the button is clicked.
            OnClick<public>():listenable(widget_message) = external {}

        # Slot for button widget.
        button_slot<native><public> := struct:
            # The widget assigned to this slot.
            Widget<native><public>:widget

            # Horizontal alignment of the widget inside the slot.
            HorizontalAlignment<native><public>:horizontal_alignment = external {}

            # Vertical alignment of the widget inside the slot.
            VerticalAlignment<native><public>:vertical_alignment = external {}

            # Empty distance in pixels that surrounds the widget inside the slot. Assumes 1080p resolution.
            Padding<native><public>:margin = external {}

        # Canvas is a container widget that allows for arbitrary positioning of widgets in the canvas' slots.
        canvas<native><public> := class<final>(widget):
            # The child widgets of the canvas. Used only during initialization of the widget and not modified by Add/RemoveWidget.
            Slots<native><public>:[]canvas_slot = external {}

            # Adds a new child slot to the canvas.
            AddWidget<native><public>(Slot:canvas_slot):void

            # Removes a slot containing the given widget.
            RemoveWidget<native><public>(Widget:widget):void

        # Slot for a canvas widget.
        canvas_slot<native><public> := struct:
            # The border for the margin and how the widget is resized with its parent.
            # Values are defined between 0.0 and 1.0.
            Anchors<native><public>:anchors = external {}

            # The offset that defined the size and position of the widget.
            # When the anchors are well defined, the Offsets.Left represent the distance in pixels from the Anchors Minimum.X, the Offsets.Bottom represent the distance in pixel from the Anchors Maximum.Y, effectively controlling the desired widget size. When the anchors are not well defined, the Offsets.Left and Offsets.Top represent the widget position and Offsets.Right and Offset.Bottom represent the widget size.
            Offsets<native><public>:margin = external {}

            # When true we use the widget's desired size. The size calculated by the Offsets is ignored.
            SizeToContent<native><public>:logic = external {}

            # Alignment is the pivot/origin point of the widget.
            # Starting in the upper left at (0.0,0.0), ending in the lower right at (1.0,1.0).
            Alignment<native><public>:vector2 = external {}

            # Z Order of this slot relative to other slots in this canvas panel.
            # Higher values are rendered last (and so they will appear to be on top)
            ZOrder<native><public>:type {_X:int where 0 <= _X, _X <= 2147483647} = external {}

            # The widget assigned to this slot.
            Widget<native><public>:widget

        # Make a canvas slot for fixed position widget.
        # If Size is set, then the Offsets is calculated and the SizeToContent is set to false.
        # If Size is not set, then Right and Bottom are set to zero and are not used. The widget size will be automatically calculated. The SizeToContent is set to true.
        # The widget is not anchored and will not move if the parent is resized.
        # The Anchors is set to zero.
        MakeCanvasSlot<native><public>(Widget:widget, Position:vector2, ?Size:vector2 = external {}, ?ZOrder:type {_X:int where 0 <= _X, _X <= 2147483647} = external {}, ?Alignment:vector2 = external {})<computes>:canvas_slot

        # A solid color widget.
        color_block<native><public> := class<final>(widget):
            # The color of the widget. Used only during initialization of the widget and not modified by SetColor.
            DefaultColor<native><public>:color = external {}

            # The opacity of the widget. Used only during initialization of the widget and not modified by SetOpacity.
            DefaultOpacity<native><public>:type {_X:float where 0.000000 <= _X, _X <= 1.000000} = external {}

            # The size this widget desired to be displayed in. Used only during initialization of the widget and not modified by SetDesiredSize.
            DefaultDesiredSize<native><public>:vector2 = external {}

            # Sets the widget's color.
            SetColor<native><public>(InColor:color):void

            # Gets the widget's color.
            GetColor<native><public>():color

            # Sets the widgets's opacity.
            SetOpacity<native><public>(InOpacity:type {_X:float where 0.000000 <= _X, _X <= 1.000000}):void

            # Gets the widget's opacity.
            GetOpacity<native><public>():type {_X:float where 0.000000 <= _X, _X <= 1.000000}

            # Sets the size this widget desired to be displayed in.
            SetDesiredSize<native><public>(InDesiredSize:vector2):void

            # Gets the size this widget desired to be displayed in.
            GetDesiredSize<native><public>():vector2

        # Tiling options values
        image_tiling<native><public> := enum:
            # Stretch the image to fit the available space.
            Stretch
            # Repeat/Wrap the image to fill the available space.
            Repeat

        # A widget to display a texture.
        texture_block<native><public> := class(widget):
            # The image to render. Used only during initialization of the widget and not modified by SetImage.
            DefaultImage<native><public>:texture

            # Tinting applied to the image. Used only during initialization of the widget and not modified by SetTint.
            DefaultTint<native><public>:color = external {}

            # The size this widget desired to be displayed in. Used only during initialization of the widget and not modified by SetDesiredSize.
            DefaultDesiredSize<native><public>:vector2 = external {}

            # The horizontal tiling option. Used only during initialization of the widget and not modified by SetTiling.
            DefaultHorizontalTiling<native><public>:image_tiling = external {}

            # The vertical tiling option. Used only during initialization of the widget and not modified by SetTiling.
            DefaultVerticalTiling<native><public>:image_tiling = external {}

            # Sets the image to render.
            SetImage<native><public>(InImage:texture):void

            # Gets the image to render.
            GetImage<native><public>():texture

            # Sets the tint applied to the image.
            SetTint<native><public>(InColor:color):void

            # Gets the tint applied to the image.
            GetTint<native><public>():color

            # Sets the size this widget desired to be displayed in.
            SetDesiredSize<native><public>(InDesiredSize:vector2):void

            # Gets the size this widget desired to be displayed in.
            GetDesiredSize<native><public>():vector2

            # Sets the tiling option when the image is smaller than the allocated size.
            SetTiling<native><public>(InHorizontalTiling:image_tiling, InVerticalTiling:image_tiling):void

            # Gets the tiling option.
            GetTiling<native><public>():tuple(image_tiling, image_tiling)

        # A widget to display a material.
        material_block<native><epic_internal> := class(widget):
            # The image to render. Used only during initialization of the widget and not modified by SetImage.
            DefaultImage<native><public>:material

            # Tinting applied to the image. Used only during initialization of the widget and not modified by SetTint.
            DefaultTint<native><public>:color = external {}

            # The size this widget desired to be displayed in. Used only during initialization of the widget and not modified by SetDesiredSize.
            DefaultDesiredSize<native><public>:vector2 = external {}

            # Sets the image to render.
            SetImage<native><public>(InImage:material):void

            # Gets the image to render.
            GetImage<native><public>():material

            # Sets the tint applied to the image.
            SetTint<native><public>(InColor:color):void

            # Gets the tint applied to the image.
            GetTint<native><public>():color

            # Sets the size this widget desired to be displayed in.
            SetDesiredSize<native><public>(InDesiredSize:vector2):void

            # Gets the size this widget desired to be displayed in.
            GetDesiredSize<native><public>():vector2

        # Overlay is a container consisting of widgets stacked on top of each other.
        overlay<native><public> := class<final>(widget):
            # The child widgets of the overlay. Used only during initialization of the widget and not modified by Add/RemoveWidget.
            Slots<native><public>:[]overlay_slot = external {}

            # Add a new child slot to the overlay. Slots are added at the end.
            AddWidget<native><public>(Slot:overlay_slot):void

            # Removes a slot containing the given widget
            RemoveWidget<native><public>(Widget:widget):void

        # Slot for an overlay widget
        overlay_slot<native><public> := struct:
            # The widget assigned to this slot.
            Widget<native><public>:widget

            # Horizontal alignment of the widget inside the slot.
            # This alignment is only applied after the layout space for the widget slot is created and determines the widget alignment within that space.
            HorizontalAlignment<native><public>:horizontal_alignment = external {}

            # Vertical alignment of the widget inside the slot.
            # This alignment is only applied after the layout space for the widget slot is created and determines the widget alignment within that space.
            VerticalAlignment<native><public>:vertical_alignment = external {}

            # Empty distance in pixels that surrounds the widget inside the slot. Assumes 1080p resolution.
            Padding<native><public>:margin = external {}

        # Stack box is a container of a list of widgets stacked either vertically or horizontally.
        stack_box<native><public> := class<final>(widget):
            # The child widgets of the stack box. Used only during initialization of the widget and not modified by Add/RemoveWidget.
            Slots<native><public>:[]stack_box_slot = external {}

            # The orientation of the stack box. Either stack widgets horizontal or vertical.
            Orientation<native><public>:orientation

            # Add a new child slot to the stack box. Slots are added at the end.
            AddWidget<native><public>(Slot:stack_box_slot):void

            # Removes a slot containing the given widget
            RemoveWidget<native><public>(Widget:widget):void

        # Slot for a stack_box widget
        stack_box_slot<native><public> := struct:
            # The widget assigned to this slot.
            Widget<native><public>:widget

            # Horizontal alignment of the widget inside the slot.
            # This alignment is only applied after the layout space for the widget slot is created and determines the widget alignment within that space.
            HorizontalAlignment<native><public>:horizontal_alignment = external {}

            # Vertical alignment of the widget inside the slot.
            # This alignment is only applied after the layout space for the widget slot is created and determines the widget alignment within that space.
            VerticalAlignment<native><public>:vertical_alignment = external {}

            # Empty distance in pixels that surrounds the widget inside the slot. Assumes 1080p resolution.
            Padding<native><public>:margin = external {}

            # The available space will be distributed proportionally.
            # If not set, the slot will use the desired size of the widget.
            Distribution<native><public>:?float = external {}

        # Text justification values:
        #   Left: Justify the text logically to the left based on current culture.
        #   Center: Justify the text in the center.
        #   Right: Justify the text logically to the right based on current culture.
        # The Left and Right value will flip when the local culture is right-to-left.
        text_justification<native><public> := enum:
            Left
            Center
            Right
            InvariantLeft
            InvariantRight

        # Text overflow policy values:
        #   Clip: Overflowing text will be clipped.
        #   Ellipsis: Overflowing text will be replaced with an ellipsis.
        text_overflow_policy<native><public> := enum:
            Clip
            Ellipsis

        # Base widget for text widget.
        text_base<native><public> := class<abstract>(widget):
            # The text to display to the user. Used only during initialization of the widget and not modified by SetText.
            DefaultText<native><localizes><public>:message = external {}

            # The color of the displayed text. Used only during initialization of the widget and not modified by SetTextColor.
            DefaultTextColor<native><public>:color = external {}

            # The opacity of the displayed text. Used only during initialization of the widget and not modified by SetTextOpacity.
            DefaultTextOpacity<native><public>:type {_X:float where 0.000000 <= _X, _X <= 1.000000} = external {}

            # The justification to display to the user. Used only during initialization of the widget and not modified by SetJustification.
            DefaultJustification<native><public>:text_justification = external {}

            # The policy that determine what happens when the text is longer than its allowed length.
            # Used only during initialization of the widget and not modified by SetOverflowPolicy.
            DefaultOverflowPolicy<native><public>:text_overflow_policy = external {}

            # Sets the text displayed in the widget.
            SetText<native><public>(InText:message):void

            # Gets the text currently in the widget.
            GetText<native><public>():string

            # Sets the text justification in the widget.
            SetJustification<native><public>(InJustification:text_justification):void

            # Gets the text justification in the widget.
            GetJustification<native><public>():text_justification

            # Sets the policy that determine what happens when the text is longer than its allowed length.
            SetOverflowPolicy<native><public>(InOverflowPolicy:text_overflow_policy):void

            # Gets the policy that determine what happens when the text is longer than its allowed length.
            GetOverflowPolicy<native><public>():text_overflow_policy

            # Sets the color of the displayed text.
            SetTextColor<native><public>(InColor:color):void

            # Gets the color of the displayed text.
            GetTextColor<native><public>():color

            # Sets the opacity of the displayed text.
            SetTextOpacity<native><public>(InOpacity:type {_X:float where 0.000000 <= _X, _X <= 1.000000}):void

            # Gets the opacity of the displayed text.
            GetTextOpacity<native><public>():type {_X:float where 0.000000 <= _X, _X <= 1.000000}

        # Text block widget. Displays text to the user.
        text_block_internal<native><epic_internal> := class(text_base):

        # Verse interface to native `umg asset`.
        umg_widget_class_asset<native><epic_internal> := class<computes><final>(client_asset):

        # Widget created from a umg_widget_class_asset.
        umg_widget<native><epic_internal> := class<epic_internal>(widget):
            # The widget_blueprint asset to create.
            Asset<native><epic_internal>:umg_widget_class_asset

            GetViewmodel_<native><epic_internal>(viewmodel_type:type, ViewmodelName:[]char)<transacts>:viewmodel_type

            SetViewmodel_<native><epic_internal>(viewmodel_type:type, ViewmodelName:[]char, ViewmodelInstance:viewmodel_type)<transacts>:void

            GetViewmodelOptional_<native><epic_internal>(viewmodel_type:type, ViewmodelName:[]char)<transacts>:viewmodel_type

            SetViewmodelOptional_<native><epic_internal>(viewmodel_type:type, ViewmodelName:[]char, ViewmodelInstance:viewmodel_type)<transacts>:void

            GetNamedSlot_<native><epic_internal>(NamedSlotName:[]char)<transacts>:widget

            SetNamedSlot_<native><epic_internal>(NamedSlotName:[]char, NamedSlotInstance:widget)<transacts>:void

            GetNamedSlotOptional_<native><epic_internal>(NamedSlotName:[]char)<transacts>:?widget

            SetNamedSlotOptional_<native><epic_internal>(NamedSlotName:[]char, NamedSlotInstance:?widget)<transacts>:void

    using {/UnrealEngine.com/Temporary/Diagnostics}
    # Module import path: /UnrealEngine.com/Temporary/Curves
    Curves<public> := module:
        editable_curve<native><public> := class<final><concrete>:
            # Evaluates this float curve at the specified time and returns the result as a float
            Evaluate<native><public>(Time:float):float

    # Module import path: /UnrealEngine.com/Temporary/Diagnostics
    Diagnostics<public> := module:
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
            DrawSphere<native><public>(Center:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, ?Radius:float = external {}, ?Color:color = external {}, ?NumSegments:int = external {}, ?Thickness:float = external {}, ?DrawDurationPolicy:debug_draw_duration_policy = external {}, ?Duration:float = external {})<transacts>:void

            # Draws a box at the named location, and using the provided draw parameters
            DrawBox<native><public>(Center:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, Rotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation, ?Extent:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}, ?Color:color = external {}, ?Thickness:float = external {}, ?DrawDurationPolicy:debug_draw_duration_policy = external {}, ?Duration:float = external {})<transacts>:void

            # Draws a capsule at the named location, and using the provided draw parameters.
            DrawCapsule<native><public>(Center:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, Rotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation, ?Height:float = external {}, ?Radius:float = external {}, ?Color:color = external {}, ?Thickness:float = external {}, ?DrawDurationPolicy:debug_draw_duration_policy = external {}, ?Duration:float = external {})<transacts>:void

            # Draws a cone at the named location, and using the provided draw parameters.
            DrawCone<native><public>(Origin:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, Direction:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, ?Height:float = external {}, ?NumSides:int = external {}, ?AngleWidthRadians:float = external {}, ?AngleHeightRadians:float = external {}, ?Color:color = external {}, ?Thickness:float = external {}, ?DrawDurationPolicy:debug_draw_duration_policy = external {}, ?Duration:float = external {})<transacts>:void

            # Draws a cylinder at the named location, and using the provided draw parameters.
            DrawCylinder<native><public>(Start:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, End:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, ?NumSegments:int = external {}, ?Radius:float = external {}, ?Color:color = external {}, ?Thickness:float = external {}, ?DrawDurationPolicy:debug_draw_duration_policy = external {}, ?Duration:float = external {})<transacts>:void

            # Draws a line from Start to End locations, and using the provided draw parameters.
            DrawLine<native><public>(Start:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, End:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, ?Color:color = external {}, ?Thickness:float = external {}, ?DrawDurationPolicy:debug_draw_duration_policy = external {}, ?Duration:float = external {})<transacts>:void

            # Draws a point at the named location, and using the provided draw parameters.
            DrawPoint<native><public>(Position:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, ?Color:color = external {}, ?Thickness:float = external {}, ?DrawDurationPolicy:debug_draw_duration_policy = external {}, ?Duration:float = external {})<transacts>:void

            # Draws an arrow pointing from Start to End locations, and using the provided draw parameters.
            DrawArrow<native><public>(Start:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, End:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, ?ArrowSize:float = external {}, ?Color:color = external {}, ?Thickness:float = external {}, ?DrawDurationPolicy:debug_draw_duration_policy = external {}, ?Duration:float = external {})<transacts>:void

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

            # Print message using the given log level
            (/UnrealEngine.com/Temporary/Diagnostics/log:)Print<public>(Message:string, ?Level:log_level = external {})<computes>:void = external {}

            # Print message using the given log level
            (/UnrealEngine.com/Temporary/Diagnostics/log:)Print<epic_internal>(Message:message, ?Level:log_level = external {})<computes><reads>:void = external {}

            # Print diagnostic using the given log level
            (/UnrealEngine.com/Temporary/Diagnostics/log:)Print<public>(Message:diagnostic, ?Level:log_level = external {})<computes>:void = external {}

            # Prints current script call stack using the give log level
            PrintCallStack<native><public>(?Level:log_level = external {})<computes>:void

    # Module import path: /UnrealEngine.com/Temporary/Testing
    Testing<public> := module:
        # test result outcomes
        test_result<native><epic_internal> := enum:
            Passed
            Failed
            Skipped

        # test_reporter is a test result aggregator that writes test results to a log stream and can compile and print a summary of test results.
        test_reporter<native><epic_internal> := class:
            # The name of this `test_reporter`. Used when displaying results summary.
            Name<native><epic_internal>:string = external {}

            # Sets the default log level of the displayed message. See log_level enum for more info on log levels. Defaults to log_level.Normal.
            DefaultLevel<native><epic_internal>:log_level = external {}

            # Resets test results.
            Reset<native><epic_internal>():void

            # Logs `Message` to the `test_reporter` log stream. This allows users to add context for results to the summary.
            (/UnrealEngine.com/Temporary/Testing/test_reporter:)Log<native><epic_internal>(Message:string, ?Level:log_level = external {}):void

            # Report a test result of `Passed`. `Category` and `SubCategory` are used to calculate test result stats as part of printing the summary.
            ReportTestPassed<native><epic_internal>(Message:string, ?Category:string = external {}, ?SubCategory:string = external {}):void

            # Report a test result of `Failed`. `Category` and `SubCategory` are used to calculate test result stats as part of printing the summary.
            ReportTestFailed<native><epic_internal>(Message:string, ?Category:string = external {}, ?SubCategory:string = external {}):void

            # Report a test result of `Skipped`. `Category` and `SubCategory` are used to calculate test result stats as part of printing the summary.
            ReportTestSkipped<native><epic_internal>(Message:string, ?Category:string = external {}, ?SubCategory:string = external {}):void

            # Report a test result of `Result`. `Category` and `SubCategory` are used to calculate test result stats as part of printing the summary.
            ReportTestResult<native><epic_internal>(Message:string, Result:test_result, ?Category:string = external {}, ?SubCategory:string = external {}):void

            # Prints a summary of test results to the log stream and resets the test results.
            PrintSummary<native><epic_internal>(?Level:log_level = external {}):void

            # Returns a string of the test results summary.
            GetSummaryStrings<native><epic_internal>(?Level:log_level = external {}):[]string

    using {/Verse.org/SpatialMath}
    using {/Verse.org/Native}
    # Module import path: /UnrealEngine.com/Temporary/SpatialMath
    (/UnrealEngine.com/Temporary:)SpatialMath<public> := module:
        @editable
        @import_as("/Script/EpicGamesTemporary.FVerseRotation_Deprecated")
        (/UnrealEngine.com/Temporary/SpatialMath:)rotation<native><public> := struct<concrete>:

        # Makes a `rotation` from `Axis` and `AngleRadians` using a left-handed sign convention (e.g. a positive rotation around +Z takes +X to +Y). If `Axis.IsAlmostZero[]`, make the identity rotation.
        (/UnrealEngine.com/Temporary/SpatialMath:)MakeRotation<native><public>(Axis:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, AngleRadians:float)<converges><reads>:(/UnrealEngine.com/Temporary/SpatialMath:)rotation

        # Makes a `rotation` by applying `YawRightDegrees`, `PitchUpDegrees`, and `RollClockwiseDegrees`, in that order:
        #  * first a *yaw* about the Z axis with a positive angle indicating a clockwise rotation when viewed from above,
        #  * then a *pitch* about the new Y axis with a positive angle indicating 'nose up',
        #  * followed by a *roll* about the new X axis axis with a positive angle indicating a clockwise rotation when viewed along +X.
        # Note that these conventions differ from `MakeRotation` but match `ApplyYaw`, `ApplyPitch`, and `ApplyRoll`.
        (/UnrealEngine.com/Temporary/SpatialMath:)MakeRotationFromYawPitchRollDegrees<native><public>(YawRightDegrees:float, PitchUpDegrees:float, RollClockwiseDegrees:float)<converges><reads>:(/UnrealEngine.com/Temporary/SpatialMath:)rotation

        # Makes the identity `rotation`.
        (/UnrealEngine.com/Temporary/SpatialMath:)IdentityRotation<native><public>()<converges>:(/UnrealEngine.com/Temporary/SpatialMath:)rotation

        # Returns the 'distance' between `Rotation1` and `Rotation2`. The result will be between:
        #  * `0.0`, representing equivalent rotations and
        #  * `1.0` representing rotations which are 180 degrees apart (i.e., the shortest rotation between them is 180 degrees around some axis).
        (/UnrealEngine.com/Temporary/SpatialMath:)Distance<native><public>(Rotation1:(/UnrealEngine.com/Temporary/SpatialMath:)rotation, Rotation2:(/UnrealEngine.com/Temporary/SpatialMath:)rotation)<computes><reads>:float

        # Returns the 'smallest angular distance' between `Rotation1` and `Rotation2` in radians.
        (/UnrealEngine.com/Temporary/SpatialMath:)AngularDistance<native><public>(Rotation1:(/UnrealEngine.com/Temporary/SpatialMath:)rotation, Rotation2:(/UnrealEngine.com/Temporary/SpatialMath:)rotation)<computes><reads>:float

        # Makes a `rotation` by applying `PitchUpRadians` of right-handed rotation around the local +Y axis to `InitialRotation`.
        (InitialRotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation).(/UnrealEngine.com/Temporary/SpatialMath:)ApplyPitch<native><public>(PitchUpRadians:float)<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)rotation

        # Makes a `rotation` by applying `RollClockwiseRadians` of right-handed rotation around the local +X axis to `InitialRotation`.
        (InitialRotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation).(/UnrealEngine.com/Temporary/SpatialMath:)ApplyRoll<native><public>(RollClockwiseRadians:float)<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)rotation

        # Makes a `rotation` by applying `YawRightRadians` of left-handed rotation around the local +Z axis to `InitialRotation`.
        (InitialRotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation).(/UnrealEngine.com/Temporary/SpatialMath:)ApplyYaw<native><public>(YawRightRadians:float)<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)rotation

        # Makes a `rotation` by applying `AngleRadians` of left-handed rotation around the world +X axis to `InitialRotation`.
        (InitialRotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation).ApplyWorldRotationX<native><public>(AngleRadians:float)<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)rotation

        # Makes a `rotation` by applying `AngleRadians` of left-handed rotation around the world +Y axis to `InitialRotation`.
        (InitialRotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation).ApplyWorldRotationY<native><public>(AngleRadians:float)<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)rotation

        # Makes a `rotation` by applying `AngleRadians` of left-handed rotation around the world +Z axis to `InitialRotation`.
        (InitialRotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation).ApplyWorldRotationZ<native><public>(AngleRadians:float)<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)rotation

        # Makes a `rotation` by applying `AngleRadians` of left-handed rotation around the local +Y axis to `InitialRotation`.
        (InitialRotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation).ApplyLocalRotationY<public>(AngleRadians:float)<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)rotation = external {}

        # Makes a `rotation` by applying `AngleRadians` of left-handed rotation around the local +Z axis to `InitialRotation`.
        (InitialRotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation).ApplyLocalRotationZ<public>(AngleRadians:float)<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)rotation = external {}

        # Makes a `rotation` by composing `AdditionalRotation` to `InitialRotation`.
        (InitialRotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation).(/UnrealEngine.com/Temporary/SpatialMath:)RotateBy<native><public>(AdditionalRotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation)<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)rotation

        # Makes a `rotation` by composing the inverse of `RotationToRemove` from `InitialRotation`. such that InitialRotation = RotateBy(UnrotateBy(InitialRotation, RotationToRemove), RotationToRemove). This is equivalent to RotateBy(InitialRotation, InvertRotation(RotationToRemove))
        (InitialRotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation).(/UnrealEngine.com/Temporary/SpatialMath:)UnrotateBy<native><public>(RotationToRemove:(/UnrealEngine.com/Temporary/SpatialMath:)rotation)<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)rotation

        # Makes an `[]float` with three elements:
        #  * *yaw* degrees of `rotation`
        #  * *pitch* degrees of `rotation`
        #  * *roll* degrees of `rotation`
        # using the conventions of `MakeRotationFromYawPitchRollDegrees`.
        (Rotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation).(/UnrealEngine.com/Temporary/SpatialMath:)GetYawPitchRollDegrees<native><public>()<computes><reads>:[]float

        # Makes a `vector3` from the axis of `rotation`.
        # If `rotation` is nearly identity, this will return the +X axis. See also `GetAngle`.
        (Rotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation).(/UnrealEngine.com/Temporary/SpatialMath:)GetAxis<native><public>()<computes><reads>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3

        # Returns the radians of `rotation` around the axis of `rotation`. See also `GetAxis`.
        (Rotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation).(/UnrealEngine.com/Temporary/SpatialMath:)GetAngle<native><public>()<computes><reads>:float

        # Makes the smallest angular `rotation` from `InitialRotation` to `FinalRotation` such that:
        # `InitialRotation.RotateBy(MakeShortestRotationBetween(InitialRotation, FinalRotation)) = FinalRotation` and
        # `MakeShortestRotationBetween(InitialRotation, FinalRotation)?.GetAngle()` is as small as possible.
        (/UnrealEngine.com/Temporary/SpatialMath:)MakeShortestRotationBetween<native><public>(InitialRotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation, FinalRotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation)<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)rotation

        # Makes the smallest angular `rotation` from `InitialVector` to `FinalVector` such that:
        # `InitialVector.RotateBy(MakeShortestRotationBetween(InitialVector, Vector)) = FinalVector` and
        # `MakeShortestRotationBetween(InitialVector, FinalVector)?.GetAngle()` is as small as possible.
        (/UnrealEngine.com/Temporary/SpatialMath:)MakeShortestRotationBetween<native><public>(InitialVector:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, FinalVector:(/UnrealEngine.com/Temporary/SpatialMath:)vector3)<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)rotation

        # Makes a new `rotation` from the component wise subtraction of the Euler angle components in `RotationA` by 
        # the Euler angle components in `RotationB` and ensures the returned value is normalized.
        (/UnrealEngine.com/Temporary/SpatialMath:)MakeComponentWiseDeltaRotation<native><public>(RotationA:(/UnrealEngine.com/Temporary/SpatialMath:)rotation, RotationB:(/UnrealEngine.com/Temporary/SpatialMath:)rotation)<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)rotation

        # Used to perform spherical linear interpolation between `From` (when `Parameter = 0.0`) and `To` (when `Parameter = 1.0`). Expects that `0.0 <= Parameter <= 1.0`.
        (/UnrealEngine.com/Temporary/SpatialMath:)Slerp<native><public>(InitialRotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation, FinalRotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation, Parameter:float)<transacts><decides>:(/UnrealEngine.com/Temporary/SpatialMath:)rotation

        # Makes a `vector3` by applying `Rotation` to `Vector`.
        (Rotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation).(/UnrealEngine.com/Temporary/SpatialMath:)RotateVector<native><public>(Vector:(/UnrealEngine.com/Temporary/SpatialMath:)vector3)<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3

        # Makes a `vector3` by applying the inverse of `Rotation` to `Vector`.
        (Rotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation).(/UnrealEngine.com/Temporary/SpatialMath:)UnrotateVector<native><public>(Vector:(/UnrealEngine.com/Temporary/SpatialMath:)vector3)<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3

        # Makes a `rotation` by inverting `Rotation` such that `ApplyRotation(Rotation, Rotation.Invert())) = IdentityRotation`.
        (Rotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation).(/UnrealEngine.com/Temporary/SpatialMath:)Invert<native><public>()<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)rotation

        # Returns `Rotation` if it does not contain `NaN`, `Inf` or `-Inf`.
        (Rotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation).(/UnrealEngine.com/Temporary/SpatialMath:)IsFinite<native><public>()<converges><decides>:(/UnrealEngine.com/Temporary/SpatialMath:)rotation

        # Makes a unit `vector3` pointing in the local space *forward* direction in world space coordinates.
        # This is equivalent to: `RotateVector(Rotation, vector3{X:=1.0, Y:=0.0, Z:=0.0})`.
        (Rotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation).(/UnrealEngine.com/Temporary/SpatialMath:)GetLocalForward<public>()<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

        # Makes a unit `vector3` pointing in the the local space *right* direction in world space coordinates.
        # This is equivalent to: `RotateVector(Rotation, vector3{X:=0.0, Y:=1.0, Z:=0.0})`.
        (Rotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation).(/UnrealEngine.com/Temporary/SpatialMath:)GetLocalRight<public>()<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

        # Makes a unit `vector3` pointing in the local space *up* direction in world space coordinates.
        # This is equivalent to: `RotateVector(Rotation, vector3{X:=0.0, Y:=0.0, Z:=1.0})`.
        (Rotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation).(/UnrealEngine.com/Temporary/SpatialMath:)GetLocalUp<public>()<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

        # Makes a `string` representation of `rotation` in axis/degrees format with a left-handed sign convention.
        # `ToString(MakeRotation(vector3{X:=1.0, Y:=0.0, Z:=0.0}, PiFloat/2.0))` produces the string: `"Axis: {x=1.000000,y=0.000000,z=0.000000} Angle: 90.000000"`.
        (/UnrealEngine.com/Temporary/SpatialMath:)ToString<native><public>(Rotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation)<computes><reads>:string

        # Returns radians from `Degrees`.
        (/UnrealEngine.com/Temporary/SpatialMath:)DegreesToRadians<public>(Degrees:float)<computes><reads>:float = external {}

        # Returns degrees from `Radians`.
        (/UnrealEngine.com/Temporary/SpatialMath:)RadiansToDegrees<public>(Radians:float)<computes><reads>:float = external {}

        @experimental
        @available {MinUploadedAtFNVersion := 3400}
        # Util function for converting a `vector3` from /UnrealEngine.com/Temporary/SpatialMath to a `vector3` from /Verse.org/SpatialMath.
        FromVector3<public>(InVector3:(/UnrealEngine.com/Temporary/SpatialMath:)vector3)<computes><reads>:(/Verse.org/SpatialMath:)vector3 = external {}

        @experimental
        @available {MinUploadedAtFNVersion := 3400}
        # Util function for converting a `rotation` from /UnrealEngine.com/Temporary/SpatialMath to a `rotation` from /Verse.org/SpatialMath.
        FromRotation<public>(InRotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation)<computes><reads>:(/Verse.org/SpatialMath:)rotation = external {}

        @experimental
        @available {MinUploadedAtFNVersion := 3400}
        # Util function for converting a `transform` from /UnrealEngine.com/Temporary/SpatialMath to a `transform` from /Verse.org/SpatialMath.
        FromTransform<public>(InTransform:(/UnrealEngine.com/Temporary/SpatialMath:)transform)<computes><reads>:(/Verse.org/SpatialMath:)transform = external {}

        @experimental
        @available {MinUploadedAtFNVersion := 3400}
        # Util function for converting a `vector3` from /Verse.org/SpatialMath to a `vector3` from /UnrealEngine.com/Temporary/SpatialMath.
        FromVector3<public>(InVector3:(/Verse.org/SpatialMath:)vector3)<computes><reads>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

        @experimental
        @available {MinUploadedAtFNVersion := 3400}
        # Util function for converting a `rotation` from /Verse.org/SpatialMath to a `rotation` from /UnrealEngine.com/Temporary/SpatialMath.
        FromRotation<public>(InRotation:(/Verse.org/SpatialMath:)rotation)<computes><reads>:(/UnrealEngine.com/Temporary/SpatialMath:)rotation = external {}

        @experimental
        @available {MinUploadedAtFNVersion := 3400}
        # Util function for converting a `transform` from /Verse.org/SpatialMath to a `transform` from /UnrealEngine.com/Temporary/SpatialMath.
        FromTransform<public>(InTransform:(/Verse.org/SpatialMath:)transform)<computes><reads>:(/UnrealEngine.com/Temporary/SpatialMath:)transform = external {}

        # A combination of scale, rotation, and translation, applied in that order.
        (/UnrealEngine.com/Temporary/SpatialMath:)transform<native><public> := struct<concrete><computes>:
            @editable
            # The scale of this `transform`.
            Scale<native><public>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

            @editable
            # The rotation of this `transform`.
            Rotation<native><public>:(/UnrealEngine.com/Temporary/SpatialMath:)rotation = external {}

            @editable
            # The location of this `transform`.
            Translation<native><public>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

        # Makes a `vector3` by applying `InTransform` to `InVector`.
        (/UnrealEngine.com/Temporary/SpatialMath:)TransformVector<native><public>(InTransform:(/UnrealEngine.com/Temporary/SpatialMath:)transform, InVector:(/UnrealEngine.com/Temporary/SpatialMath:)vector3)<computes><reads>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3

        # Makes a `vector3` by applying `InTransform` to `InVector` without applying `InTransform.Scale`.
        (/UnrealEngine.com/Temporary/SpatialMath:)TransformVectorNoScale<native><public>(InTransform:(/UnrealEngine.com/Temporary/SpatialMath:)transform, InVector:(/UnrealEngine.com/Temporary/SpatialMath:)vector3)<computes><reads>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3

        # Makes a `string` representation of `InTransform` where the result is on the form.
        # `"Scale: {ToString(`InTransform.Scale`)} Rotation: {ToString(`InTransform.Rotation`)} Translation: {ToString(`InTransform.Translation`)}.
        (/UnrealEngine.com/Temporary/SpatialMath:)ToString<native><epic_internal>(InTransform:(/UnrealEngine.com/Temporary/SpatialMath:)transform)<computes><reads>:string

        # 2-dimensional vector with `float` components.
        vector2<native><public> := struct<concrete><computes><persistable>:
            @editable
            X<native><public>:float = external {}

            @editable
            Y<native><public>:float = external {}

        # Makes a `vector2` by inverting the `SurfaceNormal` component of `Direction`.
        # Fails if `not SurfaceNormal.MakeUnitVector[]`.
        (/UnrealEngine.com/Temporary/SpatialMath:)ReflectVector<native><public>(Direction:vector2, SurfaceNormal:vector2)<computes><decides><reads>:vector2

        # Returns the dot product of `V1` and `V2`.
        (/UnrealEngine.com/Temporary/SpatialMath:)DotProduct<native><public>(V1:vector2, V2:vector2)<computes><reads>:float

        # Returns the Euclidean distance between `V1` and `V2`.
        (/UnrealEngine.com/Temporary/SpatialMath:)Distance<native><public>(V1:vector2, V2:vector2)<computes><reads>:float

        # Returns the squared Euclidean distance between `V1` and `V2`.
        (/UnrealEngine.com/Temporary/SpatialMath:)DistanceSquared<native><public>(V1:vector2, V2:vector2)<computes><reads>:float

        # Makes a unit length `vector3` pointing in the same direction of `V`.
        # Fails if `V.IsAlmostZero[] or not V.IsFinite[]`.
        (V:vector2).(/UnrealEngine.com/Temporary/SpatialMath:)MakeUnitVector<native><public>()<computes><decides><reads>:vector2

        # Returns the length of `V`.
        (V:vector2).(/UnrealEngine.com/Temporary/SpatialMath:)Length<public>()<computes><reads>:float = external {}

        # Returns the squared length of `V`.
        (V:vector2).(/UnrealEngine.com/Temporary/SpatialMath:)LengthSquared<public>()<computes><reads>:float = external {}

        # Used to linearly interpolate/extrapolate between `From` (when `Parameter = 0.0`) and `To` (when `Parameter = 1.0`). Expects that all arguments are finite.
        # Returns `From*(1 - Parameter) + To*Parameter`.
        (/UnrealEngine.com/Temporary/SpatialMath:)Lerp<public>(From:vector2, To:vector2, Parameter:float)<computes><reads>:vector2 = external {}

        # Makes a `string` representation of `V`.
        (/UnrealEngine.com/Temporary/SpatialMath:)ToString<native><public>(V:vector2)<computes><reads>:string

        # Makes a `vector2` by inverting the signs of `Operand`.
        (/UnrealEngine.com/Temporary/SpatialMath:)prefix'-'<public>(Operand:vector2)<computes>:vector2 = external {}

        # Makes a `vector2` by component-wise addition of `Left` and `Right`.
        (/UnrealEngine.com/Temporary/SpatialMath:)operator'+'<public>(Left:vector2, Right:vector2)<computes>:vector2 = external {}

        # Makes a `vector2` by component-wise subtraction of `Right` from `Left`.
        (/UnrealEngine.com/Temporary/SpatialMath:)operator'-'<public>(Left:vector2, Right:vector2)<computes>:vector2 = external {}

        # Makes a `vector2` by component-wise multiplication of `Left` and `Right`.
        (/UnrealEngine.com/Temporary/SpatialMath:)operator'*'<public>(Left:vector2, Right:float)<computes>:vector2 = external {}

        # Makes a `vector2` by multiplying the components of `Right` by `Left`.
        (/UnrealEngine.com/Temporary/SpatialMath:)operator'*'<public>(Left:float, Right:vector2)<computes>:vector2 = external {}

        # Makes a `vector2` by dividing the components of `Left` by `Right`.
        (/UnrealEngine.com/Temporary/SpatialMath:)operator'/'<public>(Left:vector2, Right:float)<computes>:vector2 = external {}

        # Makes a `vector2` by component-wise division of `Left` by `Right`.
        (/UnrealEngine.com/Temporary/SpatialMath:)operator'/'<public>(Left:vector2, Right:vector2)<computes>:vector2 = external {}

        # Makes a `vector2` by converting the components of `V` to `float`s.
        ToVector2<public>(V:vector2i)<transacts>:vector2 = external {}

        # Returns `V` if all components are finite.
        # Fails if any of the components are not finite.
        (V:vector2).(/UnrealEngine.com/Temporary/SpatialMath:)IsFinite<public>()<computes><decides>:vector2 = external {}

        # Succeeds when each component of `V` is within `AbsoluteTolerance` of `0.0`.
        (V:vector2).(/UnrealEngine.com/Temporary/SpatialMath:)IsAlmostZero<public>(AbsoluteTolerance:float)<computes><decides>:void = external {}

        # Succeeds when each component of `V1` and `V2` are within `AbsoluteTolerance` of each other.
        (/UnrealEngine.com/Temporary/SpatialMath:)IsAlmostEqual<public>(V1:vector2, V2:vector2, AbsoluteTolerance:float)<computes><decides>:void = external {}

        # 2-dimensional vector with `int` components.
        vector2i<native><public> := struct<concrete><computes><persistable>:
            @editable
            X<native><public>:int = external {}

            @editable
            Y<native><public>:int = external {}

        # Returns the dot product of `V1` and `V2`.
        (/UnrealEngine.com/Temporary/SpatialMath:)DotProduct<public>(V1:vector2i, V2:vector2i)<computes>:int = external {}

        # Makes a `vector2i` that is component-wise equal to `V1` and `V2`.
        # Fails if any component of `V1` does not equal the corresponding component of `V2`.
        Equals<public>(V1:vector2i, V2:vector2i)<computes><decides>:vector2i = external {}

        # Makes a `string` representation of `V`.
        (/UnrealEngine.com/Temporary/SpatialMath:)ToString<native><public>(V:vector2i)<computes>:string

        # Makes a `vector2i` by component-wise truncation of `V` to `ints`s.
        ToVector2i<public>(V:vector2)<computes><decides><reads>:vector2i = external {}

        # Makes a `vector2i` by inverting the signs of `Operand`.
        (/UnrealEngine.com/Temporary/SpatialMath:)prefix'-'<public>(Operand:vector2i)<computes>:vector2i = external {}

        # Makes a `vector2i` by component-wise addition of `Left` and `Right`.
        (/UnrealEngine.com/Temporary/SpatialMath:)operator'+'<public>(Left:vector2i, Right:vector2i)<computes>:vector2i = external {}

        # Makes a `vector2i` by component-wise subtraction of `Right` from `Left`.
        (/UnrealEngine.com/Temporary/SpatialMath:)operator'-'<public>(Left:vector2i, Right:vector2i)<computes>:vector2i = external {}

        # Makes a `vector2i` by multiplying the components of `Left` by `Right`.
        (/UnrealEngine.com/Temporary/SpatialMath:)operator'*'<public>(Left:vector2i, Right:int)<computes>:vector2i = external {}

        # Makes a `vector2i` by multiplying the components of `Right` by `Left`.
        (/UnrealEngine.com/Temporary/SpatialMath:)operator'*'<public>(Left:int, Right:vector2i)<computes>:vector2i = external {}

        # 3-dimensional vector with `float` components.
        (/UnrealEngine.com/Temporary/SpatialMath:)vector3<native><public> := struct<concrete><computes><persistable>:
            @editable
            X<native><public>:float = external {}

            @editable
            Y<native><public>:float = external {}

            @editable
            Z<native><public>:float = external {}

        # Makes a unit `vector3` pointing in the positive X axis (forward)
        XAxis<epic_internal>()<computes>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

        # Makes a unit `vector3` pointing in the positive Y axis (right)
        YAxis<epic_internal>()<computes>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

        # Makes a unit `vector3` pointing in the positive Z axis (up)
        ZAxis<epic_internal>()<computes>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

        # Makes a `vector3` with all components `0.0`.
        (/UnrealEngine.com/Temporary/SpatialMath:)Zero<epic_internal>()<computes>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

        # Makes a `vector3` with all components `1.0`.
        (/UnrealEngine.com/Temporary/SpatialMath:)Ones<epic_internal>()<computes>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

        # Makes a `vector3` by inverting the `SurfaceNormal` component of `Direction`.
        # Fails if `not SurfaceNormal.MakeUnitVector[]`.
        (/UnrealEngine.com/Temporary/SpatialMath:)ReflectVector<native><public>(Direction:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, SurfaceNormal:(/UnrealEngine.com/Temporary/SpatialMath:)vector3)<computes><decides><reads>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3

        # Returns the dot product of `V1` and `V2`.
        (/UnrealEngine.com/Temporary/SpatialMath:)DotProduct<native><public>(V1:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, V2:(/UnrealEngine.com/Temporary/SpatialMath:)vector3)<computes><reads>:float

        # Returns the cross product of `V1` and `V2`.
        CrossProduct<native><public>(V1:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, V2:(/UnrealEngine.com/Temporary/SpatialMath:)vector3)<computes><reads>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3

        # Returns the Euclidean distance between `V1` and `V2`.
        (/UnrealEngine.com/Temporary/SpatialMath:)Distance<native><public>(V1:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, V2:(/UnrealEngine.com/Temporary/SpatialMath:)vector3)<computes><reads>:float

        # Returns the squared Euclidean distance between `V1` and `V2`.
        (/UnrealEngine.com/Temporary/SpatialMath:)DistanceSquared<native><public>(V1:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, V2:(/UnrealEngine.com/Temporary/SpatialMath:)vector3)<computes><reads>:float

        # Returns the 2-D Euclidean distance between `V1` and `V2` by ignoring the difference in `Z`.
        DistanceXY<native><public>(V1:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, V2:(/UnrealEngine.com/Temporary/SpatialMath:)vector3)<computes><reads>:float

        # Returns the squared 2-D Euclidean distance between `V1` and `V2` by ignoring their difference in `Z`.
        DistanceSquaredXY<native><public>(V1:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, V2:(/UnrealEngine.com/Temporary/SpatialMath:)vector3)<computes><reads>:float

        # Makes a unit length `vector3` pointing in the same direction of `V`.
        # Fails if `V.IsAlmostZero[] or not V.IsFinite[]`.
        (V:(/UnrealEngine.com/Temporary/SpatialMath:)vector3).(/UnrealEngine.com/Temporary/SpatialMath:)MakeUnitVector<native><public>()<computes><decides><reads>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3

        # Makes a `string` representation of `V`.
        (/UnrealEngine.com/Temporary/SpatialMath:)ToString<native><public>(V:(/UnrealEngine.com/Temporary/SpatialMath:)vector3)<computes><reads>:string

        # Returns the length of `V`.
        (V:(/UnrealEngine.com/Temporary/SpatialMath:)vector3).(/UnrealEngine.com/Temporary/SpatialMath:)Length<public>()<computes><reads>:float = external {}

        # Returns the squared length of `V`.
        (V:(/UnrealEngine.com/Temporary/SpatialMath:)vector3).(/UnrealEngine.com/Temporary/SpatialMath:)LengthSquared<public>()<computes>:float = external {}

        # Returns the length of `V` as if `V.Z = 0.0`.
        (V:(/UnrealEngine.com/Temporary/SpatialMath:)vector3).LengthXY<public>()<computes><reads>:float = external {}

        # Returns the squared length of `V` as if `V.Z = 0.0`.
        (V:(/UnrealEngine.com/Temporary/SpatialMath:)vector3).LengthSquaredXY<public>()<computes><reads>:float = external {}

        # Used to linearly interpolate/extrapolate between `From` (when `Parameter = 0.0`) and `To` (when `Parameter = 1.0`). Expects that all arguments are finite.
        # Returns `From*(1 - Parameter) + To*Parameter`.
        (/UnrealEngine.com/Temporary/SpatialMath:)Lerp<public>(From:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, To:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, Parameter:float)<computes><reads>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

        # Makes a `vector3` by inverting the signs of `Operand`.
        (/UnrealEngine.com/Temporary/SpatialMath:)prefix'-'<public>(Operand:(/UnrealEngine.com/Temporary/SpatialMath:)vector3)<computes>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

        # Makes a `vector3` by component-wise addition of `Left` and `Right`.
        (/UnrealEngine.com/Temporary/SpatialMath:)operator'+'<public>(Left:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, Right:(/UnrealEngine.com/Temporary/SpatialMath:)vector3)<computes>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

        # Makes a `vector3` by component-wise subtraction of `Right` from `Left`.
        (/UnrealEngine.com/Temporary/SpatialMath:)operator'-'<public>(Left:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, Right:(/UnrealEngine.com/Temporary/SpatialMath:)vector3)<computes>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

        # Makes a `vector3` by component-wise multiplication of `Left` and `Right`.
        (/UnrealEngine.com/Temporary/SpatialMath:)operator'*'<public>(Left:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, Right:(/UnrealEngine.com/Temporary/SpatialMath:)vector3)<computes>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

        # Makes a `vector3` by multiplying the components of `Left` by `Right`.
        (/UnrealEngine.com/Temporary/SpatialMath:)operator'*'<public>(Left:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, Right:float)<computes>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

        # Makes a `vector3` by multiplying the components of `Right` by `Left`.
        (/UnrealEngine.com/Temporary/SpatialMath:)operator'*'<public>(Left:float, Right:(/UnrealEngine.com/Temporary/SpatialMath:)vector3)<computes>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

        # Makes a `vector3` by dividing the components of `Left` by `Right`.
        (/UnrealEngine.com/Temporary/SpatialMath:)operator'/'<public>(Left:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, Right:float)<computes>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

        # Makes a `vector3` by component-wise division of `Left` by `Right`.
        (/UnrealEngine.com/Temporary/SpatialMath:)operator'/'<public>(Left:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, Right:(/UnrealEngine.com/Temporary/SpatialMath:)vector3)<computes>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

        # Returns `V` if all components are finite.
        # Fails if any of the components are not finite.
        (V:(/UnrealEngine.com/Temporary/SpatialMath:)vector3).(/UnrealEngine.com/Temporary/SpatialMath:)IsFinite<public>()<computes><decides>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

        # Succeeds when each component of `V` is within `AbsoluteTolerance` of `0.0`.
        (V:(/UnrealEngine.com/Temporary/SpatialMath:)vector3).(/UnrealEngine.com/Temporary/SpatialMath:)IsAlmostZero<public>(AbsoluteTolerance:float)<computes><decides>:void = external {}

        # Succeeds when each component of `V1` and `V2` are within `AbsoluteTolerance` of each other.
        (/UnrealEngine.com/Temporary/SpatialMath:)IsAlmostEqual<public>(V1:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, V2:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, AbsoluteTolerance:float)<computes><decides>:void = external {}

    @experimental
    playable<epic_internal> := interface<epic_internal>:
        @experimental
        Play<public>():void

        @experimental
        Pause<public>():void

        @experimental
        Stop<public>(?BlendOutTime:float = external {}):void

        @experimental
        GetDuration<public>()<decides>:float

        @experimental
        GetOnFinishedEvent<public>()<computes><decides><reads>:listenable(tuple())

        @experimental
        GetOnStoppedEvent<public>():listenable(tuple())

        @experimental
        GetOnPlayedEvent<public>():listenable(tuple())

        @experimental
        GetOnPausedEvent<public>():listenable(tuple())

    # Stably sort `Array` using `Less` where `Less` succeeding indicates `Left` should precede `Right`
    SortBy<native><public>(Array:[]t, Less:type {_(:t, :t)<computes><decides>:void} where t:type)<computes>:[]t

AINavigation<public> := module:
    using {/Verse.org/SceneGraph}
    using {/Verse.org/Native}
    using {/Verse.org/Simulation}
    using {/UnrealEngine.com/Temporary/SpatialMath}
    # Navigation layers are various representations of the world that can be used by agents of different shapes and abilities
    navigation_layer<native><epic_internal> := class<abstract>:

    # Auto select a ground layer based on the user's collision component
    navigation_layer_ground_auto<native><epic_internal> := class<concrete><final>(navigation_layer):

    # Use the most granular air field available
    navigation_layer_air_auto<native><epic_internal> := class<concrete><final>(navigation_layer):

    # Result of a navigation request
    navigation_find_path_result<native><epic_internal> := enum:
        # A valid navigation path was found.
        PathFound
        # The destination is unreachable. The path leads to the reachable location closest to the destination.
        PartialUnreachable
        # Search limit was reached before a path could be found. The path leads to the closest location to the destination that the search had time to visit.
        PartialReachedLimit
        # The request contains invalid or missing data.
        InvalidRequest
        # The origin location cannot be associated to the query's navigation_layer.
        StartLocationNonNavigable
        # The destination cannot be associated to the query's navigation_layer.
        DestinationNonNavigable
        # There is no path that connect the start and end location using the query parameters.
        DestinationUnreachable

    # Describes the location and characteristics of a point along a navigation path.
    navigation_path_point<native><epic_internal> := struct<concrete>:
        @editable
        # Position of the point in the world.
        Location<native><public>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

    # Contains the resulting path and status from a find path query.
    navigation_path<native><epic_internal> := class<final><epic_internal>:
        # Returns the points that form the path. Fails if the path is invalid.
        GetPathPoints<native><public>()<transacts><decides>:[]navigation_path_point

        # Whether this path completed successfully or encountered a problem.
        Result<native><public>:navigation_find_path_result

    @import_as("/Script/AINavigation.UCompositeNavigationQuery")
    # Defines the parameters of a navigation query such as finding a path or projecting a point.
    navigation_query<native><epic_internal> := class<concrete><final>:

    @experimental
    # Component that describes the navigation preferences of this entity and offers helpers to find paths using those preferences.
    navigation_user_component<native><epic_internal> := class<final><final_super>(component):
        OnAddedToScene<native><override>():void

        OnRemovingFromScene<native><override>():void

        @editable
        # Default navigation query parameters for this entity.
        DefaultNavigationQuery<native><public>:navigation_query

    @experimental
    # Finds and returns the path between this entity's location and the target location.
    (InEntity:entity).FindPath<native><epic_internal>(Destination:(/UnrealEngine.com/Temporary/SpatialMath:)vector3)<suspends>:navigation_path

    @experimental
    # Finds and returns the path between this entity's location and the target location, filtering the path using supplied Query
    (InEntity:entity).FindPath<native><epic_internal>(Destination:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, Query:navigation_query)<suspends>:navigation_path

Tests<public> := module:
    # Module import path: /UnrealEngine.com/Tests/NexusUtils
    NexusUtils<public> := module:
        nexus_utils<native><epic_internal> := class:
            PrintEpicAPIFunctionLog<native><public>():void


WebAPI<public> := module:
    # Usage:
    #     Licensed users create a derived version of `client_id` in their module.
    #     The Verse class path for your derived `client_id` is then used as the 
    #     configuration key in your backend service to map to your endpoint.
    # 
    #     WARNING: do not make your derived `client_id` class public. This object
    #     type is your private key to your backend.
    # 
    # Example:
    #     my_client_id<internal> := class<final><computes>(client_id)
    #     MyClient<internal> := MakeClient(my_client_id)
    client_id<native><public> := class<abstract><computes>:

    client<native><public> := class<final><computes><internal>:
        Get<native><public>(Path:string)<suspends>:response

    response<native><public> := class<internal>:

    body_response<native><public> := class<internal>(response):
        GetBody<native><public>()<computes>:string

    MakeClient<constructor><native><public>(ClientId:client_id)<converges>:client

JSON<public> := module:
    value<native><public> := class:
        # Retrieve an object value or fail if value is not a json object
        AsObject<native><public>()<transacts><decides>:[string]value

        # Retrieve an array value or fail if value is not a json array
        AsArray<native><public>()<transacts><decides>:[]value

        # Retrieve an integer value or fail if value is not a json number
        AsInt<native><public>()<transacts><decides>:int

        # Retrieve a float value or fail if value is not a json number
        AsFloat<native><public>()<transacts><decides>:float

        # Retrieve an object value or fail if value is not a string
        AsString<native><public>()<transacts><decides>:string

        # Retrieve an object value or fail if value is not null
        AsNull<native><public>()<transacts><decides>:void

    # Parse a JSON string returning a value with its contents
    Parse<native><public>(JSONString:string)<transacts><decides>:value

using {/UnrealEngine.com/Temporary/SpatialMath}
# Module import path: /UnrealEngine.com/Assets
(/UnrealEngine.com:)Assets<public> := module:
    play_sound_subscription<native><epic_internal> := class(cancelable):
        Cancel<native><override>()<transacts>:void

    PlaySound<native><epic_internal>(Asset:sound, ?StartDelay:float = external {})<transacts>:cancelable

    PlaySoundAtLocation<native><epic_internal>(Asset:sound, Position:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, ?Rotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation = external {}, ?StartDelay:float = external {})<transacts>:cancelable

    spawn_particle_system_subscription<native><epic_internal> := class(cancelable):
        Cancel<native><override>()<transacts>:void

    SpawnParticleSystem<native><public>(Asset:particle_system, Position:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, ?Rotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation = external {}, ?StartDelay:float = external {})<transacts>:cancelable
EditableSubclass<public> := module:
    using {/Verse.org/Assets}
    verse_editable_subclass<native><epic_internal> := class(asset):

using {/Verse.org/Simulation}
# Module import path: /UnrealEngine.com/EntityRegistryTestSuite
EntityRegistryTestSuite<public> := module:
    @hide_in_editor
    @experimental
    entity_registry_test_entity<native><epic_internal> := class(entity):

    @hide_in_editor
    @experimental
    entity_registry_not_used_test_entity<native><epic_internal> := class(entity):

    @hide_in_editor
    @experimental
    entity_registry_test_component<native><epic_internal> := class<final_super>(component):

    @hide_in_editor
    @experimental
    entity_registry_other_test_component<native><epic_internal> := class<final_super>(component):

    @hide_in_editor
    @experimental
    entity_registry_unused_test_component<native><epic_internal> := class<final_super>(component):

using {/Verse.org/Simulation/Tags}
# Module import path: /UnrealEngine.com/ComponentTestSuite
ComponentTestSuite<public> := module:
    @experimental
    @hide_in_editor
    test_component_key_component_base<native><epic_internal> := class<final_super>(component):

    @experimental
    @hide_in_editor
    test_component_key_component_a<native><epic_internal> := class(test_component_key_component_base):

    @experimental
    @hide_in_editor
    test_component_key_component_b<native><epic_internal> := class(test_component_key_component_base):

    @hide_in_editor
    test_tag_animal<native><epic_internal> := class(tag):

    @hide_in_editor
    test_tag_animal_cat<native><epic_internal> := class(test_tag_animal):

    @hide_in_editor
    test_tag_animal_cat_cheddar<native><epic_internal> := class(test_tag_animal_cat):

    @hide_in_editor
    test_tag_animal_cat_jello<native><epic_internal> := class(test_tag_animal_cat):

    @hide_in_editor
    test_tag_animal_dog<native><epic_internal> := class(test_tag_animal):

    @hide_in_editor
    test_tag_animal_dog_kimchi<native><epic_internal> := class(test_tag_animal_dog):

    @hide_in_editor
    test_tag_animal_dog_pollo<native><epic_internal> := class(test_tag_animal_dog):

    @hide_in_editor
    test_tag_vehicle<native><epic_internal> := class(tag):

    @hide_in_editor
    test_tag_vehicle_bike<native><epic_internal> := class(test_tag_vehicle):

    @hide_in_editor
    test_tag_vehicle_bike_norton<native><epic_internal> := class(test_tag_vehicle_bike):

    @hide_in_editor
    test_tag_vehicle_car<native><epic_internal> := class(test_tag_vehicle):

    @hide_in_editor
    test_tag_vehicle_car_datsun<native><epic_internal> := class(test_tag_vehicle_car):

# Module import path: /UnrealEngine.com/EntityTestSuite
EntityTestSuite<public> := module:
    @hide_in_editor
    @experimental
    test_contentscope_events_component<native><epic_internal> := class<final_super>(component):
        KeyframeReachedEvent<native><public>:listenable(tuple()) = external {}

        OnBeginSimulation<override>():void = external {}

    @hide_in_editor
    @experimental
    test_contentscope_execution_component<native><epic_internal> := class<final_super>(component):
        OnBeginSimulation<override>():void = external {}

    @hide_in_editor
    @experimental
    test_replication_component<native><epic_internal> := class<final_super>(component):

    @hide_in_editor
    @experimental
    test_replication_object<native><epic_internal> := class:

    @hide_in_editor
    @experimental
    test_component<native><epic_internal> := class<final_super>(component):

    @hide_in_editor
    @experimental
    derived_test_component<native><epic_internal> := class(test_component):

    @hide_in_editor
    @experimental
    second_derived_test_component<native><epic_internal> := class(test_component):

    @hide_in_editor
    @experimental
    lambda_test_component<native><epic_internal> := class<final_super>(component):
        OnInitializedInternal<native><override>():void

        OnAddedToSceneInternal<native><override>():void

        OnBeginSimulationInternal<native><override>():void

        OnEndSimulationInternal<native><override>():void

        OnRemovingFromSceneInternal<native><override>():void

        OnUninitializingInternal<native><override>():void

        OnSimulate<override>()<suspends>:void = external {}

    @hide_in_editor
    @experimental
    lambda_test_component_2<native><epic_internal> := class<final_super>(component):
        OnInitializedInternal<native><override>():void

        OnAddedToSceneInternal<native><override>():void

        OnBeginSimulationInternal<native><override>():void

        OnEndSimulationInternal<native><override>():void

        OnRemovingFromSceneInternal<native><override>():void

        OnUninitializingInternal<native><override>():void

        OnSimulate<override>()<suspends>:void = external {}

# Module import path: /UnrealEngine.com/PlayspaceInternal
PlayspaceInternal<public> := module:
    @hide_in_editor
    @experimental
    playspace_association_component<native><epic_internal> := class<final_super><epic_internal>(component):
Itemization<public> := module:
    using {/Verse.org/Colors}
    using {/UnrealEngine.com/Abilities}
    using {/Verse.org/Assets}
    using {/Verse.org/Simulation/Tags}
    using {/Verse.org/Temporary/EpicGamesRestricted/Network}
    using {/Verse.org/Simulation}
    using {/Verse.org/Native}
    using {/Verse.org/SceneGraph}
    @experimental
    add_inventory_result<native><epic_internal> := struct<epic_internal>:
        ParentInventory<native><public>:inventory_component

        Inventory<native><public>:inventory_component

    @experimental
    remove_inventory_result<native><epic_internal> := struct<epic_internal>:
        ParentInventory<native><public>:inventory_component

        Inventory<native><public>:inventory_component

    @experimental
    add_items_result<native><epic_internal> := struct<epic_internal>:
        Inventory<native><public>:inventory_component

        AddedItems<native><public>:[]entity

    @experimental
    remove_items_result<native><epic_internal> := struct<epic_internal>:
        Inventory<native><public>:inventory_component

        RemovedItems<native><public>:[]entity

    @experimental
    change_items_slot_result<native><epic_internal> := struct<epic_internal>:
        Inventory<native><public>:inventory_component

        SlotChangedItems<native><public>:[]item_slot_change

    @experimental
    inventory_property_change_result<native><epic_internal> := struct<epic_internal>:
        ParentInventory<native><public>:inventory_component

        Inventory<native><public>:inventory_component

    @experimental
    inventory_component<native><epic_internal> := class<final_super>(component):
        OnInitializedInternal<native><override>():void

        OnUninitializingInternal<native><override>():void

        CanAddItem<native><public>(Item:entity)<decides>:void

        AddItems<native><final><public>(Item:[]entity)<transacts><decides>:add_items_result

        CanRemoveItem<native><public>(Item:entity)<decides>:void

        RemoveItems<native><final><public>(Item:[]entity)<transacts><decides>:remove_items_result

        GetItems<native><final><public>()<computes><reads>:[]entity

        @available {MinUploadedAtFNVersion := 2930}
        FindItems<native><final><public>()<computes><reads>:generator(entity)

        GetItemSlot<native><epic_internal>(Item:entity)<computes><reads>:int

        InventoryAddedEvent<native><public>:listenable(add_inventory_result) = external {}

        InventoryRemovedEvent<native><public>:listenable(remove_inventory_result) = external {}

        InventoryPropertyChangedEvent<native><public>:listenable(inventory_property_change_result) = external {}

        ItemsAddedEvent<native><public>:listenable(add_items_result) = external {}

        ItemsRemovedEvent<native><public>:listenable(remove_items_result) = external {}

        ItemsSlotChangedEvent<native><public>:listenable(change_items_slot_result) = external {}

        AddRule<native><final><public>(Rule:inventory_rule_interface)<decides>:cancelable

        var<private> InventoryRuleList<native><public>:[]inventory_rule_interface = external {}

        @editable
        @replicated("")
        var<private> InventoryName<native><public>:string = external {}

        @editable
        @replicated("")
        var<private> InventoryDisplayName<native><public>:message = external {}

        @editable
        @replicated("")
        var<private> InventoryDescription<native><public>:message = external {}

        @editable
        ItemRequirement<native><public>:?item_requirement_base = external {}

        @editable
        @replicated("")
        var<private> TotalSlots<native><protected>:int = external {}

        @editable
        @replicated("")
        var<private> PickupPriority<native><public>:int = external {}

        @editable
        VerseGameplayTags<native><epic_internal>:tag_container = external {}

        @editable
        @replicated("")
        var<private> EnableItemStacking<native><public>:logic = external {}

        @replicated("")
        var<private> InventoryMaxStackSizeOverride<native><public>:int = external {}

    @experimental
    fail_reason<native><epic_internal> := class:

    @experimental
    inventory_rule_interface<native><epic_internal> := interface<unique>:
        OnRuleAdded<native_callable><public>(InventoryComponent:inventory_component):void

        CanAddItem<native_callable><public>(InventoryComponent:inventory_component, Item:entity)<computes><reads>:?fail_reason

        CanMergeItem<native_callable><public>(InventoryComponent:inventory_component, Item:entity)<computes><reads>:?fail_reason

        CanRemoveItem<native_callable><public>(InventoryComponent:inventory_component, Item:entity)<computes><reads>:?fail_reason

    @import_as("/Script/ItemizationCoreRuntime.UEquippableItemRestrictionBase")
    @experimental
    equippable_item_restriction_base<native><epic_internal> := class<unique><concrete>:

    @experimental
    active_item_limit_behavior<native><epic_internal> := enum<persistable>:
        UnequipLeastRecentlyUsed
        Block

    @experimental
    equippable_item_restriction<native><epic_internal> := class(equippable_item_restriction_base):
        AppliesTo<native><public>(Item:entity)<transacts><decides>:void

        GetActiveSlotLimit<native><public>(Item:entity)<transacts><decides>:int

        GetActiveLimitBehaviour<native><public>(Item:entity)<transacts><decides>:active_item_limit_behavior

        @editable
        ItemRequirement<native><public>:?item_requirement_base = external {}

        @editable
        ActiveSlotLimit<native><public>:int = external {}

        @editable
        ActiveLimitBehaviour<native><public>:active_item_limit_behavior = external {}

    @experimental
    equippable_inventory_component<native><epic_internal> := class(inventory_component):
        CanEquipItem<native><public>(Item:entity)<decides>:void

        EquipItem<native><public>(Item:entity)<transacts><decides>:void

        UnequipItem<native><public>(Item:entity)<transacts><decides>:void

        GetInputAction<epic_internal>(ItemSlot:int):?input_action(type) = external {}

        GetNativeInputAction<native><epic_internal>(ItemSlot:int):?input_action(type)

        @editable
        EquipmentRestrictionList<native><public>:[]equippable_item_restriction_base = external {}

        @editable
        AutoEquipRequirementList<native><public>:[]item_requirement_base = external {}

        @editable
        SlotBindingList<native><epic_internal>:[]tuple(input_action(type), int) = external {}

        @editable
        ShowSlotBindings<native><public>:logic = external {}

        GetEquippedItems<final><native><public>():[]entity

    @experimental
    inventory_backpack_component<epic_internal> := class(inventory_component):
        var TotalSlots<override>:int = external {}

    @experimental
    equippable_inventory_slot_component<native><epic_internal> := class(equippable_inventory_component):
        var TotalSlots<override>:int = external {}

        EquipmentRestrictionList<override>:[]equippable_item_restriction_base = external {}

        AutoEquipRequirementList<override>:[]item_requirement_base = external {}

    @experimental
    equippable_inventory_hotbar_component<native><epic_internal> := class(equippable_inventory_component):
        var TotalSlots<override>:int = external {}

        EquipmentRestrictionList<override>:[]equippable_item_restriction_base = external {}

        AutoEquipRequirementList<override>:[]item_requirement_base = external {}

    @experimental
    (InAgent:agent).GetInventory<native><epic_internal>()<transacts><decides>:inventory_component

    @experimental
    inventory_debug<native><epic_internal> := class:
        AddTestItem<native_callable><public>(InInventory:inventory_component):void = external {}

        AddTestStackableItem<native_callable><public>(InInventory:inventory_component):void = external {}

        RemoveAllItems<native_callable><public>(InInventory:inventory_component):void = external {}

    @experimental
    inventory_setup_data_result<native><epic_internal> := struct<epic_internal>:
        Inventory<native><public>:inventory_component

        AddedInventoryMap<native><public>:[]tuple(inventory_component, []entity)

    @experimental
    inventory_starting_item<native><epic_internal> := struct<concrete><epic_internal>:
        @editable
        ItemDefinition<native>:?item_definition_base = external {}

        @editable
        ItemEntityClass<native>:?subtype(entity) = external {}

        @editable_number(int) {MinValue := option {1}}
        Amount<native>:int = external {}

    @experimental
    inventory_properties_base<native><epic_internal> := class<epic_internal>:
        @editable
        InventoryName<native><public>:string = external {}

        @editable
        InventoryDisplayName<native><localizes><public>:message = external {}

        @editable
        InventoryDescription<native><localizes><public>:message = external {}

        @editable
        PickupPriority<native><public>:int = external {}

        @editable_number(int) {MinValue := option {0}}
        TotalSlotsOverride<native><public>:int = external {}

        @editable
        ItemRequirement<native><public>:?item_requirement = external {}

    @experimental
    inventory_properties<native><epic_internal> := class<epic_internal>(inventory_properties_base):
        @editable
        InventoryClass<native><public>:subtype(inventory_component)

    @experimental
    equippable_inventory_slot_binding_definition<native><epic_internal> := struct<concrete><epic_internal>:
        @editable_number(int) {MinValue := option {0}}
        Slot<native><public>:int = external {}

        @editable
        InputAction<native><public>:input_action(type) = external {}

    @experimental
    equippable_inventory_properties<native><epic_internal> := class<epic_internal>(inventory_properties_base):
        @editable
        InventoryClass<native><public>:subtype(equippable_inventory_component)

        @editable
        SlotBindings<native><public>:[]equippable_inventory_slot_binding_definition

    @experimental
    inventory_setup_data<native><epic_internal> := class<abstract>:
        ApplyTo<public>(Target:inventory_component)<decides>:inventory_setup_data_result

    @editable_subclass
    @experimental
    basic_inventory_setup_data<native><epic_internal> := class<concrete>(inventory_setup_data):
        ApplyTo<native><override>(Target:inventory_component)<decides>:inventory_setup_data_result

        @editable
        EquippableInventoryList<native><public>:[]equippable_inventory_properties = external {}

        @editable
        InventoryList<native><public>:[]inventory_properties = external {}

        @editable
        StartingItemList<native><public>:[]inventory_starting_item = external {}

    @experimental
    @import_as("/Script/ItemizationCoreRuntime.UItemAbilityCost")
    item_ability_cost<native><epic_internal> := class<unique><abstract>:

    @experimental
    item_ability_cost_item<native><epic_internal> := class(item_ability_cost):

    @experimental
    @import_as("/Script/ItemizationCoreRuntime.UItemAbilityCooldown")
    item_ability_cooldown<native><epic_internal> := class<unique><abstract>:

    @experimental
    item_ability_cooldown_time<native><epic_internal> := class(item_ability_cooldown):

    @experimental
    item_ability_cooldown_velocity_based<native><epic_internal> := class(item_ability_cooldown):

    @experimental
    item_ability_binding<native><final><epic_internal> := class<concrete>:
        @editable
        var<private> InputAction<native><public>:?input_action(type) = external {}

        @editable
        var<private> ActiveWhenItemEquipped<native><public>:logic = external {}

        @editable
        var<private> ActiveWhenItemNotEquipped<native><public>:logic = external {}

        @editable
        var<private> Costs<native><public>:[]item_ability_cost = external {}

        @editable
        var<private> Cooldowns<native><public>:[]item_ability_cooldown = external {}

        @editable
        var<private> Ability<native><public>:?ability = external {}

    @experimental
    item_ability_component<native><final><epic_internal> := class<final_super>(component):
        @editable
        var<private> ItemAbilities<native><public>:[]item_ability_binding

    @experimental
    item_attachment_definition<native><epic_internal> := class<unique><concrete>:
        @editable
        var AttachmentVisibility<native><public>:item_state_filter = external {}

    @experimental
    item_mesh_attachment_definition<native><epic_internal> := class<concrete>(item_attachment_definition):
        @editable
        var AttachToSocketName<native><public>:string = external {}

        @editable
        EntityToAttach<native><public>:?subtype(entity) = external {}

    @experimental
    item_attach_component<native><final><epic_internal> := class<final_super>(component):
        @editable
        Attachments<native><public>:[]item_attachment_definition = external {}

    @experimental
    item_slot_change<native><epic_internal> := struct<epic_internal>:
        Item<native><public>:entity

        PreviousSlot<native><public>:int

        CurrentSlot<native><public>:int

    @experimental
    item_equipped_change<native><epic_internal> := class<epic_internal>:
        ItemComponent<native><public>:item_component

        IsItemEquipped<native><public>:logic

    @experimental
    item_stack_size_change<native><epic_internal> := class<epic_internal>:
        ItemComponent<native><public>:item_component

        PreviousStackSize<native><public>:int

        CurrentStackSize<native><public>:int

    @experimental
    item_max_stack_size_change<native><epic_internal> := class<epic_internal>:
        ItemComponent<native><public>:item_component

        PreviousMaxStackSize<native><public>:?int

        CurrentMaxStackSize<native><public>:?int

    @experimental
    # Anything using this component should be considered an item. Required to interact with inventories.
    item_component<native><final><epic_internal> := class<final_super>(component):
        OnInitializedInternal<native><override>():void

        GetParentInventory<native><public>()<converges><decides>:inventory_component

        IsItemEquipped<native><public>()<decides>:void

        EquippedChangedEvent<native><public>:listenable(item_equipped_change) = external {}

        ItemChangedSlotEvent<native><public>:listenable(item_slot_change) = external {}

        StackSizeChangedEvent<native><public>:listenable(item_stack_size_change) = external {}

        MaxStackSizeChangedEvent<native><public>:listenable(item_max_stack_size_change) = external {}

        @replicated("")
        var<private> ItemDefinition<native><epic_internal>:?item_definition_base = external {}

    @experimental
    # Component that holds the details of an item.
    item_details_component<native><epic_internal> := class<final_super>(component):
        @editable
        # Name of the item.
        var<protected> Name<native><localizes><public>:message

        @editable
        # Full description of the item.
        var<protected> Description<native><localizes><public>:message

        @editable
        # Short description of the item with only the essential information.
        var<protected> ShortDescription<native><localizes><public>:message

    @experimental
    # Component that holds the icon of an item.
    item_icon_component<native><epic_internal> := class<final_super>(component):
        @editable
        # Texture used for representing the item in the UI.
        var<protected> Icon<native><public>:texture

    @experimental
    @import_as("/Script/ItemizationCoreRuntime.UItemDefinitionBase")
    item_definition_base<native><epic_internal> := class<epic_internal>:

    @experimental
    @import_as("/Script/ItemizationCoreRuntime.UItemOwnerPoseAsset")
    pose_modifier<native><epic_internal> := class<concrete><unique>(asset):

    @experimental
    item_owner_pose_modifier_component<native><final><epic_internal> := class<final_super>(component):
        @editable
        EquippedPose<native><public>:?pose_modifier = external {}

        @editable
        NotEquippedPose<native><public>:?pose_modifier = external {}

    @experimental
    item_stack_size_component<native><final><epic_internal> := class<final_super>(component):
        @editable
        var<private> StackSize<native><public>:int = external {}

        @editable
        var<private> MaxStackSize<native><public>:int = external {}

        SetStackSize<native><public>(NewStackSize:int)<transacts>:void

        SetMaxStackSize<native><public>(NewMaxStackSize:int):void

    DefaultText<localizes><epic_internal>:message = external {}

    DebugItemTypeAmmoName<localizes><epic_internal>:message = external {}

    DebugItemTypeAmmoDescription<localizes><epic_internal>:message = external {}

    DebugItemTypeResourcesName<localizes><epic_internal>:message = external {}

    DebugItemTypeResourcesDescription<localizes><epic_internal>:message = external {}

    DebugItemTypeCollectablesName<localizes><epic_internal>:message = external {}

    DebugItemTypeCollectablesDescription<localizes><epic_internal>:message = external {}

    DebugItemTypeCurrenciesName<localizes><epic_internal>:message = external {}

    DebugItemTypeCurrenciesDescription<localizes><epic_internal>:message = external {}

    DebugItemTypeBuildToolsName<localizes><epic_internal>:message = external {}

    DebugItemTypeBuildToolsDescription<localizes><epic_internal>:message = external {}

    @experimental
    item_type<native><epic_internal> := class<concrete><unique>:
        @editable
        ItemTypeName<native><public>:message = external {}

        @editable
        ItemTypeDescription<native><public>:message = external {}

        @editable
        ParentType<native><public>:?item_type = external {}

    @experimental
    DebugItemTypeAmmo<epic_internal> := class(item_type):
        ItemTypeName<override>:message = external {}

        ItemTypeDescription<override>:message = external {}

    @experimental
    DebugItemTypeResources<epic_internal> := class(item_type):
        ItemTypeName<override>:message = external {}

        ItemTypeDescription<override>:message = external {}

    @experimental
    DebugItemTypeCollectables<epic_internal> := class(item_type):
        ItemTypeName<override>:message = external {}

        ItemTypeDescription<override>:message = external {}

    @experimental
    DebugItemTypeCurrencies<epic_internal> := class(item_type):
        ItemTypeName<override>:message = external {}

        ItemTypeDescription<override>:message = external {}

    @experimental
    DebugItemTypeBuildTools<epic_internal> := class(item_type):
        ItemTypeName<override>:message = external {}

        ItemTypeDescription<override>:message = external {}

    @experimental
    item_type_component<native><final><epic_internal> := class<final_super>(component):
        GetItemTypeTags<native><epic_internal>():tag_container

        @editable
        var<private> ItemType<native><public>:item_type

    @import_as("/Script/ItemizationCoreRuntime.UItemRequirementBase")
    @experimental
    item_requirement_base<native><epic_internal> := class<unique><concrete>:

    @experimental
    item_requirement<native><epic_internal> := class(item_requirement_base):
        CanAcceptItem<native><public>(Item:entity)<transacts><decides>:void

        @editable
        RequirementName<native><public>:string = external {}

        @editable
        RequirementDescription<native><public>:string = external {}

        @editable
        ItemTypeRequirement<native><public>:?item_type = external {}

    @experimental
    item_rarity<native><epic_internal> := class<unique><concrete>:
        @editable
        RarityName<native><public>:string = external {}

        @editable
        RarityDescription<native><public>:string = external {}

        @editable
        RarityColor<native><public>:color = external {}

        @editable
        RarityTier<native><public>:float = external {}

    @experimental
    item_rarity_component<native><final><epic_internal> := class<final_super>(component):
        @editable
        var<private> Rarity<native><public>:?item_rarity

    @experimental
    item_state_filter<native><epic_internal> := enum:
        Owned
        Equipped
        EquippedAndActive

    @experimental
    # Spawns loot to the world or award it to an agent inventory.
    loot_component<native><epic_internal> := class<final_super>(component, enableable):
        Enable<native><override>():void

        Disable<native><override>():void

        IsEnabled<native><override>()<transacts><decides>:void

        SpawnPickups<native><public>(Instigators:[]agent):[]entity

        AwardLoot<native><public>(Target:entity, Instigators:[]agent, DestroyOverflow:logic):[]entity

        @editable
        Items<native><public>:[]entity = external {}

        @editable
        LootPools<native><public>:[]loot_pool = external {}

    @experimental
    # The Data for the loot component to work with
    loot_pool<native><epic_internal> := class<concrete>:

    @experimental
    # It can be overriden. It will return how many times the loot can be rolled
    loot_count_calculator<native><epic_internal> := class<concrete>:

    @experimental
    calculate_count_info<native><epic_internal> := struct:
        Owner<native>:entity = external {}

        Instigators<native>:[]agent = external {}

    @experimental
    # Fixed amount of rolls
    loot_count_calculator_fixed<native><epic_internal> := class<concrete>(loot_count_calculator):

    @experimental
    # Random range of rolls
    loot_count_calculator_range<native><epic_internal> := class<concrete>(loot_count_calculator):

    @experimental
    loot_distribution<native><epic_internal> := struct<concrete>:
        @category("Values")
        @editable
        Count<native>:int = external {}

        @category("Values")
        @editable
        Weight<native>:float = external {}

    @experimental
    # Weighted amount of rolls
    loot_count_calculator_weighted<native><epic_internal> := class<concrete>(loot_count_calculator):

    @experimental
    # Loot Data
    loot<native><epic_internal> := struct<concrete>:
        @editable
        Weight<native>:loot_weight_calculator = external {}

        @editable
        MaxSelections<native>:?int = external {}

        @editable
        Items<native>:[]entity = external {}

        @editable
        LootPools<native>:[]loot_pool = external {}

    @experimental
    loot_weight_calculator_info<native><epic_internal> := struct:
        Owner<native>:?entity = external {}

        Instigators<native>:[]agent = external {}

        Items<native>:[]entity = external {}

        LootPools<native>:[]loot_pool = external {}

    @experimental
    loot_weight_calculator<native><epic_internal> := class<concrete>:

    @experimental
    loot_weight_calculator_fixed<epic_internal> := class<concrete>(loot_weight_calculator):

Abilities<public> := module:
    using {/Verse.org/SceneGraph}
    ability<native><public> := class:
        GameplayAbilityPath<native><epic_internal>:?string = external {}

        Activate<native><protected>()<suspends>:void

    @experimental
    ability_component<native><public> := class<final_super>(component):
        GiveAbility<native><public>(ability_type:subtype(ability))<transacts><decides>:void

        ActivateAbility<native><public>(ability_type:subtype(ability)):void

        GiveAbility<native><epic_internal>(Ability:ability)<transacts><decides>:void

        ActivateAbility<native><epic_internal>(Ability:ability):void

    @attribscope_data
    @customattribhandler
    ability_link<epic_internal> := class<computes>(attribute):
        Name<epic_internal>:string = external {}


