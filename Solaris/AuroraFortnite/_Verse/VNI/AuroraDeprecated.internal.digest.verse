# Verse path: /Fortnite.com/Marketplace
using {/Verse.org/Native}
using {/UnrealEngine.com/Marketplace}
@available {MinUploadedAtFNVersion := 3800}
@deprecated {Message := "Use `price_vbucks` from the /UnrealEngine.com/Marketplace module instead."}
# DEPRECATED - Use `price_vbucks` from the /UnrealEngine.com/Marketplace module instead.
(/Fortnite.com/Marketplace:)price_vbucks<public> := (/UnrealEngine.com/Marketplace:)price_vbucks

@deprecated {Message := "Use `MakePriceVBucks` from the /UnrealEngine.com/Marketplace module instead."}
@available {MinUploadedAtFNVersion := 3800}
# DEPRECATED - Use `MakePriceVBucks` from the /UnrealEngine.com/Marketplace module instead.
(/Fortnite.com/Marketplace:)MakePriceVBucks<public>:type {_(:float)<converges>:(/Fortnite.com/Marketplace:)price_vbucks} = external {}

@available {MinUploadedAtFNVersion := 3800}
@deprecated {Message := "Use `GetPriceVBucks` from the /UnrealEngine.com/Marketplace module instead."}
# DEPRECATED - Use `GetPriceVBucks` from the /UnrealEngine.com/Marketplace module instead.
(/Fortnite.com/Marketplace:)GetPriceVBucks<public>(P:(/Fortnite.com/Marketplace:)price_vbucks):float = external {}