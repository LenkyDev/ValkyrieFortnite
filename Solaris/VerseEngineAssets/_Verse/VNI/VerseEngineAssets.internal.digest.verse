# Module import path: /UnrealEngine.com/BasicShapes
BasicShapes<public> := module:
    using {/Verse.org/Assets}
    using {/Verse.org/SceneGraph}
    body_part<epic_internal> := class<epic_internal>(mesh_part, has_collision, has_dynamics):


    cube<public> := class<final><public>(mesh_component):
        Mesh<override>:mesh = external {}

        Body<epic_internal>:body_part = external {}

    sphere<public> := class<final><public>(mesh_component):
        Mesh<override>:mesh = external {}

        Body<epic_internal>:body_part = external {}

    plane<public> := class<final><public>(mesh_component):
        Mesh<override>:mesh = external {}

    cone<public> := class<final><public>(mesh_component):
        Mesh<override>:mesh = external {}

    cylinder<public> := class<final><public>(mesh_component):
        Mesh<override>:mesh = external {}