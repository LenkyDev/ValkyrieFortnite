# Module import path: /Verse.org/Simulation
Simulation<public> := module:
    @attribscope_class
    @attribscope_data
    @customattribhandler
    allow_self_reference<epic_internal> := class<computes>(attribute):


    @attribscope_class
    @attribscope_data
    @attribscope_function
    @customattribhandler
    category_attribute<epic_internal> := class<computes><internal>(attribute):


    category<constructor><epic_internal>(Category:string)<computes>:category_attribute = external {}

    @attribscope_data
    @customattribhandler
    clamp_max_attribute<epic_internal> := class<computes><internal>(attribute):


    clamp_max<constructor><epic_internal>(ClampMax:string)<computes>:clamp_max_attribute = external {}

    @attribscope_data
    @customattribhandler
    clamp_min_attribute<epic_internal> := class<computes><internal>(attribute):


    clamp_min<constructor><epic_internal>(ClampMin:string)<computes>:clamp_min_attribute = external {}

    @attribscope_class
    @attribscope_data
    @attribscope_function
    @customattribhandler
    display_name_attribute<epic_internal> := class<computes><internal>(attribute):


    display_name<constructor><epic_internal>(DisplayName:string)<computes>:display_name_attribute = external {}

    @attribscope_class
    @attribscope_data
    @attribscope_function
    @customattribhandler
    display_priority_attribute<epic_internal> := class<computes><internal>(attribute):


    display_priority<constructor><epic_internal>(DisplayPriority:string)<computes>:display_priority_attribute = external {}

    editable_empty_message<localizes><epic_internal>:message = external {}

    @attribscope_class
    @attribscope_struct
    @attribscope_data
    @customattribhandler
    editable<public> := class<computes>(attribute):
        # The tooltip displayed in the editor.
        ToolTip<public>:message = external {}

        # The short tooltip displayed in the editor.
        ShortToolTip<epic_internal>:message = external {}

        # The thumbnail shown in the content browser.
        ShowThumbnail<epic_internal>:logic = external {}

        # The categories displayed in the editor.
        Categories<public>:[]message = external {}

        EditInline<epic_internal>:logic = external {}

        # If true the property will only be displayed if epic developer permission exist.
        EpicOnly<epic_internal>:logic = external {}

    @attribscope_class
    @attribscope_struct
    @attribscope_data
    @customattribhandler
    editable_non_concrete<epic_internal> := class<computes>(attribute):
        EditInline<epic_internal>:logic = external {}

    @attribscope_class
    @attribscope_struct
    @attribscope_data
    @customattribhandler
    editable_text_box<public> := class<final><computes>(editable):
        # True if the editor text box should support multiple lines.
        MultiLine<public>:logic = external {}

        # The maximum length of the text.
        MaxLength<public>:int = external {}

    @attribscope_class
    @attribscope_struct
    @attribscope_data
    @customattribhandler
    editable_slider<public>(t:type) := class<final><computes>(editable):
        (/Verse.org/Simulation/editable_slider:)Simulation_editable_slider_Variance<private>:?type {_():tuple(t)} = external {}

        # The minimum value of the editor slider.
        MinValue<public>:?t = external {}

        # The maximum value of the editor slider.
        MaxValue<public>:?t = external {}

        # The amount the slider moves for each step.
        SliderDelta<public>:?t = external {}

        # Used to scale a slider exponentially. Common values are found within the range of 1-20.
        SliderExponent<public>:?t = external {}

        # Used to change how sensitive the field value is when moving the slider via mouse cursor.
        MouseLinearDeltaSensitivity<public>:float = external {}

        MouseShiftMovePixelPerDelta<public>:float = external {}

    @attribscope_class
    @attribscope_struct
    @attribscope_data
    @customattribhandler
    editable_number<public>(t:type) := class<final><computes>(editable):
        (/Verse.org/Simulation/editable_number:)Simulation_editable_number_Variance<private>:?type {_():tuple(t)} = external {}

        # The minimum value the editor allows.
        MinValue<public>:?t = external {}

        # The maximum value the editor allows.
        MaxValue<public>:?t = external {}

        # Snap the spinbox to the nearest delta.
        SpinBoxDelta<public>:?t = external {}

    @attribscope_class
    @attribscope_struct
    @attribscope_data
    @customattribhandler
    editable_vector_slider<public>(t:type) := class<final><computes>(editable):
        (/Verse.org/Simulation/editable_vector_slider:)Simulation_editable_vector_slider_Variance<private>:?type {_():tuple(t)} = external {}

        # Show the button that allows locking the vector aspect ratio.
        ShowPreserveRatio<public>:logic = external {}

        # Show the button that allows normalizing the vector.
        ShowNormalize<public>:logic = external {}

        # The minimum value allowed for each vector element.
        MinComponentValue<public>:?t = external {}

        # The maximum value allowed for each vector element.
        MaxComponentValue<public>:?t = external {}

        # The amount the slider moves for each step.
        SliderDelta<public>:?t = external {}

        # Used to scale a slider exponentially. Common values are found within the range of 1-20.
        SliderExponent<public>:?t = external {}

        # Used to change how sensitive the field value is when moving the slider via mouse cursor.
        MouseLinearDeltaSensitivity<public>:float = external {}

        MouseShiftMovePixelPerDelta<public>:float = external {}

    @attribscope_class
    @attribscope_struct
    @attribscope_data
    @customattribhandler
    editable_vector_number<public>(t:type) := class<final><computes>(editable):
        (/Verse.org/Simulation/editable_vector_number:)Simulation_editable_vector_number_Variance<private>:?type {_():tuple(t)} = external {}

        # Show the button that allows locking the vector aspect ratio.
        ShowPreserveRatio<public>:logic = external {}

        # Show the button that allows normalizing the vector.
        ShowNormalize<public>:logic = external {}

        # The minimum value allowed for each vector element.
        MinComponentValue<public>:?t = external {}

        # The maximum value allowed for each vector element.
        MaxComponentValue<public>:?t = external {}

        # Snap the spinbox to the nearest delta.
        SpinBoxDelta<public>:?t = external {}

    @attribscope_class
    @attribscope_struct
    @attribscope_data
    @customattribhandler
    editable_container<public> := class<final><computes>(editable):
        # If true, allows reordering of the container elements in the editor.
        AllowReordering<public>:logic = external {}

    @attribscope_class
    @customattribhandler
    editor_type<epic_internal> := class<computes>(attribute):


    @attribscope_class
    @attribscope_data
    @customattribhandler
    experimental_always_overridden<epic_internal> := class<computes>(attribute):


    @attribscope_class
    @customattribhandler
    hide_in_editor<epic_internal> := class<computes>(attribute):


    @attribscope_class
    @attribscope_data
    @attribscope_function
    @customattribhandler
    short_tool_tip_attribute<epic_internal> := class<computes><internal>(attribute):


    short_tool_tip<constructor><epic_internal>(ShortToolTip:string)<computes>:short_tool_tip_attribute = external {}

    @attribscope_class
    @attribscope_data
    @attribscope_function
    @customattribhandler
    tool_tip_attribute<epic_internal> := class<computes><internal>(attribute):


    tool_tip<constructor><epic_internal>(ToolTip:string)<computes>:tool_tip_attribute = external {}

    @attribscope_class
    @attribscope_data
    @customattribhandler
    transient<epic_internal> := class<computes>(attribute):


    @attribscope_data
    @customattribhandler
    ui_max_attribute<epic_internal> := class<computes><internal>(attribute):


    ui_max<constructor><epic_internal>(UIMax:string)<computes>:ui_max_attribute = external {}

    @attribscope_data
    @customattribhandler
    ui_min_attribute<epic_internal> := class<computes><internal>(attribute):


    ui_min<constructor><epic_internal>(UIMin:string)<computes>:ui_min_attribute = external {}

    @attribscope_data
    @customattribhandler
    units_attribute<epic_internal> := class<computes><internal>(attribute):


    units<constructor><epic_internal>(Unit:string)<computes>:units_attribute = external {}