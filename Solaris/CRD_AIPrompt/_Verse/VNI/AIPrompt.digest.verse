using {/Verse.org/Chat}
using {/Verse.org/Simulation}
using {/Verse.org/SceneGraph}
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
    # Removes all the history events from the session. Including conversation history.
    ClearHistory<native><public>()<transacts>:void

    # The result will conform to the result type. The result type must be a struct which can contain.
    #  - numeric types, message, bools and enums, as well as structs or arrays which only contain those types, anything else results in an error.
    #  Use the names of the fields and name of the type of the struct to direct the prompt or facts on how to fill out the data structure.
    Prompt<native><public>(PromptTemplate:prompt_template, response_type:type)<suspends>:result(response_type, llm_prompt_error)

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
# Defines the persona and what it knows.
persona_definition<native><public> := class<final>:
    # Defines the personality
    var PersonalitySlot<public>:prompt_slot_provider = external {}

    var PersonalitySlotInternal<native><public>:prompt_slot_provider = external {}

    # What the persona currently knows
    var KnowledgeSlot<public>:prompt_slot_provider = external {}

    var KnowledgeSlotInternal<native><public>:prompt_slot_provider = external {}

@available {MinUploadedAtFNVersion := 4000}
@experimental
# NPC Persona component
persona_component<native><public> := class<final_super>(component):
    # Defines the persona and what it knows
    PersonaDefinition<native><public>:persona_definition = external {}

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

    # Listenable which is signaled when the persona starts talking.
    #  1/ The agent (if involved) which prompted the response
    #  2/ The message being said.
    #  3/ Cancelable to stop the target from talking
    StartSayEvent<native><public>:listenable(tuple(?agent, message, cancelable)) = external {}

    # Listenable which is signaled when the target stops talking.
    #  1/ logic that is true when interrupted
    StopSayEvent<native><public>:listenable(logic) = external {}

    # Requests the Persona to talk on the topic provided, requires the persona to be on a channel
    RequestToTalk<native><public>(RequestInstruction:prompt_slot_provider)<transacts><decides>:void

    # Registers a callback for when the persona receives structured data in the format of response_type.
    #  Required forces this be filled out every time the persona is prompted.
    #  The returned cancelable unregisters this callback and stops the llm from attempting to send this kind of structured data.
    #  The result type must be a struct which can contain.
    #  - numeric types, message, bools and enums, as well as structs or arrays which only contain those types, anything else results in an error.
    #  Use the names of the fields and name of the type of the struct to direct the prompt or facts on how to fill out the data structure.
    SubscribeToResponseType<native><public>(response_type:type, Required:logic, Callback:type {_(:?agent, :response_type):void})<transacts>:cancelable

    @available {MinUploadedAtFNVersion := 4000}
    OnReceive<override>(SceneEvent:scene_event):logic = external {}

    # Listenable which is signaled when the persona was requested to talk, either by a player or prompt and failed.
    #  Callback receives:
    #    1) The persona which had the failure
    #    2) The error
    PromptFailureEvent<native><public>:listenable(llm_prompt_error) = external {}

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
@experimental
# Base class for the abstraction of how prompts are constructed
prompt_template<native><public> := class<abstract><castable><epic_internal>:


@available {MinUploadedAtFNVersion := 4000}
@experimental
# A prompt definition which is used by persona's - used to build a personality which knows things in the world.
persona_prompt_template<native><public> := class<final>(prompt_template):
    # Defines the personality
    PersonaDefinition<native><public>:persona_definition

    # Directions to the persona - what should it do
    InstructionSlot<native><public>:prompt_slot_provider

@available {MinUploadedAtFNVersion := 4000}
@experimental
# The persona voice used when converting text-to-voice
voice_model<native><public> := class<abstract><epic_internal>:


@available {MinUploadedAtFNVersion := 4000}
@experimental
# Comic, High, Warm
lily_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
@experimental
# Refined, Med, Warm
julienne_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
@experimental
# Glamorous, Animated, warm
victoria_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
@experimental
# Tough, Low, Gravelly
wyatt_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
@experimental
# Comic, Med, Natural
caleb_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
@experimental
# Whimsical, High, Warm
ethan_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
@experimental
# Tough, Med, Natural
vera_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
@experimental
# Refined, Med, Natural
grant_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
@experimental
# Narrator, Low, Warm
rex_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
@experimental
# Whimsical, High, Warm
luna_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
@experimental
# Whimsical, Med, Warm
chloe_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
@experimental
# Tough, Med, Natural
roxy_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
@experimental
# Tough, Low, Natural
vivienne_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
@experimental
# Narrator, Med, Natural
milo_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
@experimental
# Cinematic, Med, Natural
clara_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
@experimental
# Comic, Med, Natural
dante_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
@experimental
# Cinematic, High, Natural
marcus_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
@experimental
# Whimsical, Med, Natural
aria_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
@experimental
# Comic, High, Natural
victor_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
@experimental
# Narrator, Med, Warm
alaina_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
@experimental
# Narrator, Low, Warm
maisie_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
@experimental
# Cinematic, Med, Warm
arthur_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
@experimental
# Comic, High, Natural
felix_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
@experimental
# Cinematic, Med, Natural
walter_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
@experimental
# Refined, Med, Warm
simon_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
@experimental
# Whimsical, High, Warm
troy_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
@experimental
# Tough, High, Warm
brenna_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
@experimental
# Tough, High, Natural
marina_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
@experimental
# Glamorous, Low, Natural
helen_voice<final><public> := class(voice_model):


@available {MinUploadedAtFNVersion := 4000}
@experimental
# Glamorous, Med, Natural
graham_voice<final><public> := class(voice_model):
