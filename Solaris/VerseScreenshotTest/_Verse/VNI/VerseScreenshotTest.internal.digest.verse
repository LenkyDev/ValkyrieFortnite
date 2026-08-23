# Verse path: /Fortnite.com/VerseScreenshotTest
using {/Verse.org/Simulation}
using {/Verse.org/Assets}
using {/Verse.org/SceneGraph}
screenshot_test_component<native><epic_internal> := class(mesh_component):
    Mesh<override>:mesh = external {}

    @editable_slider(float) {MinValue := option {0.000000}}
    Delay<native><epic_internal>:float = external {}

    @editable_slider(float) {MinValue := option {1.000000}}
    Timeout<native><epic_internal>:float = external {}

    @editable
    ShowUI<native><epic_internal>:logic = external {}

    @editable
    HdrScreenshot<native><epic_internal>:logic = external {}

    @editable
    ScreenshotTestFileName<native><epic_internal>:string = external {}

    # Listenable which is signaled when a screenshot has been taken.
    #  Tuple payload: 0: whether the screenshot was taken successfully or not
    #                 1: the average exposure value
    #                 2: the average luminance value
    #                 3: the name of the screenshot
    #                 4: any error messages if the screenshot failed to be captured
    ScreenshotTakenEvent<native><epic_internal>:listenable(tuple(logic, float, float, string, string)) = external {}

    # Requests a screenshot test to be performed for the specified agent
    RequestClientScreenshotTest<native><final><epic_internal>(Agent:agent)<transacts><decides>:void

    # Performs any setup needed for the screenshot test to execute
    Setup<native_callable><epic_internal>()<transacts><decides>:void = external {}

    # Performs the screenshot test on the first player found in the world
    PerformScreenshotTestRequest<native_callable><final><epic_internal>(?TargetAgent:?agent = external {})<transacts><decides>:void = external {}

    # Performs any cleanup to on the executed test
    TearDown<native_callable><epic_internal>()<transacts>:void = external {}

screenshot_test_runner_component<native><epic_internal> := class<final_super>(mesh_component):
    Mesh<override>:mesh = external {}

    @editable_slider(float) {MinValue := option {0.000000}}
    Delay<native><epic_internal>:float = external {}

    @editable_slider(float) {MinValue := option {1.000000}}
    Timeout<native><epic_internal>:float = external {}

    # Listenable which is signaled when a screenshot test has been processed.
    ScreenshotTestProcessedEvent<native><epic_internal>:listenable(tuple()) = external {}