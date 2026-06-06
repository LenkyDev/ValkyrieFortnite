llm_fact<native><epic_internal> := class(cancelable):
    Cancel<native><override>()<transacts>:void

llm_string<native><epic_internal> := class:
    Value<native><epic_internal>:string

MakeLLMString<native_callable><epic_internal>(String:string):llm_string = external {}

MakeLLMStringMessage<localizes><native_callable><epic_internal>(LLMString:llm_string):message = external {}

localizable_llm_string<native><epic_internal> := class(localizable_value):
    Value<native><epic_internal>:string

(/UnrealEngine.com/Conversations:)MakeLocalizableValue<epic_internal>(V:llm_string):localizable_llm_string = external {}