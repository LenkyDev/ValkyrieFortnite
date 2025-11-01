# Module import path: /Verse.org/Simulation
Simulation<public> := module:
    using {/Verse.org/Native}
    # Type for which there is a single instance per round.  Use `GetSession` to get the current round's `session` instance. May be used with `weak_map` to implement global variables.
    # Note: may be changed in a future release to a single instance per game. Round-local behavior should not be relied upon.
    session<native><public> := class<unique><module_scoped_var_weak_map_key><epic_internal>:


    # Returns the `session` corresponding to the current round.  The result can be used with `weak_map` to implement global variables.
    # Note: may be changed in a future release to return a single instance per game. Round-local behavior should not be relied upon.
    GetSession<native><public>()<reads>:session

    # Specifies what type of environment the current session is in.
    session_environment<native><public> := enum:
        # The current session is in an Edit environment for an experience, such as a session started within UEFN.
        Edit
        # The current session is in a Private environment for an experience, such as a playtest.
        Private
        # The current session is in a Live environment for an experience.
        Live

    @available {MinUploadedAtFNVersion := 3800}
    (Session:session).Environment<native><public>()<transacts>:session_environment

    # Waits specified number of seconds and then resumes. If `Seconds` = 0.0 then it waits until next tick/frame/update. If `Seconds` = Inf then it waits forever and only calls back if canceled - such as via `race`. If `Seconds` < 0.0 then it completes immediately and does not yield to other aysnc expressions.
    # Waiting until the next update (0.0) is especially useful in a loop of a coroutine that needs to do some work every update and this yields to other coroutines so that it doesn't hog a processor's resources.
    # Waiting forever (Inf) will have any expression that follows never be evaluated. Occasionally it is desireable to have a task never complete such as the last expression in a `race` subtask where the task must never win the race though it still may be canceled earlier.
    # Immediately completing (less than 0) is useful when you want programmatic control over whether an expression yields or not.
    Sleep<native><public>(Seconds:float)<suspends>:void

    # Get the seconds that have elapsed since the world began simulating
    GetSimulationElapsedTime<native><public>()<transacts>:float

    team<native><public> := class<unique><epic_internal>:
