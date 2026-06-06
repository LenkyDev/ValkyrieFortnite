using {/Verse.org/Native}
@available {MinUploadedAtFNVersion := 4100}
@experimental
@attribscope_data
@customattribhandler
llm_description_attribute<public> := class<computes><internal>(attribute):
    Description<public>:string

@available {MinUploadedAtFNVersion := 4100}
@experimental
llm_description<constructor><public>(Description:string)<computes>:llm_description_attribute = external {}