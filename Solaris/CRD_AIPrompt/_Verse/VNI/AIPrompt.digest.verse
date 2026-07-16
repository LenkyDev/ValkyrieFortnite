using {/Verse.org/Chat}
using {/Verse.org/Simulation}
using {/Verse.org/SceneGraph}
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
# Manages AI session state: conversation history, pinned entries, and registered capabilities (tools, signals, listenables).
#  History is automatically compacted by the runtime. Completed goals are summarized into history.
ai_session<native><public> := class<unique>:
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
# NPC Persona component
persona_component<native><public> := class<final_super>(component):
    # The personality of the persona
    var Personality<public>:message = external {}

    # The session which will process all this persona's prompts
    # When the persona is in a voice channel, every session in that channel will automatically
    # propagate conversation history entries to all sessions found in the channel.
    # All and only conversation directly to or from a persona will be automatically recorded.
    GetAISession<native><public>()<transacts>:ai_session

    # The voice assigned to this persona.
    var Voice<public>:voice_model = external {}

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

    # Listenable which is signaled when the persona was requested to talk, either by a player or prompt and failed.
    #  Callback receives:
    #    1) The persona which had the failure
    #    2) The error
    PromptFailureEvent<native><public>:listenable(ai_error) = external {}

@available {MinUploadedAtFNVersion := 4000}
# Sets the persona the player will attempt to prompt when they use the relevant hotkey.
#  The persona must be in the voice channel with the player in order for the player to be able to successfully prompt.
(Player:player where member_info:subtype(has_voice_member_info)).SetConversationTarget<native><public>((local:)Persona:persona_component, Channel:voice_channel(member_info))<transacts>:void

@available {MinUploadedAtFNVersion := 4000}
# Retrieve the persona and channel the player is currently bound to prompt.
(Player:player).GetConversationTarget<native><public>()<reads><decides>:tuple(persona_component, voice_channel(has_voice_member_info))

@available {MinUploadedAtFNVersion := 4000}
# Unbind player from prompting personas
(Player:player).ClearConversationTarget<native><public>()<transacts>:void

@available {MinUploadedAtFNVersion := 4000}
# The persona voice used when converting text-to-voice
voice_model<native><public> := class<abstract><epic_internal>:


@available {MinUploadedAtFNVersion := 4000}
# Comic, High, Warm
brite_bomber_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
# Refined, Med, Warm
elmira_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
# Glamorous, Animated, warm
helsie_midnight_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
# Tough, Low, Gravelly
mancake_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
# Whimsical, High, Warm
munitions_master_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
# Refined, Med, Natural
peely_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
# Narrator, Low, Warm
terns_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
# Whimsical, High, Warm
lexa_hexbringer_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
# Whimsical, Med, Warm
battle_gamer_mae_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
# Tough, Med, Natural
halley_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
# Tough, Low, Natural
aura_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
# Cinematic, Med, Natural
brute_gunner_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
# Comic, Med, Natural
field_commander_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
# Cinematic, High, Natural
ziggy_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
# Whimsical, Med, Natural
haylee_skye_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
# Comic, High, Natural
orin_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
# Narrator, Med, Warm
moxie_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
# Narrator, Low, Warm
kor_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
# Cinematic, Med, Warm
clover_swift_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
# Comic, High, Natural
chase_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
# Cinematic, Med, Natural
fishstick_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
# Refined, Med, Warm
guild_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
# Whimsical, High, Warm
sunspot_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
# Tough, High, Warm
the_imagined_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
# Tough, High, Natural
red_ruin_joni_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
# Glamorous, Low, Natural
nezumi_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
# Glamorous, Med, Natural
magnus_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
revolt_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
tomatohead_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
raven_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
cuddle_team_leader_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
midas_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
mecha_team_leader_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
jonesy_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
hope_voice<final><public> := class(voice_model):
