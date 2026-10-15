# Verse path: /Verse.org/Chat
using {/Verse.org/SceneGraph}
using {/Verse.org/Colors}
using {/Verse.org/Simulation}
using {/Verse.org/Native}
using {/Verse.org/AgentGroup}
@available {MinUploadedAtFNVersion := 4000}
chat_channel<native><public>(member_info:subtype(member_info_interface)) := class<unique><abstract><internal>(enableable):
    (/Verse.org/Chat/chat_channel:)Chat_chat_channel_Variance<private>():tuple(member_info) = external {}

    Name<public>:message

    @available {MinUploadedAtFNVersion := 4000}
    Group<public>:agent_group_interface(member_info)

    Enable<override>():void = external {}

    Disable<override>():void = external {}

    IsEnabled<override>()<transacts><decides>:void = external {}

    @available {MinUploadedAtFNVersion := 4220}
    var<private> MaxSize<epic_internal>:int = external {}

    IsAgentInChannel<native_callable><epic_internal>(Agent:agent)<decides><reads>:void = external {}

    GetAllPlayerAgents<native_callable><epic_internal>()<reads>:[]agent = external {}

    GetAllAgents<native_callable><epic_internal>()<reads>:[]agent = external {}

@available {MinUploadedAtFNVersion := 4000}
# Used to specify permissions and other settings for a voice_channel.
has_voice_member_info<native><public> := interface(member_info_interface):
    # Determines if the participant can send voice messages to the channel.
    # If false, the participant can still hear those who are broadcasting and see users in the social overlay panel.
    var CanBroadcast<public>:logic = external {}

    @available {MinUploadedAtFNVersion := 4220}
    GetCanBroadcastEpicInternal<epic_internal>()<reads>:logic = external {}

@available {MinUploadedAtFNVersion := 4240}
# Used to specify permissions and other settings for a `text_channel`.
has_text_member_info<native><public> := interface(member_info_interface):
    # Determines if the participant can send text messages to the channel.
    # If false, the participant can still see users and messages in the text chat widget.
    var CanSend<public>:logic = external {}

    # The text styling for this participant in the channel.
    # If false, `MessageStyle` as defined by the channel is used.
    var MessageStyle<public>:?text_message_style = external {}

    GetCanSendEpicInternal<epic_internal>()<reads>:logic = external {}

    GetMessageStyleEpicInternal<epic_internal>()<reads>:?text_message_style = external {}

@available {MinUploadedAtFNVersion := 4240}
# Defines text message styling for text messages in a `text_channel`.
# Only affects new messages.
text_message_style<native><public> := class<concrete>:
    # The text color of messages sent to the chat feed.
    TextColor<native><public>:color = external {}

    # A message printed after a user's name in the chat feed.
    # This message is always wrapped in square brackets "[]".
    # If false, no extra message is added to the message.
    # For example, in the message "Jonesy [Tilted Towers]: gg", the text "Tilted Towers" would be the message provided here.
    ContextMessage<native><public>:?message = external {}

@available {MinUploadedAtFNVersion := 4000}
# A `voice_channel` defines a group of agents who can communicate via voice chat.
# An agent can be a member of more than one `voice_channel`.Voice channels can accommodate 80 members of the channel's `Group`. Agents beyond this limit are not included in the chat.A chat participant in a `voice_channel` may be restricted from voice chat based on parental controls and/or user settings.
voice_channel<native><public>(member_info:subtype(has_voice_member_info)) := class<final>(chat_channel(member_info)):
    @available {MinUploadedAtFNVersion := 4210}
    (/Verse.org/Chat/voice_channel:)Chat_voice_channel_Variance_Inherited<private>():tuple(member_info) = external {}

    (/Verse.org/Chat/voice_channel:)Chat_voice_channel_Variance<private>(:member_info, :member_info, :member_info):tuple() = external {}

    var VoiceChannelSubscriptions<epic_internal>:[]cancelable = external {}

    AddVoiceChannelSubscription<epic_internal>(NewSubscription:cancelable):void = external {}

    # Allows users to communicate on the channel.
    Enable<override><native>():void

    # Disables users from communicating on the channel.
    Disable<override><native>():void

    # Returns if any user can communicate on the channel.
    IsEnabled<override><native>()<transacts><decides>:void

    @available {MinUploadedAtFNVersion := 4220}
    # The priority assigned to the channel.
    # When a user could hear a speaker on more than one channel, they hear the speaker on the channel with the highest priority.
    # Between channels of equal priority the most recently joined one wins.
    var HearingPriority<epic_internal>:float = external {}

    @available {MinUploadedAtFNVersion := 4220}
    # Checks to see if a given member is speaking on the `voice_channel`.
    # Fails if the agent is not a member of the channel, or is not currently speaking.
    IsMemberSpeaking<native><public>(Agent:agent)<decides><reads>:void

    @available {MinUploadedAtFNVersion := 4220}
    # Signalled when a member of this channel starts speaking on it.
    # Returns a subscribable with a payload of the speaking `agent`.
    BeginBroadcastEvent<public>():listenable(agent) = external {}

    @available {MinUploadedAtFNVersion := 4220}
    # Signalled when a member of this channel stops speaking on it.
    # Returns a subscribable with a payload of the `agent` that stopped speaking.
    EndBroadcastEvent<public>():listenable(agent) = external {}

    @available {MinUploadedAtFNVersion := 4220}
    # Signalled when a member's `CanBroadcast` changes while they hold one of the channel's slots.
    # Returns a subscribable with a payload of the member and their new `CanBroadcast` value.
    CanBroadcastChangeEvent<public>():listenable(tuple(agent, logic)) = external {}

    @available {MinUploadedAtFNVersion := 4220}
    BeginBroadcastEventInternal<native><epic_internal>:subscribable_event_intrnl(agent) = external {}

    @available {MinUploadedAtFNVersion := 4220}
    EndBroadcastEventInternal<native><epic_internal>:subscribable_event_intrnl(agent) = external {}

    @available {MinUploadedAtFNVersion := 4220}
    CanBroadcastChangeEventInternal<native><epic_internal>:subscribable_event_intrnl(tuple(agent, logic)) = external {}

    OnAddMemberEvent<native><epic_internal>(Agent:agent, MemberInfo:member_info)<transacts>:void

    OnRemoveMemberEvent<native><epic_internal>(Agent:agent, MemberInfo:member_info)<transacts>:void

    @available {MinUploadedAtFNVersion := 4220}
    OnMemberInfoChangeEvent<native><epic_internal>(Agent:agent, MemberInfo:member_info)<transacts>:void

    @available {MinUploadedAtFNVersion := 4220}
    GetBroadcastingAgents<native_callable><epic_internal>()<reads>:[]agent = external {}

    GetActiveAgents<native><epic_internal>()<reads>:[]agent

    SetupSubscriptions<epic_internal>():void = external {}

    CancelSubscriptions<native_callable><epic_internal>():void = external {}

@available {MinUploadedAtFNVersion := 4240}
# A `text_channel` defines a group of agents who can communicate via text chat.
# An agent can be a member of more than one `text_channel`.
# Text channels can accommodate 100 members of the channel's `Group`. Agents beyond this limit are not included in the chat.
# A chat participant in a `text_channel` may be restricted from text chat based on parental controls and/or user settings.
text_channel<native><public>(member_info:subtype(has_text_member_info)) := class<final>(chat_channel(member_info)):
    @available {MinUploadedAtFNVersion := 4210}
    (/Verse.org/Chat/text_channel:)Chat_text_channel_Variance_Inherited<private>():tuple(member_info) = external {}

    (/Verse.org/Chat/text_channel:)Chat_text_channel_Variance<private>(:member_info, :member_info, :member_info):tuple() = external {}

    var TextChannelSubscriptions<epic_internal>:[]cancelable = external {}

    AddTextChannelSubscription<epic_internal>(NewSubscription:cancelable):void = external {}

    # The color of system and platform messages sent to the chat feed.
    # For example, when a user starts writing to a chat channel, a system message tells them so, "Now chatting in Team Red."
    var SystemMessageColor<public>:color = external {}

    # Message color and name presentation for the channel.
    # A member carrying their own `MessageStyle` overrides this one.
    var MessageStyle<public>:text_message_style = external {}

    # Allows users to communicate on the channel.
    Enable<override><native>():void

    # Disables users from communicating on the channel.
    Disable<override><native>():void

    # Returns if any user can communicate on the channel.
    IsEnabled<override><native>()<transacts><decides>:void

    OnAddMemberEvent<native><epic_internal>(Agent:agent, MemberInfo:member_info)<transacts>:void

    OnRemoveMemberEvent<native><epic_internal>(Agent:agent, MemberInfo:member_info)<transacts>:void

    OnMemberInfoChangeEvent<native><epic_internal>(Agent:agent, MemberInfo:member_info)<transacts>:void

    GetSendingAgents<native_callable><epic_internal>()<reads>:[]agent = external {}

    GetMembersWithStyleOverride<native_callable><epic_internal>()<reads>:[]agent = external {}

    GetMessageStyleOverrideForMember<native_callable><epic_internal>(Agent:agent)<reads>:?text_message_style = external {}

    GetChannelName<native_callable><epic_internal>()<reads>:message = external {}

    SetupSubscriptions<epic_internal>():void = external {}

    CancelSubscriptions<native_callable><epic_internal>():void = external {}

