using {/Verse.org/Native}
using {/Verse.org/Simulation}
using {/Verse.org/Presentation}
using {/Verse.org/Assets}
join_quest_error<native><public> := class<epic_internal>:


abandon_quest_error<native><public> := class<epic_internal>:


quest<native><public> := class<abstract><castable><epic_internal>(has_icon, has_description):
    Complete<native><final><public>():void

    IsComplete<native><final><public>()<reads><decides>:void

    JoinEvent<native><final><epic_internal>:listenable(tuple(quest, user)) = external {}

    AbandonEvent<native><final><epic_internal>:listenable(tuple(quest, user)) = external {}

    CompleteEvent<native><final><epic_internal>:listenable(quest) = external {}

GetQuests<native><epic_internal>(User:user)<reads>:[]quest

@available {MinUploadedAtFNVersion := 4000}
JoinQuest<native><epic_internal>(User:user, Quest:quest)<transacts>:result(void, []join_quest_error)

@available {MinUploadedAtFNVersion := 4000}
AbandonQuest<native><epic_internal>(User:user, Quest:quest)<transacts>:result(void, []abandon_quest_error)