using {/Verse.org/Assets}
using {/Verse.org/Simulation}
using {/Verse.org/Containers}
@experimental
# A owner of a modifier of skeletons, used to animate meshes using skeletal animation
has_skeletal_animation<native><epic_internal> := interface:
    @editable
    @category("Animation")
    SkeletalAnimation<epic_internal>:modifier_stack(skeleton)

    GetSkeletalAnimation<native_callable><epic_internal>():modifier_stack(skeleton) = external {}

@experimental
# A modifier of skeletons, used to animate meshes using skeletal animation
skeletal_animation<native><epic_internal> := class<epic_internal>(modifier(skeleton)):
    InternalAsset<native><epic_internal>:animation_asset = external {}

@experimental
MakeSkeletonModifierStack<native><epic_internal>()<converges>:modifier_stack(skeleton)

@experimental
# Plays back a modifier(skeleton) on a modifier_stack(skeleton)
(Stack:modifier_stack(skeleton)).Play<epic_internal>(Modifier:modifier(skeleton))<transacts>:cancelable = external {}

@experimental
# Skeletons are collections of bones & sets/chains
skeleton<native><epic_internal> := class:
