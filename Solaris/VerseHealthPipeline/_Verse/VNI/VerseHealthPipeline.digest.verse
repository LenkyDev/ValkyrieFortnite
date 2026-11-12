# Verse path: /UnrealEngine.com/HealthPipeline
using {/Verse.org/Simulation}
using {/Verse.org/SceneGraph}
using {/Verse.org/Native}
using {/Verse.org/Simulation/Tags}
@available {MinUploadedAtFNVersion := 4300}
@experimental
# Base tag type categorizing health adjustments.
health_adjustment_tag<native><public> := class<epic_internal>(tag):


@available {MinUploadedAtFNVersion := 4300}
@experimental
# Categorizes an adjustment or result entry as damage.
damage_tag<native><public> := class(health_adjustment_tag):


@available {MinUploadedAtFNVersion := 4300}
@experimental
# Categorizes an adjustment or result entry as healing.
healing_tag<native><public> := class(health_adjustment_tag):


@available {MinUploadedAtFNVersion := 4300}
@experimental
# Pool identity: define one subclass per pool type and set an instance as the pool's Tag. 
#  Conditional matching and result entries reference pools by it.
health_pool_tag<native><public> := class(tag):


@available {MinUploadedAtFNVersion := 4300}
@experimental
# A context object passed through the adjustment pipeline in the scene_event 
#  to provide the instigator and contributing entities.
health_adjustment_context<native><public> := class<concrete>:
    var Instigator<native><public>:?entity = external {}

    var Contributors<native><public>:[]entity = external {}

@available {MinUploadedAtFNVersion := 4300}
@experimental
# The health delta to apply plus categories describing the adjustment.
health_adjustment_entry<native><public> := class<final><concrete><reads>:
    HealthDelta<native><public>:float = external {}

    Categories<native><public>:[]tag = external {}

@available {MinUploadedAtFNVersion := 4300}
@experimental
# A slice of an adjustment as applied to one pool. 
#  Categories carries the entry's direction - damage_tag when the pool was damaged, 
#  healing_tag when it was healed - alongside the adjustment's tags.
health_adjustment_result_entry<native><public> := class<final><concrete>:
    var HealthDelta<native><public>:float = external {}

    var PoolTag<native><public>:?health_pool_tag = external {}

    var Categories<native><public>:[]tag = external {}

@available {MinUploadedAtFNVersion := 4300}
@experimental
# The outcome of a processed health adjustment event.
health_adjustment_result<native><public> := class<final><concrete>:
    var Results<native><public>:[]health_adjustment_result_entry = external {}

    var Excess<native><public>:[]health_adjustment_entry = external {}

@available {MinUploadedAtFNVersion := 4300}
@experimental
# Adjustments are scene events: senders build them and deliver with entity.SendUp; 
#  receivers (health_component) process them in OnReceive. 
#  Modifiers is the event LAYER stack, supplied by the sender (gather from contributors 
#  however your game sees fit) before the event is sent.
health_adjustment_event<native><public> := class<abstract><epic_internal>(scene_event):
    Context<native><public>:health_adjustment_context = external {}

    Entries<native><public>:[]health_adjustment_entry = external {}

    var Modifiers<public>:health_adjustment_modifier_stack = external {}

    var Result<native><public>:?health_adjustment_result = external {}

@available {MinUploadedAtFNVersion := 4300}
@experimental
# A health adjustment delivered as damage; cast to distinguish in OnReceive.
damage_event<native><public> := class(health_adjustment_event):


@available {MinUploadedAtFNVersion := 4300}
@experimental
# A health adjustment delivered as healing; cast to distinguish in OnReceive.
healing_event<native><public> := class(health_adjustment_event):


