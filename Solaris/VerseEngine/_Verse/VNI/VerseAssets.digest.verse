using {/Verse.org/Simulation}
# Module import path: /Verse.org/Assets
Assets<public> := module:
    animation_sequence<native><public> := class<computes><final><epic_internal>:


    material<native><public> := class<epic_internal>:


    particle_system<native><public> := class<computes><final><epic_internal>:


    mesh<native><public> := class<computes><epic_internal>:


    sound_wave<native><public> := class<computes><final><epic_internal>:


    texture<native><public> := class<computes><final><epic_internal>:


    input_action<native><public>(t:type) := class<computes><epic_internal>:


    input_mapping<native><public> := class<computes><epic_internal>:


    # Interface that provides an icon.
    has_icon<public> := interface:
        @editable
        var<protected> Icon<public>:texture