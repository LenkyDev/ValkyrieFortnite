# Verse path: /Verse.org/Verse
using {/Verse.org/Native}
using {/Verse.org/Simulation}
@available {MinUploadedAtFNVersion := 4300}
@experimental
timer<public> := class(clock, playable):
    @editable
    ReferenceClock<public>:clock

    @editable
    var PlayRate<public>:float = external {}

    @editable
    var StartSeconds<public>:float = external {}

    @editable
    var EndSeconds<public>:float = external {}

    SetSeconds<public>(NewSeconds:float):void = external {}

    GetSeconds<override><final>()<reads>:float = external {}

    Play<override>():void = external {}

    Pause<override>():void = external {}

    Resume<override>():void = external {}

    Stop<override>():void = external {}