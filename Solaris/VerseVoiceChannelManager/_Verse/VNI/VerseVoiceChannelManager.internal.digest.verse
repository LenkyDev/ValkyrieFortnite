# Module import path: /Fortnite.com/VerseVoiceChannelManager
VerseVoiceChannelManager<public> := module:
    using {/Verse.org/Simulation}
    using {/Verse.org/AgentGroup}
    using {/Verse.org/Native}
    using {/Verse.org/Chat}
    @available {MinUploadedAtFNVersion := 4000}
    @experimental
    voice_member_info<epic_internal> := class(has_voice_member_info):


    @available {MinUploadedAtFNVersion := 4000}
    @experimental
    voice_channel_manager<native><epic_internal> := class<final_super>(voice_manager_component):
        var VoiceAgentChannels<epic_internal>:[string]tuple(agent_group(voice_member_info), voice_channel(voice_member_info)) = external {}

        var VoiceChannels<native><epic_internal>:[]voice_channel(voice_member_info) = external {}

        RegisterAgentToVoiceChannelOrCreate<native_callable><epic_internal>(Agent:agent, ChannelName:message)<transacts>:void = external {}

        CreateChannelAndVoiceGroup<epic_internal>(ChannelName:message)<transacts><decides>:void = external {}