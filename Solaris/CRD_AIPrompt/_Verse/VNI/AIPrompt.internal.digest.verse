using {/Verse.org/Native}
using {/Verse.org/Simulation}
using {/Verse.org/Colors}
using {/Verse.org/Assets}
using {/Verse.org/SceneGraph}
@experimental
# NPC Persona component
persona_component<native><epic_internal> := class<final_super><epic_internal>(component, has_icon):
    var<epic_internal> Name<native><public>:string

    var<epic_internal> Voice<native><public>:string

    var<epic_internal> HearingRange<native><public>:float = external {}

    var<epic_internal> Volume<native><public>:float = external {}

    var Icon<native><override>:texture = external {}

    var<epic_internal> Color<native><public>:color = external {}

    var<epic_internal> Facts<native><public>:[]string = external {}

    var<epic_internal> CosmeticDescription<native><public>:[]string = external {}

non_parametric_agent_subscribable_persona_event<epic_internal> := class(subscribable_event_intrnl(agent)):


@experimental
persona_prompt_error<native><epic_internal> := class:
    Message<native><public>:message

@experimental
persona_prompt_timeout_error<native><epic_internal> := class(persona_prompt_error):


@experimental
persona_prompt_throttled_error<native><epic_internal> := class(persona_prompt_error):


@experimental
persona_prompt_moderated_error<native><epic_internal> := class(persona_prompt_error):


@experimental
persona_prompt_character_limit_error<native><epic_internal> := class(persona_prompt_error):


@available {MinUploadedAtFNVersion := 3800}
MakePersonaSuccessResult<native_callable><epic_internal>(Result:success_type where success_type:type):result(success_type, false) = external {}

@available {MinUploadedAtFNVersion := 3800}
MakePersonaErrorResult<native_callable><epic_internal>(Result:error_type where error_type:type):result(false, error_type) = external {}

@experimental
conversation_target<native><epic_internal> := interface<unique><epic_internal>:
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
    #  2/ The message being said.
    #  3/ Cancelable to stop the target from talking.
    StartSayEvent<public>:listenable(tuple(?agent, message, cancelable))

    # Listenable which is signaled when the target stops talking.
    StopSayEvent<public>:listenable(tuple())

    # All the agents currently targeting Self for conversation.
    var<private> ConversationTargeters<public>:[]agent

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
(Participant:agent).SetConversationTarget<native><epic_internal>(ConversationTarget:conversation_target)<transacts><decides>:void

@experimental
# Removes any persona assignment for a participant.
(Participant:agent).ClearConversationTarget<native><epic_internal>()<transacts>:void

@experimental
# Returns the persona a participant is assigned to, fails if unassigned.
(Participant:agent).GetConversationTarget<native><epic_internal>()<reads><decides>:conversation_target

@experimental
persona_conversation_target<native><epic_internal> := class(conversation_target):
    # All the agents currently targeting Self for conversation.
    var ConversationTargeters<override>:[]agent = external {}

    # Fails if the participant is not in the list of participants
    CanConversationTargeterBeAdded<override><native>(ConversationTargeter:agent)<reads><decides>:void

    # Listenable which is signaled when the player starts prompting the persona.
    StartHearEvent<native><override>:listenable(agent) = external {}

    # Listenable which is signaled when the player finishes prompting the persona.
    StopHearEvent<native><override>:listenable(agent) = external {}

    # Listenable which is signaled when the persona starts talking.
    #  1/ The agent (if involved) which prompted the response.
    #  2/ The message being said.
    #  3/ Cancelable to stop the target from talking.
    StartSayEvent<native><override>:listenable(tuple(?agent, message, cancelable)) = external {}

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

    # Requests the Persona to talk on the topic provided.
    PromptToTalk<native><public>(Topic:message):void

    # The result will conform to the result type. The result type must be a struct or a concrete class with no private fields which can contain
    # numeric types, messages, bools and enums, as well as structs, concrete classes with no private fields or arrays which only contain those types, anything else results in an error.
    # Use the names of the fields and name of the type of the struct to direct the prompt or facts on how to fill out the data structure.
    # The result will conform to the result type. The result type must be a struct or a concrete class with no private fields which can contain
    # numeric types, messages, bools and enums, as well as structs, concrete classes with no private fields or arrays which only contain those types, anything else results in an error.
    # Use the names of the fields and name of the type of the struct to direct the prompt or facts on how to fill out the data structure.
    SubscribeToResponseType<native><public>(response_type:type, Callback:type {_(:?agent, :response_type):void}, Required:logic)<transacts>:cancelable

    # Listenable which is signaled when the persona was requested to talk, either by a player or prompt and failed.
    PromptFailureEvent<native><public>:listenable(persona_prompt_error) = external {}

    # Returns a diagnostic of the Persona facts, both static and dynamic.
    DiagnoseFacts<native><public>()<reads>:diagnostic

