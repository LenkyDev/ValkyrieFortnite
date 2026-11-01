# Verse path: /UnrealEngine.com
# Module import path: /UnrealEngine.com/ComponentTestSuite
ComponentTestSuite<public> := module:
    using {/Verse.org/Simulation}
    using {/Verse.org/SceneGraph}
    @hide_in_editor
    test_component_key_component_base<native><epic_internal> := class<final_super>(component):


    @hide_in_editor
    test_component_key_component_a<native><epic_internal> := class(test_component_key_component_base):


    @hide_in_editor
    test_component_key_component_b<native><epic_internal> := class(test_component_key_component_base):


    stress_primitive_type<native><epic_internal> := enum:
        Line
        Point
        Sphere
        Box
        Capsule
        Cylinder
        Cone
        Circle
        Arrow
        Mesh

    @experimental
    debug_draw_validation_component<native><epic_internal> := class<final_super>(component):
        @editable
        @editable
        @tool_tip("Acts as a button: tick to flip every per-row toggle (VLog Rows + DrawDebug Helper Rows). If any row is currently enabled, toggles all rows OFF; otherwise toggles all rows ON. Group switches (EnableVLogRows / EnableHelperRows) are independent gates and are NOT flipped by this action - confirm both are on if Toggle All appears to have no visible effect. Automatically resets to false after the action.")
        @display_name("Toggle All")
        @category("Primary Overrides")
        ToggleAllRows<native><epic_internal>:logic = external {}

        @editable
        @tool_tip("Group-level switch for the UE_VLOG_* row group. When false, none of the VLog rows render even if their individual toggles are on. Independent of the helper-row group switch so the two paths can be A/B tested in isolation.")
        @category("Primary Overrides")
        EnableVLogRows<native><epic_internal>:logic = external {}

        @editable
        @tool_tip("Group-level switch for the DrawDebug* helper row group. When false, none of the helper rows render even if their individual toggles are on. Pair with DrawDebugHelpers.UseShaderPipeline to A/B the LineBatcher vs UE::DebugDraw::* paths in isolation.")
        @category("Primary Overrides")
        EnableHelperRows<native><epic_internal>:logic = external {}

        @editable
        @tool_tip("Draw the UE_VLOG_LOCATION row (thickness 1 and 5, alpha 255 and 128).")
        @category("VLog Rows")
        DrawVLogLocation<native><epic_internal>:logic = external {}

        @editable
        @tool_tip("Draw the UE_VLOG_SPHERE / UE_VLOG_WIRESPHERE row.")
        @category("VLog Rows")
        DrawVLogSphere<native><epic_internal>:logic = external {}

        @editable
        @tool_tip("Draw the UE_VLOG_BOX / UE_VLOG_WIREBOX row.")
        @category("VLog Rows")
        DrawVLogBox<native><epic_internal>:logic = external {}

        @editable
        @tool_tip("Draw the UE_VLOG_OBOX / UE_VLOG_WIREOBOX row.")
        @category("VLog Rows")
        DrawVLogOBox<native><epic_internal>:logic = external {}

        @editable
        @tool_tip("Draw the UE_VLOG_CONE / UE_VLOG_WIRECONE row.")
        @category("VLog Rows")
        DrawVLogCone<native><epic_internal>:logic = external {}

        @editable
        @tool_tip("Draw the UE_VLOG_CYLINDER / UE_VLOG_WIRECYLINDER row.")
        @category("VLog Rows")
        DrawVLogCylinder<native><epic_internal>:logic = external {}

        @editable
        @tool_tip("Draw the UE_VLOG_CAPSULE / UE_VLOG_WIRECAPSULE row.")
        @category("VLog Rows")
        DrawVLogCapsule<native><epic_internal>:logic = external {}

        @editable
        @tool_tip("Draw the UE_VLOG_SEGMENT / UE_VLOG_SEGMENT_THICK row.")
        @category("VLog Rows")
        DrawVLogSegment<native><epic_internal>:logic = external {}

        @editable
        @tool_tip("Draw the UE_VLOG_ARROW / UE_VLOG_ARROW_MAG row.")
        @category("VLog Rows")
        DrawVLogArrow<native><epic_internal>:logic = external {}

        @editable
        @tool_tip("Draw the UE_VLOG_CIRCLE / UE_VLOG_CIRCLE_THICK row (solid discs).")
        @category("VLog Rows")
        DrawVLogCircle<native><epic_internal>:logic = external {}

        @editable
        @tool_tip("Draw the UE_VLOG_WIRECIRCLE / UE_VLOG_WIRECIRCLE_THICK row (wire discs).")
        @category("VLog Rows")
        DrawVLogWireCircle<native><epic_internal>:logic = external {}

        @editable
        @tool_tip("Draw the UE_VLOG_PULLEDCONVEX row (extruded convex).")
        @category("VLog Rows")
        DrawVLogPulledConvex<native><epic_internal>:logic = external {}

        @editable
        @tool_tip("Draw the UE_VLOG_MESH row (indexed triangle mesh).")
        @category("VLog Rows")
        DrawVLogMesh<native><epic_internal>:logic = external {}

        @editable
        @tool_tip("Draw the UE_VLOG_CONVEXPOLY row (2D convex polygon).")
        @category("VLog Rows")
        DrawVLogConvexPoly<native><epic_internal>:logic = external {}

        @editable
        @tool_tip("Draw the UE_VLOG_COORDINATESYSTEM row (3-axis gizmo).")
        @category("VLog Rows")
        DrawVLogCoordinateSystem<native><epic_internal>:logic = external {}

        @editable
        @tool_tip("Draw the UE_VLOG_WORLDTEXT row (world-anchored text labels).")
        @category("VLog Rows")
        DrawVLogWorldText<native><epic_internal>:logic = external {}

        @editable
        @tool_tip("Draw the DrawDebugLine row. Exercises the legacy DrawDebug* helper short-circuit into UE::DebugDraw::* (toggle DrawDebugHelpers.UseShaderPipeline 1 to route through the shader pipeline).")
        @category("DrawDebug Helper Rows")
        DrawDebugLineHelper<native><epic_internal>:logic = external {}

        @editable
        @tool_tip("Draw the DrawDebugPoint row. Exercises the legacy DrawDebug* helper short-circuit into UE::DebugDraw::* (toggle DrawDebugHelpers.UseShaderPipeline 1 to route through the shader pipeline).")
        @category("DrawDebug Helper Rows")
        DrawDebugPointHelper<native><epic_internal>:logic = external {}

        @editable
        @tool_tip("Draw the DrawDebugSphere row above the UE_VLOG_SPHERE row.")
        @category("DrawDebug Helper Rows")
        DrawDebugSphereHelper<native><epic_internal>:logic = external {}

        @editable
        @tool_tip("Draw the DrawDebugBox row above the UE_VLOG_BOX row (axis-aligned variant via FQuat::Identity).")
        @category("DrawDebug Helper Rows")
        DrawDebugBoxHelper<native><epic_internal>:logic = external {}

        @editable
        @tool_tip("Draw the DrawDebugCapsule row above the UE_VLOG_CAPSULE row.")
        @category("DrawDebug Helper Rows")
        DrawDebugCapsuleHelper<native><epic_internal>:logic = external {}

        @editable
        @tool_tip("Draw the DrawDebugCylinder row above the UE_VLOG_CYLINDER row.")
        @category("DrawDebug Helper Rows")
        DrawDebugCylinderHelper<native><epic_internal>:logic = external {}

        @editable
        @tool_tip("Draw the DrawDebugCone row above the UE_VLOG_CONE row.")
        @category("DrawDebug Helper Rows")
        DrawDebugConeHelper<native><epic_internal>:logic = external {}

        @editable
        @tool_tip("Draw the DrawDebugDirectionalArrow row above the UE_VLOG_ARROW row.")
        @category("DrawDebug Helper Rows")
        DrawDebugArrowHelper<native><epic_internal>:logic = external {}

        @editable
        @tool_tip("Draw the DrawDebugCoordinateSystem row above the UE_VLOG_COORDINATESYSTEM row.")
        @category("DrawDebug Helper Rows")
        DrawDebugCoordSystemHelper<native><epic_internal>:logic = external {}

        @editable
        @tool_tip("Draw the DrawDebugCrosshairs row stacked above the DrawDebugCoordinateSystem row.")
        @category("DrawDebug Helper Rows")
        DrawDebugCrosshairsHelper<native><epic_internal>:logic = external {}

        @editable
        @tool_tip("Draw the DrawDebugSolidBox row stacked above the DrawDebugBox row (solid AABB variant).")
        @category("DrawDebug Helper Rows")
        DrawDebugSolidBoxHelper<native><epic_internal>:logic = external {}

        @editable
        @tool_tip("Draw the DrawDebugCircle row above the UE_VLOG_WIRECIRCLE row (cols 2/3 exercise bDrawAxis).")
        @category("DrawDebug Helper Rows")
        DrawDebugCircleHelper<native><epic_internal>:logic = external {}

        @editable
        @tool_tip("Draw the DrawDebugCamera row (composite of DrawDebugCoordinateSystem + DrawDebugBox + 8x DrawDebugLine; auto-migrates through sub-call fast paths).")
        @category("DrawDebug Helper Rows")
        DrawDebugCameraHelper<native><epic_internal>:logic = external {}

        @editable
        @tool_tip("Draw the DrawDebugSolidBox(FBox+FTransform) row above the UE_VLOG_OBOX row. All 4 cols share the same yaw + extent matching the OBox VLog row for column-by-column A/B parity; only alpha varies.")
        @category("DrawDebug Helper Rows")
        DrawDebugSolidBoxTransformHelper<native><epic_internal>:logic = external {}

        @editable
        @tool_tip("Draw the DrawDebugMesh row above the UE_VLOG_MESH row (tetrahedron).")
        @category("DrawDebug Helper Rows")
        DrawDebugMeshHelper<native><epic_internal>:logic = external {}

        @editable
        @tool_tip("Draw the DrawDebugAltCone row (sparse rect-pyramid; 20 lines).")
        @category("DrawDebug Helper Rows")
        DrawDebugAltConeHelper<native><epic_internal>:logic = external {}

        @editable
        @tool_tip("Draw the DrawDebug2DDonut row (two concentric rings + 4 radial connectors).")
        @category("DrawDebug Helper Rows")
        DrawDebug2DDonutHelper<native><epic_internal>:logic = external {}

        @editable
        @tool_tip("Draw the DrawDebugCircleArc row (N-segment polyline arc).")
        @category("DrawDebug Helper Rows")
        DrawDebugCircleArcHelper<native><epic_internal>:logic = external {}

        @editable
        @tool_tip("Draw the DrawDebugSolidPlane row (quad + normal arrow; auto-migrates via DrawDebugMesh + DrawDebugDirectionalArrow).")
        @category("DrawDebug Helper Rows")
        DrawDebugSolidPlaneHelper<native><epic_internal>:logic = external {}

        @editable
        @tool_tip("Draw the thick-shaft DrawDebugDirectionalArrow row. Validates the shaft/fin Thickness now routed through the sink; previously thick arrows fell back to the LineBatcher.")
        @category("DrawDebug Helper Rows")
        DrawDebugArrowThickHelper<native><epic_internal>:logic = external {}

        @editable
        @tool_tip("Draw the elliptical DrawDebugCircle row (non-uniform Y/Z axes). Validates the DrawEllipse primitive; previously non-uniform circles fell back to the LineBatcher.")
        @category("DrawDebug Helper Rows")
        DrawDebugEllipseHelper<native><epic_internal>:logic = external {}

        @editable
        @tool_tip("Draw the elliptical DrawDebug2DDonut row (non-uniform Y/Z axes). Validates the DrawEllipse-backed donut rings for non-uniform scale.")
        @category("DrawDebug Helper Rows")
        DrawDebug2DDonutEllipseHelper<native><epic_internal>:logic = external {}

        @editable
        @tool_tip("Draw the DrawDebugCircleArc row using the Direction overload. Validates the direction-basis arc path (the FQuat overload is covered by DrawDebugCircleArcHelper).")
        @category("DrawDebug Helper Rows")
        DrawDebugCircleArcDirHelper<native><epic_internal>:logic = external {}

        @editable
        @tool_tip("Number of times to replicate the entire grid stacked in +Z. 1 = single grid (default). Higher values scale the per-frame draw count linearly for A/B perf measurement. Pair with DrawDebugHelpers.UseShaderPipeline.")
        @category("Stress")
        StressMultiplier<native><epic_internal>:int = external {}

        @editable
        @tool_tip("Primitive type for the stress workload. Editor surfaces a dropdown of the stress_primitive_type enum.")
        @category("Stress")
        StressPrimitiveType<native><epic_internal>:stress_primitive_type = external {}

        @editable
        @tool_tip("Number of stress primitives to draw per frame (in addition to the grid). 0 disables. Use thousands to isolate per-primitive cost.")
        @category("Stress")
        StressPrimitiveCount<native><epic_internal>:int = external {}

        @editable
        @tool_tip("Alpha applied to every stress primitive\'s color. 255 (default) routes through the WD-Opaque tier; below 255 routes through WD-Translucent, exercising the per-view-family camera-sorted upload. Overlap primitives (high count, small volume) and compare blend order across differently-oriented viewports. Only observable on the shader pipeline - the LineBatcher fallback renders lines opaque regardless.")
        @category("Stress")
        StressPrimitiveAlpha<native><epic_internal>:int = external {}

        @editable
        @tool_tip("Half-extent of the bounded cube the stress workload spawns into, in world units (cm). Positions are deterministic across runs so A/B measurements compare like for like.")
        @category("Stress")
        StressVolumeRadius<native><epic_internal>:float = external {}