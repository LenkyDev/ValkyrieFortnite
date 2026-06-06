using {/Fortnite.com/Devices}
using {/Verse.org/Colors}
using {/Verse.org/SceneGraph}
using {/Verse.org/Simulation}
using {/Verse.org/Chat}
using {/Verse.org/Native}
@available {MinUploadedAtFNVersion := 4000}
@experimental
llm_prompt_error<native><public> := class:
    Message<native><public>:message

@available {MinUploadedAtFNVersion := 4000}
@experimental
llm_prompt_timeout_error<native><public> := class(llm_prompt_error):


@available {MinUploadedAtFNVersion := 4000}
@experimental
llm_prompt_throttled_error<native><public> := class(llm_prompt_error):


@available {MinUploadedAtFNVersion := 4000}
@experimental
llm_prompt_moderated_error<native><public> := class(llm_prompt_error):


@available {MinUploadedAtFNVersion := 4000}
@experimental
llm_prompt_character_limit_error<native><public> := class(llm_prompt_error):


@available {MinUploadedAtFNVersion := 4000}
@experimental
# An abstraction around a recorded history of events and sending prompts with that history context included.
llm_session<native><public> := class<unique>:
    var VoiceChannelSubscriptions<epic_internal>:[]cancelable = external {}

    # Removes all the history events from the session. Including conversation history.
    ClearHistory<native><public>()<transacts>:void

    @available {MinUploadedAtFNVersion := 4100}
    # The result will conform to the result type. The result type must be a struct which can contain.
    #  - numeric types, message, bools and enums, as well as structs or arrays which only contain those types, anything else results in an error.
    #  Use the names of the fields and name of the type of the struct to direct the prompt or facts on how to fill out the data structure.
    Prompt<native><public>((local:)Prompt:prompt, response_type:type)<suspends>:result(response_type, llm_prompt_error)

    OnLLMSessionConstructed<native><epic_internal>()<transacts>:void

    SubscribeToVoiceChannelMemberAdded<native_callable><epic_internal>(VoiceChannel:voice_channel(member_info) where member_info:subtype(has_voice_member_info))<transacts>:cancelable = external {}

    SubscribeToVoiceChannelMemberRemoved<native_callable><epic_internal>(VoiceChannel:voice_channel(member_info) where member_info:subtype(has_voice_member_info))<transacts>:cancelable = external {}

    CancelAllVoiceChannelSubscriptions<native_callable><epic_internal>()<transacts>:void = external {}

    OnAddMemberEvent<native><epic_internal>((Agent:agent, MemberInfo:member_info) where member_info:subtype(has_voice_member_info))<transacts>:void

    OnRemoveMemberEvent<native><epic_internal>((Agent:agent, MemberInfo:member_info) where member_info:subtype(has_voice_member_info))<transacts>:void

@available {MinUploadedAtFNVersion := 4100}
@import_as("/Script/AIPrompt.UPersonaPrompt")
@experimental
persona_editor_prompt<native><epic_internal> := class<concrete><final><epic_internal>:


@available {MinUploadedAtFNVersion := 4000}
@experimental
# Defines the way the persona will handle attempts to prompt it while it is processing.
persona_interruption_rule<native><public> := enum<open>:
    # Cannot be interrupted, will ignore any input until the finished.
    IgnoreUntilFinished
    # Will be interrupted immediately when spoken to.
    InterruptOnPromptStart
    # Will interrupt when the response for the interrupting prompt is ready.
    InterruptOnResponseStart

