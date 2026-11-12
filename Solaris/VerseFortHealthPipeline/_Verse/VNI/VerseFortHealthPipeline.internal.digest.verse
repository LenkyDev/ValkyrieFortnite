# Verse path: /Fortnite.com
# Module import path: /Fortnite.com/FortHealthPipeline
FortHealthPipeline<public> := module:
    using {/Verse.org/Simulation}
    using {/Verse.org/SceneGraph}
    using {/Fortnite.com/Characters}
    using {/Verse.org/Native}
    using {/UnrealEngine.com/HealthPipeline}
    @available {MinUploadedAtFNVersion := 4300}
    @experimental
    # Identity tag for the Fortnite Overshield health pool.
    fort_overshield_tag<native><public> := class<final>(health_pool_tag):


    @available {MinUploadedAtFNVersion := 4300}
    @experimental
    # Identity tag for the Fortnite Shield health pool.
    fort_shield_tag<native><public> := class<final>(health_pool_tag):


    @available {MinUploadedAtFNVersion := 4300}
    @experimental
    # Identity tag for the Fortnite Health health pool.
    fort_health_tag<native><public> := class<final>(health_pool_tag):


    @available {MinUploadedAtFNVersion := 4300}
    @experimental
    # The Fortnite Overshield health pool; identity is fixed to fort_overshield_tag.
    fort_overshield<native><public> := class<concrete><final>(health_pool_entry):
        Tag<override>:health_pool_tag = external {}

    @available {MinUploadedAtFNVersion := 4300}
    @experimental
    # The Fortnite Shield health pool; identity is fixed to fort_shield_tag.
    fort_shield<native><public> := class<concrete><final>(health_pool_entry):
        Tag<override>:health_pool_tag = external {}

    @available {MinUploadedAtFNVersion := 4300}
    @experimental
    # The Fortnite Health health pool; identity is fixed to fort_health_tag.
    fort_health<native><public> := class<concrete><final>(health_pool_entry):
        Tag<override>:health_pool_tag = external {}

    @available {MinUploadedAtFNVersion := 4300}
    @hide_in_editor
    @experimental
    # The Fortnite bridge for the Verse health pipeline: mirrors the pawn's
    #  native Health/Shield/Overshield attributes into three health pools, routes
    #  Verse damage/healing events through Fortnite's native damage formula, and
    #  routes Fortnite-originated damage through the Verse modifier stacks before
    #  health is adjusted.
    # 
    # A negative HealthDelta entry applies the event's reverse direction through
    # the FN boundary (a negative damage entry heals, a negative heal entry
    # damages). The APPLIED direction decides which adjustment stacks run, and a
    # flipped entry gets no event-layer stack (the event's Modifiers match its
    # own direction only).
    # 
    # For fort pawns OnDied fires only on a real elimination - direct kill, DBNO
    # finisher, or bleed-out. A DBNO knockdown is NOT death: the pools mirror the
    # DBNO health values and IsAlive keeps succeeding while downed.
    fort_health_component<native><epic_internal> := class(health_component, pawn_interop_interface, pawn_controller_interop_interface):
        # Resolves the pawn's ability system and health set when the pawn links.
        #  On the authority a pawn links before it is possessed, so this can run
        #  before the player state / ability system exists - HandlePawnControllerChanged
        #  re-drives the resolve once the controller arrives.
        HandlePawnLinked<override><native>(Info:pawn_linked_info):void

        # Fires after HandlePawnLinked and again on every controller change; the
        #  resolve is idempotent so repeated changes are cheap. A final call with no
        #  pawn in Info means the pawn unlinked - the component freezes the pools at
        #  the native attributes' final values and detaches.
        HandlePawnControllerChanged<override><native>(Info:pawn_linked_info):void

        # Seed the pools once, when the component is added to the entity - before it
        #  is in the scene, simulating, or pawn-linked - so resolution never races an
        #  empty pool set.
        OnInitialized<native><override>():void

        OnBeginSimulation<native><override>():void

        OnEndSimulation<native><override>():void

        # All adjustments flow through Fortnite's damage attributes exactly once;
        #  the native override owns the re-entrancy scope lock that keeps
        #  Verse -> FN -> Verse from recursing.
        OnReceive<native><override>(SceneEvent:scene_event):logic

        # The fort pool set is fixed (Overshield/Shield/Health, or template-provided):
        #  pools are a projection of the native attributes, so runtime adds are
        #  rejected. Seeding happens via InitializePools or template archetypes.
        AddHealthPool<override><final>(Pool:health_pool_entry)<transacts>:void = external {}

        # The fort pool set is fixed: runtime removes are rejected.
        RemoveHealthPool<override><final>(Pool:health_pool_entry)<transacts>:void = external {}

        # Gate liveness on the fort Health pool BY TAG, not the base "last pool",
        #  so a template-provided pool order cannot hijack the alive gate.
        IsAlive<override>()<decides><reads>:void = external {}