# Verse path: /Fortnite.com/Devices
using {/Verse.org/SceneGraph}
using {/Verse.org/Native}
@import_as("/Script/FortniteGame.ULevelSaveRecord")
@experimental
level_save_record<native><epic_internal> := class<epic_internal>:


@experimental
bridge_component<native><epic_internal> := class<final><final_super>(component):
    OnInitializedInternal<native><override>():void

    OnUninitializingInternal<native><override>():void

    OnAddedToSceneInternal<native><override>():void

    @experimental
    AsCreativeDevice<public>(creative_device_type:subtype(creative_device_base))<suspends>:?creative_device_type = external {}