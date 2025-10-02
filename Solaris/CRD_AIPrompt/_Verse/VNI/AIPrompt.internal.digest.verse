using {/Verse.org/Simulation}
using {/Verse.org/SceneGraph}
@experimental
# NPC Persona component
persona_component<native><epic_internal> := class<final_super><epic_internal>(component):
    var<epic_internal> Name<native><public>:string

    var<epic_internal> Voice<native><public>:string

    var<epic_internal> Personality<native><public>:[]string = external {}

    var<epic_internal> Description<native><public>:[]string = external {}

non_parametric_agent_subscribable_persona_event<epic_internal> := class(subscribable_event_intrnl(agent)):


@experimental
error_message<native><public> := class:
    Message<native><public>:message

@experimental
persona_prompt_error<native><public> := class(error_message):


@experimental
persona_prompt_timeout_error<native><public> := class(persona_prompt_error):


@experimental
persona_prompt_throttled_error<native><public> := class(persona_prompt_error):


@experimental
persona_prompt_moderated_error<native><public> := class(persona_prompt_error):


@experimental
conversation_target<native><public> := interface<unique><epic_internal>:
    # Get all the agents currently targeting Self for conversation.
    GetConversationTargeters<native_callable><public>():[]agent = external {}

    # Succeeds if the agent can target Self for conversation.
    CanConversationTargeterBeAdded<native_callable><epic_internal>(ConversationTargeter:agent)<reads><decides>:void = external {}

    # When agent targets Self for conversation.
    AddConversationTargeterEvent<final><public>:listenable(agent) = external {}

    # When agent untargets Self for conversation.
    RemoveConversationTargeterEvent<final><public>:listenable(agent) = external {}

    # Listenable which is signaled when the player starts prompting the persona.
    StartHearEvent<public>:listenable(agent)

    # Listenable which is signaled when the player finishes prompting the persona.
    StopHearEvent<public>:listenable(agent)

    # Listenable which is signaled when the persona starts talking.
    #  1/ The agent (if involved) which prompted the response.
    #  2/ Cancelable to stop the target from talking.
    StartSayEvent<public>:listenable(tuple(?agent, cancelable))

    # Listenable which is signaled when the target stops talking.
    StopSayEvent<public>:listenable(tuple())

    # All the agents currently targeting Self for conversation.
    var ConversationTargeters<epic_internal>:[]agent

    # Allow player to to talk to this persona.
    AddPlayer<native_callable><epic_internal>(Player:agent)<transacts><decides>:void = external {}

    # Stop player from being able to talk to this persona.
    RemovePlayer<native_callable><epic_internal>(Player:agent)<transacts><decides>:void = external {}

    # Signals the AddConversationTargeterEvent.
    SignalAddConversationTargeterEvent<native_callable><epic_internal>(Agent:agent):void = external {}

    # Signals the RemoveConversationTargeterEvent.
    SignalRemoveConversationTargeterEvent<native_callable><epic_internal>(Agent:agent):void = external {}

@experimental
# A participant can only speak to one conversation target at a time.
#  A conversation target can be spoken to by many participants at a time.
#  Fails if the conversation target refuses the addition, or if the participant is assigned to a different conversation target.
(Participant:agent).SetConversationTarget<native><public>(ConversationTarget:conversation_target)<transacts><decides>:void

@experimental
# Removes any persona assignment for a participant.
(Participant:agent).ClearConversationTarget<native><public>()<transacts>:void

@experimental
# Returns the persona a participant is assigned to, fails if unassigned.
(Participant:agent).GetConversationTarget<native><public>()<reads><decides>:conversation_target

@experimental
persona_conversation_target<native><public> := class(conversation_target):
    # Get all the agents currently targeting Self for conversation.
    GetConversationTargeters<native><override>():[]agent

    # Fails if the participant is not in the list of participants
    CanConversationTargeterBeAdded<override><native>(ConversationTargeter:agent)<reads><decides>:void

    # Listenable which is signaled when the player starts prompting the persona.
    StartHearEvent<native><override>:listenable(agent) = external {}

    # Listenable which is signaled when the player finishes prompting the persona.
    StopHearEvent<native><override>:listenable(agent) = external {}

    # Listenable which is signaled when the persona starts talking.
    #  1/ The agent (if involved) which prompted the response.
    #  2/ Cancelable to stop the target from talking.
    StartSayEvent<native><override>:listenable(tuple(?agent, cancelable)) = external {}

    # Listenable which is signaled when the target stops talking.
    StopSayEvent<native><override>:listenable(tuple()) = external {}

    # Allow player to to talk to this persona.
    AddPlayer<native><override>(Player:agent)<transacts><decides>:void

    # Stop player from being able to talk to this persona.
    RemovePlayer<native><override>(Player:agent)<transacts><decides>:void

    # Add information about, or known by, the persona. Cancelable is used to remove the fact.
    # # The persona knows these facts, and device facts.
    AddFact<native><public>(Fact:string)<transacts>:cancelable

    # Adds a fact which is assessed at when a persona is prompted. The fact is generated by calling the FactFunc.
    AddDynamicFact<native><public>(FactFunc:type {_()<reads>:string})<transacts>:cancelable

    # Requests the Persona to talk on the topic provided.
    PromptToTalk<native><public>(Topic:string):void

    # Listenable which is signaled when the persona was requested to talk, either by a player or prompt and failed.
    PromptFailureEvent<native><public>:listenable(persona_prompt_error) = external {}

    # Link this device to a agent.
    LinkToAgent<native><epic_internal>(Agent:agent)<transacts><decides>:void

persona_utterance<native><epic_internal> := class(cancelable):
    Cancel<native><override>()<transacts>:void

@experimental
# A persona device manages conversations involving one or multiple persona objects
# that are either standalone (announcer) or in the future attachable to NPCs,
# behind the scenes using a single LLM session.
# The persona device sees all conversations by all personas and participants.
# The persona device only sees facts added to the device.
# A persona also sees all conversations among all of its device's personas and participants.
# A persona sees all facts added to its device and itself.
persona_device<native><public> := class<concrete><final>(creative_device_base):
    # Add general information to the device. Cancelable is used to remove the fact.
    # The persona knows these facts, and their persona facts.
    AddFact<native><epic_internal>(Fact:string)<transacts>:cancelable

    # Adds a fact which is assessed at when the device, or a persona is prompted. The fact is generated by calling the FactFunc.
    AddDynamicFact<native><epic_internal>(FactFunc:type {_()<reads>:string})<transacts>:cancelable

    # Prompt the device without addressing any particular persona. Only the device facts are known to the prompt.
    Prompt<native><epic_internal>(UserPrompt:string)<suspends>:result([]char, persona_prompt_error)

    # Removes all conversation history from the device.
    ClearHistory<native><public>()<transacts>:void

    # Attempts to add a player to the list of participants on this device.
    # Does nothing if the agent does not meet the criteria of participation configured on the device.
    AddParticipant<public>(Agent:agent):void = external {}

    # Removes an agent from the participants.
    RemoveParticipant<public>(Agent:agent):void = external {}

    # Attempts to add a persona on this device.
    AddPersona<native><epic_internal>(Persona:entity)<transacts><decides>:persona_conversation_target

    # Attempts to remove a persona on this device.
    RemovePersona<native><epic_internal>(Persona:entity)<transacts>:void

    # All the players in the channel with the personas managed by this device.
    var<private> Participants<public>:[]agent = external {}

    # Direct access to all personas configured on this device.
    var<private> Personas<public>:[]persona_conversation_target = external {}