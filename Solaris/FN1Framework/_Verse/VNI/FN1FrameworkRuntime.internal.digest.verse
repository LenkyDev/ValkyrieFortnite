# Module import path: /Fortnite.com/Framework/CVarUtils
CVarUtils<epic_internal> := module:
    IsCVarEnabled<native><epic_internal>(CVarName:string)<transacts><decides>:void

    GetCVarAsLogic<native><epic_internal>(CVarName:string)<transacts><decides>:logic

    GetCVarAsFloat<native><epic_internal>(CVarName:string)<transacts><decides>:float

    GetCVarAsInt<native><epic_internal>(CVarName:string)<transacts><decides>:int

# Module import path: /Fortnite.com/Framework/Analytics
Analytics<epic_internal> := module:
    using {/Verse.org/Simulation}
    # Base class for creating analytic events from Verse. This would be the only public api.
    analytics_framework_event_base<native><epic_internal> := class<persistent>:
        GetEventName<native_callable><epic_internal>():string = external {}

        Send<native><epic_internal>():void

        Send<native><epic_internal>(Agent:agent):void

    # Tags base class for creating analytic events to allow proper name and allow use of Tags to inject native data
    tags_analytics_event_base<native><epic_internal> := class<persistent>(analytics_framework_event_base):
        SendWithTags<native><epic_internal>(AddTags:[]string):void

        SendWithTags<native><epic_internal>(Agent:agent, AddTags:[]string):void

        Send<native><override>():void

        Send<native><override>(Agent:agent):void

        GetAgentId<native><epic_internal>(Agent:agent):string

    # Base class to inherit from to pass to analytics_attributes_request.AppendToAttributes to inject attributes in an analytics event
    analytics_attributes_base<native><epic_internal> := class<persistent>:


    # System to allow verse to listen for native analytic events to allow injection of custom data
    analytics_attributes_request<native><epic_internal> := class<persistent>:
        OnRequestAttributes<public>():listenable(tuple([string]agent)) = external {}

        AppendToAttributesTags<native><public>(AddTags:[]string):void

        AppendToAttributes<native><public>(FieldPrefix:string, Object:analytics_attributes_base):void

# Module import path: /Fortnite.com/Framework/AnalyticsHelper
AnalyticsHelper<epic_internal> := module:
    using {/Verse.org/Simulation}
    SendELOAnalyticForPlayer<native><epic_internal>(Player:player, MatchPoints:float, TeamPoints:float, IndividualPoints:float):void

# Module import path: /Fortnite.com/Framework/Matchmaking
Matchmaking<epic_internal> := module:
    using {/Verse.org/Simulation}
    # A player agent method to play again.
    (InAgent:agent).PlayAgain<native><epic_internal>():void

    # A player agent method indicating ready for matchmaking (used w/ PlayAgain).
    (InAgent:agent).SetReadyForMatchmaking<native><epic_internal>(IsReady:logic):void