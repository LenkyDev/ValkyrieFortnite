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
    # Align the frame to another frame
    alignment_constraint<native><epic_internal> := class(constraint):
        @editable
        @replicated("")
        @tool_tip("In which direction to align the frame")
        # In which direction to align the frame
        Orientation<native><public>:constraint_orientation

        @editable
        @replicated("RepNotify")
        @tool_tip("Where along this frame in the specified orientation to align with the source frame\'s anchor as a percentage of the size of this frame, normalized between 0.0 and 1.0.")
        # Where along this frame in the specified orientation to align with the source frame's anchor as a percentage of the size of this frame, normalized between 0.0 and 1.0.
        var Alignment<native><public>:float

        @editable
        @replicated("")
        @tool_tip("The frame to align this frame with.")
        # The frame to align this frame with.
        Source<native><public>:ui_frame_reference

        @editable
        @replicated("RepNotify")
        @tool_tip("Where along the source frame in the specified orientation to anchor this frame to as a percentage of the size of the source frame, normalized between 0.0 and 1.0.")
        # Where along the source frame in the specified orientation to anchor this frame to as a percentage of the size of the source frame, normalized between 0.0 and 1.0.
        var Anchor<native><public>:float

        @editable
        @replicated("RepNotify")
        @tool_tip("How far to offset this frame from the aligned position in the specified orientation (in pixels)")
        # How far to offset this frame from the aligned position in the specified orientation (in pixels)
        var Offset<native><public>:float = external {}

    constraint_orientation<native><epic_internal> := enum:
        # Constrain along the left to right axis
        Horizontal
        # Constrain along the top to bottom axis
        Vertical
        # Constrain along both the left to right and the top to bottom axes
        HorizontalAndVertical

    constraint<native><epic_internal> := class<abstract><unique><epic_internal>:


    ui_frame_reference<native><epic_internal> := class<abstract><computes><epic_internal>:
        GetFrameComponent<native><epic_internal>()<transacts><decides>:ui_frame_component

    # Refers to a specified frame component instance.
    ui_frame_component_reference<native><epic_internal> := class<public>(ui_frame_reference):
        @replicated("")
        Component<native><public>:ui_frame_component

        GetFrameComponent<override><native>()<transacts><decides>:ui_frame_component

    # Refers to the player's viewport that the frame is rendering in
    viewport_frame_reference<native><epic_internal> := class<final><public>(ui_frame_reference):


    # Refers to the safe zone portion of the player's viewport that the frame is rendering in
    safe_zone_frame_reference<native><epic_internal> := class<final><public>(ui_frame_reference):


    # Refers to the first frame component on an ancestor entity. Falls back to the safe zone frame if an ancestor frame is not found.
    parent_frame_reference<native><epic_internal> := class<final><public>(ui_frame_reference):


    @available {MinUploadedAtFNVersion := 4000}
    # How the texture should fill its frame
    texture_image_scaling<native><epic_internal> := enum:
        # Scale the texture non-uniformly to fill the entire frame.
        Fill
        # Scale the texture uniformly to match the size of the frame along the shortest axis, while preserving the aspect ratio of the texture.
        ScaleToFit
        # Scale the texture uniformly to match the size of the frame along the horizontal axis, while preserving the aspect ratio of the texture.
        ScaleToFitHorizontally
        # Scale the texture uniformly to match the size of the frame along the vertical axis, while preserving the aspect ratio of the texture.
        ScaleToFitVertically
        # Scale the texture uniformly to match the size of the frame along the longest axis, while preserving the aspect ratio of the texture.
        ScaleToFill

    @available {MinUploadedAtFNVersion := 4000}
    # Base class for objects that can be rendered by image_widget
    image_resource<native><epic_internal> := class<abstract><epic_internal>:


    @available {MinUploadedAtFNVersion := 4000}
    # For image_widget to render texture assets
    texture_image_resource<native><epic_internal> := class(image_resource):
        @editable
        @replicated("")
        # The texture to render
        Texture<native><public>:texture

        @editable
        @replicated("")
        # How the texture should fill the frame
        Scaling<native><public>:texture_image_scaling = external {}

    @available {MinUploadedAtFNVersion := 4000}
    # For image_widget to render material assets
    material_image_resource<native><epic_internal> := class(image_resource):
        @editable
        @replicated("")
        # The material to render
        Material<native><public>:material

    @available {MinUploadedAtFNVersion := 4000}
    # For image_widget to render a solid color
    color_image_resource<native><epic_internal> := class(image_resource):
        @editable
        @replicated("")
        # The color to render
        Color<native><public>:color

    @available {MinUploadedAtFNVersion := 4000}
    # UI element that renders an image
    image_widget<native><epic_internal> := class((/Verse.org/SceneGraph/UI:)widget):
        @editable
        # The image to render
        var Resource<public>:image_resource = external {}

        # The color to tint the image
        var Color<public>:color_alpha = external {}

    @available {MinUploadedAtFNVersion := 4000}
    # UI element that renders an image
    image_widget_component<native><epic_internal> := class(widget_component):
        # The image to render
        var Resource<public>:image_resource = external {}

        # The color to tint the image
        var Color<public>:color_alpha = external {}

    # Base class for size constraints that can have min/max sizes
    size_constraint_base<native><epic_internal> := class<abstract>(constraint):
        @editable
        @replicated("")
        # Which direction to constrain the size of the frame
        Orientation<native><public>:constraint_orientation

        @editable
        @replicated("RepNotify")
        # Optional minimum size the frame can be
        var MinSize<native><public>:?float = external {}

        @editable
        @replicated("RepNotify")
        # Optional maximum size the frame can be
        var MaxSize<native><public>:?float = external {}

    # Specify a fixed value for the size of the frame
    fixed_size_constraint<native><epic_internal> := class(size_constraint_base):
        @editable
        @replicated("RepNotify")
        # The specified size of the frame
        var Size<native><public>:float

    # Let the frame determine its size
    auto_size_constraint<native><epic_internal> := class(size_constraint_base):


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

    @import_as("/Script/LocalizableMessage.FLocalizableMessage")
    localizable_message_internal<native><epic_internal> := struct<concrete>:


    @available {MinUploadedAtFNVersion := 4000}
    # UI element that renders text.
    text_widget_component<native><epic_internal> := class(widget_component):
        OnBeginSimulationInternal<native><override>():void

        OnInitializedInternal<native><override>():void

        OnUninitializingInternal<native><override>():void

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

    # Component representing a UI bounding box
    ui_frame_component<native><epic_internal> := class<final_super>(component, enableable):
        OnInitializedInternal<native><override>():void

        OnAddedToSceneInternal<native><override>():void

        OnRemovingFromSceneInternal<native><override>():void

        # Start displaying this frame and all enabled frames that are attached to it with constraints
        Enable<native><override>():void

        # Stop displaying this frame and all frames that are attached to it with constraints
        Disable<native><override>():void

        # Succeeds if the component is enabled, fails if it is disabled
        IsEnabled<native><override>()<transacts><decides>:void

    # Component to define how to layout a sibling UI frame component
    ui_layout_component<native><epic_internal> := class<final_super>(component):
        OnInitializedInternal<native><override>():void

        OnUninitializingInternal<native><override>():void

        OnBeginSimulationInternal<native><override>():void

        OnEndSimulationInternal<native><override>():void

        # Add constraints to apply to the sibling UI frame component
        AddConstraints<native><public>(Constraints:[]constraint):void

        # Add a constraint to apply to the sibling UI frame component
        AddConstraint<native><public>(Constraint:constraint):void

        # Remove a constraint
        RemoveConstraint<native><public>(Constraint:constraint):void

        # Get the list of constraints that are applied to the sibling UI frame component
        GetConstraints<public>():[]constraint = external {}

    @available {MinUploadedAtFNVersion := 4000}
    @cpp_name("umg_widget_entity")
    @hide_in_editor
    (/Verse.org/SceneGraph/UI:)umg_widget<native><epic_internal> := class((/Verse.org/SceneGraph/UI:)widget):
        @replicated("")
        Asset<native><epic_internal>:umg_widget_class_asset = external {}

    @available {MinUploadedAtFNVersion := 4000}
    umg_widget_component<native><epic_internal> := class<final_super>(widget_component):


    @available {MinUploadedAtFNVersion := 4000}
    @cpp_name("widget_entity")
    (/Verse.org/SceneGraph/UI:)widget<native><epic_internal> := class(entity, showable):
        var Show<override>:logic = external {}

        var Size<public>:(/Verse.org/SpatialMath:)vector3 = external {}

        var IsFocusable<public>:logic = external {}

    @available {MinUploadedAtFNVersion := 4000}
    widget_component<native><epic_internal> := class<final_super>(component):
        @replicated("RepNotify")
        var Show<native><public>:logic = external {}

        var Size<public>:(/Verse.org/SpatialMath:)vector3 = external {}

        @replicated("RepNotify")
        var IsFocusable<native><public>:logic = external {}