using {/Verse.org/Temporary/EpicGamesRestricted/Network}
using {/Verse.org/Simulation}
@experimental
# An interactable component with a composable feature set.
basic_interactable_component<native><epic_internal> := class(interactable_component):
    OnInitializedInternal<native><override>():void

    @experimental
    # Attempt to cancel an interaction. Fails if the supplied agent is not currently interacting with the component.
    Cancel<native><public>(Agent:agent)<transacts><decides>:void

    @experimental
    # Attempt to succeed at an interaction. Success will also happen automatically after InteractDuration has elapsed after starting an interaction. Fails if the supplied agent is not currently interacting with the component.
    Succeed<native><public>(Agent:agent)<transacts><decides>:void

    @experimental
    # Get the remaining cooldown of the interactable for the supplied agent. This returns the duration left in seconds of either the shared or per agent cooldown, whichever is greater. Returns the same value when called multiple times within a transaction.
    GetRemainingCooldownDurationAffectingAgent<native><public>(Agent:agent):float

    @experimental
    # The agents which are currently interacting with this interactable.
    var<private> InteractingAgents<native><public>:[]agent = external {}

    @editable
    @experimental
    # Cooldowns begin elapsing on successful interactions. A cooldown which applies for all attempts to interact on this component.
    Cooldown<native><public>:?interactable_cooldown = external {}

    @editable
    @experimental
    # Cooldowns begin elapsing on successful interactions. A cooldown which applies for future attempts to interact on this component by the agent which succeeded.
    CooldownPerAgent<native><public>:?interactable_cooldown_per_agent = external {}

    @editable
    @experimental
    # Success limits prevent new interactions once the component has been successfully interacted with a specified number of times.
    SuccessLimit<native><public>:?interactable_success_limit = external {}

    @editable
    @experimental
    # An interaction with a duration does not succeed until the duration has elapsed, and success is not guaranteed as it can be canceled while the duration is active.
    InteractableDuration<native><public>:?interactable_duration = external {}

@experimental
# Used to handle general interaction.
interactable_component<native><public> := class<final_super>(component, enableable):
    OnInitializedInternal<native><override>():void

    OnUninitializingInternal<native><override>():void

    OnBeginSimulationInternal<native><override>():void

    OnEndSimulationInternal<native><override>():void

    # Enable interaction with the component.
    Enable<native><override>():void

    # Disable interaction with the component. Disabled components do not provide interaction prompts.
    Disable<native><override>():void

    # Succeeds if the component is enabled, fails if itâs disabled.
    IsEnabled<native><override>()<transacts><decides>:void

    InteractFinishedEvent<native><public>:listenable(agent) = external {}

    # Event fires when an a successful interaction starts. Sends the interacting agent. InteractDuration at or below 0 makes this event identical to InteractSucceededEvent.
    StartedEvent<native><public>:listenable(agent) = external {}

    # Event fires when an interaction has completed successfully. Sends the formerly interacting agent. InteractDuration at or below 0 makes this event identical to InteractStartedEvent.
    SucceededEvent<native><public>:listenable(agent) = external {}

    # Event fires when an interaction has ended before completing successfully. Sends the formerly interacting agent. interactable_component cannot be canceled, this event is provided for subclasses to fire where appropriate.
    CanceledEvent<native><public>:listenable(agent) = external {}

    # Attempt to start an interaction. Fails if the agent does not pass the CanInteract function.
    Start<native><public>(Agent:agent)<transacts><decides>:void

    # Returns whether the specified agent can interact.
    CanInteract<native><native_callable><public>(Agent:agent)<reads><decides>:void

    # Returns an appropriate message to display to players to communicate the current state of the interactable.
    InteractMessage<native><native_callable><public>(Agent:agent)<reads><decides>:message

@experimental
# Used to set a cooldown when interacted.
interactable_cooldown<native><epic_internal> := class<concrete>:
    @editable
    @experimental
    # The number of seconds after a successful interaction, before being able to initiate a subsequent interaction for anyone.
    # This is only used if duration is greater than 0.0. Modifying this does not affect the RemainingDuration.
    # When a cooldown starts on the component all other interactions are canceled.
    var Duration<native><public>:float = external {}

    @experimental
    # The remaining cooldown, in seconds, before new interactions can be initiated on this component.
    var<public> RemainingDuration<public>:float = external {}

    @experimental
    # Event which fires when the shared cooldown expires.
    ExpiredEvent<native><public>:listenable(tuple()) = external {}

    @experimental
    # Set the remaining shared cooldown duration in seconds, affecting all agents.
    SetRemainingDuration<native><epic_internal>(__dupe___unnamed_parameter_69:accessor, InRemainingDuration:float)<transacts>:void

    @experimental
    # Get the remaining shared cooldown duration in seconds, affecting all agents.
    GetRemainingDuration<native><epic_internal>(__dupe___unnamed_parameter_70:accessor)<transacts>:float

@experimental
# Used to set a cooldown per agent when interacted.
interactable_cooldown_per_agent<native><epic_internal> := class<concrete>:
    @editable
    @experimental
    # The duration in seconds after a successful interaction, before the interacting agent can initiate a subsequent interaction.
    # This is only used if the duration is greater than 0.0. Modifying this does not affect any RemainingPerAgentCooldownDuration.
    # This property gives other agents time to interact, when there is a limited number of Simultaneous Interactors.
    var Duration<native><public>:float = external {}

    @experimental
    # The cooldown remaining, in seconds, before a particular agent is able to initiate an interaction on this component.
    var<private> RemainingDuration<native><public>:[agent]float = external {}

    @experimental
    # Event which fires when the per agent cooldown expires. Sends the agent which was previously affected by the cooldown.
    ExpiredEvent<native><public>:listenable(agent) = external {}

    @experimental
    # Set the remaining shared cooldown duration in seconds, affecting all agents.
    SetRemainingDurationForAgent<native><epic_internal>(__dupe___unnamed_parameter_71:accessor, Agent:agent, InRemainingDuration:float)<transacts>:void

    @experimental
    # Get the remaining shared cooldown duration in seconds, affecting all agents.
    GetRemainingDurationForAgent<native><epic_internal>(__dupe___unnamed_parameter_72:accessor, Agent:agent)<transacts>:float

@experimental
# Used to set an interaction duration.
interactable_duration<native><epic_internal> := class<concrete>:
    @editable
    @experimental
    # The number of seconds an agent must spend interacting with the object to successfully complete an interaction.
    # 0.0 or less results in an immediate successful interaction.
    # If set during an interaction, the value given will be used for the next interaction and the remaining duration will be updated subtracting the new given value with the current time elapsed.
    # If the subtraction were zero or less it will immediately conclude.
    var InteractDuration<public>:float = external {}

    @experimental
    @replicated("")
    @editable
    @display_name("Interact Duration")
    # Internal InteractDuration value.
    var _InteractDuration<native><epic_internal>:float = external {}

    @experimental
    # Interact duration setter.
    SetInteractDuration<native><epic_internal>(__dupe___unnamed_parameter_73:accessor, InRemainingDuration:float)<transacts>:void

    @experimental
    # Interact duration getter.
    GetInteractDuration<native><epic_internal>(__dupe___unnamed_parameter_74:accessor)<transacts>:float

    @editable
    @experimental
    # The max number of simultaneous interactors. A value of false is unlimited.  This value represents how many agents may have active interactions.
    # If this changes to a value less than the current number of active interactions, those interactions are not canceled but new interactions will not start.
    var MaxSimultaneousInteractors<native><public>:?int = external {}

    @experimental
    # Returns an agentâs remaining duration, in seconds, for interaction. Fails if the agent is not interacting with this component.Returns the same value when called multiple times within a transaction.
    GetRemainingInteractDurationForAgent<final><native><public>(Agent:agent)<reads><decides>:float

    @experimental
    # Sets an agentâs remaining duration, in seconds, for interaction. Fails if the agent is not interacting with this component.
    SetRemainingInteractDurationForAgent<final><native><public>(Agent:agent, RemainingDuration:float)<transacts>:void

@experimental
# Used to set a limit of times to interact.
interactable_success_limit<native><epic_internal> := class<concrete>:
    @experimental
    # The number of times the component can be successfully interacted with. A value of false is unlimited.
    # When SuccessfulInteractionCount reaches MaxSuccessfulInteractions all active interactions are canceled, and the component cannot be interacted with.
    var MaxSuccessfulInteractions<public>:?int = external {}

    @experimental
    # The number of times this component has had a successful interaction.
    var SuccessfulInteractionCount<public>:int = external {}

    @experimental
    # Update the maximum number of successful interactions possible, a value of false is unlimited.
    # If the current number of tracked interactions is greater than the value specified here, all current interactions will be canceled.
    SetMaxSuccessfulInteractions<native><epic_internal>(__dupe___unnamed_parameter_75:accessor, InMaxSuccessfulInteractions:?int)<transacts>:void

    @experimental
    # Get the maximum number of successful interactions possible.
    GetMaxSuccessfulInteractions<native><epic_internal>(__dupe___unnamed_parameter_76:accessor)<transacts>:?int

    @experimental
    # Resets the counter for the times this component has had a successful interaction.
    ClearSuccessfulInteractionCount<native><public>()<transacts>:void