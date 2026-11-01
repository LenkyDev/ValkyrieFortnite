# Verse path: /Fortnite.com
# Module import path: /Fortnite.com/FortHealthPipeline
FortHealthPipeline<public> := module:
    using {/Verse.org/Native}
    using {/UnrealEngine.com/HealthPipeline}
    @available {MinUploadedAtFNVersion := 4300}
    @experimental
    # Identity tag for the Fortnite Overshield health pool.
    fort_overshield_tag<native><public> := class<final>(health_pool_tag):


    @available {MinUploadedAtFNVersion := 4300}
    @experimental
    # Identity tag for the Fortnite Shield health pool.
    fort_shield_tag<native><public> := class<final>(health_pool_tag):


    @available {MinUploadedAtFNVersion := 4300}
    @experimental
    # Identity tag for the Fortnite Health health pool.
    fort_health_tag<native><public> := class<final>(health_pool_tag):


    @available {MinUploadedAtFNVersion := 4300}
    @experimental
    # The Fortnite Overshield health pool; identity is fixed to fort_overshield_tag.
    fort_overshield<native><public> := class<concrete><final>(health_pool_entry):
        Tag<override>:health_pool_tag = external {}

    @available {MinUploadedAtFNVersion := 4300}
    @experimental
    # The Fortnite Shield health pool; identity is fixed to fort_shield_tag.
    fort_shield<native><public> := class<concrete><final>(health_pool_entry):
        Tag<override>:health_pool_tag = external {}

    @available {MinUploadedAtFNVersion := 4300}
    @experimental
    # The Fortnite Health health pool; identity is fixed to fort_health_tag.
    fort_health<native><public> := class<concrete><final>(health_pool_entry):
        Tag<override>:health_pool_tag = external {}