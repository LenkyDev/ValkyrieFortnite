using {/Verse.org/SceneGraph}
using {/Verse.org/Simulation}
using {/Verse.org/Native}
using {/Verse.org/AgentGroup}
@available {MinUploadedAtFNVersion := 4000}
@experimental
chat_channel<native><epic_internal>(member_info:subtype(member_info_interface)) := class<unique><abstract><internal>(enableable):
    (/Verse.org/Chat/chat_channel:)Chat_chat_channel_Variance<private>():tuple(member_info) = external {}

    Name<public>:message

    @available {MinUploadedAtFNVersion := 4000}
    Group<public>:agent_group_interface(member_info)

    IsAgentInChannel<native_callable><epic_internal>(Agent:agent)<reads><decides>:void = external {}

    GetAllPlayerAgents<native_callable><epic_internal>()<reads>:[]agent = external {}

@available {MinUploadedAtFNVersion := 4000}
@experimental
# Used to specify permissions and other settings for a voice_channel.
has_voice_member_info<native><epic_internal> := interface(member_info_interface):
    # Determines if the participant can send voice messages to the channel.
    # If true, the participant can still hear those who are broadcasting and see users in the social overlay panel.
    var CanBroadcast<public>:logic = external {}

@available {MinUploadedAtFNVersion := 4000}
@experimental
# A `voice_channel` defines a group of agents who can communicate via voice chat.
# An agent can be a member of more than one `voice_channel`.Voice channels can accommodate 80 members of the channel’s `Group`. Agents beyond this limit are not included in the chat.A chat participant in a `voice_channel` may be restricted from voice chat based on parental controls and/or user settings.
voice_channel<native><epic_internal>(member_info:subtype(has_voice_member_info)) := class<final>(chat_channel(member_info)):
    @available {MinUploadedAtFNVersion := 4294967041}
    (/Verse.org/Chat/voice_channel:)Chat_voice_channel_Variance_Inherited<private>():tuple(member_info) = external {}

    # Allows users to communicate on the channel.
    Enable<override>():void = external {}

    # Disables users from communicating on the channel.
    Disable<override>():void = external {}

    # Returns if any user can communicate on the channel.
    IsEnabled<override>()<transacts><decides>:void = external {}

@available {MinUploadedAtFNVersion := 4000}
@experimental
(Entity:entity).GetVoiceChannels<native><epic_internal>():[]voice_channel(has_voice_member_info)

@available {MinUploadedAtFNVersion := 4000}
@experimental
(Entity:simulation_entity).GetVoiceChannelsForAgent<native><epic_internal>(Agent:agent):[]voice_channel(has_voice_member_info)

@available {MinUploadedAtFNVersion := 4000}
@experimental
AddVoiceChannel<native_callable><epic_internal>(Channel:voice_channel(has_voice_member_info), Entity:simulation_entity):void = external {}

@experimental
# Error returned when a channel cannot be added via the `AddChatChannel` function.
add_channel_error<epic_internal> := class<computes>:


@available {MinUploadedAtFNVersion := 4000}
@experimental
voice_manager_component<native><epic_internal> := class<final_super>(component):
    var VoiceChannelsOnSimulation<native><public>:[]voice_channel(has_voice_member_info) = external {}