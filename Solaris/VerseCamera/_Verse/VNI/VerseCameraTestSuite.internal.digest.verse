# Module import path: /UnrealEngine.com/VerseCameraTestSuite
VerseCameraTestSuite<public> := module:
    using {/Verse.org/Temporary/EpicGamesRestricted/Network}
    using {/Verse.org/Simulation}
    using {/Verse.org/Native}
    using {/Verse.org/SceneGraph}
    @available {MinUploadedAtFNVersion := 4110}
    @experimental
    @hide_in_editor
    # Camera modifier designed to test base class properties of camera_component.
    base_camera_test_modifier<native><epic_internal> := class(camera_modifier):


    @available {MinUploadedAtFNVersion := 4110}
    @experimental
    @hide_in_editor
    # Component that stores test results.
    camera_system_test_results_component<native><epic_internal> := class<final_super>(component):
        OnAddedToSceneInternal<native><override>():void

    @available {MinUploadedAtFNVersion := 4110}
    @experimental
    @hide_in_editor
    # Camera modifier designed to test orthographic_camera_component.
    orthographic_camera_test_modifier<native><epic_internal> := class(base_camera_test_modifier):


    @available {MinUploadedAtFNVersion := 4110}
    @experimental
    @hide_in_editor
    # Camera modifier designed to test perspective_camera_component.
    perspective_camera_test_modifier<native><epic_internal> := class(base_camera_test_modifier):


    @available {MinUploadedAtFNVersion := 4110}
    @experimental
    @hide_in_editor
    # Camera modifier designed to test physical_camera_component.
    physical_camera_test_modifier<native><epic_internal> := class(base_camera_test_modifier):


    @available {MinUploadedAtFNVersion := 4110}
    @experimental
    @hide_in_editor
    # Component that associates an entity with a unique ID - For testing purposes
    test_identifier_component<native><epic_internal> := class<final_super>(component):
        @experimental
        @replicated("")
        CameraID<native><public>:int = external {}