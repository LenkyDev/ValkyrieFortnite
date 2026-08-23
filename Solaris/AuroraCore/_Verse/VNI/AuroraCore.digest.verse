# Verse path: /Fortnite.com/Marketplace
using {/Verse.org/Native}
using {/Verse.org/Simulation}
using {/Verse.org/Presentation}
using {/Verse.org/Assets}
price_dimension<native><public> := class<computes><abstract><epic_internal>:


# An entitlement that is tracked by the commerce system.
# 
#  * A player may only have one `entitlement` if the entitlement is not consumable.
#  * A player may have `MaxCount` of a consumable entitlement.
#  * Your derived type must be <concrete> to be used by the purchase system.
#  * If the entitlement you are selling gives players a meaningful advantage in your island, you must set ConsequentialToGameplay to true.
entitlement<native><public> := class<castable>(has_icon, has_description):
    MaxCount<native><public>:int = external {}

    Consumable<native><public>:logic = external {}

    PaidRandomItem<native><public>:logic = external {}

    PaidArea<native><public>:logic = external {}

    ConsequentialToGameplay<native><public>:logic = external {}

# Offers are used to sell entitlements to players. See `entitlement_offer` and `bundle_offer` classes for more information.
offer<native><public> := class<abstract><castable><internal>(has_icon, has_description):
    @editable
    Price<native><public>:price_dimension

    # Override this method to restrict availability of an offer in certain regions and minimum ages.
    # 
    # Parameters:
    #     CountryCode: ISO-3166-1 A-2 code for the country, dependent territories, or special
    #                  area of geographical interest
    #     SubdivisionCode: ISO-3166-2 code (excluding Country Code portion) for the subdivision
    #                  within a country, dependent territory, or special area of geographical interest.
    #                  If subdivision information is unavailable for players in a region SubdivisionCode
    #                  will be an empty string.
    #     PlatformFamily: Android, iOS, macOS, Nintendo, PlayStation, Windows, Xbox, Luna, GeForceNow
    # 
    # Returns:
    #     Fails if sale of this offer should not be allowed in this (CountryCode, SubdivisionCode)
    #     Minimum age of purchase in this (CountryCode, SubdivisionCode).
    #     If minimum age is higher than the highest available age by region the offer will not be made
    GetMinPurchaseAge<native_callable><public>(CountryCode:string, SubdivisionCode:string, PlatformFamily:string)<computes><decides>:int = external {}

# An `entitlement_offer` allows an individual `entitlement` to be purchased.
entitlement_offer<native><public> := class<castable>(offer):
    @available {MinUploadedAtFNVersion := 3800}
    @editable
    EntitlementType<native><public>:concrete_subtype(entitlement)

# A `bundle_offer` allows you to bundle multiple other `offer`s into a single purchasable `offer`.
bundle_offer<native><public> := class<castable>(offer):
    Offers<native><public>:[]tuple(offer, int) = external {}

# Informs if usage of paid random items is restricted for `Player`
# due to platform, territory, age, or user configuration restrictions.
RestrictPaidRandomItems<native><public>(Player:player)<decides><reads>:void

# Informs if usage of direct prompts to purchase is restricted for `Player`.
RestrictDirectPromptsToPurchase<native><public>(Player:player)<decides><reads>:void

# Displays the Epic purchase UI to the player to purchase the `Offer`.
# Returns true if an offer was purchased.
BuyOffer<native><public>(Player:player, Offer:offer)<suspends>:logic

@available {MinUploadedAtFNVersion := 3800}
# Grant an entitlement directly to `Player`.
# This function does not gate granting entitlements based on EntitlementDisclosures.
# Entitlements are always granted assuming they match the MaxCount requirement.
GrantEntitlement<native><public>(Player:player, entitlement_type:concrete_subtype(entitlement), ?Count:int = external {})<suspends>:logic

# Get all available `entitlement`s for `Player`, along with the number of those `entitlement`s.
# This includes finding `entitlement`s of derived types.
# Calling GetPurchasedEntitlements(Player, entitlement) will suspend forever.
GetPurchasedEntitlements<native><public>(Player:player, entitlement_type:subtype(entitlement))<suspends>:[]tuple(entitlement_type, int)

# Entitlements that have changed in quantity.
# This will also include entitlement changes triggered by moderation, refunds and other commerce operations.
entitlement_change<native><public>(t:type) := class<internal>:
    (/Fortnite.com/Marketplace/entitlement_change:)Marketplace_entitlement_change_Variance<private>():tuple(t) = external {}

    # Entitlement that has changed in quantity.
    Entitlement<native><public>:t

    # Total quantity of the entitlement now owned.
    Quantity<native><public>:int

    # Change to the original quantity of entitlement.
    Change<native><public>:int

# Used to listen for entitlement change events during a game session.
# Runtime error if `entitlement` is used directly.
GetEntitlementsChangedEvent<native><public>(Player:player, entitlement_type:subtype(entitlement)):listenable(tuple(player, []entitlement_change(entitlement_type)))

@available {MinUploadedAtFNVersion := 3800}
# Consumes a consumable `entitlement`.
# Fails if:
#  * The `entitlement` is not consumable.
#  * The `Player` does not own requested `Count` of `entitlement`.
ConsumeEntitlement<native><public>(Player:player, entitlement_type:concrete_subtype(entitlement), ?Count:int = external {})<suspends>:logic

# Shows the Epic provided store front contain the specified `Offers`.
ShowOffersDialog<native><public>(Player:player, Offers:[]offer, ?Title:message = external {})<suspends>:void