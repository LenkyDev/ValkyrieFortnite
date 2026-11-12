# Verse path: /Verse.org
using {/Verse.org/Native}
@available {MinUploadedAtFNVersion := 4300}
# Module import path: /Verse.org/Progression
Progression<public> := module:
    using {/Verse.org/SceneGraph}
    using {/Verse.org/Simulation}
    # Implemented by types that hold an `objective`.
    has_objective<native><public> := interface:
        # Replaces the objective.
        SetObjective<native_callable><public>(InObjective:objective)<transacts>:void = external {}

        # The objective this type holds.
        # Write it with `SetObjective`.
        var<protected> Objective<native><public>:objective

        # Native read of `Objective` for the contributor walk; creators read the field directly.
        GetObjective<final><native_callable><epic_internal>()<reads>:objective = external {}

    # Lifecycle state of an objective.
    objective_state<native><public> := enum<open>:
        # The objective is not running and has not completed.
        Inactive
        # The objective is running and has not completed.
        Active
        # The objective has completed.
        Complete

    # Implement on an objective type that tracks contributing agents.
    has_objective_contributors<native><public> := interface:
        # Records `Agent` as a contributor.
        AddContributor<native_callable><public>(Agent:agent)<transacts>:void = external {}

        # Records that `Agent` no longer contributes.
        RemoveContributor<native_callable><public>(Agent:agent)<transacts>:void = external {}

        # Contributing agents, one record per `AddContributor` call.
        # Write them through `AddContributor` / `RemoveContributor`.
        var<protected> Contributors<native><public>:[]agent = external {}

    # Implement on an objective whose activation-scoped registrations belong to a scene entity; container objectives implement it as a pass-through to their children.
    has_objective_anchor<native><epic_internal> := interface:
        # Records 'InAnchor' as the entity this objective's activation-scoped registrations belong to; a later call re-anchors the next activation. An override replaces this body, so it must write Anchor itself.
        SetAnchor<native_callable><epic_internal>(InAnchor:entity)<transacts>:void = external {}

        # The anchor recorded by SetAnchor, or false when none has been set. Write it with SetAnchor.
        var<protected> Anchor<native><epic_internal>:?entity = external {}

    # Returned when an objective lifecycle call cannot be honored.
    objective_error<native><public> := class<abstract><computes><castable>:


    activate_objective_error<native><epic_internal> := class<epic_internal>(objective_error):


    deactivate_objective_error<native><epic_internal> := class<epic_internal>(objective_error):


    complete_objective_error<native><epic_internal> := class<epic_internal>(objective_error):


    # Why an objective completed.
    complete_objective_reason<native><public> := class<abstract><castable>:


    # The objective's work was accomplished.
    succeed_objective_reason<native><public> := class(complete_objective_reason):


    # The objective's work can no longer be accomplished.
    fail_objective_reason<native><public> := class(complete_objective_reason):


    # Delivered by `objective.CompleteEvent`.
    objective_complete_event_data<native><public> := struct<epic_internal>:
        # The objective that completed.
        Objective<native><public>:objective

        # Why it completed.
        Reason<native><public>:complete_objective_reason

    # A unit of trackable work with an `Inactive`, `Active` and `Complete` lifecycle. Use it for anything from an objective that simply tracks a number to a complex nested objective made of other objectives.
    #   * Eliminate 10 enemies: one counter that completes at its target.
    #   * Hold the point for 60 seconds: time accumulated while a condition holds.
    #   * Clear the dungeon: nested objectives that complete in sequence or together.
    objective<native><public> := class<abstract><castable><unique>:
        # This objective's lifecycle state.
        var<private> State<native><public>:objective_state = external {}

        # Returns a `message` describing progress, for example `"3 / 10"`.
        GetProgress<native><native_callable><public>()<reads>:message

        # Signals `ProgressEvent`.
        SignalProgressEvent<native><final><protected>()<transacts>:void

        CanProgress<native><native_callable><epic_internal>()<decides><reads>:void

        # Marks this objective's view dirty so holders re-render it.
        MarkObjectiveViewDirty<native><final><epic_internal>()<transacts>:void

        # Starts this objective; returns an error when it is already running or its type refuses to start it, otherwise the errors `CanActivate` returned.
        Activate<native><final><public>()<transacts>:result(void, []objective_error)

        # Succeeds if this objective may be activated; the default succeeds.
        # Veto by returning errors.
        CanActivate<native><native_callable><public>()<reads>:result(void, []objective_error)

        # Called when this objective starts.
        OnActivate<native><native_callable><protected>()<transacts>:void

        # Stops this objective; returns an error when it is not running, otherwise the errors `CanDeactivate` returned.
        Deactivate<native><final><public>()<transacts>:result(void, []objective_error)

        # Succeeds if this objective may be deactivated; the default succeeds.
        # Veto by returning errors.
        CanDeactivate<native><native_callable><public>()<reads>:result(void, []objective_error)

        # Called when this objective stops.
        OnDeactivate<native><native_callable><protected>()<transacts>:void

        # Reports this objective as complete for `Reason`; returns an error when its type refuses the report, otherwise the errors `CanComplete` returned.
        Complete<native><final><public>(Reason:complete_objective_reason)<transacts>:result(void, []objective_error)

        # Succeeds if this objective may be completed for `Reason`; the default succeeds.
        # Veto by returning errors.
        CanComplete<native><native_callable><public>(Reason:complete_objective_reason)<reads>:result(void, []objective_error)

        # Called after this objective is complete, possibly more than once.
        OnComplete<native><native_callable><protected>(Reason:complete_objective_reason)<transacts>:void

        # Signaled when this objective completes.
        CompleteEvent<native><final><public>:listenable(objective_complete_event_data) = external {}

        # Signaled when this objective's progress changes.
        ProgressEvent<native><final><public>:listenable(objective) = external {}

        # Signaled when this objective is activated.
        ActivateEvent<native><final><public>:listenable(objective) = external {}

        # Signaled when this objective is deactivated.
        DeactivateEvent<native><final><public>:listenable(objective) = external {}

    MakeObjectiveSuccessResult<native_callable><epic_internal>():result(void, []objective_error) = external {}

    MakeActivateObjectiveErrorResult<native_callable><epic_internal>():result(void, []objective_error) = external {}

    MakeDeactivateObjectiveErrorResult<native_callable><epic_internal>():result(void, []objective_error) = external {}

    MakeCompleteObjectiveErrorResult<native_callable><epic_internal>():result(void, []objective_error) = external {}

    ComposeActivationGuardResult<native_callable><epic_internal>(QuestRefused:logic, Objective:objective):result(void, []objective_error) = external {}

    ComposeDeactivationGuardResult<native_callable><epic_internal>(QuestRefused:logic, Objective:objective):result(void, []objective_error) = external {}

    ComposeCompletionGuardResult<native_callable><epic_internal>(QuestRefused:logic, Objective:objective, Reason:complete_objective_reason):result(void, []objective_error) = external {}