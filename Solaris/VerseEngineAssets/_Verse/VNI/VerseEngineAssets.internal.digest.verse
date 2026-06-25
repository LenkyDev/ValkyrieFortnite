# Module import path: /UnrealEngine.com/BasicShapes
BasicShapes<public> := module:
    using {/Verse.org/Assets}
    using {/Verse.org/SceneGraph}
    cube<public> := class<final><public>(mesh_component):
        Mesh<override>:mesh = external {}

    sphere<public> := class<final><public>(mesh_component):
        Mesh<override>:mesh = external {}

    plane<public> := class<final><public>(mesh_component):
        Mesh<override>:mesh = external {}

    cone<public> := class<final><public>(mesh_component):
        Mesh<override>:mesh = external {}

    cylinder<public> := class<final><public>(mesh_component):
        Mesh<override>:mesh = external {}

@deprecated
# Module import path: /UnrealEngine.com/SceneGraph
(/UnrealEngine.com:)SceneGraph<public> := module:
