# Verse path: /Fortnite.com/Devices
using {/Verse.org/Colors}
using {/Verse.org/SpatialMath}
using {/Verse.org/Native}
@available {MinUploadedAtFNVersion := 4310}
# Used with `day_sequence_device.DayNightCycleMode` to define how the device controls the day/night cycle time.
day_night_cycle_mode<public> := enum<open>:
    # Makes no changes to the day/night cycle time.
    Default
    # Forces the day/night cycle to stay fixed at `DayNightCycleTime`.
    FixedTime
    # Sets the day/night cycle to `DayNightCycleTime` when the device is enabled, then lets it continue.
    StartAtSpecifiedTime
    # Uses a random, fixed time for the day/night cycle.
    RandomFixedTime
    # Starts the day/night cycle at a random time, then lets it continue.
    RandomStartTime
    # Applies a time warp local to this device's sequence. Does not affect the global time.
    LocalFixedTime

@available {MinUploadedAtFNVersion := 4310}
# Used with `day_sequence_device.BlendMode` to define how the device blends its settings when `IsVolumeEnabled` is `true`.
day_sequence_blend_mode<public> := enum<open>:
    # Blend weight is always `1.0`.
    Global
    # Blend weight moves between `0.0` and `1.0` according to how far the blend target is from the volume boundary.
    Volume
    # Blend weight moves between `0.0` and `1.0` at a fixed rate after the blend target crosses the volume boundary.
    Time

