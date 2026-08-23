# Verse path: /UnrealEngine.com/Conversations
using {/Fortnite.com/Devices}
using {/Verse.org/Colors}
using {/Verse.org/SceneGraph}
using {/Verse.org/Diagnostics}
using {/Verse.org/Simulation}
using {/Verse.org/Chat}
using {/Verse.org/Native}
@available {MinUploadedAtFNVersion := 4000}
ai_error<native><public> := class:
    Message<native><public>:message

@available {MinUploadedAtFNVersion := 4000}
ai_timeout_error<native><public> := class(ai_error):


@available {MinUploadedAtFNVersion := 4000}
ai_throttled_error<native><public> := class(ai_error):


@available {MinUploadedAtFNVersion := 4000}
ai_moderated_error<native><public> := class(ai_error):


@available {MinUploadedAtFNVersion := 4000}
ai_character_limit_error<native><public> := class(ai_error):


@available {MinUploadedAtFNVersion := 4120}
# Describes a capability registered on a session. The Name and Description are provided to the AI in the prompt.
prompt_binding_definition<native><public> := struct:
    # Human-readable name the AI prompt sees when deciding which capability to call.
    Name<native><public>:message

    # Describes when/why the AI prompt should pick this capability.
    Description<native><public>:message

@available {MinUploadedAtFNVersion := 4000}
@export_metadata {Category := "PublishingMutators"; Key := "Conversations"; Value := ""}
# Manages AI session state: conversation history, pinned entries, and registered capabilities (tools, signals, listenables).
#  History is automatically compacted by the runtime. Completed goals are summarized into history.
ai_session<native><public> := class<unique>:
    var VoiceChannelSubscriptions<epic_internal>:[]cancelable = external {}

    # Removes all the history events from the session.
    ClearHistory<native><public>()<transacts>:void

    @available {MinUploadedAtFNVersion := 4100}
    # Sends instructions to the model with the session's full context (personality, pinned facts, history).
    #  The response is parsed into response_type, which must be a struct containing only:
    #  numeric types, messages, booleans, enums, agents, or structs/arrays of those types.
    #  Field names and type names guide the model on how to fill out the structure.
    Prompt<native><public>((local:)Prompt:message, response_type:type)<suspends>:result(response_type, ai_error)

    @available {MinUploadedAtFNVersion := 4120}
    # Registers a fire-and-forget side-output the model can emit alongside any response, during prompts and goals.
    #  When Required is true, the model must emit this every response.
    #  Returns a cancelable that unregisters the action.
    RegisterAction<native><public>(Definition:prompt_binding_definition, Required:logic, input_type:type, Callback:type {_(:input_type):void})<transacts>:cancelable

    OnAISessionConstructed<native><epic_internal>()<transacts>:void

    SubscribeToVoiceChannelMemberAdded<native_callable><epic_internal>(VoiceChannel:voice_channel(member_info) where member_info:subtype(has_voice_member_info))<transacts>:cancelable = external {}

    SubscribeToVoiceChannelMemberRemoved<native_callable><epic_internal>(VoiceChannel:voice_channel(member_info) where member_info:subtype(has_voice_member_info))<transacts>:cancelable = external {}

    CancelAllVoiceChannelSubscriptions<native_callable><epic_internal>()<transacts>:void = external {}

    OnAddMemberEvent<native><epic_internal>((Agent:agent, MemberInfo:member_info) where member_info:subtype(has_voice_member_info))<transacts>:void

    OnRemoveMemberEvent<native><epic_internal>((Agent:agent, MemberInfo:member_info) where member_info:subtype(has_voice_member_info))<transacts>:void

@available {MinUploadedAtFNVersion := 4120}
session_type_subscription<native><epic_internal> := class(cancelable):
    Cancel<native><override>()<transacts>:void

@available {MinUploadedAtFNVersion := 4100}
@import_as("/Script/AIPrompt.UPersonaPrompt")
persona_editor_prompt<native><epic_internal> := class<concrete><final><epic_internal>:


@available {MinUploadedAtFNVersion := 4000}
# Defines the way the persona will handle attempts to prompt it while it is processing.
persona_interruption_rule<native><public> := enum<open>:
    # Cannot be interrupted, will ignore any input until the finished.
    IgnoreUntilFinished
    # Will be interrupted immediately when spoken to.
    InterruptOnPromptStart
    # Will interrupt when the response for the interrupting prompt is ready.
    InterruptOnResponseStart

