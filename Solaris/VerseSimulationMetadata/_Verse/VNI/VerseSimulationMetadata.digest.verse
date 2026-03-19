# Module import path: /Verse.org/Simulation
Simulation<public> := module:
    @attribscope_class
    @attribscope_struct
    @attribscope_data
    @customattribhandler
    editable<public> := class<computes>(attribute):
        # The tooltip displayed in the editor.
        ToolTip<public>:message = external {}

        # The categories displayed in the editor.
        Categories<public>:[]message = external {}

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
        (/Verse.org/Simulation/editable_slider:)Simulation_editable_slider_Variance<private>():tuple(t) = external {}

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
        (/Verse.org/Simulation/editable_number:)Simulation_editable_number_Variance<private>():tuple(t) = external {}

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
        (/Verse.org/Simulation/editable_vector_slider:)Simulation_editable_vector_slider_Variance<private>():tuple(t) = external {}

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
        (/Verse.org/Simulation/editable_vector_number:)Simulation_editable_vector_number_Variance<private>():tuple(t) = external {}

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