@available {MinUploadedAtFNVersion := 4310}
# Controls the lighting and atmosphere of your island over time. You can fade in and out the device's visual effects, and toggle individual components like fog, sun, skylight, sky atmosphere, skybox, and clouds based on the device's override settings. Values set from Verse are sent to every player and replace the Details panel settings until the round ends, then the device returns to those settings. Set the look players should see at spawn in the Details panel and apply Verse changes in `OnBegin`.
day_sequence_device<public> := class<concrete><final>(creative_device_base, enableable):
    # Enables this device.
    Enable<override>():void = external {}

    # Disables this device.
    Disable<override>():void = external {}

    # Succeeds if this device is enabled, fails if it's disabled.
    IsEnabled<override>()<transacts><decides>:void = external {}

    # Fades in this device's visual effects at the speed set by `FadeSpeed`.
    FadeIn<public>():void = external {}

    # Fades out this device's visual effects at the speed set by `FadeSpeed`.
    FadeOut<public>():void = external {}

    # Maps to the device option for *Day Night Cycle Mode*.How this device controls the day/night cycle time.
    var DayNightCycleMode<public>:day_night_cycle_mode = external {}

    # Maps to the device option for *Day Night Cycle Time*.Time of day in hours from `0.0` to `24.0`. Values outside the range are clamped. Setting it to `NaN`, `Inf` or `-Inf` is ignored. Used when `DayNightCycleMode` is `FixedTime`, `StartAtSpecifiedTime` or `LocalFixedTime`.
    var DayNightCycleTime<public>:float = external {}

    # Maps to the device option for *Priority*.Priority of this device relative to other Day Sequence devices. Settings of a device with a higher priority are applied on top of those with a lower priority.
    var Priority<public>:int = external {}

    # Maps to the device option for *Fade Speed*.Unitless speed multiplier for `FadeIn` and `FadeOut`, `1.0` is the device default. `0.0` stops a fade from progressing. Setting it to `NaN`, `Inf` or `-Inf` is ignored.
    var FadeSpeed<public>:float = external {}

    # Maps to the device option for *Use Volume*.If `true`, this device only applies its settings inside its volume, blended according to `BlendMode`.
    var IsVolumeEnabled<public>:logic = external {}

    # Maps to the device option for *Blending*.How this device blends its settings at the volume boundary. Only used when `IsVolumeEnabled` is `true`.
    var BlendMode<public>:day_sequence_blend_mode = external {}

    # Maps to the device option for *Blend Distance*.Distance in centimeters from the volume boundary over which the settings are blended, from `0.0` to `1000000.0`. Values outside the range are clamped. Setting it to `NaN`, `Inf` or `-Inf` is ignored. Only used when `BlendMode` is `Volume`.
    var BlendDistance<public>:float = external {}

    # Maps to the device option for *Blend Time*.Time in seconds over which the settings are blended, from `0.0` to `1000000.0`. Values outside the range are clamped. Setting it to `NaN`, `Inf` or `-Inf` is ignored. Only used when `BlendMode` is `Volume` or `Time`.
    var BlendTime<public>:float = external {}

    # Maps to the device options *Volume Extent X*, *Volume Extent Y* and *Volume Extent Z*.Size of the trigger volume in centimeters along the Forward, Left and Up axes, `0.0` or more per axis. The Details panel shows these options in meters. Values below `0.0` are clamped to `0.0`. `0.0` on an axis shrinks the volume to 5 centimeters on that axis. A value with a `NaN`, `Inf` or `-Inf` component is ignored. Only used when `IsVolumeEnabled` is `true`.
    var VolumeExtent<public>:(/Verse.org/SpatialMath:)vector3 = external {}

    # Maps to the device option for *Override Sunlight*.If `true`, the sunlight settings of this device are applied.
    var ShouldOverrideSunlight<public>:logic = external {}

    # Maps to the device option for *Enable Sun Component*.If `true`, the sun component of this device is enabled. Only used when `ShouldOverrideSunlight` is `true`.
    var IsSunEnabled<public>:logic = external {}

    # Maps to the device option for *Sunlight Intensity*.Intensity of the sunlight in lux, `0.0` or more. Values below `0.0` are clamped to `0.0`. Setting it to `NaN`, `Inf` or `-Inf` is ignored. Only used when `ShouldOverrideSunlight` is `true`.
    var SunlightIntensity<public>:float = external {}

    # Maps to the device option for *Sunlight Color*.Color of the sunlight. A color with a `NaN`, `Inf` or `-Inf` channel is ignored. Only used when `ShouldOverrideSunlight` is `true`.
    var SunlightColor<public>:color = external {}

    # Maps to the device option for *Enable Sun Flare*.If `true`, the sun flare is enabled. Only used when `ShouldOverrideSunlight` is `true`.
    var IsSunFlareEnabled<public>:logic = external {}

    # Maps to the device option for *Sunlight Rotation Z*.Rotation of the sunlight around the Z axis in degrees. Values outside `0.0` to `360.0` wrap around. Setting it to `NaN`, `Inf` or `-Inf` is ignored. Only used when `ShouldOverrideSunlight` is `true`.
    var SunlightRotationZ<public>:float = external {}

    # Maps to the device option for *Sunlight Rotation X*.Rotation of the sunlight around the X axis in degrees. Values outside `0.0` to `360.0` wrap around. Setting it to `NaN`, `Inf` or `-Inf` is ignored. Only used when `ShouldOverrideSunlight` is `true`.
    var SunlightRotationX<public>:float = external {}

    # Maps to the device option for *Override Fog*.If `true`, the fog settings of this device are applied.
    var ShouldOverrideFog<public>:logic = external {}

    # Maps to the device option for *Enable Fog Component*.If `true`, the fog component of this device is enabled. Only used when `ShouldOverrideFog` is `true`.
    var IsFogEnabled<public>:logic = external {}

    # Maps to the device option for *Fog Density*.Unitless density of the fog from `0.0` to `10.0`. Values outside the range are clamped. Setting it to `NaN`, `Inf` or `-Inf` is ignored. Only used when `ShouldOverrideFog` is `true`.
    var FogDensity<public>:float = external {}

    # Maps to the device option for *Fog Color*.Color of the fog. A color with a `NaN`, `Inf` or `-Inf` channel is ignored. Only used when `ShouldOverrideFog` is `true`.
    var FogColor<public>:color = external {}

    # Maps to the device option for *Fog Height Falloff*.Unitless rate at which the fog density falls off with height, from `0.0` to `2.0`. Values outside the range are clamped. Setting it to `NaN`, `Inf` or `-Inf` is ignored. Only used when `ShouldOverrideFog` is `true`.
    var FogHeightFalloff<public>:float = external {}

    # Maps to the device option for *Fog Directional Inscattering Color*.Color of the fog inscattering towards the sun. A color with a `NaN`, `Inf` or `-Inf` channel is ignored. Only used when `ShouldOverrideFog` is `true`.
    var FogDirectionalInscatteringColor<public>:color = external {}

    # Maps to the device option for *Fog Max Opacity*.Maximum opacity of the fog from `0.0` to `1.0`. Values outside the range are clamped. Setting it to `NaN`, `Inf` or `-Inf` is ignored. Only used when `ShouldOverrideFog` is `true`.
    var FogMaxOpacity<public>:float = external {}

    # Maps to the device option for *Secondary Fog Density*.Unitless density of the secondary fog layer from `0.0` to `10.0`. Values outside the range are clamped. Setting it to `NaN`, `Inf` or `-Inf` is ignored. Only used when `ShouldOverrideFog` is `true`.
    var SecondaryFogDensity<public>:float = external {}

    # Maps to the device option for *Secondary Fog Falloff*.Unitless rate at which the secondary fog density falls off with height, from `0.0` to `2.0`. Values outside the range are clamped. Setting it to `NaN`, `Inf` or `-Inf` is ignored. Only used when `ShouldOverrideFog` is `true`.
    var SecondaryFogFalloff<public>:float = external {}

    # Maps to the device option for *Secondary Fog Offset*.Height offset of the secondary fog layer in centimeters, relative to the device. Setting it to `NaN`, `Inf` or `-Inf` is ignored. Only used when `ShouldOverrideFog` is `true`.
    var SecondaryFogOffset<public>:float = external {}

    # Maps to the device option for *Sunlight Volumetric Scattering*.Unitless intensity of the volumetric scattering of the sunlight in the fog, `0.0` or more. Values below `0.0` are clamped to `0.0`. Setting it to `NaN`, `Inf` or `-Inf` is ignored. Only used when `ShouldOverrideFog` is `true`.
    var SunlightVolumetricScattering<public>:float = external {}

    # Maps to the device option for *Override Skylight*.If `true`, the skylight settings of this device are applied.
    var ShouldOverrideSkylight<public>:logic = external {}

    # Maps to the device option for *Enable Skylight Component*.If `true`, the skylight component of this device is enabled. Only used when `ShouldOverrideSkylight` is `true`.
    var IsSkylightEnabled<public>:logic = external {}

    # Maps to the device option for *Skylight Intensity*.Unitless intensity scale of the skylight, `0.0` or more. Values below `0.0` are clamped to `0.0`. Setting it to `NaN`, `Inf` or `-Inf` is ignored. Only used when `ShouldOverrideSkylight` is `true`.
    var SkylightIntensity<public>:float = external {}

    # Maps to the device option for *Skylight Color*.Color of the skylight. A color with a `NaN`, `Inf` or `-Inf` channel is ignored. Only used when `ShouldOverrideSkylight` is `true`.
    var SkylightColor<public>:color = external {}

    # Maps to the device option for *Override Sky*.If `true`, the sky settings of this device are applied.
    var ShouldOverrideSky<public>:logic = external {}

    # Maps to the device option for *Enable Sky Atmosphere Component*.If `true`, the sky atmosphere component of this device is enabled. Only used when `ShouldOverrideSky` is `true`.
    var IsSkyAtmosphereEnabled<public>:logic = external {}

    # Maps to the device option for *Enable Skybox Component*.If `true`, the skybox component of this device is enabled. Only used when `ShouldOverrideSky` is `true`.
    var IsSkyboxEnabled<public>:logic = external {}

    # Maps to the device option for *Sky Gradient Blend*.How strongly the sky gradient colors blend onto the sky, from `0.0` to `5.0`. Values outside the range are clamped. Setting it to `NaN`, `Inf` or `-Inf` is ignored. Only used when `ShouldOverrideSky` is `true`.
    var SkyGradientBlend<public>:float = external {}

    # Maps to the device option for *Sky Gradient Low Color*.Color of the sky gradient near the horizon. A color with a `NaN`, `Inf` or `-Inf` channel is ignored. Only used when `ShouldOverrideSky` is `true`.
    var SkyGradientLowColor<public>:color = external {}

    # Maps to the device option for *Sky Gradient Mid Color*.Color of the sky gradient between the horizon and the zenith. A color with a `NaN`, `Inf` or `-Inf` channel is ignored. Only used when `ShouldOverrideSky` is `true`.
    var SkyGradientMidColor<public>:color = external {}

    # Maps to the device option for *Sky Gradient High Color*.Color of the sky gradient at the zenith. A color with a `NaN`, `Inf` or `-Inf` channel is ignored. Only used when `ShouldOverrideSky` is `true`.
    var SkyGradientHighColor<public>:color = external {}

    # Maps to the device option for *Sun Size*.Unitless size of the sun disc in the sky, `0.0` or more. Values below `0.0` are clamped to `0.0`. Setting it to `NaN`, `Inf` or `-Inf` is ignored. Only used when `ShouldOverrideSky` is `true`.
    var SunSize<public>:float = external {}

    # Maps to the device option for *Sun Intensity*.Unitless intensity of the sun disc in the sky, `0.0` or more. Values below `0.0` are clamped to `0.0`. Setting it to `NaN`, `Inf` or `-Inf` is ignored. Only used when `ShouldOverrideSky` is `true`.
    var SunIntensity<public>:float = external {}

    # Maps to the device option for *Sun Color*.Color of the sun disc in the sky. A color with a `NaN`, `Inf` or `-Inf` channel is ignored. Only used when `ShouldOverrideSky` is `true`.
    var SunColor<public>:color = external {}

    # Maps to the device option for *Custom Sun Color Blend*.Blend between the default sun disc color and `SunColor`, `0.0` or more, `1.0` fully replaces the default color. Values below `0.0` are clamped to `0.0`. Setting it to `NaN`, `Inf` or `-Inf` is ignored. Only used when `ShouldOverrideSky` is `true`.
    var CustomSunColorBlend<public>:float = external {}

    # Maps to the device option for *Moon Size*.Unitless size of the moon in the sky from `0.0` to `1.0`. Values outside the range are clamped. Setting it to `NaN`, `Inf` or `-Inf` is ignored. Only used when `ShouldOverrideSky` is `true`.
    var MoonSize<public>:float = external {}

    # Maps to the device option for *Moon Intensity*.Unitless intensity of the moon in the sky, `0.0` or more. Values below `0.0` are clamped to `0.0`. Setting it to `NaN`, `Inf` or `-Inf` is ignored. Only used when `ShouldOverrideSky` is `true`.
    var MoonIntensity<public>:float = external {}

    # Maps to the device option for *Moon Color*.Color of the moon in the sky. A color with a `NaN`, `Inf` or `-Inf` channel is ignored. Only used when `ShouldOverrideSky` is `true`.
    var MoonColor<public>:color = external {}

    # Maps to the device option for *Moon Halo Size*.Unitless size of the halo around the moon, `0.0` or more. Values below `0.0` are clamped to `0.0`. Setting it to `NaN`, `Inf` or `-Inf` is ignored. Only used when `ShouldOverrideSky` is `true`.
    var MoonHaloSize<public>:float = external {}

    # Maps to the device option for *Moon Halo Intensity*.Unitless intensity of the halo around the moon, `0.0` or more. Values below `0.0` are clamped to `0.0`. Setting it to `NaN`, `Inf` or `-Inf` is ignored. Only used when `ShouldOverrideSky` is `true`.
    var MoonHaloIntensity<public>:float = external {}

    # Maps to the device option for *Star Brightness*.Unitless brightness of the stars from `0.0` to `20.0`. Values outside the range are clamped. Setting it to `NaN`, `Inf` or `-Inf` is ignored. Only used when `ShouldOverrideSky` is `true`.
    var StarBrightness<public>:float = external {}

    # Maps to the device option for *Override Clouds*.If `true`, the cloud settings of this device are applied.
    var ShouldOverrideCloud<public>:logic = external {}

    # Maps to the device option for *Cloud Light Color*.Color of the lit side of the clouds. A color with a `NaN`, `Inf` or `-Inf` channel is ignored. Only used when `ShouldOverrideCloud` is `true`.
    var CloudLightColor<public>:color = external {}

    # Maps to the device option for *Cloud Shadow Color*.Color of the shadowed side of the clouds. A color with a `NaN`, `Inf` or `-Inf` channel is ignored. Only used when `ShouldOverrideCloud` is `true`.
    var CloudShadowColor<public>:color = external {}

    # Maps to the device option for *Cloud Lighting Brightness*.Unitless brightness of the cloud lighting, `0.0` or more. Values below `0.0` are clamped to `0.0`. Setting it to `NaN`, `Inf` or `-Inf` is ignored. Only used when `ShouldOverrideCloud` is `true`.
    var CloudLightingBrightness<public>:float = external {}

    # Maps to the device option for *Cloud Coverage*.Cloud coverage from `0.0` (no clouds) to `1.0` (full coverage). Values outside the range are clamped. Setting it to `NaN`, `Inf` or `-Inf` is ignored. Only used when `ShouldOverrideCloud` is `true`.
    var CloudCoverage<public>:float = external {}

    # Maps to the device option for *Cloud Size*.Unitless scale of the cloud shapes from `0.2` to `5.0`, `1.0` is the device default. Values outside the range are clamped. Setting it to `NaN`, `Inf` or `-Inf` is ignored. Only used when `ShouldOverrideCloud` is `true`.
    var CloudSize<public>:float = external {}

    # Maps to the device option for *Cloud Opacity*.Opacity of the clouds from `0.0` to `1.0`. Values outside the range are clamped. Setting it to `NaN`, `Inf` or `-Inf` is ignored. Only used when `ShouldOverrideCloud` is `true`.
    var CloudOpacity<public>:float = external {}

    # Maps to the device option for *Cloud Speed*.Unitless speed multiplier of the cloud movement, `0.0` or more, `1.0` is the device default. Values below `0.0` are clamped to `0.0`. Setting it to `NaN`, `Inf` or `-Inf` is ignored. Only used when `ShouldOverrideCloud` is `true`.
    var CloudSpeed<public>:float = external {}

    # Maps to the device option for *Cloud Direction X*.X component of the direction in which the clouds move, from `-1.0` to `1.0`. Values outside the range are clamped. Setting it to `NaN`, `Inf` or `-Inf` is ignored. Only used when `ShouldOverrideCloud` is `true`.
    var CloudDirectionX<public>:float = external {}

    # Maps to the device option for *Cloud Direction Y*.Y component of the direction in which the clouds move, from `-1.0` to `1.0`. Values outside the range are clamped. Setting it to `NaN`, `Inf` or `-Inf` is ignored. Only used when `ShouldOverrideCloud` is `true`.
    var CloudDirectionY<public>:float = external {}

    GetBPFunctionNamesForValidation<override>():[]string = external {}

@deprecated {Message := "This type is deprecated."}
# Controls how the sky looks, as well as giving you options for changing the sun, clouds, stars or other objects in the sky above your island. You can control the sun and moon, and add other atmospheric elements like stars, fog and clouds. You can change the color of your light source, and blend different colors for your island's sky to create the perfect atmosphere for your game.
skydome_device<public> := class<concrete><final>(creative_device_base):
    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    GetBPFunctionNamesForValidation<override>():[]string = external {}