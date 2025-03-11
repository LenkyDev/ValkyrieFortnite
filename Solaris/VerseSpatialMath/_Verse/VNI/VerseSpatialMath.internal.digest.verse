using {/Verse.org/Simulation}
using {/Verse.org/Native}
# Module import path: /Verse.org/SpatialMath
SpatialMath<public> := module:
    @import_as("/*.FVRotation")
    rotation<native><public> := struct<concrete>:


    @experimental
    # Makes a `rotation` from `Axis` and `AngleRadians` using a left-handed sign convention (e.g. a positive rotation around +Z takes +X to +Y). If `Axis.IsAlmostZero[]`, make the identity rotation.
    MakeRotation<native><public>(Axis:vector3, AngleRadians:float)<converges><reads>:rotation

    @experimental
    # Makes a `rotation` by applying `YawRightDegrees`, `PitchUpDegrees`, and `RollClockwiseDegrees`, in that order:
    #  * first a *yaw* about the Up axis with a positive angle indicating a clockwise rotation when viewed from above,
    #  * then a *pitch* about the new Right axis with a positive angle indicating 'nose up',
    #  * followed by a *roll* about the new Forward axis axis with a positive angle indicating a clockwise rotation when viewed along +X.
    # Note that these conventions differ from `MakeRotation` but match `ApplyYaw`, `ApplyPitch`, and `ApplyRoll`.
    MakeRotationFromYawPitchRollDegrees<native><public>(YawRightDegrees:float, PitchUpDegrees:float, RollClockwiseDegrees:float)<converges><reads>:rotation

    @experimental
    # Makes the identity `rotation`.
    IdentityRotation<native><public>()<converges>:rotation

    @experimental
    # Returns the 'distance' between `Rotation1` and `Rotation2`. The result will be between:
    #  * `0.0`, representing equivalent rotations and
    #  * `1.0` representing rotations which are 180 degrees apart (i.e., the shortest rotation between them is 180 degrees around some axis).
    Distance<native><public>(Rotation1:rotation, Rotation2:rotation)<computes><reads>:float

    @experimental
    # Returns the 'smallest angular distance' between `Rotation1` and `Rotation2` in radians.
    AngularDistance<native><public>(Rotation1:rotation, Rotation2:rotation)<computes><reads>:float

    @experimental
    # Makes a `rotation` by applying `PitchUpRadians` of right-handed rotation around the local +Right axis to `InitialRotation`.
    (InitialRotation:rotation).ApplyPitch<native><public>(PitchUpRadians:float)<computes><reads>:rotation

    @experimental
    # Makes a `rotation` by applying `RollClockwiseRadians` of right-handed rotation around the local +Forward axis to `InitialRotation`.
    (InitialRotation:rotation).ApplyRoll<native><public>(RollClockwiseRadians:float)<computes><reads>:rotation

    @experimental
    # Makes a `rotation` by applying `YawRightRadians` of left-handed rotation around the local +Up axis to `InitialRotation`.
    (InitialRotation:rotation).ApplyYaw<native><public>(YawRightRadians:float)<computes><reads>:rotation

    @experimental
    # Makes a `rotation` by applying `AngleRadians` of left-handed rotation around the world +Forward axis to `InitialRotation`.
    (InitialRotation:rotation).ApplyWorldRotationForward<native><public>(AngleRadians:float)<computes><reads>:rotation

    @experimental
    # Makes a `rotation` by applying `AngleRadians` of left-handed rotation around the world +Right axis to `InitialRotation`.
    (InitialRotation:rotation).ApplyWorldRotationRight<native><public>(AngleRadians:float)<computes><reads>:rotation

    @experimental
    # Makes a `rotation` by applying `AngleRadians` of left-handed rotation around the world +Up axis to `InitialRotation`.
    (InitialRotation:rotation).ApplyWorldRotationUp<native><public>(AngleRadians:float)<computes><reads>:rotation

    @experimental
    # Makes a `rotation` by applying `AngleRadians` of left-handed rotation around the local +Forward axis to `InitialRotation`.
    (InitialRotation:rotation).ApplyLocalRotationForward<public>(AngleRadians:float)<computes><reads>:rotation = external {}

    @experimental
    # Makes a `rotation` by applying `AngleRadians` of left-handed rotation around the local +Right axis to `InitialRotation`.
    (InitialRotation:rotation).ApplyLocalRotationRight<public>(AngleRadians:float)<computes><reads>:rotation = external {}

    @experimental
    # Makes a `rotation` by applying `AngleRadians` of left-handed rotation around the local +Up axis to `InitialRotation`.
    (InitialRotation:rotation).ApplyLocalRotationUp<public>(AngleRadians:float)<computes><reads>:rotation = external {}

    @experimental
    # Makes a `rotation` by composing `AdditionalRotation` to `InitialRotation`.
    (InitialRotation:rotation).RotateBy<native><public>(AdditionalRotation:rotation)<computes><reads>:rotation

    @experimental
    # Makes a `rotation` by composing the inverse of `RotationToRemove` from `InitialRotation`. such that InitialRotation = RotateBy(UnrotateBy(InitialRotation, RotationToRemove), RotationToRemove). This is equivalent to RotateBy(InitialRotation, InvertRotation(RotationToRemove))
    (InitialRotation:rotation).UnrotateBy<native><public>(RotationToRemove:rotation)<computes><reads>:rotation

    @experimental
    # Makes a `tuple(float, float, float)` with three elements:
    #  * *yaw* degrees of `rotation`
    #  * *pitch* degrees of `rotation`
    #  * *roll* degrees of `rotation`
    # using the conventions of `MakeRotationFromYawPitchRollDegrees`.
    (Rotation:rotation).GetYawPitchRollDegrees<native><public>()<computes><reads>:tuple(float, float, float)

    @experimental
    # Makes a `vector3` from the axis of `rotation`.
    # If `rotation` is nearly identity, this will return the +Forward axis. See also `GetAngle`.
    (Rotation:rotation).GetAxis<native><public>()<computes><reads>:vector3

    @experimental
    # Returns the radians of left-handed `rotation` around the axis of `rotation`. See also `GetAxis`.
    (Rotation:rotation).GetAngle<native><public>()<computes><reads>:float

    @experimental
    # Makes the smallest angular `rotation` from `InitialRotation` to `FinalRotation` such that:
    # `InitialRotation.RotateBy(MakeShortestRotationBetween(InitialRotation, FinalRotation)) = FinalRotation` and
    # `MakeShortestRotationBetween(InitialRotation, FinalRotation)?.GetAngle()` is as small as possible.
    MakeShortestRotationBetween<native><public>(InitialRotation:rotation, FinalRotation:rotation)<computes><reads>:rotation

    @experimental
    # Makes the smallest angular `rotation` from `InitialVector` to `FinalVector` such that:
    # `InitialVector.RotateBy(MakeShortestRotationBetween(InitialVector, Vector)) = FinalVector` and
    # `MakeShortestRotationBetween(InitialVector, FinalVector)?.GetAngle()` is as small as possible.
    MakeShortestRotationBetween<native><public>(InitialVector:vector3, FinalVector:vector3)<computes><reads>:rotation

    @experimental
    # Makes a new `rotation` from the component wise subtraction of the Euler angle components in `RotationA` by 
    # the Euler angle components in `RotationB` and ensures the returned value is normalized.
    MakeComponentWiseDeltaRotation<native><public>(RotationA:rotation, RotationB:rotation)<computes><reads>:rotation

    @experimental
    # Used to perform spherical linear interpolation between `From` (when `Parameter = 0.0`) and `To` (when `Parameter = 1.0`). Expects that `0.0 <= Parameter <= 1.0`.
    Slerp<native><public>(InitialRotation:rotation, FinalRotation:rotation, Parameter:float)<computes><decides><reads>:rotation

    @experimental
    # Makes a `vector3` by applying `Rotation` to `Vector`.
    (Rotation:rotation).RotateVector<native><public>(Vector:vector3)<computes><reads>:vector3

    @experimental
    # Makes a `vector3` by applying the inverse of `Rotation` to `Vector`.
    (Rotation:rotation).UnrotateVector<native><public>(Vector:vector3)<computes><reads>:vector3

    @experimental
    # Makes a `rotation` by inverting `Rotation` such that `ApplyRotation(Rotation, Rotation.Invert())) = IdentityRotation`.
    (Rotation:rotation).Invert<native><public>()<computes><reads>:rotation

    @experimental
    # Returns `Rotation` if it does not contain `NaN`, `Inf` or `-Inf`.
    (Rotation:rotation).(/Verse.org/SpatialMath:)IsFinite<native><public>()<converges><decides>:rotation

    @experimental
    # Makes a unit `vector3` pointing in the local space *forward* direction in world space coordinates.
    # This is equivalent to: `RotateVector(Rotation, vector3{Forward:=1.0, Right:=0.0, Up:=0.0})`.
    (Rotation:rotation).GetLocalForward<public>()<computes><reads>:vector3 = external {}

    @experimental
    # Makes a unit `vector3` pointing in the the local space *right* direction in world space coordinates.
    # This is equivalent to: `RotateVector(Rotation, vector3{Forward:=0.0, Right:=1.0, Up:=0.0})`.
    (Rotation:rotation).GetLocalRight<public>()<computes><reads>:vector3 = external {}

    @experimental
    # Makes a unit `vector3` pointing in the local space *up* direction in world space coordinates.
    # This is equivalent to: `RotateVector(Rotation, vector3{Forward:=0.0, Right:=0.0, Up:=1.0})`.
    (Rotation:rotation).GetLocalUp<public>()<computes><reads>:vector3 = external {}

    @experimental
    # Makes a `string` representation of `rotation` in axis/degrees format with a left-handed sign convention.
    # `ToString(MakeRotation(vector3{Forward:=1.0, Right:=0.0, Up:=0.0}, PiFloat/2.0))` produces the string: `"{Axis = {x=1.000000,y=0.000000,z=0.000000}, Angle = 90.000000}"`.
    (/Verse.org/SpatialMath:)ToString<native><public>(Rotation:rotation)<computes><reads>:string

    @experimental
    # Returns radians from `Degrees`.
    DegreesToRadians<public>(Degrees:float)<computes><reads>:float = external {}

    @experimental
    # Returns degrees from `Radians`.
    RadiansToDegrees<public>(Radians:float)<computes><reads>:float = external {}

    @experimental
    @import_as("/*.FVTransform")
    # A combination of scale, rotation, and translation, applied in that order.
    transform<native><public> := struct<concrete><computes>:
        @editable
        # The location of this `transform`.
        Translation<native><public>:vector3 = external {}

        @editable
        # The rotation of this `transform`.
        Rotation<native><public>:rotation = external {}

        @editable
        # The scale of this `transform`.
        Scale<native><public>:vector3 = external {}

    @experimental
    # Makes a `vector3` by applying `InTransform` to `InVector`.
    TransformVector<native><public>(InTransform:transform, InVector:vector3)<computes><reads>:vector3

    @experimental
    # Makes a `vector3` by applying `InTransform` to `InVector` without applying `InTransform.Scale`.
    TransformVectorNoScale<native><public>(InTransform:transform, InVector:vector3)<computes><reads>:vector3

    @experimental
    # Makes a `string` representation of `InTransform` where the result is on the form.
    # `"{Translation = {ToString(`InTransform.Translation`)}, Rotation = {ToString(`InTransform.Rotation`)}, Scale = {ToString(`InTransform.Scale`)}}".
    (/Verse.org/SpatialMath:)ToString<native><public>(InTransform:transform)<computes><reads>:string

    @experimental
    @import_as("/*.FVVector3")
    # 3-dimensional vector with `float` components.
    vector3<native><public> := struct<concrete><computes><persistable>:
        @editable
        # The Forward (was X) component of this vector.
        Forward<native><public>:float = external {}

        @editable
        # The Right (was Y) component of this vector.
        Right<native><public>:float = external {}

        @editable
        # The Up (was Z) component of this vector.
        Up<native><public>:float = external {}

    @experimental
    # Makes a unit `vector3` pointing in the positive Forward axis
    ForwardAxis<epic_internal>()<computes>:vector3 = external {}

    @experimental
    # Makes a unit `vector3` pointing in the positive Right axis
    RightAxis<epic_internal>()<computes>:vector3 = external {}

    @experimental
    # Makes a unit `vector3` pointing in the positive Up axis
    UpAxis<epic_internal>()<computes>:vector3 = external {}

    @experimental
    # Makes a `vector3` with all components `0.0`.
    Zero<epic_internal>()<computes>:vector3 = external {}

    @experimental
    # Makes a `vector3` with all components `1.0`.
    Ones<epic_internal>()<computes>:vector3 = external {}

    @experimental
    # Makes a `vector3` by inverting the `SurfaceNormal` component of `Direction`.
    # Fails if `not SurfaceNormal.MakeUnitVector[]`.
    ReflectVector<native><public>(Direction:vector3, SurfaceNormal:vector3)<computes><decides><reads>:vector3

    @experimental
    # Returns the dot product of `V1` and `V2`.
    DotProduct<native><public>(V1:vector3, V2:vector3)<computes><reads>:float

    @experimental
    # Returns the left-handed cross product of `V1` and `V2`.
    CrossProductLeftHanded<native><public>(V1:vector3, V2:vector3)<computes><reads>:vector3

    @experimental
    # Returns the Euclidean distance between `V1` and `V2`.
    Distance<native><public>(V1:vector3, V2:vector3)<computes><reads>:float

    @experimental
    # Returns the squared Euclidean distance between `V1` and `V2`.
    DistanceSquared<native><public>(V1:vector3, V2:vector3)<computes><reads>:float

    @experimental
    # Returns the 2-D Euclidean distance between `V1` and `V2` by ignoring the difference in `Up`.
    DistanceForwardRight<native><public>(V1:vector3, V2:vector3)<computes><reads>:float

    @experimental
    # Returns the squared 2-D Euclidean distance between `V1` and `V2` by ignoring their difference in `Up`.
    DistanceSquaredForwardRight<native><public>(V1:vector3, V2:vector3)<computes><reads>:float

    @experimental
    # Makes a unit length `vector3` pointing in the same direction of `V`.
    # Fails if `V.IsAlmostZero[] or not V.IsFinite[]`.
    (V:vector3).MakeUnitVector<native><public>()<computes><decides><reads>:vector3

    @experimental
    # Makes a `string` representation of `V`.
    (/Verse.org/SpatialMath:)ToString<native><public>(V:vector3)<computes><reads>:string

    @experimental
    # Returns the length of `V`.
    (V:vector3).Length<public>()<computes><reads>:float = external {}

    @experimental
    # Returns the squared length of `V`.
    (V:vector3).LengthSquared<public>()<computes>:float = external {}

    @experimental
    # Returns the length of `V` as if `V.Up = 0.0`.
    (V:vector3).LengthForwardRight<public>()<computes><reads>:float = external {}

    @experimental
    # Returns the squared length of `V` as if `V.Up = 0.0`.
    (V:vector3).LengthSquaredForwardRight<public>()<computes><reads>:float = external {}

    @experimental
    # Used to linearly interpolate/extrapolate between `From` (when `Parameter = 0.0`) and `To` (when `Parameter = 1.0`). Expects that all arguments are finite.
    # Returns `From*(1 - Parameter) + To*Parameter`.
    (/Verse.org/SpatialMath:)Lerp<public>(From:vector3, To:vector3, Parameter:float)<computes><reads>:vector3 = external {}

    @experimental
    # Makes a `vector3` by inverting the signs of `Operand`.
    (/Verse.org/SpatialMath:)prefix'-'<public>(Operand:vector3)<computes>:vector3 = external {}

    @experimental
    # Makes a `vector3` by component-wise addition of `Left` and `Right`.
    (/Verse.org/SpatialMath:)operator'+'<public>(Left:vector3, Right:vector3)<computes>:vector3 = external {}

    @experimental
    # Makes a `vector3` by component-wise subtraction of `Right` from `Left`.
    (/Verse.org/SpatialMath:)operator'-'<public>(Left:vector3, Right:vector3)<computes>:vector3 = external {}

    @experimental
    # Makes a `vector3` by component-wise multiplication of `Left` and `Right`.
    (/Verse.org/SpatialMath:)operator'*'<public>(Left:vector3, Right:vector3)<computes>:vector3 = external {}

    @experimental
    # Makes a `vector3` by multiplying the components of `Left` by `Right`.
    (/Verse.org/SpatialMath:)operator'*'<public>(Left:vector3, Right:float)<computes>:vector3 = external {}

    @experimental
    # Makes a `vector3` by multiplying the components of `Right` by `Left`.
    (/Verse.org/SpatialMath:)operator'*'<public>(Left:float, Right:vector3)<computes>:vector3 = external {}

    @experimental
    # Makes a `vector3` by dividing the components of `Left` by `Right`.
    (/Verse.org/SpatialMath:)operator'/'<public>(Left:vector3, Right:float)<computes>:vector3 = external {}

    @experimental
    # Makes a `vector3` by component-wise division of `Left` by `Right`.
    (/Verse.org/SpatialMath:)operator'/'<public>(Left:vector3, Right:vector3)<computes>:vector3 = external {}

    @experimental
    # Returns `V` if all components are finite.
    # Fails if any of the components are not finite.
    (V:vector3).(/Verse.org/SpatialMath:)IsFinite<public>()<computes><decides>:vector3 = external {}

    @experimental
    # Succeeds when each component of `V` is within `AbsoluteTolerance` of `0.0`.
    (V:vector3).(/Verse.org/SpatialMath:)IsAlmostZero<public>(AbsoluteTolerance:float)<computes><decides>:void = external {}

    @experimental
    # Succeeds when each component of `V1` and `V2` are within `AbsoluteTolerance` of each other.
    (/Verse.org/SpatialMath:)IsAlmostEqual<public>(V1:vector3, V2:vector3, AbsoluteTolerance:float)<computes><decides>:void = external {}