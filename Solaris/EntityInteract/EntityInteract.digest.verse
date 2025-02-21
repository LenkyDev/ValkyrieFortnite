using {/Verse.org/Simulation}
@experimental
# Used to handle general interaction.
interactable_component<native><public> := class<final_super>(component, enableable):
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
    CanInteract<native><native_callable><public>(Agent:agent)<computes><decides><reads>:void

    # Returns an appropriate message to display to players to communicate the current state of the interactable.
    InteractMessage<native><native_callable><public>(Agent:agent)<computes><decides><reads>:message