using {/Verse.org/Progression}
progress_quest<native><public> := class<abstract><epic_internal>(quest):
    GetProgress<native><final><public>()<reads>:int

    SetProgress<native><final><public>(Amount:int):void

    RequiredCount<native><public>:int

    ProgressEvent<native><final><public>:listenable(tuple(quest, int)) = external {}