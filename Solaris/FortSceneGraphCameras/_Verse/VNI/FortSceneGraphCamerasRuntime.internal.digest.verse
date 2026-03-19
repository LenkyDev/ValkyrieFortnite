# Module import path: /Fortnite.com/SceneGraphCameras/FortSceneGraphCameras
FortSceneGraphCameras<public> := module:
    using {/Verse.org/Assets}
    using {/Verse.org/SceneGraph/VerseCamera}
    @experimental
    fort_first_person_camera_operator_component<native><epic_internal> := class(camera_operator_component):
        UpdateCamera<override>(UpdateParameters:camera_operator_update_parameters):void = external {}

        CameraRigAsset<override>:camera_rig_asset = external {}

    @experimental
    fort_fixed_angle_camera_operator_component<native><epic_internal> := class(camera_operator_component):
        UpdateCamera<override>(UpdateParameters:camera_operator_update_parameters):void = external {}

        CameraRigAsset<override>:camera_rig_asset = external {}

    @experimental
    fort_fixed_point_camera_operator_component<native><epic_internal> := class(camera_operator_component):
        UpdateCamera<override>(UpdateParameters:camera_operator_update_parameters):void = external {}

        CameraRigAsset<override>:camera_rig_asset = external {}

    @experimental
    fort_orbit_camera_operator_component<native><epic_internal> := class(camera_operator_component):
        UpdateCamera<override>(UpdateParameters:camera_operator_update_parameters):void = external {}

        CameraRigAsset<override>:camera_rig_asset = external {}