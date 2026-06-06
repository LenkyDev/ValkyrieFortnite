using {/Verse.org/Simulation}
using {/Verse.org/Native}
@available {MinUploadedAtFNVersion := 4000}
@experimental
# Interface that defines a class as being usable as member info in an agent group
member_info_interface<native><public> := interface:


@available {MinUploadedAtFNVersion := 4000}
@experimental
# Interface that defines a class as providing an agent group.
agent_group_interface<public>(member_info:subtype(member_info_interface)) := interface:
    (/Verse.org/AgentGroup/agent_group_interface:)AgentGroup_agent_group_interface_Variance<private>():tuple(member_info) = external {}

    # Get the members of this agent group with their member info
    GetMemberMap<public>()<reads>:[agent]member_info

    # Signalled whenever an agent successfully joins this agent group.Passes in the agent that joined along with their member_info.
    AddMemberEvent<public>:listenable(tuple(agent, member_info))

    # Signalled whenever an agent successfully leaves this agent group.Passes in the agent that left along with their member_info.
    RemoveMemberEvent<public>:listenable(tuple(agent, member_info))

    # Signalled whenever the MemberInfo class is re-instantiated for a given agent.Passes in the agent that was updated along with their new member_info.
    MemberInfoChangeEvent<public>:listenable(tuple(agent, member_info))

@available {MinUploadedAtFNVersion := 4000}
@experimental
# An agent group is defined as a set of agents that share a common ownership.This class stores agents and specific information about each member via the member_info type provided.
agent_group<native><public>(member_info:subtype(member_info_interface)) := class<unique>(agent_group_interface(member_info)):
    @available {MinUploadedAtFNVersion := 4294967041}
    (/Verse.org/AgentGroup/agent_group:)AgentGroup_agent_group_Variance_Inherited<private>():tuple(member_info) = external {}

    (/Verse.org/AgentGroup/agent_group:)AgentGroup_agent_group_Variance<private>(:member_info, :member_info):tuple(member_info) = external {}

    # Get the members of this agent group with their member info
    GetMemberMap<override><native>()<reads>:[agent]member_info

    # Attempt to add the given agent to this agent group.This function returns a result that will either succeed or return an error.
    AddMember<public>(Agent:agent, MemberInfo:member_info)<transacts>:result(void, add_member_error) = external {}

    # Attempt to remove the given agent from this agent group.This function returns a result that will either succeed or return an error.
    RemoveMember<public>(Agent:agent)<transacts>:result(void, remove_member_error) = external {}

    # Signalled whenever an agent successfully joins this agent group.Passes in the agent that joined along with their member_info.
    AddMemberEvent<override><native><final>:listenable(tuple(agent, member_info)) = external {}

    # Signalled whenever an agent successfully leaves this agent group.Passes in the agent that left along with their member_info.
    RemoveMemberEvent<override><native><final>:listenable(tuple(agent, member_info)) = external {}

    # Signalled whenever the MemberInfo class is re-instantiated for a given agent.Passes in the agent that was updated along with their new member_info.
    MemberInfoChangeEvent<override><native><final>:listenable(tuple(agent, member_info)) = external {}

@available {MinUploadedAtFNVersion := 4000}
@experimental
# Base class for all errors returned from agent_group.AddMember.
add_member_error<native><public> := class<computes>:


@available {MinUploadedAtFNVersion := 4000}
@experimental
# Base class for all errors returned from agent_group.RemoveMember.
remove_member_error<native><public> := class<computes>:
