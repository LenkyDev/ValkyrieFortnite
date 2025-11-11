using {/Verse.org/Native}
using {/Verse.org/Simulation}
using {/Verse.org/Presentation}
using {/Verse.org/Assets}
@experimental
price_dimension<native><public> := class<computes><abstract><epic_internal>:


@experimental
# A product that is tracked by the commerce system.
# 
#  * A player may only have one `product` if the product is not consumable.
#  * A player may have `MaxCount` of a consumable product.
#  * Your derived type must be <concrete> to be used by the purchase system.
product<native><public> := class<castable>(has_icon, has_description):
    MaxCount<native><public>:int = external {}

    Consumable<native><public>:logic = external {}

    PaidRandomItem<native><public>:logic = external {}

    PaidArea<native><public>:logic = external {}

@experimental
# Offers are used to sell products to players. See `product_offer` and `bundle_offer` classes for more information.
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

@experimental
# A `product_offer` allows an individual product to be purchased.
product_offer<native><public> := class<castable>(offer):
    @available {MinUploadedAtFNVersion := 3800}
    @editable
    ProductType<native><public>:concrete_subtype(product)

@experimental
# A `bundle_offer` allows you to bundle multiple other `offer`s into a single purchasable `offer`.
bundle_offer<native><public> := class<castable>(offer):
    Offers<native><public>:[]tuple(offer, int) = external {}

@experimental
# Informs if the player allows use of paid random items.
AllowPaidRandomItems<native><public>(Player:player)<reads><decides>:void

@experimental
# Epic provides a function telling developers whether their platform, territory & age allows purchase exhortations.
AllowDirectPromptsToPurchase<native><public>(Player:player)<reads><decides>:void

@experimental
# Displays the Epic purchase UI to the player to purchase the `Offer`.
# Returns true if an offer was purchased.
BuyOffer<native><public>(Player:player, Offer:offer)<suspends>:logic

@available {MinUploadedAtFNVersion := 3800}
@experimental
# Grant an item directly to `Player`.
# This function does not gate granting items based on ProductDisclosures.
# Items are always granted assuming they match the MaxCount requirement.
GrantProduct<native><public>(Player:player, product_type:concrete_subtype(product), ?Count:int = external {})<suspends>:logic

@experimental
# Get all available `product`s for `Player`, along with the number of those `product`s.
# This includes finding `product`s of derived types.
# Calling GetPurchasedProducts(Player:player, product) will suspend forever.
GetPurchasedProducts<native><public>(Player:player, product_type:subtype(product))<suspends>:[]tuple(product_type, int)

@experimental
# Products that have changed in quantity.
# This will also include product changes triggered by moderation, refunds and other commerce operations.
product_change<native><public>(t:subtype(product)) := class<internal>:
    (/Fortnite.com/Marketplace/product_change:)Marketplace_product_change_Variance<private>:?type {_():tuple(t)} = external {}

    # Product that has changed in quantity.
    Product<native><public>:t

    # Total quantity of the product now owned.
    Quantity<native><public>:int

    # Change to the original quantity of product.
    Change<native><public>:int

@experimental
# Used to listen for purchase change events during a game session.
# Runtime error if `product` is used directly.
GetProductsChangedEvent<native><public>(Player:player, product_type:subtype(product)):listenable(tuple(player, []product_change(product_type)))

@available {MinUploadedAtFNVersion := 3800}
@experimental
# Consumes a consumable `product`.
# Fails if:
#  * The `product` is not consumable.
#  * The `Player` does not own requested `Count` of `product`.
ConsumeProduct<native><public>(Player:player, product_type:concrete_subtype(product), ?Count:int = external {})<suspends>:logic

@experimental
# Shows the Epic provided store front contain the specified `Offers`.
ShowOffersDialog<native><public>(Player:player, Offers:[]offer, ?Title:message = external {})<suspends>:void