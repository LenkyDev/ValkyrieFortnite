# Verse path: /Fortnite.com/Marketplace
using {/Verse.org/Simulation}
using {/Verse.org/Native}
using {/UnrealEngine.com/Marketplace}
@available {MinUploadedAtFNVersion := 3800}
@deprecated {Message := "Use `price_dimension` from the /UnrealEngine.com/Marketplace module instead."}
# DEPRECATED - Use `price_dimension` from the /UnrealEngine.com/Marketplace module instead.
(/Fortnite.com/Marketplace:)price_dimension<public> := (/UnrealEngine.com/Marketplace:)price_dimension

@available {MinUploadedAtFNVersion := 3800}
@deprecated {Message := "Use `entitlement` from the /UnrealEngine.com/Marketplace module instead."}
# DEPRECATED - Use `entitlement` from the /UnrealEngine.com/Marketplace module instead.
(/Fortnite.com/Marketplace:)entitlement<public> := (/UnrealEngine.com/Marketplace:)entitlement

@available {MinUploadedAtFNVersion := 3800}
@deprecated {Message := "Use `offer` from the /UnrealEngine.com/Marketplace module instead."}
# DEPRECATED - Use `offer` from the /UnrealEngine.com/Marketplace module instead.
(/Fortnite.com/Marketplace:)offer<public> := (/UnrealEngine.com/Marketplace:)offer

@available {MinUploadedAtFNVersion := 3800}
@deprecated {Message := "Use `entitlement_offer` from the /UnrealEngine.com/Marketplace module instead."}
# DEPRECATED - Use `entitlement_offer` from the /UnrealEngine.com/Marketplace module instead.
(/Fortnite.com/Marketplace:)entitlement_offer<public> := (/UnrealEngine.com/Marketplace:)entitlement_offer

@available {MinUploadedAtFNVersion := 3800}
@deprecated {Message := "Use `bundle_offer` from the /UnrealEngine.com/Marketplace module instead."}
# DEPRECATED - Use `bundle_offer` from the /UnrealEngine.com/Marketplace module instead.
(/Fortnite.com/Marketplace:)bundle_offer<public> := (/UnrealEngine.com/Marketplace:)bundle_offer

@available {MinUploadedAtFNVersion := 3800}
@deprecated {Message := "Use `RestrictPaidRandomItems` from the /UnrealEngine.com/Marketplace module instead."}
# DEPRECATED - Use `RestrictPaidRandomItems` from the /UnrealEngine.com/Marketplace module instead.
(/Fortnite.com/Marketplace:)RestrictPaidRandomItems<public>(Player:player)<decides><reads>:void = external {}

@available {MinUploadedAtFNVersion := 3800}
@deprecated {Message := "Use `RestrictDirectPromptsToPurchase` from the /UnrealEngine.com/Marketplace module instead."}
# DEPRECATED - Use `RestrictDirectPromptsToPurchase` from the /UnrealEngine.com/Marketplace module instead.
(/Fortnite.com/Marketplace:)RestrictDirectPromptsToPurchase<public>(Player:player)<decides><reads>:void = external {}

@available {MinUploadedAtFNVersion := 3800}
@deprecated {Message := "Use `BuyOffer` from the /UnrealEngine.com/Marketplace module instead."}
# DEPRECATED - Use `BuyOffer` from the /UnrealEngine.com/Marketplace module instead.
(/Fortnite.com/Marketplace:)BuyOffer<public>(Player:player, Offer:(/Fortnite.com/Marketplace:)offer)<suspends>:logic = external {}

@available {MinUploadedAtFNVersion := 3800}
@deprecated {Message := "Use `GrantEntitlement` from the /UnrealEngine.com/Marketplace module instead."}
# DEPRECATED - Use `GrantEntitlement` from the /UnrealEngine.com/Marketplace module instead.
(/Fortnite.com/Marketplace:)GrantEntitlement<public>(Player:player, entitlement_type:concrete_subtype((/Fortnite.com/Marketplace:)entitlement), ?Count:int = external {})<suspends>:logic = external {}

@available {MinUploadedAtFNVersion := 3800}
@deprecated {Message := "Use `GetPurchasedEntitlements` from the /UnrealEngine.com/Marketplace module instead."}
# DEPRECATED - Use `GetPurchasedEntitlements` from the /UnrealEngine.com/Marketplace module instead.
(/Fortnite.com/Marketplace:)GetPurchasedEntitlements<public>(Player:player, entitlement_type:subtype((/UnrealEngine.com/Marketplace:)entitlement))<suspends>:[]tuple(entitlement_type, int) = external {}

@available {MinUploadedAtFNVersion := 3800}
@deprecated {Message := "Use `entitlement_change` from the /UnrealEngine.com/Marketplace module instead."}
# DEPRECATED - Use `entitlement_change` from the /UnrealEngine.com/Marketplace module instead.
(/Fortnite.com/Marketplace:)entitlement_change<public>(t:type) := (/UnrealEngine.com/Marketplace:)entitlement_change(t)

@available {MinUploadedAtFNVersion := 3800}
@deprecated {Message := "Use `GetEntitlementsChangedEvent` from the /UnrealEngine.com/Marketplace module instead."}
# DEPRECATED - Use `GetEntitlementsChangedEvent` from the /UnrealEngine.com/Marketplace module instead.
(/Fortnite.com/Marketplace:)GetEntitlementsChangedEvent<public>(Player:player, entitlement_type:subtype((/UnrealEngine.com/Marketplace:)entitlement)):listenable(tuple(player, [](/UnrealEngine.com/Marketplace:)entitlement_change(entitlement_type))) = external {}

@available {MinUploadedAtFNVersion := 3800}
@deprecated {Message := "Use `ConsumeEntitlement` from the /UnrealEngine.com/Marketplace module instead."}
# DEPRECATED - Use `ConsumeEntitlement` from the /UnrealEngine.com/Marketplace module instead.
(/Fortnite.com/Marketplace:)ConsumeEntitlement<public>(Player:player, entitlement_type:concrete_subtype((/Fortnite.com/Marketplace:)entitlement), ?Count:int = external {})<suspends>:logic = external {}

@available {MinUploadedAtFNVersion := 3800}
@deprecated {Message := "Use `ShowOffersDialog` from the /UnrealEngine.com/Marketplace module instead."}
# DEPRECATED - Use `ShowOffersDialog` from the /UnrealEngine.com/Marketplace module instead.
(/Fortnite.com/Marketplace:)ShowOffersDialog<public>(Player:player, Offers:[](/Fortnite.com/Marketplace:)offer, ?Title:message = external {})<suspends>:void = external {}