@available {MinUploadedAtFNVersion := 4300}
@experimental
# A pool of health that can be damaged and/or healed. 
#  Pool identifier is the Tag: define one health_pool_tag subclass per pool type 
#  (e.g. shields_pool_tag := class(health_pool_tag)) - conditional matching and result entries 
#  reference pools by that tag. Pools carry their own modifier stacks, evaluated as the pool LAYER.
health_pool_entry<native><public> := class<concrete><unique>:
    @editable
    var CurrentValue<native><public>:float = external {}

    @editable
    var MaxValue<native><public>:float = external {}

    @editable
    # The pool's identity tag; fixed at setup (non-var) so identity cannot
    #  change while the pool is live.
    Tag<native><public>:health_pool_tag = external {}

    # Pool-layer damage modifier stack.
    var DamageModifiers<public>:health_adjustment_modifier_stack = external {}

    # Pool-layer healing modifier stack.
    var HealingModifiers<public>:health_adjustment_modifier_stack = external {}

    # Gates whether this pool processes an adjustment entry; the default
    #  processes everything - override for pool-specific rules (e.g. shields
    #  refuse Penetrating entries).
    CanProcessAdjustment<public>(Adjustment:health_adjustment_entry)<decides><reads>:void = external {}

@available {MinUploadedAtFNVersion := 4300}
@experimental
# The default health component: processes damage and healing scene events
# against an ordered array of health pools.
# 
# ==============================================================================
# Scene Events
# 
#   Senders BUILD the adjustment event themselves and deliver it with SendUp:
# 
#     Event := damage_event:
#         Context := health_adjustment_context{Instigator := option{Agent}}
#         Entries := array{health_adjustment_entry{HealthDelta := 70.0}}
#     Target.SendUp(Event)
#     DealtResult := Event.Result
# 
#   The event's Modifiers stack is supplied by the sender - gather modifiers
#   from contributors however your game sees fit before sending.
# 
#   OnReceive consumes the first damage_event/healing_event that reaches this
#   component: pools are adjusted, the event's Result is set, OnDamaged or
#   OnHealed is signaled with that result, and OnDied is signaled when the
#   adjustments took IsAlive from succeeding to failing.
# 
# ==============================================================================
# The Math - Layer-Factor Multiplication
# 
#   Pools are processed in order; within each pool, entries are processed in
#   order. Per (pool, entry), three modifier stack LAYERS are consulted:
# 
#     1. the event's stack     (Event.Modifiers, supplied by the sender)
#     2. the pool's stack      (Pool.DamageModifiers / Pool.HealingModifiers)
#     3. the component's stack (DamageModifiers / HealingModifiers)
# 
#   Each layer independently evaluates the REAL entry with natural semantics -
#   a stack's modifiers chain internally, and the whole stack's output folds
#   to ONE factor:
# 
#     Factor = Stack.Evaluate(Entry).HealthDelta / Entry.HealthDelta
# 
#   The layer factors MULTIPLY: Multiplier = FEvent * FPool * FComponent. A
#   factor of 1.0 is naturally inert; a 0 from ANY layer zeroes the multiplier
#   and NULLIFIES the entry (a 0-delta result entry is recorded and nothing
#   remains to continue on); a negative factor flips the direction.
# 
# ==============================================================================
# Application, Unwind, and Excess
# 
#     Scaled = Remaining * Multiplier
# 
#   The pool is first gated by its CanProcessAdjustment. The SIGN of Scaled
#   then decides direction: in a damage_event a positive Scaled damages the
#   pool toward 0 while a negative Scaled heals it toward MaxValue (a
#   healing_event mirrors this). Scaled is negative when the entry's
#   HealthDelta or the folded multiplier is negative - a negative HealthDelta
#   entry is valid input and starts in the reversed direction. A pool with no
#   capacity in that direction is skipped and the entry continues on
#   unchanged.
# 
#   What the pool absorbs is recorded as a result entry carrying the pool's
#   Tag, the entry's Categories, and the direction actually applied
#   (damage_tag or healing_tag). Overflow UNWINDS by dividing the multiplier
#   back out - Remaining = (Scaled - Absorbed) / Multiplier - and continues to
#   the next pool, where the layers are consulted again. Whatever survives
#   every pool lands in Result.Excess at its unwound value.
# 
#   A zero HealthDelta entry adjusts nothing but still records one 0.0 result
#   entry on the pool it would land on (first with capacity in the event's
#   direction, else the last eligible pool), with no Excess.
# 
#   Example: a 70 damage entry against shields at 50 carrying a 2x pool trait,
#   with a 3x record on the event: multiplier 2 * 3 = 6, so 420 to apply;
#   shields absorb 50; the remaining 370 unwinds to ~61.7 and continues to
#   the next pool at THAT pool's multipliers.
health_component<native><public> := class<final_super>(component):
    @editable {}
    # The health pools associated w/ this health component; adjustments are
    #  applied to each pool in this order.
    var<protected> HealthPools<native><public>:[]health_pool_entry = external {}

    # The health pools, in adjustment-application order.
    GetHealthPools<public>()<reads>:[]health_pool_entry = external {}

    # The first pool whose identity Tag is an instance of PoolTag; fails
    #  when none match.
    GetHealthPool<public>(PoolTag:castable_subtype(health_pool_tag))<decides><reads>:health_pool_entry = external {}

    # Appends a pool (applied after the existing pools).
    AddHealthPool<native_callable><public>(Pool:health_pool_entry)<transacts>:void = external {}

    # Removes the given pool instance (health_pool_entry is unique).
    RemoveHealthPool<native_callable><public>(Pool:health_pool_entry)<transacts>:void = external {}

    # Component-layer damage modifier stack.
    var DamageModifiers<public>:health_adjustment_modifier_stack = external {}

    # Component-layer healing modifier stack.
    var HealingModifiers<public>:health_adjustment_modifier_stack = external {}

    # Signaled after a damage event is processed, with the result that was applied.
    OnDamaged<native><final><public>:listenable(health_adjustment_result) = external {}

    # Signaled after a healing event is processed, with the result that was applied.
    OnHealed<native><final><public>:listenable(health_adjustment_result) = external {}

    # Signaled when an adjustment takes IsAlive from succeeding to failing.
    OnDied<native><final><public>:listenable(tuple()) = external {}

    # Signals OnDamaged and broadcasts the native delegate mirror;
    #  native because the underlying event signal is no_rollback.
    SignalDamaged<native><protected>(Result:health_adjustment_result)<transacts>:void

    # Signals OnHealed and broadcasts the native delegate mirror;
    #  native because the underlying event signal is no_rollback.
    SignalHealed<native><protected>(Result:health_adjustment_result)<transacts>:void

    # Signals OnDied and broadcasts the native delegate mirror;
    #  native because the underlying event signal is no_rollback.
    SignalDied<native><protected>()<transacts>:void

    # Succeeds while the component is alive; override to change the gate.
    IsAlive<public>()<decides><reads>:void = external {}

    # Adjustments arrive as scene events (senders build them and SendUp to
    #  the target). A processed event is consumed to stop it climbing past the
    #  first health component; unhandled events keep traversing.
    OnReceive<override>(SceneEvent:scene_event):logic = external {}

