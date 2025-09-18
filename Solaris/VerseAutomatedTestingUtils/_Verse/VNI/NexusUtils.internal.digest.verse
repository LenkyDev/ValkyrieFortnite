# Module import path: /UnrealEngine.com/Tests/NexusUtils
NexusUtils<public> := module:
    nexus_utils<native><epic_internal> := class:
        PrintEpicAPIFunctionLog<native><public>():void

        # Takes a screenshot on clients that are connected to the server this is called onPasses in the file name of the screenshot that gets saved to a fixed directory
        ScreenshotAllClients<native><epic_internal>(ScreenshotFileName:string):void