@available {MinUploadedAtFNVersion := 4000}
@experimental
# NPC Persona component
persona_component<native><public> := class<final_super>(component):
    OnInitialized<override>():void = external {}

    var<epic_internal> HearingRange<native><epic_internal>:float = external {}

    var<epic_internal> Volume<native><epic_internal>:float = external {}

    var<epic_internal> Color<native><epic_internal>:color = external {}

    # The personality of the persona
    var Personality<public>:message = external {}

    # What the persona knows
    var Knowledge<public>:message = external {}

    # The session which will process all this persona's prompts
    # When the persona is in a voice channel, every session in that channel will automatically
    # propagate conversation history entries to all sessions found in the channel.
    # All and only conversation directly to or from a persona will be automatically recorded.
    var Session<public>:llm_session = external {}

    # The voice assigned to this persona.
    var Voice<public>:voice_model = external {}

    # How the persona will handle overlapping prompts.
    var InterruptionRule<public>:persona_interruption_rule = external {}

    # Listenable which is signaled when the player starts prompting the persona.
    StartHearEvent<native><public>:listenable(agent) = external {}

    # Listenable which is signaled when the player finishes prompting the persona.
    StopHearEvent<native><public>:listenable(agent) = external {}

    # Listenable which is signaled when the persona begins speaking (before moderation resolves).
    #  1/ The agent (if involved) that prompted the response.
    #  2/ Cancelable to stop the persona from talking.
    StartSayEvent<native><public>:listenable(tuple(?agent, cancelable)) = external {}

    # Listenable which is signaled when the spoken message is finalized (after moderation).
    #  Contains the actual message delivered — either the original or the canned replacement.
    #  1/ The agent (if involved) that prompted the response.
    #  2/ The final message that was said.
    CommitSayEvent<native><public>:listenable(tuple(?agent, message)) = external {}

    # Listenable which is signaled when the target stops talking.
    #  1/ logic that is true when interrupted
    StopSayEvent<native><public>:listenable(logic) = external {}

    # Requests the Persona to talk on the topic provided, requires the persona to be on a channel
    RequestToTalk<native><public>(Instructions:message)<transacts><decides>:void

    # Registers a callback for when the persona receives structured data in the format of response_type.
    #  Required forces this be filled out every time the persona is prompted.
    #  The returned cancelable unregisters this callback and stops the llm from attempting to send this kind of structured data.
    #  The result type must be a struct which can contain.
    #  - numeric types, message, bools and enums, as well as structs or arrays which only contain those types, anything else results in an error.
    #  Use the names of the fields and name of the type of the struct to direct the prompt or facts on how to fill out the data structure.
    SubscribeToResponseType<native><public>(response_type:type, Required:logic, Callback:type {_(:?agent, :response_type):void})<transacts>:cancelable

    @available {MinUploadedAtFNVersion := 4000}
    OnReceive<override>(SceneEvent:scene_event):logic = external {}

    UpdateDetails<native><epic_internal>()<transacts>:void

    UpdateIcon<native><epic_internal>()<transacts>:void

    # Listenable which is signaled when the persona was requested to talk, either by a player or prompt and failed.
    #  Callback receives:
    #    1) The persona which had the failure
    #    2) The error
    PromptFailureEvent<native><public>:listenable(llm_prompt_error) = external {}

    OnPersonaComponentConstructed<native><epic_internal>()<transacts>:void

@available {MinUploadedAtFNVersion := 4000}
@experimental
# Sets the persona the player will attempt to prompt when they use the relevant hotkey.
#  The persona must be in the voice channel with the player in order for the player to be able to successfully prompt.
(Player:player where member_info:subtype(has_voice_member_info)).SetConversationTarget<native><public>((local:)Persona:persona_component, Channel:voice_channel(member_info))<transacts>:void

@available {MinUploadedAtFNVersion := 4000}
@experimental
# Retrieve the persona and channel the player is currently bound to prompt.
(Player:player).GetConversationTarget<native><public>()<reads><decides>:tuple(persona_component, voice_channel(has_voice_member_info))

@available {MinUploadedAtFNVersion := 4000}
@experimental
# Unbind player from prompting personas
(Player:player).ClearConversationTarget<native><public>()<transacts>:void

@available {MinUploadedAtFNVersion := 4000}
non_parametric_agent_subscribable_persona_event<epic_internal> := class(subscribable_event_intrnl(agent)):


@available {MinUploadedAtFNVersion := 4000}
MakePersonaSuccessResult<native_callable><epic_internal>(Result:success_type where success_type:type):result(success_type, false) = external {}

@available {MinUploadedAtFNVersion := 4000}
MakePersonaErrorResult<native_callable><epic_internal>(Result:error_type where error_type:type):result(false, error_type) = external {}

@available {MinUploadedAtFNVersion := 4000}
@experimental
conversation_target<native><epic_internal> := interface<unique><epic_internal>:
    # Succeeds if the agent can target Self for conversation.
    CanConversationTargeterBeAdded<native_callable><epic_internal>(ConversationTargeter:agent)<reads><decides>:void = external {}

    # When agent targets Self for conversation.
    AddConversationTargeterEvent<final><public>:listenable(agent) = external {}

    # When agent untargets Self for conversation.
    RemoveConversationTargeterEvent<final><public>:listenable(agent) = external {}

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

@available {MinUploadedAtFNVersion := 4000}
@experimental
# A participant can only speak to one conversation target at a time.
#  A conversation target can be spoken to by many participants at a time.
#  Fails if the conversation target refuses the addition, or if the participant is assigned to a different conversation target.
(Participant:agent).SetConversationTargetForAgent<native><epic_internal>(ConversationTarget:conversation_target)<transacts><decides>:void

@available {MinUploadedAtFNVersion := 4000}
@experimental
# Removes any persona assignment for a participant.
(Participant:agent).ClearConversationTargetForAgent<native><epic_internal>()<transacts>:void

@available {MinUploadedAtFNVersion := 4000}
@experimental
# Returns the persona a participant is assigned to, fails if unassigned.
(Participant:agent).GetConversationTargetForAgent<native><epic_internal>()<reads><decides>:conversation_target

internal_response_data<native><epic_internal> := struct:
    TargetAgent<native>:?agent

@available {MinUploadedAtFNVersion := 4000}
@experimental
persona_conversation_target<native><epic_internal> := class(conversation_target):
    # All the agents currently targeting Self for conversation.
    var ConversationTargeters<override>:[]agent = external {}

    # Fails if the participant is not in the list of participants
    CanConversationTargeterBeAdded<override><native>(ConversationTargeter:agent)<reads><decides>:void

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

    # Returns a diagnostic of the Persona facts, both static and dynamic.
    DiagnoseFacts<native><public>()<reads>:diagnostic

@available {MinUploadedAtFNVersion := 4000}
persona_utterance<native><epic_internal> := class(cancelable):
    Cancel<native><override>()<transacts>:void

@available {MinUploadedAtFNVersion := 4000}
persona_type_subscription<native><epic_internal> := class(cancelable):
    Cancel<native><override>()<transacts>:void

@available {MinUploadedAtFNVersion := 4000}
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
    Prompt<native><epic_internal>(UserPrompt:string, response_type:type)<suspends>:result(response_type, llm_prompt_error)

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

    GetBPFunctionNamesForValidation<override>():[]string = external {}

@available {MinUploadedAtFNVersion := 4100}
@experimental
# Base class for all prompts sent to an llm session
prompt<native><public> := class<abstract><castable><epic_internal>:


@available {MinUploadedAtFNVersion := 4100}
@experimental
# A basic prompt for carrying out instructions
basic_prompt<native><public> := class<final>(prompt):
    # What the llm should do
    var Instructions<native><public>:message

@available {MinUploadedAtFNVersion := 4100}
@experimental
# A prompt which defines a persona and tells it to do something
persona_prompt<native><public> := class<final>(prompt):
    # The personality of the persona
    var Personality<native><public>:message

    # What the persona knows
    var Knowledge<native><public>:message

    # What the persona should do
    var Instructions<native><public>:message

@available {MinUploadedAtFNVersion := 4000}
@experimental
# The persona voice used when converting text-to-voice
voice_model<native><public> := class<abstract><epic_internal>:
    VoiceName<native><epic_internal>:string

@available {MinUploadedAtFNVersion := 4000}
@experimental
alice_voice<final><epic_internal> := class(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
@experimental
# Comic, High, Warm
lily_voice<final><public> := class(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
@experimental
# Refined, Med, Warm
julienne_voice<final><public> := class(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
@experimental
# Glamorous, Animated, warm
victoria_voice<final><public> := class(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
@experimental
# Tough, Low, Gravelly
wyatt_voice<final><public> := class(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
@experimental
# Comic, Med, Natural
caleb_voice<final><public> := class(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
@experimental
# Whimsical, High, Warm
ethan_voice<final><public> := class(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
@experimental
# Tough, Med, Natural
vera_voice<final><public> := class(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
@experimental
# Refined, Med, Natural
grant_voice<final><public> := class(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
@experimental
# Narrator, Low, Warm
rex_voice<final><public> := class(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
@experimental
# Whimsical, High, Warm
luna_voice<final><public> := class(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
@experimental
# Whimsical, Med, Warm
chloe_voice<final><public> := class(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
@experimental
# Tough, Med, Natural
roxy_voice<final><public> := class(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
@experimental
# Tough, Low, Natural
vivienne_voice<final><public> := class(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
@experimental
# Narrator, Med, Natural
milo_voice<final><public> := class(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
@experimental
# Cinematic, Med, Natural
clara_voice<final><public> := class(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
@experimental
# Comic, Med, Natural
dante_voice<final><public> := class(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
@experimental
# Cinematic, High, Natural
marcus_voice<final><public> := class(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
@experimental
# Whimsical, Med, Natural
aria_voice<final><public> := class(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
@experimental
# Comic, High, Natural
victor_voice<final><public> := class(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
@experimental
# Narrator, Med, Warm
alaina_voice<final><public> := class(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
@experimental
# Narrator, Low, Warm
maisie_voice<final><public> := class(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
@experimental
# Cinematic, Med, Warm
arthur_voice<final><public> := class(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
@experimental
# Comic, High, Natural
felix_voice<final><public> := class(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
@experimental
# Cinematic, Med, Natural
walter_voice<final><public> := class(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
@experimental
# Refined, Med, Warm
simon_voice<final><public> := class(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
@experimental
# Whimsical, High, Warm
troy_voice<final><public> := class(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
@experimental
# Tough, High, Warm
brenna_voice<final><public> := class(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
@experimental
# Tough, High, Natural
marina_voice<final><public> := class(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
@experimental
# Glamorous, Low, Natural
helen_voice<final><public> := class(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
@experimental
# Glamorous, Med, Natural
graham_voice<final><public> := class(voice_model):
    VoiceName<override>:string = external {}