# Verse path: /Fortnite.com
# Module import path: /Fortnite.com/AI
AI<public> := module:
    using {/Verse.org/SceneGraph}
    using {/Verse.org/Native}
    using {/Verse.org/Simulation}
    @available {MinUploadedAtFNVersion := 3800}
    # Component to manage functionality specifically for an agent's equipped Sidekick.
    equipped_sidekick_component<native><public> := class<final_super><epic_internal>(sidekick_component, showable):
        # By default, Sidekicks will change their mood depending on actions in the game.
        # This value will lock the Sidekick into the mood passed in, overriding the automatic mood system.
        var MoodOverride<override>:?sidekick_mood = external {}

        # Get the Sidekick's current mood.
        GetMood<override><native>()<reads>:sidekick_mood

        # Signaled whenever the Sidekick's mood changes, either via the underlying mood system, or an override is applied. Returns (Previous Mood, New Mood).
        ChangeMoodEvent<override><native>:listenable(tuple(sidekick_mood, sidekick_mood)) = external {}

        # Request to play a given reaction on the sidekick.
        # This reaction is not guaranteed to play immediately; instead, the StartPlayReactionEvent should be used to monitor this.
        # This will fail if the Sidekick cannot play the given reaction.
        PlayReaction<override><native>(Reaction:sidekick_reaction)<transacts><decides>:void

        # Signaled when the Sidekick starts to play a reaction, returns the reaction that started playing.
        StartPlayReactionEvent<override><native>:listenable(sidekick_reaction) = external {}

        # Signaled when the Sidekick ends playing a reaction, returns the reaction that played.
        StopPlayReactionEvent<override><native>:listenable(sidekick_reaction) = external {}

        # Get the agent that owns this Sidekick.
        GetOwningAgent<native><public>()<transacts><decides>:agent

        # Is the Sidekick visible?
        var Show<override>:logic = external {}

        # The Sidekick will run animations to react to the state of the player. Is this system enabled?
        var AutomaticReactionsEnabled<public>:logic = external {}

        # Sidekicks have a built-in player interaction; this can be disabled by setting this to false.
        var DefaultInteractionEnabled<public>:logic = external {}

    @available {MinUploadedAtFNVersion := 3800}
    # component to manage an entity that supports a Spark mode.
    # Spark mode will transform the entity into a floating spark.
    # The entity will enter `spark mode` whenever it enters impassable terrain or to reduce visual clutter.
    spark_mode_component<native><public> := class<final_super><epic_internal>(component):
        # Automatic switching in and out of spark mode can be turned off, forcing spark mode always, by setting this value to true.
        var SparkModeAlwaysActive<public>:logic = external {}

        # Signaled when the Sidekick enters spark mode.
        BeginSparkModeEvent<native><public>:listenable(tuple()) = external {}

        # Signaled when the Sidekick exits spark mode
        EndSparkModeEvent<native><public>:listenable(tuple()) = external {}