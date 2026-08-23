# Verse path: /UnrealEngine.com/WebAPI
# Usage:
#     Licensed users create a derived version of `client_id` in their module.
#     The Verse class path for your derived `client_id` is then used as the 
#     configuration key in your backend service to map to your endpoint.
# 
#     WARNING: do not make your derived `client_id` class public. This object
#     type is your private key to your backend.
# 
# Example:
#     my_client_id<internal> := class<final><computes>(client_id)
#     MyClient<internal> := MakeClient(my_client_id)
client_id<native><public> := class<abstract><computes>:


client<native><public> := class<final><computes><internal>:
    Get<native><public>(Path:string)<suspends>:response

response<native><public> := class<internal>:


body_response<native><public> := class<internal>(response):
    GetBody<native><public>()<computes>:string

MakeClient<native><public>(ClientId:client_id)<converges>:client