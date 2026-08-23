# Verse path: /Fortnite.com/UI
using {/Verse.org/Assets}
using {/Verse.org/Simulation}
using {/UnrealEngine.com/Temporary/UI}
using {/UnrealEngine.com/Temporary/SpatialMath}
dynamic_ui_z_order<native><epic_internal> := enum:
    (/Fortnite.com/UI/dynamic_ui_z_order:)Back
    Middle
    Front
    Custom

dynamic_ui_anchor<native><epic_internal> := enum:
    TopLeft
    TopCenter
    TopRight
    CenterLeft
    CenterCenter
    CenterRight
    BottomLeft
    BottomCenter
    BottomRight

dynamic_ui_constraint_base<native><epic_internal> := class<epic_internal>:
    # Offset applied to the widget after the constraint is resolved.
    Offset<native><epic_internal>:vector2 = external {}

dynamic_ui_constraint_alignment<native><epic_internal> := class<epic_internal>(dynamic_ui_constraint_base):
    # Horizontal alignment of the widget on screen.
    HorizontalAlignment<native><epic_internal>:horizontal_alignment

    # Vertical alignment of the widget on screen.
    VerticalAlignment<native><epic_internal>:vertical_alignment

    # By which anchor should the widget be attached.
    Anchor<native><epic_internal>:dynamic_ui_anchor = external {}

dynamic_ui_constraint_widget<native><epic_internal> := class<epic_internal>(dynamic_ui_constraint_base):
    # The `widget` to attach to.
    Widget<native><epic_internal>:widget

    # To which anchor should the source widget be attached on the target widget.
    TargetAnchor<native><epic_internal>:dynamic_ui_anchor = external {}

    # By which anchor should the source widget be attached to the target widget.
    Anchor<native><epic_internal>:dynamic_ui_anchor = external {}

    # Unique id used to identify and attach to a specific instance of the target widget class.
    UniqueID<native><epic_internal>:string = external {}

dynamic_ui_constraint_widget_fn<native><epic_internal> := class<epic_internal>(dynamic_ui_constraint_base):
    # Unique id used to identify and attach to a specific widget.
    UniqueID<native><epic_internal>:string = external {}

    # Path to widget class.
    WidgetClassPath<native><epic_internal>:string

    # To which anchor should the source widget be attached on the target widget.
    TargetAnchor<native><epic_internal>:dynamic_ui_anchor = external {}

    # By which anchor should the source widget be attached to the target widget.
    Anchor<native><epic_internal>:dynamic_ui_anchor = external {}

dynamic_ui_constraint_replace<native><epic_internal> := class<epic_internal>(dynamic_ui_constraint_base):
    # The `widget` to replace.
    Widget<native><epic_internal>:widget

    # Unique id used to identify and attach to a specific instance of the target widget class.
    UniqueID<native><epic_internal>:string = external {}

dynamic_ui_constraint_replace_fn<native><epic_internal> := class<epic_internal>(dynamic_ui_constraint_base):
    # Unique id used to identify and attach to a specific widget
    UniqueID<native><epic_internal>:string = external {}

    # Path to widget class.
    WidgetClassPath<native><epic_internal>:string

dynamic_ui_allowed<native><epic_internal> := struct:
    # The `widget` to show.
    Widget<native><public>:widget

    # Layout constraint to apply to this widget when putting it on screen.
    LayoutConstraint<native><public>:dynamic_ui_constraint_base

    # Z order used to draw this widget.
    ZOrder<native><public>:dynamic_ui_z_order = external {}

    # Custom z order used to draw this widget. (Higher numbered z order widget are drawn in front of lower numbered one).
    CustomZOrder<native><public>:int = external {}

    # Unique id is used to make this widget a separate instance from other widget of the same class.
    UniqueID<native><public>:string = external {}

dynamic_ui_unallowed<native><epic_internal> := struct:
    # Path to widget class.
    WidgetClassPath<native><public>:string = external {}

    # Unallow widget with this unique ID.
    UniqueID<native><public>:string

dynamic_ui_scene<native><epic_internal> := struct:
    # list of allowed widgets in this scene.
    AllowedList<native><public>:[]dynamic_ui_allowed = external {}

    UnallowedList<native><public>:[]dynamic_ui_unallowed = external {}

# Dynamic UI panel to handle the scenes and apply the constraints.
dynamic_ui_panel<native><epic_internal> := class<final>(widget):
    # Adds `scene` to this panel.
    AddScene<native><epic_internal>(Scene:dynamic_ui_scene):void

    # Removes `scene` from this panel.
    RemoveScene<native><epic_internal>(Scene:dynamic_ui_scene):void

# Returns the `fn_ui_extensions_component` associated with `Player`.
GetUIExtensionsComponent<native><epic_internal>(Player:player)<transacts><decides>:fn_ui_extensions_component

ui_tab_info<native><epic_internal> := class<epic_internal>:
    # The text label to be shown on the tab button.
    Label<native><public>:message

    # Optional icon to be shown on the tab button.
    Icon<native><public>:?texture = external {}

    # The desired order for the tab. -1 will add tab to the end of the list.
    SortOrder<native><public>:int = external {}

fn_ui_extension<native><epic_internal> := class<epic_internal>:
    AddTab<native><epic_internal>(Player:player, TabInfo:ui_tab_info, Widget:widget):void

    RemoveTab<native><epic_internal>(Player:player, TabInfo:ui_tab_info):void

fn_ui_extensions_component<native><epic_internal> := class<epic_internal>:
    Map<native><public>:fn_ui_extension = external {}

    Inventory<native><public>:fn_ui_extension = external {}

    PostGame<native><public>:fn_ui_extension = external {}