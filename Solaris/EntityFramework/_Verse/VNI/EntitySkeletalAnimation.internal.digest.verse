# Verse path: /Verse.org/SceneGraph
using {/Verse.org/Temporary/EpicGamesRestricted/Network}
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

has_uaf_shared_variables<native><epic_internal> := interface<epic_internal>:
    InternalAsset<epic_internal>:animation_asset

    SetProperty<epic_internal>(PropertyName:string, NewValue:any)<transacts>:void = external {}

RouteUAFSharedVariableSet<native><epic_internal>(Component:has_uaf_shared_variables, Asset:animation_asset, PropertyName:string, NewValue:any)<transacts>:void

@import_as("/Script/EntitySkeletalAnimation.UEntityProxySkeletonModifierBase")
proxy_skeleton_modifier_base<native><epic_internal> := class<epic_internal>:


@available {MinUploadedAtFNVersion := 4240}
@experimental
# Follows the skeletal animation of another entity's animation source, so e.g. this mesh follows another mesh. SourceEntity's skeletal-animation stack output is republished as this stack's incoming skeleton.
proxy_skeleton_modifier<native><epic_internal> := class<final><epic_internal>(proxy_skeleton_modifier_base, modifier(skeleton)):
    Evaluate<native><override>(InValue:skeleton)<reads>:skeleton

    @editable
    @replicated("RepNotify")
    # The entity whose skeletal animation to follow. While unset or unresolved, this mesh stays on its reference pose.
    var SourceEntity<native><epic_internal>:?entity = external {}

    @editable
    # The retargeting method applied to the followed skeletal animation. Unset means plain remapping.
    var RetargetMethod<native><epic_internal>:?skeletal_animation_retarget_method = external {}

@import_as("/Script/EntitySkeletalAnimation.UEntitySkeletalAnimationBase")
skeletal_animation_base<native><epic_internal> := class<epic_internal>:


@available {MinUploadedAtFNVersion := 4100}
@experimental
# A modifier of skeletons, used to animate meshes using skeletal animation
skeletal_animation<native><public> := class<castable><epic_internal>(skeletal_animation_base, modifier(skeleton)):
    Evaluate<native><override>(InValue:skeleton)<reads>:skeleton

    Play<native><epic_internal>()<transacts>:void

    Pause<native><epic_internal>()<transacts>:void

    Stop<native><epic_internal>()<transacts>:void

    var<private> IsPlaying<native><epic_internal>:logic = external {}

    StopEvent<native><epic_internal>:listenable(tuple()) = external {}

    PlayEvent<native><epic_internal>:listenable(tuple()) = external {}

    PauseEvent<native><epic_internal>:listenable(tuple()) = external {}

    # Get this animation's lifetime, in seconds.Fails if an animation has an indefinite duration (i.e. it is not possible at the point of the call to tell how long the animation is)Animations can be of infinite length (such as a looping animation)
    GetDuration<native_callable><epic_internal>()<decides><reads>:float = external {}

    # Get a listenable event that will fire Offset seconds before this animation finishes.This can be useful for triggering crossfades as animations naturally finishFails if this animation has an indefinite duration (i.e. it is not possible at the point of the call to tell how long the animation is)If this animation has an infinite duration, then this event will never fire.
    PreFinishEvent<native><epic_internal>(Offset:float)<transacts><decides>:listenable(tuple())

    @replicated("")
    # Controls if the `skeletal_animation` should play automatically when created.
    AutoPlay<native><epic_internal>:logic = external {}

    GetSeconds<native><epic_internal>()<reads>:float

    BeginTime<native><epic_internal>:float = external {}

    EndTime<native><epic_internal>:float = external {}

    GetIsLooping<native_callable><epic_internal>()<reads>:logic = external {}

    SetProperty<native><epic_internal>(PropertyName:string, NewValue:any)<transacts>:void

    @replicated("RepNotify")
    InternalAsset<native><epic_internal>:animation_asset = external {}

@available {MinUploadedAtFNVersion := 4100}
@experimental
MakeSkeletonModifierStack<native><epic_internal>()<converges>:modifier_stack(skeleton)

@available {MinUploadedAtFNVersion := 4100}
@experimental
play_skeletal_animation_result<public> := struct<epic_internal>:
    # The skeletal_animation that was played
    Animation:skeletal_animation

    # An easeable interface used to control blending
    Easeable:easeable

@available {MinUploadedAtFNVersion := 4200}
@experimental
cancelable_impl_internal<epic_internal> := class<epic_internal>(cancelable):
    Cancel<override>()<transacts>:void = external {}

    Cancelable<epic_internal>:cancelable

@available {MinUploadedAtFNVersion := 4200}
@experimental
easeout_impl_internal<epic_internal> := class<epic_internal>:
    EasingModifier<epic_internal>:easing_modifier(skeleton)

@available {MinUploadedAtFNVersion := 4100}
@experimental
# Play a skeletal_animation on an entity
(Entity:entity).PlaySkeletalAnimation<public>(Animation:skeletal_animation, ?EaseInWindow:easing_window = external {}, ?EaseOutWindow:easing_window = external {})<transacts><decides>:play_skeletal_animation_result = external {}

@import_as("/Script/EntitySkeletalAnimation.USkeletalAnimationRetargetMethodBase")
skeletal_animation_retarget_method_base<native><epic_internal> := class<epic_internal>:


@experimental
# A method used to retarget skeletal animation between different skeletons. Unset on a proxy_skeleton_modifier means plain remapping.
skeletal_animation_retarget_method<native><epic_internal> := class<abstract><epic_internal>(skeletal_animation_retarget_method_base):


@display_name("Translation Retarget")
@experimental
# Retargets bone translations using the per-bone retarget modes authored on the target skeleton.
translation_retarget_method<native><epic_internal> := class<final><epic_internal>(skeletal_animation_retarget_method):


@available {MinUploadedAtFNVersion := 4100}
@experimental
# Skeletons are collections of bones & sets/chains
skeleton<native><public> := class<epic_internal>:
