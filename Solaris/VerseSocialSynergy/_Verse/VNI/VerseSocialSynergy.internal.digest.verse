# Verse path: /UnrealEngine.com/Social
using {/Verse.org/Simulation}
using {/Verse.org/Native}
using {/Verse.org/AgentGroup}
@available {MinUploadedAtFNVersion := 4210}
# Per-member info for party members. Can be extended with additional fields in future versions.
party_member_info<native><public> := class<epic_internal>(member_info_interface):


@available {MinUploadedAtFNVersion := 4210}
# Returns the party context for `InPlayer`.
# Filters by the simulation_entity owning this player.
# A player is always in a party of at least 1 (themselves).
(InPlayer:player).GetLocalParty<native><public>()<reads>:agent_group_interface(party_member_info)