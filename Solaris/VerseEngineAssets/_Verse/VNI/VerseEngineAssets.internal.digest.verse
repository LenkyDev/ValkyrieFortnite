using {/Verse.org/Assets}
using {/Verse.org/SceneGraph}
# Module import path: /UnrealEngine.com/BasicShapes
BasicShapes<public> := module:
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