@available {MinUploadedAtFNVersion := 4000}
@export_metadata {Category := "PublishingMutators"; Key := "Conversations"; Value := ""}
# NPC Persona component
persona_component<native><public> := class<final_super>(component):
    OnInitialized<override>():void = external {}

    var<epic_internal> HearingRange<native><epic_internal>:float = external {}

    var<epic_internal> Volume<native><epic_internal>:float = external {}

    var<epic_internal> Color<native><epic_internal>:color = external {}

    # The personality of the persona
    var<private> Personality<public>:message = external {}

    SetPersonality<native><public>(NewPersonality:message)<transacts><decides>:void

    # The session which will process all this persona's prompts
    # When the persona is in a voice channel, every session in that channel will automatically
    # propagate conversation history entries to all sessions found in the channel.
    # All and only conversation directly to or from a persona will be automatically recorded.
    GetAISession<native><public>()<transacts>:ai_session

    # The voice assigned to this persona.
    var<private> Voice<public>:voice_model = external {}

    SetVoice<native><public>(NewVoice:voice_model)<transacts><decides>:void

    # How the persona will handle overlapping prompts.
    var PromptInterruptionRule<public>:persona_interruption_rule = external {}

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

    # Prompts the session with instructions and speaks the result to the channel parameter.
    #  Fails if the interrupt rule prevents the prompt being submitted or the persona isn't in a channel.
    PromptToTalk<native><public>((Instructions:message, Channel:voice_channel(member_info)) where member_info:subtype(has_voice_member_info))<transacts><decides>:void

    # Prompts the session with instructions and speaks the result to the channel parameter.
    #  Fails if the interrupt rule prevents the prompt being submitted or the persona isn't in a channel.
    #  Override the interrupt rules for this prompt only.
    PromptToTalk<native><public>((Instructions:message, PromptInterrupt:persona_interruption_rule, Channel:voice_channel(member_info)) where member_info:subtype(has_voice_member_info))<transacts><decides>:void

    @available {MinUploadedAtFNVersion := 4000}
    OnReceive<override>(SceneEvent:scene_event):logic = external {}

    UpdateDetails<native><epic_internal>()<transacts>:void

    UpdateIcon<native><epic_internal>()<transacts>:void

    # Listenable which is signaled when the persona was requested to talk, either by a player or prompt and failed.
    #  Callback receives:
    #    1) The persona which had the failure
    #    2) The error
    PromptFailureEvent<native><public>:listenable(ai_error) = external {}

    OnPersonaComponentConstructed<native><epic_internal>()<transacts>:void

@available {MinUploadedAtFNVersion := 4000}
# Sets the persona the player will attempt to prompt when they use the relevant hotkey.
#  The persona must be in the voice channel with the player in order for the player to be able to successfully prompt.
(Player:player where member_info:subtype(has_voice_member_info)).SetConversationTarget<native><public>((local:)Persona:persona_component, Channel:voice_channel(member_info))<transacts>:void

@available {MinUploadedAtFNVersion := 4000}
# Retrieve the persona and channel the player is currently bound to prompt.
(Player:player).GetConversationTarget<native><public>()<decides><reads>:tuple(persona_component, voice_channel(has_voice_member_info))

@available {MinUploadedAtFNVersion := 4000}
# Unbind player from prompting personas
(Player:player).ClearConversationTarget<native><public>()<transacts>:void

@available {MinUploadedAtFNVersion := 4000}
non_parametric_agent_subscribable_persona_event<epic_internal> := class(subscribable_event_intrnl(agent)):


@available {MinUploadedAtFNVersion := 4000}
MakePersonaSuccessResult<native_callable><epic_internal>(Result:success_type where success_type:type):result(success_type, false) = external {}

@available {MinUploadedAtFNVersion := 4000}
MakePersonaErrorResult<native_callable><epic_internal>(Result:error_type where error_type:type):result(false, error_type) = external {}

@available {MinUploadedAtFNVersion := 4000}
conversation_target<native><epic_internal> := interface<unique><epic_internal>:
    # Succeeds if the agent can target Self for conversation.
    CanConversationTargeterBeAdded<native_callable><epic_internal>(ConversationTargeter:agent)<decides><reads>:void = external {}

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
# A participant can only speak to one conversation target at a time.
#  A conversation target can be spoken to by many participants at a time.
#  Fails if the conversation target refuses the addition, or if the participant is assigned to a different conversation target.
(Participant:agent).SetConversationTargetForAgent<native><epic_internal>(ConversationTarget:conversation_target)<transacts><decides>:void

@available {MinUploadedAtFNVersion := 4000}
# Removes any persona assignment for a participant.
(Participant:agent).ClearConversationTargetForAgent<native><epic_internal>()<transacts>:void

@available {MinUploadedAtFNVersion := 4000}
# Returns the persona a participant is assigned to, fails if unassigned.
(Participant:agent).GetConversationTargetForAgent<native><epic_internal>()<decides><reads>:conversation_target

internal_response_data<native><epic_internal> := struct:
    @ai_description("Use this to output the name of the targeted conversation participant")
    TargetAgent<native>:?agent

@available {MinUploadedAtFNVersion := 4000}
persona_conversation_target<native><epic_internal> := class(conversation_target):
    # All the agents currently targeting Self for conversation.
    var ConversationTargeters<override>:[]agent = external {}

    # Fails if the participant is not in the list of participants
    CanConversationTargeterBeAdded<override><native>(ConversationTargeter:agent)<decides><reads>:void

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

    # Returns a diagnostic of the Persona facts, both static and dynamic.
    DiagnoseFacts<native><public>()<reads>:diagnostic

@available {MinUploadedAtFNVersion := 4000}
persona_utterance<native><epic_internal> := class(cancelable):
    Cancel<native><override>()<transacts>:void

@available {MinUploadedAtFNVersion := 4000}
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
    Prompt<native><epic_internal>(UserPrompt:string, response_type:type)<suspends>:result(response_type, ai_error)

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

@available {MinUploadedAtFNVersion := 4000}
# The persona voice used when converting text-to-voice
voice_model<native><public> := class<abstract><epic_internal>:
    VoiceName<native><epic_internal>:string

@available {MinUploadedAtFNVersion := 4000}
# Comic, High, Warm
brite_bomber_voice<final><public> := class<epic_internal>(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
# Refined, Med, Warm
elmira_voice<final><public> := class(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
# Glamorous, Animated, warm
helsie_midnight_voice<final><public> := class(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
# Tough, Low, Gravelly
mancake_voice<final><public> := class<epic_internal>(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
# Whimsical, High, Warm
munitions_master_voice<final><public> := class(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
# Refined, Med, Natural
peely_voice<final><public> := class<epic_internal>(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
# Narrator, Low, Warm
terns_voice<final><public> := class(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
# Whimsical, High, Warm
lexa_hexbringer_voice<final><public> := class(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
# Whimsical, Med, Warm
battle_gamer_mae_voice<final><public> := class(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
# Tough, Med, Natural
halley_voice<final><public> := class(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
# Tough, Low, Natural
aura_voice<final><public> := class(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
# Cinematic, Med, Natural
brute_gunner_voice<final><public> := class(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
# Comic, Med, Natural
field_commander_voice<final><public> := class(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
# Cinematic, High, Natural
ziggy_voice<final><public> := class<epic_internal>(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
# Whimsical, Med, Natural
haylee_skye_voice<final><public> := class<epic_internal>(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
# Comic, High, Natural
orin_voice<final><public> := class(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
# Narrator, Med, Warm
moxie_voice<final><public> := class(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
# Narrator, Low, Warm
kor_voice<final><public> := class<epic_internal>(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
# Cinematic, Med, Warm
clover_swift_voice<final><public> := class(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
# Comic, High, Natural
chase_voice<final><public> := class(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
# Cinematic, Med, Natural
fishstick_voice<final><public> := class<epic_internal>(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
# Refined, Med, Warm
guild_voice<final><public> := class(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
# Whimsical, High, Warm
sunspot_voice<final><public> := class(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
# Tough, High, Warm
the_imagined_voice<final><public> := class<epic_internal>(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
# Tough, High, Natural
red_ruin_joni_voice<final><public> := class<epic_internal>(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
# Glamorous, Low, Natural
nezumi_voice<final><public> := class(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
# Glamorous, Med, Natural
magnus_voice<final><public> := class(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
hope_voice<final><public> := class<epic_internal>(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
cuddle_team_leader_voice<final><public> := class<epic_internal>(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
raven_voice<final><public> := class<epic_internal>(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
tomatohead_voice<final><public> := class<epic_internal>(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
revolt_voice<final><public> := class(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
mecha_team_leader_voice<final><public> := class<epic_internal>(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
midas_voice<final><public> := class<epic_internal>(voice_model):
    VoiceName<override>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
jonesy_voice<final><public> := class<epic_internal>(voice_model):
    VoiceName<override>:string = external {}