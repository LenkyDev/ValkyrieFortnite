using {/Verse.org/SceneGraph}
using {/Verse.org/Native}
using {/Verse.org/AgentGroup}
@available {MinUploadedAtFNVersion := 4000}
chat_channel<native><public>(member_info:subtype(member_info_interface)) := class<unique><abstract><internal>:
    (/Verse.org/Chat/chat_channel:)Chat_chat_channel_Variance<private>():tuple(member_info) = external {}

    Name<public>:message

    @available {MinUploadedAtFNVersion := 4000}
    Group<public>:agent_group_interface(member_info)

@available {MinUploadedAtFNVersion := 4000}
# Used to specify permissions and other settings for a voice_channel.
has_voice_member_info<native><public> := interface(member_info_interface):
    # Determines if the participant can send voice messages to the channel.
    # If true, the participant can still hear those who are broadcasting and see users in the social overlay panel.
    var CanBroadcast<public>:logic = external {}

@available {MinUploadedAtFNVersion := 4000}
# A `voice_channel` defines a group of agents who can communicate via voice chat.
# An agent can be a member of more than one `voice_channel`.Voice channels can accommodate 80 members of the channel's `Group`. Agents beyond this limit are not included in the chat.A chat participant in a `voice_channel` may be restricted from voice chat based on parental controls and/or user settings.
voice_channel<native><public>(member_info:subtype(has_voice_member_info)) := class<final>(chat_channel(member_info)):
    @available {MinUploadedAtFNVersion := 4294967041}
    (/Verse.org/Chat/voice_channel:)Chat_voice_channel_Variance_Inherited<private>():tuple(member_info) = external {}

    (/Verse.org/Chat/voice_channel:)Chat_voice_channel_Variance<private>(:member_info, :member_info):tuple() = external {}

@available {MinUploadedAtFNVersion := 4000}
# Returns the registered voice channels on the `simulation_entity`
(Entity:entity).GetVoiceChannels<native><public>()<reads>:[]voice_channel(has_voice_member_info)

@available {MinUploadedAtFNVersion := 4000}
# Registers a `voice_channel` or `text_channel` to the `simulation_entity`.
# Fails if the `MaxSize` of the channel's `agent_group` is undefined or larger than the channel type's limit.
# * Voice Chat Max Size = 80 participants.
# * Text Chat Max Size = 100 participants.
(Entity:entity where MemberInfo:subtype(member_info_interface)).AddChatChannel<native><public>(Channel:chat_channel(MemberInfo)):result(void, add_channel_error)

@available {MinUploadedAtFNVersion := 4000}
# Deregisters a `voice_channel` or `text channel` from the `simulation_entity`.
(Entity:entity where MemberInfo:subtype(member_info_interface)).RemoveChatChannel<native><public>(Channel:chat_channel(MemberInfo)):result(void, remove_channel_error)

@available {MinUploadedAtFNVersion := 4000}
# Error returned when a channel cannot be added via the `AddChatChannel` function.
add_channel_error<public> := class<computes>:


@available {MinUploadedAtFNVersion := 4000}
# Error returned when a channel cannot be removed via the `RemoveChatChannel` function.
remove_channel_error<public> := class<computes>:
