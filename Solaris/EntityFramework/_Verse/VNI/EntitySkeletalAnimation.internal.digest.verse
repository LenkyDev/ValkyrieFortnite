using {/Verse.org/Assets}
using {/Verse.org/Native}
@experimental
# Internal common implementation for skeletal_animation
generic_skeletal_animation<native><epic_internal> := class<abstract>(skeletal_animation, property_changed_interface):
    Asset<native><epic_internal>:asset = external {}

    OnPropertyChangedFromVerse<native><override>(PropertyName:string)<transacts>:void

@experimental
# All things that produce a skeleton implement the skeletal_animation interface
skeletal_animation<native><epic_internal> := interface:


@experimental
# Skeletons are collections of bones & sets/chains
skeleton<native><epic_internal> := class:
