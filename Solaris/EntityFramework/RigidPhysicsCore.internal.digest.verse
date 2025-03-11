using {/Verse.org/SpatialMath}
@experimental
# Specifies how a collision volume pair should interact. See collision_profile.
collision_interaction<native><public> := enum:
    # The pair will not be detected by Overlap and Sweep queries. The pair will not collide in the physics simulation.
    Ignore
    # The pair will be detected by Overlap and Sweep queries. The pair will not collide in the physics simulation.
    Overlap
    # The pair will be detected by Overlap and Sweep queries. The pair will collide in the physics simulation.
    Block

@experimental
# Every volume has a collision channel as part of its collision_profile. It is used to determine how two volumes interact. See collision_profile.
collision_channel<native><public> := class<concrete><epic_internal>:


@experimental
# An alias for the function type used to map a collision_channel to a collision_interaction used by  collision_profile.
collision_channel_to_interaction<public> := type {_(:collision_channel)<computes>:collision_interaction}

@experimental
DefaultChannelToInteraction<epic_internal>(__dupe___unnamed_parameter_47:collision_channel)<computes>:collision_interaction = external {}

@experimental
# A collision profile determines how a volume interacts with other volumes for Overlap queries, Sweep queries, and physics simulation. When two volumes are being tested to see how they interact, the algorithm looks like this:
#    GetInteraction(A:collision_profile, B:collision_profile):collision_interaction = 
#        InteractionA = B.GetChannelInteraction(A.Channel) 
#        InteractionB = A.GetChannelInteraction(B.Channel) 
#        return Min(InteractionA, InteractionB) 
collision_profile<native><public> := class<concrete>:
    # The collision channel for the owning object.
    Channel<native><public>:collision_channel = external {}

    # How the owning object should interact with other objects.GetChannelInteraction is a function which maps a collision_channel to a collision_interaction. It can be implemented as an simple sequence of if statements. For example, to block all channels except camera:
    #     BlockAllIgnoreCamera(Channel:collision_channel)<computes>:collision_interaction =
    #         if (collision_channels.camera[Channel]):
    #             return collision_interaction.Ignore
    #         return collision_interaction.Block
    #     MyProfile<public>:collision_profile = MakeCollisionProfile(collision_channels.dynamic, BlockAllIgnoreCamera)
    GetChannelInteraction<native><public>:collision_channel_to_interaction = external {}

@experimental
# Create a collision_profile. See the collision_profiles module.
MakeCollisionProfile<native><public>(channel_type:subtype(collision_channel), ChannelToInteraction:collision_channel_to_interaction)<converges>:collision_profile

# Module import path: /Verse.org/SceneGraph/collision_channels
# The set of built-in collision_channels. This is a closed set for now.
(/Verse.org/SceneGraph:)collision_channels<public> := module:
    @experimental
    stationary<native><public> := class(collision_channel):


    @experimental
    dynamic<native><public> := class(collision_channel):


    @experimental
    avatar<native><public> := class(collision_channel):


    @experimental
    visibility<native><public> := class(collision_channel):


    @experimental
    camera<native><public> := class(collision_channel):


    @experimental
    physics<native><public> := class(collision_channel):


# Module import path: /Verse.org/SceneGraph/collision_profiles
# A set of useful collision profiles. New profiles can be created in Verse code
(/Verse.org/SceneGraph:)collision_profiles<public> := module:
    @experimental
    # Stationary collision channel, Ignore all channels
    StationaryIgnoreAll<public>:collision_profile = external {}

    @experimental
    # Stationary collision channel, Overlap all channels
    StationaryOverlapAll<public>:collision_profile = external {}

    @experimental
    # Stationary collision channel, Block all channels
    StationaryBlockAll<public>:collision_profile = external {}

    @experimental
    # Dynamic collision channel, Ignore all channels
    DynamicIgnoreAll<public>:collision_profile = external {}

    @experimental
    # Dynamic collision channel, Overlap all channels
    DynamicOverlapAll<public>:collision_profile = external {}

    @experimental
    # Dynamic collision channel, Block all channels
    DynamicBlockAll<public>:collision_profile = external {}

    @experimental
    # Stationary collision channel, Block all channels except visibility (used for e.g., invisible wall, glass)
    StationaryBlockVisible<public>:collision_profile = external {}

    @experimental
    # Visibility collision channel, Overlap all channel (used for e.g., visibility testing)
    VisibilityOverlapAll<public>:collision_profile = external {}

@experimental
# The results of an overlap query. See entity.FindOverlapHits(). We will get one overlap_hit for each intersection of any volume in SourceVolumes with any other volume.
overlap_hit<native><public> := struct:
    # The source component and volume (query input). For compound inputs (like an entity hierarchy) this will be a component/volume in that hierarchy. The SourceTransform is the transform of SourceVolume used for the overlap test. For single volume inputs like a sphere, the Source volume and transform are just the inputs to the overlap test, and the component is false.
    SourceComponent<native><public>:?component

    # The source volume (query input)
    SourceVolume<native><public>:collision_volume

    # The source volume transform
    SourceGlobalTransform<native><public>:(/Verse.org/SpatialMath:)transform

    # The component that was hit by SourceVolume
    TargetComponent<native><public>:component

    # The volume that was hit by SourceVolume
    TargetVolume<native><public>:collision_element

@experimental
# The results of a sweep query. See entity.FindSweepHits(). We will get one sweep_hit for each intersection of any volume in SourceVolumes with any other volume.
sweep_hit<native><public> := struct:
    # The source component and volume (query input). For compound inputs (like an entity hierarchy) this will be a component/volume in that hierarchy. The SourceGlobalTransform is the transform of SourceVolume at the start of the sweep. For single volume inputs like a sphere, the volume and transform are just the inputs to the sweep, and the component is false.
    SourceComponent<native><public>:?component

    # The source volume (query input).
    SourceVolume<native><public>:collision_volume

    # The source volume transform at the start of the sweep.
    SourceStartGlobalTransform<native><public>:(/Verse.org/SpatialMath:)transform

    # The world-space translation (relative to SourceStartGlobalTransform) of SourceVolume when it touches TargetVolume.
    SourceHitTranslation<native><public>:(/Verse.org/SpatialMath:)vector3 = external {}

    # The Distance along the sweep at which SourceVolume touches TargetVolume.
    SourceHitDistance<native><public>:float = external {}

    # The component that was hit by SourceVolume.
    TargetComponent<native><public>:component

    # The volume that was hit by SourceVolume.
    TargetVolume<native><public>:collision_element

    # The point of contact between SourceVolume and TargetVolume.
    ContactPosition<native><public>:(/Verse.org/SpatialMath:)vector3 = external {}

    # The normal on TargetVolume at the HitPosition.
    ContactNormal<native><public>:(/Verse.org/SpatialMath:)vector3 = external {}

    # If TargetVolume is a polygonal object (mesh, convex hull, etc.) and the contact point is on an edge or vertex, this is the most-opposing face normal of the faces that share that edge or vertex. Otherwise it is the same as HitNormal.
    ContactFaceNormal<native><public>:(/Verse.org/SpatialMath:)vector3 = external {}

@experimental
# Collision Volumes represent the collision shapes of meshes. They can be detected by Overlap and Sweep queries and generate collisions in the physics simulation.
collision_volume<native><public> := class<abstract>:
    @experimental
    # Enable/disable collision on this volume.
    var Collideable<public>:logic = external {}

    @experimental
    # Enable/disable spatial queries against this volume.
    var Queryable<public>:logic = external {}

    # Get the transform of this volume in the space of its owner (usually a component on an entity)
    GetLocalTransform<public>()<transacts>:(/Verse.org/SpatialMath:)transform = external {}

    # Set the transform of this volume in the space of its owner (usually a component on an entity)
    SetLocalTransform<public>(NewLocalTransform:(/Verse.org/SpatialMath:)transform)<transacts>:void = external {}

@experimental
# Base class for collision_volumes that consist of a single volume with a single collision_profile and collision_material for the whole volume. This covers most volume types used in queries and physics, except compound types like a mesh. A query will always return an element rather than a general volume. For example when colliding with a mesh, the element will be a collision_triangle, which is a collision_element and has a single material, rather than a collision_triangle_mesh, which is not an element and has a material palette.
collision_element<native><public> := class<abstract>(collision_volume):
    @experimental
    # The collision_profile for this volume.
    var CollisionProfile<public>:collision_profile = external {}

@experimental
# A collision capsule aligned along the Z axis.
collision_capsule<native><public> := class(collision_element):
    # The radius of the capsule
    var Radius<public>:float = external {}

    # The length of the capsule's cylindrical section (distance between the two end cap centers)
    var Length<public>:float = external {}

@experimental
# A collision sphere.
collision_sphere<native><public> := class(collision_element):
    # The radius of the sphere
    var Radius<public>:float = external {}

@experimental
# A collision point.
collision_point<native><public> := class<concrete>(collision_element):


@experimental
# An axis-aligned collision box.
collision_box<native><public> := class(collision_element):
    var Extents<public>:(/Verse.org/SpatialMath:)vector3

@experimental
collision_volume_internal<native><epic_internal> := class<concrete><epic_internal>(collision_element):
