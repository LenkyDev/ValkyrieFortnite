using {/Verse.org/Native}
llm_fact<native><epic_internal> := class(cancelable):
    Cancel<native><override>()<transacts>:void

llm_string<native><epic_internal> := class:
    Value<native><epic_internal>:string

MakeLLMString<native_callable><epic_internal>(String:string):llm_string = external {}

MakeLLMStringMessage<localizes><native_callable><epic_internal>(LLMString:llm_string):message = external {}

localizable_llm_string<native><epic_internal> := class(localizable_value):
    Value<native><epic_internal>:string

(/UnrealEngine.com/RuntimeAI:)MakeLocalizableValue<epic_internal>(V:llm_string):localizable_llm_string = external {}

@available {MinUploadedAtFNVersion := 4000}
@experimental
# Base interface for retrieving the content in a slot on a prompt template at runtime.
prompt_slot_provider<native><epic_internal> := interface:
    # Returns the prompt as a string
    GetSlotContents<native_callable><public>()<allocates><reads>:string

@available {MinUploadedAtFNVersion := 4000}
@experimental
# Basic implementation of the prompt slot provider, which just returns a string
basic_prompt_slot<native><epic_internal> := class(prompt_slot_provider):
    # The content as a string
    var Contents<native><public>:string = external {}

    # Returns the prompt string
    GetSlotContents<native><override>()<allocates><reads>:string

@available {MinUploadedAtFNVersion := 4000}
@experimental
# Implementation of the prompt slot provider which is able to send encoded messages (output from the LLM) back to the LLM.
message_prompt_slot<native><epic_internal> := class(prompt_slot_provider):
    # The content as a message
    var Contents<native><public>:message = external {}

    # If the message is encoded, calls to GetSlotContents from verse will be encoded, yet be clear when the prompt is sent to LLM.
    GetSlotContents<native><override>()<allocates><reads>:string

@available {MinUploadedAtFNVersion := 4000}
@experimental
# Join the output from multiple prompt providers together
aggregate_prompt_slot<native><epic_internal> := class(prompt_slot_provider):
    # The prompt slot providers which have their contents concatenated with a newline.
    var PromptSlotProviders<native><public>:[]prompt_slot_provider = external {}

    # The contents from each slot provider output as a single string.
    GetSlotContents<native><override>()<allocates><reads>:string