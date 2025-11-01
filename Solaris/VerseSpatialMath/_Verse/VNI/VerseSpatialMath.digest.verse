# Module import path: /Verse.org/SpatialMath
SpatialMath<public> := module:
    using {/Verse.org/Simulation}
    using {/Verse.org/Native}
    @import_as("/*.FVRotation")
    rotation<native><public> := struct<concrete>:


    @available {MinUploadedAtFNVersion := 3600}
    @vm_no_effect_token
    # Makes a `rotation` from `Axis` and `Angle` in radians using a right-handed sign convention (e.g. a positive rotation around Up takes Forward to Left).
    MakeRotationRadians<native><public>(Axis:vector3, Angle:float)<reads><converges>:rotation

    @available {MinUploadedAtFNVersion := 3600}
    # Degrees version of `MakeRotationRadians`
    MakeRotationDegrees<public>(Axis:vector3, Angle:float)<reads>:rotation = external {}

    @available {MinUploadedAtFNVersion := 3600}
    # Makes a `rotation` by applying a pre-rotation of `YawAngle` followed by `PitchAngle` and then `RollAngle`, in that order:
    #  * *yaw* is right-handed rotation about the Down axis,
    #  * *pitch* is right-handed rotation about the Right axis,
    #  * *roll* is right-handed rotation about the Forward axis.
    MakeRotationFromYawPitchRollRadians<public>(YawAngle:float, PitchAngle:float, RollAngle:float)<reads>:rotation = external {}

    @vm_no_effect_token
    # Degrees version of `MakeRotationFromYawPitchRollRadians`
    MakeRotationFromYawPitchRollDegrees<native><public>(YawAngle:float, PitchAngle:float, RollAngle:float)<reads><converges>:rotation

    @available {MinUploadedAtFNVersion := 3600}
    @vm_no_effect_token
    # Makes a `rotation` by applying a post-rotation of `LeftAxisAngle` followed by `UpAxisAngle` and then `ForwardAxisAngle `in that order. Right-handed convention (e.g. a positive rotation around Up takes +Forward to Left).
    MakeRotationFromEulerRadians<native><public>(LeftAxisAngle:float, UpAxisAngle:float, ForwardAxisAngle:float)<reads><converges>:rotation

    @available {MinUploadedAtFNVersion := 3600}
    # Degrees version of `MakeRotationFromEulerRadians`
    MakeRotationFromEulerDegrees<public>(LeftAxisAngle:float, UpAxisAngle:float, ForwardAxisAngle:float)<reads>:rotation = external {}

    # Makes the identity `rotation`.
    IdentityRotation<native><public>()<converges>:rotation

    @vm_no_effect_token
    # Returns the distance between `Rotation1` and `Rotation2`. The result will be between:
    #  * `0.0`, representing equivalent rotations and
    #  * `1.0` representing rotations which are 180 degrees apart (i.e., the shortest rotation between them is 180 degrees around some axis).
    Distance<native><public>(Rotation1:rotation, Rotation2:rotation)<reads><converges>:float

    @available {MinUploadedAtFNVersion := 3600}
    @vm_no_effect_token
    # Returns the smallest angular distance between `Rotation1` and `Rotation2` in radians.
    AngularDistanceRadians<native><public>(Rotation1:rotation, Rotation2:rotation)<reads><converges>:float

    @available {MinUploadedAtFNVersion := 3600}
    # Degrees version of `AngularDistanceRadians`.
    AngularDistanceDegrees<public>(Rotation1:rotation, Rotation2:rotation)<reads>:float = external {}

    @available {MinUploadedAtFNVersion := 3600}
    @vm_no_effect_token
    # Apply a `PreRotation` to `PostRotation` as `v * PreRotation * PostRotation`.
    (/Verse.org/SpatialMath:)operator'*'<native><public>(PreRotation:rotation, PostRotation:rotation)<reads><converges>:rotation

    @available {MinUploadedAtFNVersion := 3600}
    # Makes a `tuple(float, float, float)` with three elements:
    #  * *yaw* of `rotation` in radians
    #  * *pitch* of `rotation` in radians
    #  * *roll* of `rotation` in radians
    # using the conventions of `MakeRotationFromYawPitchRollRadians`.
    (Rotation:rotation).GetYawPitchRollRadians<public>()<reads>:tuple(float, float, float) = external {}

    @available {MinUploadedAtFNVersion := 3600}
    @vm_no_effect_token
    # Degrees version of `GetYawPitchRollRadians`.
    (Rotation:rotation).GetYawPitchRollDegrees<native><public>()<reads><converges>:tuple(float, float, float)

    @available {MinUploadedAtFNVersion := 3600}
    @vm_no_effect_token
    # Makes a `tuple(float, float, float)` with three elements:
    #  * *left axis* `rotation` in radians
    #  * *up axis* of `rotation` in radians
    #  * *forward axis* of `rotation` in radians
    # using the conventions of `MakeRotationEulerRadians`.
    (Rotation:rotation).GetEulerRadians<native><public>()<reads><converges>:tuple(float, float, float)

    @available {MinUploadedAtFNVersion := 3600}
    # Degrees version of `GetEulerRadians`.
    (Rotation:rotation).GetEulerDegrees<public>()<reads>:tuple(float, float, float) = external {}

    @vm_no_effect_token
    # Makes a `vector3` from the axis of `rotation` for an right-handed angle.
    # If `rotation` is nearly identity, this will return the +Forward axis. See also `GetAngleRadians`.
    (Rotation:rotation).GetAxis<native><public>()<reads><converges>:vector3

    @available {MinUploadedAtFNVersion := 3600}
    @vm_no_effect_token
    # Returns the radians of right-handed `rotation` around the axis of `rotation`. See also `GetAxis`.
    (Rotation:rotation).GetAngleRadians<native><public>()<reads><converges>:float

    @available {MinUploadedAtFNVersion := 3600}
    # Degrees version of GetAngleRadians
    (Rotation:rotation).GetAngleDegrees<public>()<reads>:float = external {}

    @vm_no_effect_token
    # Makes the smallest angular `rotation` from `InitialVector` to `FinalVector` two vectors of arbitrary length such that:
    # `InitialVector * MakeShortestRotationBetween(InitialVector, FinalVector) = FinalVector` and
    # `MakeShortestRotationBetween(InitialVector, FinalVector)?.GetAngleRadians()` is as small as possible.
    MakeShortestRotationBetween<native><public>(InitialVector:vector3, FinalVector:vector3)<reads><converges>:rotation

    @vm_no_effect_token
    # Used to perform spherical linear interpolation between `From` (when `Ratio = 0.0`) and `To` (when `Ratio = 1.0`). Expects `0.0 <= Ratio <= 1.0`.
    Slerp<native><public>(InitialRotation:rotation, FinalRotation:rotation, Ratio:float)<reads><converges>:rotation

    @vm_no_effect_token
    # Makes a `vector3` by applying `Rotation` to `Vector`.
    (/Verse.org/SpatialMath:)operator'*'<native><public>(Vector:vector3, Rotation:rotation)<reads><converges>:vector3

    @vm_no_effect_token
    # Makes a `rotation` by inverting `Rotation` such that `ApplyRotation(Rotation, Rotation.Invert())) = IdentityRotation`.
    (Rotation:rotation).Invert<native><public>()<reads><converges>:rotation

    # Returns `Rotation` if it does not contain `NaN`, `Inf` or `-Inf`.
    (Rotation:rotation).(/Verse.org/SpatialMath:)IsFinite<native><public>()<decides><converges>:rotation

    # Makes a unit `vector3` pointing in the *forward* rotated direction.
    # This is equivalent to: `vector3{Forward:=1.0, Left:=0.0, Up:=0.0} * Rotation`.
    (Rotation:rotation).GetForwardAxis<public>()<reads>:vector3 = external {}

    # Makes a unit `vector3` pointing in the *left* rotated direction.
    # This is equivalent to: `vector3{Forward:=0.0, Left:=1.0, Up:=0.0} * Rotation`.
    (Rotation:rotation).GetLeftAxis<public>()<reads>:vector3 = external {}

    # Makes a unit `vector3` pointing in the *up* rotated direction.
    # This is equivalent to: `vector3{Forward:=0.0, Left:=0.0, Up:=1.0} * Rotation`.
    (Rotation:rotation).GetUpAxis<public>()<reads>:vector3 = external {}

    # Makes a `string` representation of `rotation` in axis/degrees format with a right-handed sign convention.
    # `ToString(MakeRotationRadians(vector3{Left:=0.0, Up:=0.0, Forward:=1.0}, PiFloat/2.0))` produces the string: `"{Axis = {Left=0.000000, Up=0.000000, Forward=1.000000}, Angle = 90.000000}"`.
    (/Verse.org/SpatialMath:)ToString<public>(Rotation:rotation)<reads>:string = external {}

    # Returns radians from `Degrees`.
    DegreesToRadians<public>(Degrees:float)<reads>:float = external {}

    # Returns degrees from `Radians`.
    RadiansToDegrees<public>(Radians:float)<reads>:float = external {}

    @import_as("/*.FVTransform")
    # A combination of scale, rotation, and translation, applied in that order.
    transform<native><public> := struct<concrete><computes>:
        @editable
        # The location of this `transform`.
        Translation<public>:vector3 = external {}

        @editable
        # The rotation of this `transform`.
        Rotation<public>:rotation = external {}

        @editable
        # The scale of this `transform`.
        Scale<public>:vector3 = external {}

    # Makes a `vector3` by applying `InTransform` to `InVector`.
    (/Verse.org/SpatialMath:)operator'*'<public>(InVector:vector3, InTransform:transform)<reads>:vector3 = external {}

    # Makes a `string` representation of `InTransform` where the result is on the form.
    # `"{Translation = {ToString(`InTransform.Translation`)}, Rotation = {ToString(`InTransform.Rotation`)}, Scale = {ToString(`InTransform.Scale`)}}".
    (/Verse.org/SpatialMath:)ToString<public>(InTransform:transform)<reads>:string = external {}

    @import_as("/*.FVVector3")
    # 3-dimensional vector with `float` components.
    vector3<native><public> := struct<concrete><computes><persistable>:
        @editable
        # The Left (was -Y) component of this vector.
        Left<public>:float = external {}

        @editable
        # The Up (was Z) component of this vector.
        Up<public>:float = external {}

        @editable
        # The Forward (was X) component of this vector.
        Forward<public>:float = external {}

    # Makes a `vector3` by inverting the `SurfaceNormal` component of `Direction`.
    ReflectVector<public>(Direction:vector3, SurfaceNormal:vector3)<reads>:vector3 = external {}

    # Returns the dot product of `V1` and `V2`.
    DotProduct<public>(V1:vector3, V2:vector3)<reads>:float = external {}

    # Returns the left-handed cross product of `V1` and `V2`.
    CrossProductLeftHanded<public>(V1:vector3, V2:vector3)<reads>:vector3 = external {}

    @available {MinUploadedAtFNVersion := 3600}
    # Returns the right-handed cross product of `V1` and `V2`.
    CrossProduct<public>(V1:vector3, V2:vector3)<reads>:vector3 = external {}

    # Returns the Euclidean distance between `V1` and `V2`.
    Distance<public>(V1:vector3, V2:vector3)<reads>:float = external {}

    # Returns the squared Euclidean distance between `V1` and `V2`.
    DistanceSquared<public>(V1:vector3, V2:vector3)<reads>:float = external {}

    # Returns the 2-D Euclidean distance between `V1` and `V2` by ignoring the difference in `Up`.
    DistanceForwardLeft<public>(V1:vector3, V2:vector3)<reads>:float = external {}

    # Returns the squared 2-D Euclidean distance between `V1` and `V2` by ignoring their difference in `Up`.
    DistanceSquaredForwardLeft<public>(V1:vector3, V2:vector3)<reads>:float = external {}

    # Makes a unit length `vector3` pointing in the same direction of `V`.
    (V:vector3).MakeUnitVector<public>()<reads>:vector3 = external {}

    # Makes a `string` representation of `V`.
    (/Verse.org/SpatialMath:)ToString<public>(V:vector3)<reads>:string = external {}

    # Returns the length of `V`.
    (V:vector3).Length<public>()<reads>:float = external {}

    # Returns the squared length of `V`.
    (V:vector3).LengthSquared<public>()<computes>:float = external {}

    # Returns the length of `V` as if `V.Up = 0.0`.
    (V:vector3).LengthForwardLeft<public>()<reads>:float = external {}

    # Returns the squared length of `V` as if `V.Up = 0.0`.
    (V:vector3).LengthSquaredForwardLeft<public>()<reads>:float = external {}

    # Used to linearly interpolate/extrapolate between `From` (when `Parameter = 0.0`) and `To` (when `Parameter = 1.0`). Expects that all arguments are finite.
    # Returns `From*(1 - Parameter) + To*Parameter`.
    (/Verse.org/SpatialMath:)Lerp<public>(From:vector3, To:vector3, Parameter:float)<reads>:vector3 = external {}

    # Makes a `vector3` by inverting the signs of `Operand`.
    (/Verse.org/SpatialMath:)prefix'-'<public>(Operand:vector3)<computes>:vector3 = external {}

    # Makes a `vector3` by component-wise addition of `Left` and `Right`.
    (/Verse.org/SpatialMath:)operator'+'<public>(Left:vector3, Right:vector3)<computes>:vector3 = external {}

    # Makes a `vector3` by component-wise subtraction of `Right` from `Left`.
    (/Verse.org/SpatialMath:)operator'-'<public>(Left:vector3, Right:vector3)<computes>:vector3 = external {}

    # Makes a `vector3` by component-wise multiplication of `Left` and `Right`.
    (/Verse.org/SpatialMath:)operator'*'<public>(Left:vector3, Right:vector3)<computes>:vector3 = external {}

    # Makes a `vector3` by multiplying the components of `Left` by `Right`.
    (/Verse.org/SpatialMath:)operator'*'<public>(Left:vector3, Right:float)<computes>:vector3 = external {}

    # Makes a `vector3` by multiplying the components of `Right` by `Left`.
    (/Verse.org/SpatialMath:)operator'*'<public>(Left:float, Right:vector3)<computes>:vector3 = external {}

    # Makes a `vector3` by dividing the components of `Left` by `Right`.
    (/Verse.org/SpatialMath:)operator'/'<public>(Left:vector3, Right:float)<computes>:vector3 = external {}

    # Makes a `vector3` by component-wise division of `Left` by `Right`.
    (/Verse.org/SpatialMath:)operator'/'<public>(Left:vector3, Right:vector3)<computes>:vector3 = external {}

    # Returns `V` if all components are finite.
    # Fails if any of the components are not finite.
    (V:vector3).(/Verse.org/SpatialMath:)IsFinite<public>()<computes><decides>:vector3 = external {}

    # Succeeds when each component of `V` is within `AbsoluteTolerance` of `0.0`.
    (V:vector3).(/Verse.org/SpatialMath:)IsAlmostZero<public>(AbsoluteTolerance:float)<computes><decides>:void = external {}

    # Succeeds when each component of `V1` and `V2` are within `AbsoluteTolerance` of each other.
    (/Verse.org/SpatialMath:)IsAlmostEqual<public>(V1:vector3, V2:vector3, AbsoluteTolerance:float)<computes><decides>:void = external {}