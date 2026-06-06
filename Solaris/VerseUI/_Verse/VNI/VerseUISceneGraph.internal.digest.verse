using {/Verse.org/SceneGraph}
using {/Verse.org/Simulation}
using {/Verse.org/Native}
@available {MinUploadedAtFNVersion := 3800}
# Module import path: /Verse.org/SceneGraph/UI
(/Verse.org/SceneGraph:)UI<public> := module:
    using {/UnrealEngine.com/Temporary/UI}
    using {/Verse.org/SpatialMath}
    using {/Verse.org/Colors}
    using {/Verse.org/Temporary/EpicGamesRestricted/Network}
    using {/Verse.org/Simulation}
    using {/Verse.org/Native}
    using {/Verse.org/Assets}
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

    @import_as("/Script/LocalizableMessage.FLocalizableMessage")
    localizable_message_internal<native><epic_internal> := struct<concrete>:


    @available {MinUploadedAtFNVersion := 4000}
    @hide_in_editor
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

@available {MinUploadedAtFNVersion := 4100}
@experimental
# Viewport to add all screen-space UI to.
(Player:player).GetViewport<native><epic_internal>()<transacts>:(/Verse.org/SceneGraph:)UI.widget

@available {MinUploadedAtFNVersion := 4100}
# Plaform-specific viewport to add specialized screen-space UI to. Always renders on top of the regular viewport.
(Player:player).GetPlatformViewport<native><epic_internal>()<transacts>:(/Verse.org/SceneGraph:)UI.widget