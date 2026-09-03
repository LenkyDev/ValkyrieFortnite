# Verse path: /Verse.org/SceneGraph
using {/Verse.org/SceneGraph}
using {/Verse.org/Simulation}
using {/Verse.org/Native}
@available {MinUploadedAtFNVersion := 3800}
# Module import path: /Verse.org/SceneGraph/UI
(/Verse.org/SceneGraph:)UI<public> := module:
    using {/UnrealEngine.com/Temporary/UI}
    using {/Verse.org/SpatialMath}
    using {/Verse.org/Colors}
    using {/Verse.org/Assets}
    using {/Verse.org/Native}
    using {/Verse.org/Temporary/EpicGamesRestricted/Network}
    using {/Verse.org/Simulation}
    @available {MinUploadedAtFNVersion := 4210}
    # Layout hints for a child placed inside an absolute_container. Positions the child relative to the container's rendered size, independent of its flow siblings.
    absolute_container_element_component<native><epic_internal> := class(container_element_component):
        @editable
        @replicated("")
        @tool_tip("How this item is aligned along the horizontal axis within its containing block, after offsets are applied. Center and End require a finite container width; otherwise the item falls back to Start.")
        # How this item is aligned along the horizontal axis within its containing block, after offsets are applied. Center and End require a finite container width; otherwise the item falls back to Start.
        var HorizontalAlignment<native><public>:ui_alignment = external {}

        @editable
        @replicated("")
        @tool_tip("How this item is aligned along the vertical axis within its containing block, after offsets are applied. Center and End require a finite container height; otherwise the item falls back to Start.")
        # How this item is aligned along the vertical axis within its containing block, after offsets are applied. Center and End require a finite container height; otherwise the item falls back to Start.
        var VerticalAlignment<native><public>:ui_alignment = external {}

        @editable
        @replicated("")
        @tool_tip("Inset from each edge of this item\'s containing block, in centimeters, applied before alignment.")
        # Inset from each edge of this item's containing block, in centimeters, applied before alignment.
        var Offsets<native><public>:ui_margin = external {}

    @available {MinUploadedAtFNVersion := 4210}
    ui_alignment<native><epic_internal> := enum:
        Start
        Center
        End
        Fill

    @available {MinUploadedAtFNVersion := 4210}
    @replicatable
    ui_margin<native><epic_internal> := struct<concrete><computes>:
        @editable
        Top<native>:float = external {}

        @editable
        Right<native>:float = external {}

        @editable
        Bottom<native>:float = external {}

        @editable
        Left<native>:float = external {}

    @available {MinUploadedAtFNVersion := 4210}
    @hide_in_editor
    container_element_component<native><epic_internal> := class<final_super>(component):


    @available {MinUploadedAtFNVersion := 4210}
    # Layout hints for a child placed inside a flex_container.
    flex_container_element_component<native><epic_internal> := class(container_element_component):
        @editable
        @replicated("")
        @tool_tip("Margin applied around this element within its line, in centimeters.")
        # Margin applied around this element within its line, in centimeters.
        var Margin<native><public>:ui_margin = external {}

        @editable
        @replicated("")
        @tool_tip("How this item is aligned along the cross axis (perpendicular to FlexDirection) within its line.")
        # How this item is aligned along the cross axis (perpendicular to FlexDirection) within its line.
        var AlignSelf<native><public>:ui_alignment = external {}

        @editable
        @replicated("")
        @tool_tip("Alignment of this item along the main axis within an over-sized slot.")
        # Alignment of this item along the main axis within an over-sized slot.
        var AlignSelfMajorAxis<native><public>:ui_alignment = external {}

        # Grow proportion along the main axis. If not set, the item does not grow. Negative values clamp to 0.
        var GrowProportion<public>:?float = external {}

        # Shrink proportion along the main axis. Set to false to disable shrinking. Negative values clamp to 0.
        var ShrinkProportion<public>:?float = external {}

    @available {MinUploadedAtFNVersion := 4210}
    # Direction children flow along the main axis of a flex_container.
    flex_direction<native><epic_internal> := enum:
        Row
        RowReverse
        Column
        ColumnReverse

    @available {MinUploadedAtFNVersion := 4210}
    # Whether and how a flex_container wraps its children onto multiple lines.
    flex_wrap<native><epic_internal> := enum:
        NoWrap
        Wrap
        WrapReverse

    @available {MinUploadedAtFNVersion := 4210}
    # Alignment / distribution of content along an axis within a flex_container.
    flex_content_alignment<native><epic_internal> := enum:
        Start
        Center
        End
        Fill
        SpaceBetween
        SpaceAround
        SpaceEvenly

    @available {MinUploadedAtFNVersion := 4210}
    # Container widget that arranges its children in a one-dimensional flowing layout with optional wrapping.
    flex_container<native><epic_internal> := class((/Verse.org/SceneGraph/UI:)widget):
        @editable
        @replicated("")
        @tool_tip("Direction children flow along the main axis.")
        # Direction children flow along the main axis. Reversed directions (RowReverse, ColumnReverse) require a finite main-axis MaxSize; Inf silently disables reversal.
        var FlexDirection<native><public>:flex_direction = external {}

        @editable
        @replicated("")
        @tool_tip("How children wrap onto multiple lines.")
        # How children wrap onto multiple lines.
        var WrapDirection<native><public>:flex_wrap = external {}

        @editable
        @replicated("")
        @tool_tip("Alignment of items along the main axis within each line.")
        # Alignment of items along the main axis within each line.
        var LineAlignment<native><public>:flex_content_alignment = external {}

        @editable
        @replicated("")
        @tool_tip("Alignment of lines along the cross axis.")
        # Alignment of lines along the cross axis.
        var ContentAlignment<native><public>:flex_content_alignment = external {}

        # Spacing between columns, in centimeters.
        var ColumnGap<public>:float = external {}

        # Spacing between rows, in centimeters.
        var RowGap<public>:float = external {}

    @available {MinUploadedAtFNVersion := 4210}
    # Layout hints for a child placed inside a grid_container.
    grid_container_element_component<native><epic_internal> := class(container_element_component):
        @editable
        @replicated("")
        @tool_tip("Row index of the cell this item occupies. 0 = first row. Negative values count from the end: -1 = last row, -2 = second-to-last. Out-of-range values clamp to the nearest valid row.")
        # Row index of this item's anchor cell. Zero-based from the start; negative values count from the end (-1 = last row). Out-of-range values are clamped to the nearest valid row.
        var Row<native><public>:int = external {}

        @editable
        @replicated("")
        @tool_tip("Column index of the cell this item occupies. 0 = first column. Negative values count from the end: -1 = last column, -2 = second-to-last. Out-of-range values clamp to the nearest valid column.")
        # Column index of this item's anchor cell. Zero-based from the start; negative values count from the end (-1 = last column). Out-of-range values are clamped to the nearest valid column.
        var Column<native><public>:int = external {}

        # Number of rows this item spans across, starting at Row.
        var RowSpan<public>:int = external {}

        # Number of columns this item spans across, starting at Column.
        var ColumnSpan<public>:int = external {}

        @editable
        @replicated("")
        @tool_tip("How this item is aligned along the horizontal axis within its cell.")
        var HorizontalAlignment<native><public>:ui_alignment = external {}

        @editable
        @replicated("")
        @tool_tip("How this item is aligned along the vertical axis within its cell.")
        var VerticalAlignment<native><public>:ui_alignment = external {}

        @editable
        @replicated("")
        @tool_tip("Margin applied around this element within its cell, in centimeters.")
        var Margin<native><public>:ui_margin = external {}

    @available {MinUploadedAtFNVersion := 4210}
    # Container widget that arranges its children in a 2D row/column layout.
    grid_container<native><epic_internal> := class((/Verse.org/SceneGraph/UI:)widget):
        # Add a row track definition to the grid. No-op if the same definition is already present.
        AddRowDefinition<native><public>(Definition:grid_track_definition)<transacts>:void

        # Remove a previously added row track definition from the grid.
        RemoveRowDefinition<native><public>(Definition:grid_track_definition)<transacts>:void

        # Return the current ordered list of row track definitions.
        GetRowDefinitions<native><public>()<reads>:[]grid_track_definition

        # Add a column track definition to the grid. No-op if the same definition is already present.
        AddColumnDefinition<native><public>(Definition:grid_track_definition)<transacts>:void

        # Remove a previously added column track definition from the grid.
        RemoveColumnDefinition<native><public>(Definition:grid_track_definition)<transacts>:void

        # Return the current ordered list of column track definitions.
        GetColumnDefinitions<native><public>()<reads>:[]grid_track_definition

        # Spacing between rows, in centimeters.
        var RowGap<public>:float = external {}

        # Spacing between columns, in centimeters.
        var ColumnGap<public>:float = external {}

    @available {MinUploadedAtFNVersion := 4210}
    # Abstract base class for a single row or column track inside a grid_container.
    grid_track_definition<native><epic_internal> := class<abstract><unique><internal>:


    @available {MinUploadedAtFNVersion := 4210}
    # A row or column track that has a fixed size, in centimeters.
    fixed_grid_track<native><epic_internal> := class<final>(grid_track_definition):
        @editable
        @replicated("")
        @tool_tip("Fixed size of this track, in centimeters.")
        var Size<native><public>:float = external {}

    @available {MinUploadedAtFNVersion := 4210}
    # Sizes to its content along its axis, clamped to [MinSize, MaxSize]. Use proportional_grid_track to fill leftover container space.
    auto_grid_track<native><epic_internal> := class<final>(grid_track_definition):
        @editable
        @replicated("")
        @tool_tip("Minimum resolved size, in centimeters.")
        var MinSize<native><public>:float = external {}

        @editable
        @replicated("")
        @tool_tip("Maximum resolved size, in centimeters. Inf = unbounded. Floored by MinSize.")
        var MaxSize<native><public>:float = external {}

    @available {MinUploadedAtFNVersion := 4210}
    # Takes a weighted share of the container's leftover space. Clamped to [MinSize, MaxSize].
    proportional_grid_track<native><epic_internal> := class<final>(grid_track_definition):
        # Weight when dividing leftover space. Weight 2 gets twice the share of weight 1. Clamped to >= 0.
        var Proportion<public>:float = external {}

        @editable
        @replicated("")
        @tool_tip("Minimum resolved size, in centimeters.")
        var MinSize<native><public>:float = external {}

        @editable
        @replicated("")
        @tool_tip("Maximum resolved size, in centimeters. Inf = unbounded. Floored by MinSize.")
        var MaxSize<native><public>:float = external {}

    @available {MinUploadedAtFNVersion := 4000}
    @experimental
    # UI element that renders an image
    image_widget<native><epic_internal> := class((/Verse.org/SceneGraph/UI:)widget):
        # The material used to render the image.
        var Material<public>:material_like = external {}

    @available {MinUploadedAtFNVersion := 4000}
    text_effect<native><epic_internal> := class<abstract><epic_internal>:


    @available {MinUploadedAtFNVersion := 4000}
    text_style<native><epic_internal> := class:
        @editable
        @replicated("")
        # The size of the displayed text.
        Size<native><public>:float = external {}

        @editable
        @replicated("")
        # The color of the displayed text.
        Color<native><public>:color_alpha = external {}

        @editable
        @replicated("")
        # Text effects to apply with this style
        Effects<native><public>:[]text_effect = external {}

    @available {MinUploadedAtFNVersion := 4000}
    # Text outline corner styles.
    outline_text_corners<native><epic_internal> := enum:
        # The outline will have rounded corners.
        Rounded
        # The outline will have sharp corners.
        Mitered

    @available {MinUploadedAtFNVersion := 4000}
    outline_text_effect<native><epic_internal> := class(text_effect):
        @editable
        @replicated("")
        # The width of the outline to apply to the text.
        Size<native><public>:float = external {}

        @editable
        @replicated("")
        # The color of the outline.
        Color<native><public>:color = external {}

        @editable
        @replicated("")
        # How the corners of the outline should be styled.
        CornerStyle<native><public>:outline_text_corners = external {}

    @available {MinUploadedAtFNVersion := 4000}
    # How outlines are applied to drop shadows.
    drop_shadow_text_outline<native><epic_internal> := enum:
        # The outline will not be applied to the drop shadow.
        NoDropShadowOutline
        # The outline will be applied to the drop shadow.
        OutlineDropShadow

    @available {MinUploadedAtFNVersion := 4000}
    drop_shadow_text_effect<native><epic_internal> := class(text_effect):
        @editable
        @replicated("")
        # The size and direction of the drop shadow to draw.
        Offset<native><public>:(/Verse.org/SpatialMath:)vector3 = external {}

        @editable
        @replicated("")
        # The color of the drop shadow.
        Color<native><public>:color = external {}

        @editable
        @replicated("")
        # How the outline will apply to the text's drop shadow.
        Outline<native><public>:drop_shadow_text_outline = external {}

    @available {MinUploadedAtFNVersion := 4000}
    skew_text_effect<native><epic_internal> := class(text_effect):
        @editable
        @replicated("")
        # How much to skew the text by
        Amount<native><public>:float = external {}

    @available {MinUploadedAtFNVersion := 4000}
    letter_spacing_text_effect<native><epic_internal> := class(text_effect):
        @editable
        @replicated("")
        # The uniform spacing (or tracking) to apply between all characters in the text.
        Amount<native><public>:float = external {}

    @available {MinUploadedAtFNVersion := 4000}
    material_text_effect<native><epic_internal> := class(text_effect):
        @editable
        @replicated("")
        # A material to apply to the text
        Material<native><public>:material

    # How text should be aligned within the `text_widget`.
    horizontal_text_alignment<native><epic_internal> := enum:
        # Align the text logically to the left of the frame based on current culture.
        Left
        # Align the text in the center.
        Center
        # Align the text logically to the right of the frame based on current culture.
        Right
        # Align the text logically to the left of the frame ignoring the current culture.
        InvariantLeft
        # Align the text logically to the right of the frame ignoring the current culture.
        InvariantRight

    # Alignment mode for `text_widget`.
    vertical_text_alignment<native><epic_internal> := enum:
        # Center the rendered text vertically within the frame.
        Center
        # Align the rendered text to the top of the frame.
        Top
        # Align the rendered text to the bottom of the frame.
        Bottom

    # The policy that determines what happens when the text is larger than the `text_widget`.
    text_frame_overflow_policy<native><epic_internal> := enum:
        # Overflowing text will be clipped.
        Clip
        # Overflowing text will be replaced with an ellipsis.
        Ellipsis

    @available {MinUploadedAtFNVersion := 4000}
    # UI element that renders text.
    text_widget<native><epic_internal> := class((/Verse.org/SceneGraph/UI:)widget):
        # The text to render.
        var Text<public>:message = external {}

        # How the text should be horizontally aligned within the text frame.
        var HorizontalAlignment<public>:horizontal_text_alignment = external {}

        # How the text should be vertically aligned within the text frame.
        var VerticalAlignment<public>:vertical_text_alignment = external {}

        # The policy that determines what happens when the text is larger than the frame.
        var OverflowPolicy<public>:text_frame_overflow_policy = external {}

        # The style to apply to the rendered text.
        var Style<public>:text_style = external {}

    DefaultTextValue<localizes><epic_internal>:message = external {}

    @replicatable
    @import_as("/Script/LocalizableMessage.FLocalizableMessage")
    localizable_message_internal<native><epic_internal> := struct<concrete>:


    @available {MinUploadedAtFNVersion := 4000}
    @cpp_name("umg_widget_entity")
    @hide_in_editor
    (/Verse.org/SceneGraph/UI:)umg_widget<native><epic_internal> := class((/Verse.org/SceneGraph/UI:)widget):
        @replicated("")
        Asset<native><epic_internal>:umg_widget_class_asset = external {}

        GetWidgetField<native><epic_internal>(Widget:castable_subtype((/Verse.org/SceneGraph/UI:)widget), WidgetName:string)<transacts>:entity

        OnPropertyChanged<native><protected>(PropertyName:string)<transacts>:void

        CreateLocalizableMessage<native><protected>(Message:message)<transacts>:localizable_message_internal

        CreateMessage<native><protected>(LocalizableMessage:localizable_message_internal)<transacts>:message

    @available {MinUploadedAtFNVersion := 4000}
    @hide_in_editor
    umg_widget_component<native><epic_internal> := class<final_super>(component):


    @available {MinUploadedAtFNVersion := 4000}
    @cpp_name("widget_entity")
    (/Verse.org/SceneGraph/UI:)widget<native><epic_internal> := class(entity):


@available {MinUploadedAtFNVersion := 4100}
@experimental
# Viewport to add all screen-space UI to.
(Player:player).GetViewport<native><epic_internal>()<transacts>:(/Verse.org/SceneGraph:)UI.widget

@available {MinUploadedAtFNVersion := 4100}
# Plaform-specific viewport to add specialized screen-space UI to. Always renders on top of the regular viewport.
(Player:player).GetPlatformViewport<native><epic_internal>()<transacts>:(/Verse.org/SceneGraph:)UI.widget