# Verse path: /Fortnite.com/Devices
using {/Verse.org/Simulation}
#  Represents a poll.
# For example, in a poll “What to have for lunch?” the group represents the question and contains the possible answers.
# Owns the overall state of the poll and keeps track of available options.
# A group can have multiple options, connected via an internal ID. 
vote_group_device<public> := class<concrete><final>(creative_device_base):
    # Allows votes to be cast for this group’s options, and starts a timer if applicable.
    BeginVote<final><public>():void = external {}

    # Prevents any more votes from being cast and picks a winner based on vote count.
    EndVote<final><public>():void = external {}

    # Triggered when voting begins.
    BeginVoteEvent<final><public>:listenable(tuple()) = external {}

    # Triggered when voting has completed.
    EndVoteEvent<final><public>:listenable(tuple()) = external {}

    # Triggered when voting ends and at least two options are tied for first place.
    VoteTiedEvent<final><public>:listenable(tuple()) = external {}

    # Get the list of options currently in this voting group.
    GetVotingOptions<final><public>():[]vote_option_interface = external {}

    # The amount of time this poll is available before ending, in seconds.
    #  If set to zero, the poll will not be ended by a time limit.
    GetTimeLimit<final><public>():float = external {}

    # The display text for this poll.
    #  For example the string “What to have for lunch?”
    GetPollQuestion<final><public>():message = external {}

    # The total number of times each player can vote in this poll.
    #  If zero or less, players cannot vote.
    GetMaxVotesPerPlayer<final><public>():int = external {}

# Represents an individual choice in a poll.
#  For example, in a poll “What to have for lunch?” an option might be “Tacos”
#  Tracks how many times each agent has voted for this option.
#  An option is associated with only one group device (or “poll”) via an internal ID.
vote_option_interface<public> := interface:
    # Attempts to cast a vote for ‘Agent’
    #  If the voting agent has votes remaining and the voting group has started a vote, the vote will be cast successfully.
    #  Fails if Agent does not have votes remaining or voting group has not started.
    CastVote<public>(Agent:agent)<transacts><decides>:void

    # Returns the total votes cast for this option.
    GetVoteCount<public>():int

    # Returns the group device this option corresponds to, if any.
    #  Fails if the option is not in a group, or there is no corresponding group device with the same ID.
    GetVoteGroup<public>():?vote_group_device

    # Succeeds if `Agent` has voted for this option, fails if not.
    HasAgentVoted<public>(Agent:agent)<transacts><decides>:void

    # Triggered when a vote is cast by ‘agent’
    CastVoteEvent<public>:listenable(agent)

    # Triggered if this option wins the vote.
    WinVoteEvent<public>:listenable(?agent)

    # The string to display to the user when choosing which option to select.
    GetOptionDescription<public>():message

vote_option_device<public> := class(vote_option_interface, creative_device_base):
    CastVote<override>(Agent:agent)<transacts><decides>:void = external {}

    GetVoteCount<override>():int = external {}

    GetVoteGroup<override>():?vote_group_device = external {}

    HasAgentVoted<override>(Agent:agent)<transacts><decides>:void = external {}

    CastVoteEvent<override>:listenable(agent) = external {}

    WinVoteEvent<override>:listenable(?agent) = external {}

    GetOptionDescription<override>():message = external {}