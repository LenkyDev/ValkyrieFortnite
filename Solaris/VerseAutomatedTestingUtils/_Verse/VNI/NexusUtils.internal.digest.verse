# Module import path: /UnrealEngine.com/Tests/NexusUtils
NexusUtils<public> := module:
    nexus_utils<native><epic_internal> := class:
        PrintEpicAPIFunctionLog<native><public>():void

        # Takes a screenshot on clients that are connected to the server this is called onPasses in the file name of the screenshot that gets saved to a fixed directory
        ScreenshotAllClients<native><epic_internal>(ScreenshotFileName:string):void

        # Reads a file at a given path, returns a string array. Optionally prepends path to executables 'Saved' directory
        ReadFile<native><epic_internal>(FilePath:[]string)<transacts><decides>:[]string

        # Writes a string array of lines to a file at a given path. Optionally prepends path to executables 'Saved' directory
        WriteFile<native><epic_internal>(FilePath:[]string, Lines:[]string)<transacts>:void

        GetSavedDir<native><epic_internal>():string

        # Force a client garbage collection for all connected clients
        ForceGarbageCollectionOnAllClients<native><epic_internal>():void

        # Call a console command on all clients
        ExecuteConsoleCommandOnAllClients<native><epic_internal>(ConsoleCommand:string):void