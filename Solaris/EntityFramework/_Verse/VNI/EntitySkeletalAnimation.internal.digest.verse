using {/Verse.org/Assets}
using {/Verse.org/Native}
using {/Verse.org/Simulation}
@available {MinUploadedAtFNVersion := 4100}
@experimental
# A owner of a modifier of skeletons, used to animate meshes using skeletal animation
has_skeletal_animation<native><epic_internal> := interface<epic_internal>:
    @editable
    @category("Animation")
    SkeletalAnimation<epic_internal>:modifier_stack(skeleton)

    GetSkeletalAnimation<native_callable><epic_internal>():modifier_stack(skeleton) = external {}

@import_as("/Script/EntitySkeletalAnimation.UEntitySkeletalAnimationBase")
skeletal_animation_base<native><epic_internal> := class<epic_internal>:


@available {MinUploadedAtFNVersion := 4100}
@experimental
# A modifier of skeletons, used to animate meshes using skeletal animation
skeletal_animation<native><public> := class<castable><epic_internal>(skeletal_animation_base, modifier(skeleton)):
    Evaluate<native><override>(InValue:skeleton)<reads>:skeleton

    InternalAsset<native><epic_internal>:animation_asset = external {}

@available {MinUploadedAtFNVersion := 4100}
@experimental
MakeSkeletonModifierStack<native><epic_internal>()<converges>:modifier_stack(skeleton)

@available {MinUploadedAtFNVersion := 4100}
@experimental
play_skeletal_animation_result<public> := struct<epic_internal>:
    # The skeletal_animation that was played
    Animation:skeletal_animation

    # An easable interface used to control blending
    Easeable:easeable

@available {MinUploadedAtFNVersion := 4100}
@experimental
# Play a skeletal_animation on an entity
(Entity:entity).PlaySkeletalAnimation<public>(Animation:skeletal_animation, ?EaseInWindow:easing_window = external {}, ?EaseOutWindow:easing_window = external {})<transacts><decides>:play_skeletal_animation_result = external {}

@available {MinUploadedAtFNVersion := 4100}
@experimental
# Skeletons are collections of bones & sets/chains
skeleton<native><public> := class<epic_internal>:
