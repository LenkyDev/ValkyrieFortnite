# Verse path: /Fortnite.com/Devices
# The state of a progress_based_mesh_device.
progress_device_state<public> := enum<open>:
    # This device is currently progressing, and will increase its 'CurrentProgress' by its 'ProgressRate'.
    Progress
    # This device is currently regressing, and will decrease its 'CurrentProgress' by its 'RegressRate'.
    Regress
    # This device is currently paused. It will not progress or regress automatically.
    Pause

# This device is used to associate changes in progression with a mesh transition. As the device's progression changes, it will transition between a set of defined meshes.
#  The ThresholdMesh field can be found under the 'Visuals' category on an instance of a progress_based_mesh_device in Unreal Editor Fortnite.
progress_based_mesh_device<public> := class<concrete><final>(creative_device_base):
    # This value maps to the 'ProgressTarget' user option.
    #  The target Progress goal of this value.
    #  Setting this value will clamp it between 0 and 100.
    #  If 'ProgressTarget' is set to a value lower than 'CurrentProgress', 'CurrentProgress' will be clamped to 'ProgressTarget', and fire any threshold related events.
    var ProgressTarget<public>:float = external {}

    # The current progress this device has made towards its ProgressTarget.
    #  This value will be clamped between 0 and Progress Target.
    #  Modifying this value will cause changes Mesh Changes corresponding to your defined ThresholdMeshes.
    var CurrentProgress<public>:float = external {}

    # The current state of this device.
    var ProgressState<public>:progress_device_state = external {}

    # This value maps to the 'ProgressRate' user option.
    #  When this device is in the Progress state, 'CurrentProgress' will be increased by this value per second until it reaches the 'ProgressTarget'.
    #  Utilizing this value is not required, as 'CurrentProgress' can also be modified directly.
    var ProgressRate<public>:float = external {}

    # This value maps to the 'RegressRate' user option.
    #  When this device is in the Regress state, 'CurrentProgress' will be decreased by this value per second until it reaches the 0.
    #  Utilizing this value is not required, as 'CurrentProgress' can also be modified directly.
    var RegressRate<public>:float = external {}

    # This event is fired whenever 'CurrentProgress' reaches the 'ProgressTarget'.
    FillEvent<public>:listenable(tuple()) = external {}

    # This event is fired whenever 'CurrentProgress' reaches 0.
    EmptyEvent<public>:listenable(tuple()) = external {}

    # This event is fired whenever 'CurrentProgress' value gets changed, whether through direct modification, or as a result of the Progress or Regress state.
    ProgressChangeEvent<public>:listenable(float) = external {}

    # # This event fires whenever this device changes meshes as a result of 'CurrentProgress' value causing a new Threshold to be met.
    #  The ThresholdMeshe field can be found under the 'Visuals' category on an instance of a progress_based_mesh_device in Unreal Editor Fortnite.
    ProgressThresholdCrossEvent<public>:listenable(float) = external {}