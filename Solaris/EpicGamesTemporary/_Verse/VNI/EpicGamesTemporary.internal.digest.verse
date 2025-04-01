using {/Verse.org/SpatialMath}
using {/Verse.org/Native}
using {/Verse.org/Simulation}
# Module import path: /UnrealEngine.com/Temporary/SpatialMath
(/UnrealEngine.com/Temporary:)SpatialMath<public> := module:
    @editable
    @import_as("/Script/EpicGamesTemporary.FVerseRotation_Deprecated")
    (/UnrealEngine.com/Temporary/SpatialMath:)rotation<native><public> := struct<concrete>:


    # Makes a `rotation` from `Axis` and `AngleRadians` using a left-handed sign convention (e.g. a positive rotation around +Z takes +X to +Y). If `Axis.IsAlmostZero[]`, make the identity rotation.
    (/UnrealEngine.com/Temporary/SpatialMath:)MakeRotation<native><public>(Axis:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, AngleRadians:float)<converges><reads>:(/UnrealEngine.com/Temporary/SpatialMath:)rotation

    # Makes a `rotation` by applying `YawRightDegrees`, `PitchUpDegrees`, and `RollClockwiseDegrees`, in that order:
    #  * first a *yaw* about the Z axis with a positive angle indicating a clockwise rotation when viewed from above,
    #  * then a *pitch* about the new Y axis with a positive angle indicating 'nose up',
    #  * followed by a *roll* about the new X axis axis with a positive angle indicating a clockwise rotation when viewed along +X.
    # Note that these conventions differ from `MakeRotation` but match `ApplyYaw`, `ApplyPitch`, and `ApplyRoll`.
    (/UnrealEngine.com/Temporary/SpatialMath:)MakeRotationFromYawPitchRollDegrees<native><public>(YawRightDegrees:float, PitchUpDegrees:float, RollClockwiseDegrees:float)<converges><reads>:(/UnrealEngine.com/Temporary/SpatialMath:)rotation

    # Makes the identity `rotation`.
    (/UnrealEngine.com/Temporary/SpatialMath:)IdentityRotation<native><public>()<converges>:(/UnrealEngine.com/Temporary/SpatialMath:)rotation

    # Returns the 'distance' between `Rotation1` and `Rotation2`. The result will be between:
    #  * `0.0`, representing equivalent rotations and
    #  * `1.0` representing rotations which are 180 degrees apart (i.e., the shortest rotation between them is 180 degrees around some axis).
    (/UnrealEngine.com/Temporary/SpatialMath:)Distance<native><public>(Rotation1:(/UnrealEngine.com/Temporary/SpatialMath:)rotation, Rotation2:(/UnrealEngine.com/Temporary/SpatialMath:)rotation)<computes><reads>:float

    # Returns the 'smallest angular distance' between `Rotation1` and `Rotation2` in radians.
    (/UnrealEngine.com/Temporary/SpatialMath:)AngularDistance<native><public>(Rotation1:(/UnrealEngine.com/Temporary/SpatialMath:)rotation, Rotation2:(/UnrealEngine.com/Temporary/SpatialMath:)rotation)<computes><reads>:float

    # Makes a `rotation` by applying `PitchUpRadians` of right-handed rotation around the local +Y axis to `InitialRotation`.
    (InitialRotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation).(/UnrealEngine.com/Temporary/SpatialMath:)ApplyPitch<native><public>(PitchUpRadians:float)<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)rotation

    # Makes a `rotation` by applying `RollClockwiseRadians` of right-handed rotation around the local +X axis to `InitialRotation`.
    (InitialRotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation).(/UnrealEngine.com/Temporary/SpatialMath:)ApplyRoll<native><public>(RollClockwiseRadians:float)<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)rotation

    # Makes a `rotation` by applying `YawRightRadians` of left-handed rotation around the local +Z axis to `InitialRotation`.
    (InitialRotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation).(/UnrealEngine.com/Temporary/SpatialMath:)ApplyYaw<native><public>(YawRightRadians:float)<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)rotation

    # Makes a `rotation` by applying `AngleRadians` of left-handed rotation around the world +X axis to `InitialRotation`.
    (InitialRotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation).ApplyWorldRotationX<native><public>(AngleRadians:float)<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)rotation

    # Makes a `rotation` by applying `AngleRadians` of left-handed rotation around the world +Y axis to `InitialRotation`.
    (InitialRotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation).ApplyWorldRotationY<native><public>(AngleRadians:float)<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)rotation

    # Makes a `rotation` by applying `AngleRadians` of left-handed rotation around the world +Z axis to `InitialRotation`.
    (InitialRotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation).ApplyWorldRotationZ<native><public>(AngleRadians:float)<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)rotation

    # Makes a `rotation` by applying `AngleRadians` of left-handed rotation around the local +Y axis to `InitialRotation`.
    (InitialRotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation).ApplyLocalRotationY<public>(AngleRadians:float)<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)rotation = external {}

    # Makes a `rotation` by applying `AngleRadians` of left-handed rotation around the local +Z axis to `InitialRotation`.
    (InitialRotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation).ApplyLocalRotationZ<public>(AngleRadians:float)<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)rotation = external {}

    # Makes a `rotation` by composing `AdditionalRotation` to `InitialRotation`.
    (InitialRotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation).(/UnrealEngine.com/Temporary/SpatialMath:)RotateBy<native><public>(AdditionalRotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation)<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)rotation

    # Makes a `rotation` by composing the inverse of `RotationToRemove` from `InitialRotation`. such that InitialRotation = RotateBy(UnrotateBy(InitialRotation, RotationToRemove), RotationToRemove). This is equivalent to RotateBy(InitialRotation, InvertRotation(RotationToRemove))
    (InitialRotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation).(/UnrealEngine.com/Temporary/SpatialMath:)UnrotateBy<native><public>(RotationToRemove:(/UnrealEngine.com/Temporary/SpatialMath:)rotation)<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)rotation

    # Makes an `[]float` with three elements:
    #  * *yaw* degrees of `rotation`
    #  * *pitch* degrees of `rotation`
    #  * *roll* degrees of `rotation`
    # using the conventions of `MakeRotationFromYawPitchRollDegrees`.
    (Rotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation).(/UnrealEngine.com/Temporary/SpatialMath:)GetYawPitchRollDegrees<native><public>()<computes><reads>:[]float

    # Makes a `vector3` from the axis of `rotation`.
    # If `rotation` is nearly identity, this will return the +X axis. See also `GetAngle`.
    (Rotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation).(/UnrealEngine.com/Temporary/SpatialMath:)GetAxis<native><public>()<computes><reads>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3

    # Returns the radians of `rotation` around the axis of `rotation`. See also `GetAxis`.
    (Rotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation).(/UnrealEngine.com/Temporary/SpatialMath:)GetAngle<native><public>()<computes><reads>:float

    # Makes the smallest angular `rotation` from `InitialRotation` to `FinalRotation` such that:
    # `InitialRotation.RotateBy(MakeShortestRotationBetween(InitialRotation, FinalRotation)) = FinalRotation` and
    # `MakeShortestRotationBetween(InitialRotation, FinalRotation)?.GetAngle()` is as small as possible.
    (/UnrealEngine.com/Temporary/SpatialMath:)MakeShortestRotationBetween<native><public>(InitialRotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation, FinalRotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation)<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)rotation

    # Makes the smallest angular `rotation` from `InitialVector` to `FinalVector` such that:
    # `InitialVector.RotateBy(MakeShortestRotationBetween(InitialVector, Vector)) = FinalVector` and
    # `MakeShortestRotationBetween(InitialVector, FinalVector)?.GetAngle()` is as small as possible.
    (/UnrealEngine.com/Temporary/SpatialMath:)MakeShortestRotationBetween<native><public>(InitialVector:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, FinalVector:(/UnrealEngine.com/Temporary/SpatialMath:)vector3)<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)rotation

    # Makes a new `rotation` from the component wise subtraction of the Euler angle components in `RotationA` by 
    # the Euler angle components in `RotationB` and ensures the returned value is normalized.
    (/UnrealEngine.com/Temporary/SpatialMath:)MakeComponentWiseDeltaRotation<native><public>(RotationA:(/UnrealEngine.com/Temporary/SpatialMath:)rotation, RotationB:(/UnrealEngine.com/Temporary/SpatialMath:)rotation)<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)rotation

    # Used to perform spherical linear interpolation between `From` (when `Parameter = 0.0`) and `To` (when `Parameter = 1.0`). Expects that `0.0 <= Parameter <= 1.0`.
    (/UnrealEngine.com/Temporary/SpatialMath:)Slerp<native><public>(InitialRotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation, FinalRotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation, Parameter:float)<transacts><decides>:(/UnrealEngine.com/Temporary/SpatialMath:)rotation

    # Makes a `vector3` by applying `Rotation` to `Vector`.
    (Rotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation).(/UnrealEngine.com/Temporary/SpatialMath:)RotateVector<native><public>(Vector:(/UnrealEngine.com/Temporary/SpatialMath:)vector3)<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3

    # Makes a `vector3` by applying the inverse of `Rotation` to `Vector`.
    (Rotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation).(/UnrealEngine.com/Temporary/SpatialMath:)UnrotateVector<native><public>(Vector:(/UnrealEngine.com/Temporary/SpatialMath:)vector3)<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3

    # Makes a `rotation` by inverting `Rotation` such that `ApplyRotation(Rotation, Rotation.Invert())) = IdentityRotation`.
    (Rotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation).(/UnrealEngine.com/Temporary/SpatialMath:)Invert<native><public>()<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)rotation

    # Returns `Rotation` if it does not contain `NaN`, `Inf` or `-Inf`.
    (Rotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation).(/UnrealEngine.com/Temporary/SpatialMath:)IsFinite<native><public>()<converges><decides>:(/UnrealEngine.com/Temporary/SpatialMath:)rotation

    # Makes a unit `vector3` pointing in the local space *forward* direction in world space coordinates.
    # This is equivalent to: `RotateVector(Rotation, vector3{X:=1.0, Y:=0.0, Z:=0.0})`.
    (Rotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation).(/UnrealEngine.com/Temporary/SpatialMath:)GetLocalForward<public>()<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

    # Makes a unit `vector3` pointing in the the local space *right* direction in world space coordinates.
    # This is equivalent to: `RotateVector(Rotation, vector3{X:=0.0, Y:=1.0, Z:=0.0})`.
    (Rotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation).(/UnrealEngine.com/Temporary/SpatialMath:)GetLocalRight<public>()<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

    # Makes a unit `vector3` pointing in the local space *up* direction in world space coordinates.
    # This is equivalent to: `RotateVector(Rotation, vector3{X:=0.0, Y:=0.0, Z:=1.0})`.
    (Rotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation).(/UnrealEngine.com/Temporary/SpatialMath:)GetLocalUp<public>()<transacts>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

    # Makes a `string` representation of `rotation` in axis/degrees format with a left-handed sign convention.
    # `ToString(MakeRotation(vector3{X:=1.0, Y:=0.0, Z:=0.0}, PiFloat/2.0))` produces the string: `"Axis: {x=1.000000,y=0.000000,z=0.000000} Angle: 90.000000"`.
    (/UnrealEngine.com/Temporary/SpatialMath:)ToString<native><public>(Rotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation)<computes><reads>:string

    # Returns radians from `Degrees`.
    (/UnrealEngine.com/Temporary/SpatialMath:)DegreesToRadians<public>(Degrees:float)<computes><reads>:float = external {}

    # Returns degrees from `Radians`.
    (/UnrealEngine.com/Temporary/SpatialMath:)RadiansToDegrees<public>(Radians:float)<computes><reads>:float = external {}

    @experimental
    @available {MinUploadedAtFNVersion := 3400}
    # Util function for converting a `vector3` from /UnrealEngine.com/Temporary/SpatialMath to a `vector3` from /Verse.org/SpatialMath.
    FromVector3<public>(InVector3:(/UnrealEngine.com/Temporary/SpatialMath:)vector3)<computes><reads>:(/Verse.org/SpatialMath:)vector3 = external {}

    @experimental
    @available {MinUploadedAtFNVersion := 3400}
    # Util function for converting a `rotation` from /UnrealEngine.com/Temporary/SpatialMath to a `rotation` from /Verse.org/SpatialMath.
    FromRotation<public>(InRotation:(/UnrealEngine.com/Temporary/SpatialMath:)rotation)<computes><reads>:(/Verse.org/SpatialMath:)rotation = external {}

    @experimental
    @available {MinUploadedAtFNVersion := 3400}
    # Util function for converting a `transform` from /UnrealEngine.com/Temporary/SpatialMath to a `transform` from /Verse.org/SpatialMath.
    FromTransform<public>(InTransform:(/UnrealEngine.com/Temporary/SpatialMath:)transform)<computes><reads>:(/Verse.org/SpatialMath:)transform = external {}

    @experimental
    @available {MinUploadedAtFNVersion := 3400}
    # Util function for converting a `vector3` from /Verse.org/SpatialMath to a `vector3` from /UnrealEngine.com/Temporary/SpatialMath.
    FromVector3<public>(InVector3:(/Verse.org/SpatialMath:)vector3)<computes><reads>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

    @experimental
    @available {MinUploadedAtFNVersion := 3400}
    # Util function for converting a `rotation` from /Verse.org/SpatialMath to a `rotation` from /UnrealEngine.com/Temporary/SpatialMath.
    FromRotation<public>(InRotation:(/Verse.org/SpatialMath:)rotation)<computes><reads>:(/UnrealEngine.com/Temporary/SpatialMath:)rotation = external {}

    @experimental
    @available {MinUploadedAtFNVersion := 3400}
    # Util function for converting a `transform` from /Verse.org/SpatialMath to a `transform` from /UnrealEngine.com/Temporary/SpatialMath.
    FromTransform<public>(InTransform:(/Verse.org/SpatialMath:)transform)<computes><reads>:(/UnrealEngine.com/Temporary/SpatialMath:)transform = external {}

    # A combination of scale, rotation, and translation, applied in that order.
    (/UnrealEngine.com/Temporary/SpatialMath:)transform<native><public> := struct<concrete><computes>:
        @editable
        # The scale of this `transform`.
        Scale<native><public>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

        @editable
        # The rotation of this `transform`.
        Rotation<native><public>:(/UnrealEngine.com/Temporary/SpatialMath:)rotation = external {}

        @editable
        # The location of this `transform`.
        Translation<native><public>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

    # Makes a `vector3` by applying `InTransform` to `InVector`.
    (/UnrealEngine.com/Temporary/SpatialMath:)TransformVector<native><public>(InTransform:(/UnrealEngine.com/Temporary/SpatialMath:)transform, InVector:(/UnrealEngine.com/Temporary/SpatialMath:)vector3)<computes><reads>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3

    # Makes a `vector3` by applying `InTransform` to `InVector` without applying `InTransform.Scale`.
    (/UnrealEngine.com/Temporary/SpatialMath:)TransformVectorNoScale<native><public>(InTransform:(/UnrealEngine.com/Temporary/SpatialMath:)transform, InVector:(/UnrealEngine.com/Temporary/SpatialMath:)vector3)<computes><reads>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3

    # Makes a `string` representation of `InTransform` where the result is on the form.
    # `"Scale: {ToString(`InTransform.Scale`)} Rotation: {ToString(`InTransform.Rotation`)} Translation: {ToString(`InTransform.Translation`)}.
    (/UnrealEngine.com/Temporary/SpatialMath:)ToString<native><epic_internal>(InTransform:(/UnrealEngine.com/Temporary/SpatialMath:)transform)<computes><reads>:string

    # 2-dimensional vector with `float` components.
    vector2<native><public> := struct<concrete><computes><persistable>:
        @editable
        X<native><public>:float = external {}

        @editable
        Y<native><public>:float = external {}

    # Makes a `vector2` by inverting the `SurfaceNormal` component of `Direction`.
    # Fails if `not SurfaceNormal.MakeUnitVector[]`.
    (/UnrealEngine.com/Temporary/SpatialMath:)ReflectVector<native><public>(Direction:vector2, SurfaceNormal:vector2)<computes><decides><reads>:vector2

    # Returns the dot product of `V1` and `V2`.
    (/UnrealEngine.com/Temporary/SpatialMath:)DotProduct<native><public>(V1:vector2, V2:vector2)<computes><reads>:float

    # Returns the Euclidean distance between `V1` and `V2`.
    (/UnrealEngine.com/Temporary/SpatialMath:)Distance<native><public>(V1:vector2, V2:vector2)<computes><reads>:float

    # Returns the squared Euclidean distance between `V1` and `V2`.
    (/UnrealEngine.com/Temporary/SpatialMath:)DistanceSquared<native><public>(V1:vector2, V2:vector2)<computes><reads>:float

    # Makes a unit length `vector3` pointing in the same direction of `V`.
    # Fails if `V.IsAlmostZero[] or not V.IsFinite[]`.
    (V:vector2).(/UnrealEngine.com/Temporary/SpatialMath:)MakeUnitVector<native><public>()<computes><decides><reads>:vector2

    # Returns the length of `V`.
    (V:vector2).(/UnrealEngine.com/Temporary/SpatialMath:)Length<public>()<computes><reads>:float = external {}

    # Returns the squared length of `V`.
    (V:vector2).(/UnrealEngine.com/Temporary/SpatialMath:)LengthSquared<public>()<computes><reads>:float = external {}

    # Used to linearly interpolate/extrapolate between `From` (when `Parameter = 0.0`) and `To` (when `Parameter = 1.0`). Expects that all arguments are finite.
    # Returns `From*(1 - Parameter) + To*Parameter`.
    (/UnrealEngine.com/Temporary/SpatialMath:)Lerp<public>(From:vector2, To:vector2, Parameter:float)<computes><reads>:vector2 = external {}

    # Makes a `string` representation of `V`.
    (/UnrealEngine.com/Temporary/SpatialMath:)ToString<native><public>(V:vector2)<computes><reads>:string

    # Makes a `vector2` by inverting the signs of `Operand`.
    (/UnrealEngine.com/Temporary/SpatialMath:)prefix'-'<public>(Operand:vector2)<computes>:vector2 = external {}

    # Makes a `vector2` by component-wise addition of `Left` and `Right`.
    (/UnrealEngine.com/Temporary/SpatialMath:)operator'+'<public>(Left:vector2, Right:vector2)<computes>:vector2 = external {}

    # Makes a `vector2` by component-wise subtraction of `Right` from `Left`.
    (/UnrealEngine.com/Temporary/SpatialMath:)operator'-'<public>(Left:vector2, Right:vector2)<computes>:vector2 = external {}

    # Makes a `vector2` by component-wise multiplication of `Left` and `Right`.
    (/UnrealEngine.com/Temporary/SpatialMath:)operator'*'<public>(Left:vector2, Right:float)<computes>:vector2 = external {}

    # Makes a `vector2` by multiplying the components of `Right` by `Left`.
    (/UnrealEngine.com/Temporary/SpatialMath:)operator'*'<public>(Left:float, Right:vector2)<computes>:vector2 = external {}

    # Makes a `vector2` by dividing the components of `Left` by `Right`.
    (/UnrealEngine.com/Temporary/SpatialMath:)operator'/'<public>(Left:vector2, Right:float)<computes>:vector2 = external {}

    # Makes a `vector2` by component-wise division of `Left` by `Right`.
    (/UnrealEngine.com/Temporary/SpatialMath:)operator'/'<public>(Left:vector2, Right:vector2)<computes>:vector2 = external {}

    # Makes a `vector2` by converting the components of `V` to `float`s.
    ToVector2<public>(V:vector2i)<transacts>:vector2 = external {}

    # Returns `V` if all components are finite.
    # Fails if any of the components are not finite.
    (V:vector2).(/UnrealEngine.com/Temporary/SpatialMath:)IsFinite<public>()<computes><decides>:vector2 = external {}

    # Succeeds when each component of `V` is within `AbsoluteTolerance` of `0.0`.
    (V:vector2).(/UnrealEngine.com/Temporary/SpatialMath:)IsAlmostZero<public>(AbsoluteTolerance:float)<computes><decides>:void = external {}

    # Succeeds when each component of `V1` and `V2` are within `AbsoluteTolerance` of each other.
    (/UnrealEngine.com/Temporary/SpatialMath:)IsAlmostEqual<public>(V1:vector2, V2:vector2, AbsoluteTolerance:float)<computes><decides>:void = external {}

    # 2-dimensional vector with `int` components.
    vector2i<native><public> := struct<concrete><computes><persistable>:
        @editable
        X<native><public>:int = external {}

        @editable
        Y<native><public>:int = external {}

    # Returns the dot product of `V1` and `V2`.
    (/UnrealEngine.com/Temporary/SpatialMath:)DotProduct<public>(V1:vector2i, V2:vector2i)<computes>:int = external {}

    # Makes a `vector2i` that is component-wise equal to `V1` and `V2`.
    # Fails if any component of `V1` does not equal the corresponding component of `V2`.
    Equals<public>(V1:vector2i, V2:vector2i)<computes><decides>:vector2i = external {}

    # Makes a `string` representation of `V`.
    (/UnrealEngine.com/Temporary/SpatialMath:)ToString<native><public>(V:vector2i)<computes>:string

    # Makes a `vector2i` by component-wise truncation of `V` to `ints`s.
    ToVector2i<public>(V:vector2)<computes><decides><reads>:vector2i = external {}

    # Makes a `vector2i` by inverting the signs of `Operand`.
    (/UnrealEngine.com/Temporary/SpatialMath:)prefix'-'<public>(Operand:vector2i)<computes>:vector2i = external {}

    # Makes a `vector2i` by component-wise addition of `Left` and `Right`.
    (/UnrealEngine.com/Temporary/SpatialMath:)operator'+'<public>(Left:vector2i, Right:vector2i)<computes>:vector2i = external {}

    # Makes a `vector2i` by component-wise subtraction of `Right` from `Left`.
    (/UnrealEngine.com/Temporary/SpatialMath:)operator'-'<public>(Left:vector2i, Right:vector2i)<computes>:vector2i = external {}

    # Makes a `vector2i` by multiplying the components of `Left` by `Right`.
    (/UnrealEngine.com/Temporary/SpatialMath:)operator'*'<public>(Left:vector2i, Right:int)<computes>:vector2i = external {}

    # Makes a `vector2i` by multiplying the components of `Right` by `Left`.
    (/UnrealEngine.com/Temporary/SpatialMath:)operator'*'<public>(Left:int, Right:vector2i)<computes>:vector2i = external {}

    # 3-dimensional vector with `float` components.
    (/UnrealEngine.com/Temporary/SpatialMath:)vector3<native><public> := struct<concrete><computes><persistable>:
        @editable
        X<native><public>:float = external {}

        @editable
        Y<native><public>:float = external {}

        @editable
        Z<native><public>:float = external {}

    # Makes a unit `vector3` pointing in the positive X axis (forward)
    XAxis<epic_internal>()<computes>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

    # Makes a unit `vector3` pointing in the positive Y axis (right)
    YAxis<epic_internal>()<computes>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

    # Makes a unit `vector3` pointing in the positive Z axis (up)
    ZAxis<epic_internal>()<computes>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

    # Makes a `vector3` with all components `0.0`.
    (/UnrealEngine.com/Temporary/SpatialMath:)Zero<epic_internal>()<computes>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

    # Makes a `vector3` with all components `1.0`.
    (/UnrealEngine.com/Temporary/SpatialMath:)Ones<epic_internal>()<computes>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

    # Makes a `vector3` by inverting the `SurfaceNormal` component of `Direction`.
    # Fails if `not SurfaceNormal.MakeUnitVector[]`.
    (/UnrealEngine.com/Temporary/SpatialMath:)ReflectVector<native><public>(Direction:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, SurfaceNormal:(/UnrealEngine.com/Temporary/SpatialMath:)vector3)<computes><decides><reads>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3

    # Returns the dot product of `V1` and `V2`.
    (/UnrealEngine.com/Temporary/SpatialMath:)DotProduct<native><public>(V1:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, V2:(/UnrealEngine.com/Temporary/SpatialMath:)vector3)<computes><reads>:float

    # Returns the cross product of `V1` and `V2`.
    CrossProduct<native><public>(V1:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, V2:(/UnrealEngine.com/Temporary/SpatialMath:)vector3)<computes><reads>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3

    # Returns the Euclidean distance between `V1` and `V2`.
    (/UnrealEngine.com/Temporary/SpatialMath:)Distance<native><public>(V1:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, V2:(/UnrealEngine.com/Temporary/SpatialMath:)vector3)<computes><reads>:float

    # Returns the squared Euclidean distance between `V1` and `V2`.
    (/UnrealEngine.com/Temporary/SpatialMath:)DistanceSquared<native><public>(V1:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, V2:(/UnrealEngine.com/Temporary/SpatialMath:)vector3)<computes><reads>:float

    # Returns the 2-D Euclidean distance between `V1` and `V2` by ignoring the difference in `Z`.
    DistanceXY<native><public>(V1:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, V2:(/UnrealEngine.com/Temporary/SpatialMath:)vector3)<computes><reads>:float

    # Returns the squared 2-D Euclidean distance between `V1` and `V2` by ignoring their difference in `Z`.
    DistanceSquaredXY<native><public>(V1:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, V2:(/UnrealEngine.com/Temporary/SpatialMath:)vector3)<computes><reads>:float

    # Makes a unit length `vector3` pointing in the same direction of `V`.
    # Fails if `V.IsAlmostZero[] or not V.IsFinite[]`.
    (V:(/UnrealEngine.com/Temporary/SpatialMath:)vector3).(/UnrealEngine.com/Temporary/SpatialMath:)MakeUnitVector<native><public>()<computes><decides><reads>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3

    # Makes a `string` representation of `V`.
    (/UnrealEngine.com/Temporary/SpatialMath:)ToString<native><public>(V:(/UnrealEngine.com/Temporary/SpatialMath:)vector3)<computes><reads>:string

    # Returns the length of `V`.
    (V:(/UnrealEngine.com/Temporary/SpatialMath:)vector3).(/UnrealEngine.com/Temporary/SpatialMath:)Length<public>()<computes><reads>:float = external {}

    # Returns the squared length of `V`.
    (V:(/UnrealEngine.com/Temporary/SpatialMath:)vector3).(/UnrealEngine.com/Temporary/SpatialMath:)LengthSquared<public>()<computes>:float = external {}

    # Returns the length of `V` as if `V.Z = 0.0`.
    (V:(/UnrealEngine.com/Temporary/SpatialMath:)vector3).LengthXY<public>()<computes><reads>:float = external {}

    # Returns the squared length of `V` as if `V.Z = 0.0`.
    (V:(/UnrealEngine.com/Temporary/SpatialMath:)vector3).LengthSquaredXY<public>()<computes><reads>:float = external {}

    # Used to linearly interpolate/extrapolate between `From` (when `Parameter = 0.0`) and `To` (when `Parameter = 1.0`). Expects that all arguments are finite.
    # Returns `From*(1 - Parameter) + To*Parameter`.
    (/UnrealEngine.com/Temporary/SpatialMath:)Lerp<public>(From:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, To:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, Parameter:float)<computes><reads>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

    # Makes a `vector3` by inverting the signs of `Operand`.
    (/UnrealEngine.com/Temporary/SpatialMath:)prefix'-'<public>(Operand:(/UnrealEngine.com/Temporary/SpatialMath:)vector3)<computes>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

    # Makes a `vector3` by component-wise addition of `Left` and `Right`.
    (/UnrealEngine.com/Temporary/SpatialMath:)operator'+'<public>(Left:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, Right:(/UnrealEngine.com/Temporary/SpatialMath:)vector3)<computes>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

    # Makes a `vector3` by component-wise subtraction of `Right` from `Left`.
    (/UnrealEngine.com/Temporary/SpatialMath:)operator'-'<public>(Left:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, Right:(/UnrealEngine.com/Temporary/SpatialMath:)vector3)<computes>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

    # Makes a `vector3` by component-wise multiplication of `Left` and `Right`.
    (/UnrealEngine.com/Temporary/SpatialMath:)operator'*'<public>(Left:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, Right:(/UnrealEngine.com/Temporary/SpatialMath:)vector3)<computes>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

    # Makes a `vector3` by multiplying the components of `Left` by `Right`.
    (/UnrealEngine.com/Temporary/SpatialMath:)operator'*'<public>(Left:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, Right:float)<computes>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

    # Makes a `vector3` by multiplying the components of `Right` by `Left`.
    (/UnrealEngine.com/Temporary/SpatialMath:)operator'*'<public>(Left:float, Right:(/UnrealEngine.com/Temporary/SpatialMath:)vector3)<computes>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

    # Makes a `vector3` by dividing the components of `Left` by `Right`.
    (/UnrealEngine.com/Temporary/SpatialMath:)operator'/'<public>(Left:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, Right:float)<computes>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

    # Makes a `vector3` by component-wise division of `Left` by `Right`.
    (/UnrealEngine.com/Temporary/SpatialMath:)operator'/'<public>(Left:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, Right:(/UnrealEngine.com/Temporary/SpatialMath:)vector3)<computes>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

    # Returns `V` if all components are finite.
    # Fails if any of the components are not finite.
    (V:(/UnrealEngine.com/Temporary/SpatialMath:)vector3).(/UnrealEngine.com/Temporary/SpatialMath:)IsFinite<public>()<computes><decides>:(/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

    # Succeeds when each component of `V` is within `AbsoluteTolerance` of `0.0`.
    (V:(/UnrealEngine.com/Temporary/SpatialMath:)vector3).(/UnrealEngine.com/Temporary/SpatialMath:)IsAlmostZero<public>(AbsoluteTolerance:float)<computes><decides>:void = external {}

    # Succeeds when each component of `V1` and `V2` are within `AbsoluteTolerance` of each other.
    (/UnrealEngine.com/Temporary/SpatialMath:)IsAlmostEqual<public>(V1:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, V2:(/UnrealEngine.com/Temporary/SpatialMath:)vector3, AbsoluteTolerance:float)<computes><decides>:void = external {}

@experimental
playable<epic_internal> := interface<epic_internal>:
    @experimental
    Play<public>():void

    @experimental
    Pause<public>():void

    @experimental
    Stop<public>(?BlendOutTime:float = external {}):void

    @experimental
    GetDuration<public>()<decides>:float

    @experimental
    GetOnFinishedEvent<public>()<computes><decides><reads>:listenable(tuple())

    @experimental
    GetOnStoppedEvent<public>():listenable(tuple())

    @experimental
    GetOnPlayedEvent<public>():listenable(tuple())

    @experimental
    GetOnPausedEvent<public>():listenable(tuple())

@deprecated
# Module import path: /UnrealEngine.com/Temporary/SceneGraph
SceneGraph<public> := module:
    @deprecated
    # Module import path: /UnrealEngine.com/Temporary/SceneGraph/collision_channels
    collision_channels<public> := module:


    @deprecated
    # Module import path: /UnrealEngine.com/Temporary/SceneGraph/collision_profiles
    collision_profiles<public> := module:


# Stably sort `Array` using `Less` where `Less` succeeding indicates `Left` should precede `Right`
SortBy<native><public>(Array:[]t, Less:type {_(:t, :t)<computes><decides>:void} where t:type)<computes>:[]t