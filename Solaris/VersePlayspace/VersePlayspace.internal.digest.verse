using {/Verse.org/Simulation}
using {/UnrealEngine.com/Temporary/SceneGraph}
# Module import path: /UnrealEngine.com/Playspace
Playspace<public> := module:
    @hide_in_editor
    @experimental
    playspace_association_component<native><epic_internal> := class<final_super><epic_internal>(component, simulation_entity_interop_handler):
        Initialize<native><override><native_callable>(IteropObject:simulation_interop_object):void