@available {MinUploadedAtFNVersion := 4000}
# Returns the `voice_channel`s registered on the simulation this `entity` belongs to
(Entity:entity).GetVoiceChannels<native><public>()<reads>:[]voice_channel(has_voice_member_info)

@available {MinUploadedAtFNVersion := 4240}
# Returns the `text_channel`s registered on the simulation this `entity` belongs to
(Entity:entity).GetTextChannels<native><public>()<reads>:[]text_channel(has_text_member_info)

@available {MinUploadedAtFNVersion := 4000}
# Returns all the voice channels where the agent is part of the agent_group.
(Entity:simulation_entity).GetVoiceChannelsForAgent<native><epic_internal>(Agent:agent):[]voice_channel(has_voice_member_info)

@available {MinUploadedAtFNVersion := 4000}
# Registers a `chat_channel` to the simulation this `entity` belongs to.
# Fails if the channel's `agent_group` already has more members than the channel type's limit.
# * Voice Chat Max Size = 80 participants.
# * Text Chat Max Size = 100 participants.
(Entity:entity where MemberInfo:subtype(member_info_interface)).AddChatChannel<native><public>(Channel:chat_channel(MemberInfo)):result(void, add_channel_error)

@available {MinUploadedAtFNVersion := 4000}
# Deregisters a `chat_channel` from the simulation this `entity` belongs to.
(Entity:entity where MemberInfo:subtype(member_info_interface)).RemoveChatChannel<native><public>(Channel:chat_channel(MemberInfo)):result(void, remove_channel_error)

@available {MinUploadedAtFNVersion := 4000}
# Unregisters and removes all members from all chat channels currently on the simulation.
(Entity:entity).ClearChatChannels<native><epic_internal>():void

@available {MinUploadedAtFNVersion := 4000}
# Error returned when a channel cannot be added via the `AddChatChannel` function.
add_channel_error<public> := class<computes>:


@available {MinUploadedAtFNVersion := 4000}
# Used in native to create a channel result when registering a channel.
MakeAddChannelResult<native_callable><epic_internal>(IsSuccess:logic):result(comparable, add_channel_error) = external {}

@available {MinUploadedAtFNVersion := 4000}
# Used in native to create a channel result when unregistering a channel.
MakeRemoveChannelResult<native_callable><epic_internal>(IsSuccess:logic):result(comparable, remove_channel_error) = external {}

@available {MinUploadedAtFNVersion := 4000}
# Error returned when a channel cannot be removed via the `RemoveChatChannel` function.
remove_channel_error<public> := class<computes>:


@available {MinUploadedAtFNVersion := 4000}
# Internal member info - used to create the default voice channels when starting a game.
default_member_info<epic_internal> := class(has_voice_member_info):


@available {MinUploadedAtFNVersion := 4000}
# Internal agent group - used to create the default voice channels when starting a game.
default_agent_group<epic_internal> := class(agent_group(default_member_info)):


@available {MinUploadedAtFNVersion := 4220}
GetDisplayableVoiceChannelName<native_callable><epic_internal>(VoiceChannel:voice_channel(has_voice_member_info))<reads>:string = external {}

@available {MinUploadedAtFNVersion := 4000}
voice_manager_component<native><epic_internal> := class<final_super>(component):
    var VoiceChannelsOnSimulation<native><epic_internal>:[]voice_channel(has_voice_member_info) = external {}

    @available {MinUploadedAtFNVersion := 4220}
    UNDEFINED_PRIORITY<epic_internal>:float = external {}

    AddVoiceChannel<native_callable><epic_internal>(VoiceChannel:voice_channel(has_voice_member_info))<decides>:void = external {}

    RemoveVoiceChannel<native_callable><epic_internal>(VoiceChannel:voice_channel(has_voice_member_info))<decides>:void = external {}

    ToMessage<localizes><epic_internal>(ChannelName:string):message = external {}

    AddToDefaultVoiceChannel<native_callable><epic_internal>(ChannelNameString:string, Agent:agent):void = external {}

    RemoveFromDefaultVoiceChannel<native_callable><epic_internal>(ChannelNameString:string, Agent:agent):void = external {}

    RemoveAgentFromAllDefaultVoiceChannels<native_callable><epic_internal>(Agent:agent):void = external {}

@available {MinUploadedAtFNVersion := 4240}
text_manager_component<native><epic_internal> := class<final_super>(component):
    var TextChannelsOnSimulation<native><epic_internal>:[]text_channel(has_text_member_info) = external {}

    AddTextChannel<native_callable><epic_internal>(TextChannel:text_channel(has_text_member_info))<decides>:void = external {}

    RemoveTextChannel<native_callable><epic_internal>(TextChannel:text_channel(has_text_member_info))<decides>:void = external {}