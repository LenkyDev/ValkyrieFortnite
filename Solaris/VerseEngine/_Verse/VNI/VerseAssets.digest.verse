# Verse path: /Verse.org
# Module import path: /Verse.org/Assets
Assets<public> := module:
    using {/Verse.org/Simulation}
    animation_sequence<native><public> := class<computes><final><epic_internal>:


    material<native><public> := class<epic_internal>:


    particle_system<native><public> := class<computes><final><epic_internal>:


    mesh<native><public> := class<computes><epic_internal>:


    sound_wave<native><public> := class<computes><final><epic_internal>:


    texture<native><public> := class<computes><final><epic_internal>:


    input_action<native><public>(t:type) := class<allocates><unique><computes><epic_internal>:
        (/Verse.org/Assets/input_action:)Assets_input_action_Variance<private>():tuple(t) = external {}

    input_mapping<native><public> := class<computes><epic_internal>:


    # Interface that provides an icon.
    has_icon<native><public> := interface:
        @editable
        # A texture used as the 2D visual representation of this entity (e.g. an icon or portrait).
        var Icon<public>:texture