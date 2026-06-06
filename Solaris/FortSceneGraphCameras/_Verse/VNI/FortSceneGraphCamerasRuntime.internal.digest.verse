# Module import path: /Fortnite.com/SceneGraphCameras/FortSceneGraphCameras
FortSceneGraphCameras<public> := module:
    using {/Verse.org/Native}
    using {/Verse.org/SpatialMath}
    using {/Verse.org/Temporary/EpicGamesRestricted/Network}
    using {/Verse.org/Assets}
    using {/Verse.org/SceneGraph}
    @available {MinUploadedAtFNVersion := 4110}
    @experimental
    # Camera modifier that implements a fixed angle camera.
    fort_fixed_angle_camera_modifier<native><epic_internal> := class(camera_modifier):
        NativeCameraRigAsset<override>:camera_rig_asset = external {}

        @experimental
        @replicated("")
        TargetEntity<native><public>:entity

        @experimental
        @replicated("")
        var LookAtOffset<native><public>:(/Verse.org/SpatialMath:)vector3 = external {}

        @experimental
        @replicated("")
        var RotationAroundTarget<native><public>:(/Verse.org/SpatialMath:)rotation = external {}

    @available {MinUploadedAtFNVersion := 4110}
    @experimental
    MakeFixedAngleCamera<constructor><epic_internal>(TargetEntityIn:entity):fort_fixed_angle_camera_modifier = external {}

    @available {MinUploadedAtFNVersion := 4110}
    @experimental
    # Camera modifier that implements a fixed angle camera.
    fort_fixed_point_camera_modifier<native><epic_internal> := class(camera_modifier):
        NativeCameraRigAsset<override>:camera_rig_asset = external {}

        @experimental
        @replicated("")
        TargetEntity<native><public>:entity

        @experimental
        @replicated("")
        var LookAtOffset<native><public>:(/Verse.org/SpatialMath:)vector3 = external {}

    @available {MinUploadedAtFNVersion := 4110}
    @experimental
    MakeFixedPointCamera<constructor><epic_internal>(TargetEntityIn:entity):fort_fixed_angle_camera_modifier = external {}

    @available {MinUploadedAtFNVersion := 4110}
    @experimental
    # Camera modifier that implements an orbit camera.
    fort_orbit_camera_modifier<native><epic_internal> := class(camera_modifier):
        NativeCameraRigAsset<override>:camera_rig_asset = external {}

        @experimental
        @replicated("")
        TargetEntity<native><public>:entity

    @available {MinUploadedAtFNVersion := 4110}
    @experimental
    MakeOrbitCamera<constructor><epic_internal>(TargetEntityIn:entity):fort_orbit_camera_modifier = external {}