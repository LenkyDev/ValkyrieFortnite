using {/UnrealEngine.com/Temporary/SceneGraph}
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
    AsCreativeDevice<public>(Type:subtype(creative_device_base))<suspends>:?Type = external {}