@available {MinUploadedAtFNVersion := 4300}
@experimental
# Modifiers evaluate individual adjustment entries: real entry in, modified entry out 
#  (health_adjustment_entry is <reads>-constructible, so a <reads> body can build the modified entry). 
#  Evaluation state (Context/Target/Pool) is delivered through vars at the time of adjustment evaluation.
health_adjustment_modifier<public> := class(modifier(health_adjustment_entry)):
    var Context<protected>:?health_adjustment_context = external {}

    var Target<protected>:?entity = external {}

    var Pool<protected>:?health_pool_entry = external {}

    PreEvaluate<public>(InContext:?health_adjustment_context, InTarget:?entity, InPool:?health_pool_entry)<transacts>:void = external {}

    PostEvaluate<public>()<transacts>:void = external {}

    Evaluate<override>(InValue:health_adjustment_entry)<reads>:health_adjustment_entry = external {}

@available {MinUploadedAtFNVersion := 4300}
@experimental
# An ordered stack of health adjustment modifiers. 
#  Itself a modifier, so stacks nest; the Pre/PostEvaluate broadcasts forward evaluation state down the chain.
health_adjustment_modifier_stack<public> := class(modifier_stack(health_adjustment_entry)):
    AddModifier<override>(Modifier:modifier(health_adjustment_entry))<transacts>:cancelable = external {}

    PreEvaluate<public>(InContext:?health_adjustment_context, InTarget:?entity, InPool:?health_pool_entry)<transacts>:void = external {}

    PostEvaluate<public>()<transacts>:void = external {}