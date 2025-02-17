using {/Verse.org/Assets}
using {/UnrealEngine.com/Temporary/SceneGraph}
# Module import path: /UnrealEngine.com/BasicShapes
BasicShapes<public> := module:
    @experimental
    cube<public> := class<final><public>(mesh_component):
        Mesh<override>:mesh = external {}

    @experimental
    sphere<public> := class<final><public>(mesh_component):
        Mesh<override>:mesh = external {}

    @experimental
    plane<public> := class<final><public>(mesh_component):
        Mesh<override>:mesh = external {}

    @experimental
    cone<public> := class<final><public>(mesh_component):
        Mesh<override>:mesh = external {}

    @experimental
    cylinder<public> := class<final><public>(mesh_component):
        Mesh<override>:mesh = external {}