persona_utterance<native><epic_internal> := class(cancelable):
    Cancel<native><override>()<transacts>:void

persona_type_subscription<native><epic_internal> := class(cancelable):
    Cancel<native><override>()<transacts>:void

@experimental
# A persona device manages conversations involving one or multiple persona objects
# that are either standalone (announcer) or in the future attachable to NPCs,
# behind the scenes using a single LLM session.
# The persona device sees all conversations by all personas and participants.
# The persona device only sees facts added to the device.
# A persona also sees all conversations among all of its device's personas and participants.
# A persona sees all facts added to its device and itself.
persona_device<native><epic_internal> := class<concrete><final>(creative_device_base):
    # Add general information to the device. Cancelable is used to remove the fact.
    # The persona knows these facts, and their persona facts.
    AddFact<native><epic_internal>(Fact:string)<transacts>:cancelable

    # Adds a fact which is assessed at when the device, or a persona is prompted. The fact is generated by calling the FactFunc.
    AddDynamicFact<native><epic_internal>(FactFunc:type {_()<reads>:string})<transacts>:cancelable

    @available {MinUploadedAtFNVersion := 3810}
    # The result will conform to the result type. The result type must be a struct or a concrete class with no private fields which can contain
    # numeric types, messages, bools and enums, as well as structs, concrete classes with no private fields or arrays which only contain those types, anything else results in an error.
    # Use the names of the fields and name of the type of the struct to direct the prompt or facts on how to fill out the data structure.
    Prompt<native><epic_internal>(UserPrompt:string, response_type:type)<suspends>:result(response_type, persona_prompt_error)

    # Removes all conversation history from the device.
    ClearHistory<native><public>()<transacts>:void

    # Attempts to add a player to the list of participants on this device.
    # Does nothing if the agent does not meet the criteria of participation configured on the device.
    AddParticipant<public>(Agent:agent):void = external {}

    # Removes an agent from the participants.
    RemoveParticipant<public>(Agent:agent):void = external {}

    # Returns the ID for the player.
    GetPlayerParticipantId<native><public>(Player:player)<reads>:string

    # Attempts to add a persona on this device.
    AddPersona<native><public>((local:)Persona:agent)<transacts><decides>:persona_conversation_target

    # Attempts to remove a persona on this device.
    RemovePersona<native><public>((local:)Persona:agent)<transacts>:void

    # All the players in the channel with the personas managed by this device.
    var<private> Participants<public>:[]agent = external {}

    # Direct access to all personas configured on this device.
    var<private> Personas<public>:[]persona_conversation_target = external {}

    # Different criteria, which if the LLM evaluates to be true, will fire the corresponding event
    var<private> ResponseEventCriteria<public>:[int][]string = external {}

    # Fired when one of the response event criteria are met.
    # 1/ the agent, if any, which prompted the persona to trigger the event
    # 2/ the ID of the response event criteria which was met
    ResponseEvent<public>:listenable(tuple(?agent, int)) = external {}