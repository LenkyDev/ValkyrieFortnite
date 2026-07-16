using {/Verse.org/Native}
@available {MinUploadedAtFNVersion := 4100}
@attribscope_data
@customattribhandler
ai_description_attribute<public> := class<computes><internal>(attribute):
    Description<public>:string

@available {MinUploadedAtFNVersion := 4100}
ai_description<constructor><public>(Description:string)<computes>:ai_description_attribute = external {}