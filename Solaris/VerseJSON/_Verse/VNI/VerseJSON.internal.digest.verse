value<native><public> := class:
    # Retrieve an object value or fail if value is not a json object
    AsObject<native><public>()<transacts><decides>:[string]value

    # Retrieve an array value or fail if value is not a json array
    AsArray<native><public>()<transacts><decides>:[]value

    # Retrieve an integer value or fail if value is not a json number
    AsInt<native><public>()<transacts><decides>:int

    # Retrieve a float value or fail if value is not a json number
    AsFloat<native><public>()<transacts><decides>:float

    # Retrieve an object value or fail if value is not a string
    AsString<native><public>()<transacts><decides>:string

    # Retrieve an object value or fail if value is not null
    AsNull<native><public>()<transacts><decides>:void

# Parse a JSON string returning a value with its contents
Parse<native><public>(JSONString:string)<transacts><decides>:value