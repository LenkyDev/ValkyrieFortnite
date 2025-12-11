using { /Fortnite.com/Devices }
using { /Fortnite.com/Marketplace }
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /Verse.org/Assets }
using { /Verse.org/Simulation }

# Documentation for In-Island Transactions is found at https://fn.gg/z38

# Setup your entitlements and offers data, in this case that's your Names, Descriptions & Short Descriptions as well as any other data you want to be constant
EntitlementInfo<public> := module:
    Potion<public> := module:
        Name<public><localizes>:message = "Potion"
        Description<public><localizes>:message = "Adds +10 health when used. Green so you know its healthy!"
        ShortDescription<public><localizes>:message = "Adds +10 health when used."

    PotionGib<public> := module:
        Name<public><localizes>:message = "Gib Potion"
        Description<public><localizes>:message = "Special potion that unlocks violent one shot eliminations. Red so you know its healthy! Not for minors!"
        ShortDescription<public><localizes>:message = "Unlocks violent one shot eliminations."

    PotionThanksgiving<public> := module:
        Name<public><localizes>:message = "Thanksgiving Potion"
        Description<public><localizes>:message = "Special potion that adds 100 health but reduces speed by 50%"
        ShortDescription<public><localizes>:message = "Adds +100 health, causes speed reduction when used."

    PotionPack<public> := module:
        Name<public><localizes>:message = "Potion x5"
        Description<public><localizes>:message = "5 potions that add +10 health when used. Green so you know they're healthy!"
        ShortDescription<public><localizes>:message = "Get 5 for 400!"
        PotionCount<public>:int = 5

    Sword<public> := module:
        Name<public><localizes>:message = "Sword"
        Description<public><localizes>:message = "The first but not last sword you\'ll ever own."
        ShortDescription<public><localizes>:message = "A basic sword."

    # Country codes use the ISO-3166-1 A-2 standard
    # Subdivision codes use the ISO-3166-2 code (excluding Country Code portion)
    CountryCodes<public> := module:
        Antarctica<public>:string = "AQ"
        Canada<public>:string = "CA"
        UnitedStatesOfAmerica<public>:string = "US"

Entitlements<public> := module:
    using {EntitlementInfo}

    # The base entitlement you should define for ALL your entitlements in your experience
    feature_example_entitlement<public> := class<abstract><castable>(entitlement){}


    basic_sword<public> := class<concrete>(feature_example_entitlement):
        var Name<override>:message = Sword.Name
        var Description<override>:message = Sword.Description
        var ShortDescription<override>:message = Sword.ShortDescription
        var Icon<override>:texture = # This MUST have an Icon from your project defined here as the class is <concrete>
        # This is a sword, not a entitlement that gives a player a random item
        PaidRandomItem<override>:logic = false
        # This is a sword, not a entitlement that controls if a player has access to
        PaidArea<override>:logic = false
        # As a weapon, this is consequential to gameplay
        ConsequentialToGameplay<override>:logic = true

    potion<public> := class<concrete>(feature_example_entitlement):
        var Name<override>:message = Potion.Name
        var Description<override>:message = Potion.Description
        var ShortDescription<override>:message = Potion.ShortDescription
        var Icon<override>:texture = # This MUST have an Icon from your project defined here as the class is <concrete>
        MaxCount<override>:int = 5  # The Maximum number of this entitlement that you want to let a player own at once, only necessary for Consumable entitlements
        # Consumable indicates that this item is something that the Player uses and when used, your code should call ConsumeEntitlement so the consumed item is removed
        # from their entitlements owned in Epic's Marketplace systems
        Consumable<override>:logic = true
        # This is a potion, not a entitlement that gives a player a random item
        PaidRandomItem<override>:logic = false
        # This is a potion, not a entitlement that controls if a player has access to
        PaidArea<override>:logic = false
        # As a health potion, this is consequential to gameplay
        ConsequentialToGameplay<override>:logic = true

    # Potion that references violent content not suitable for minors
    potion_gib<public> := class<concrete>(feature_example_entitlement):
        var Name<override>:message = PotionGib.Name
        var Description<override>:message = PotionGib.Description
        var ShortDescription<override>:message = PotionGib.ShortDescription
        var Icon<override>:texture = # This MUST have an Icon from your project defined here as the class is <concrete>
        MaxCount<override>:int = 5  # The Maximum number of this entitlement that you want to let a player own at once, only necessary for Consumable entitlements
        # Consumable indicates that this item is something that the Player uses and when used, your code should call ConsumeEntitlement so the consumed item is removed
        # from their entitlements owned in Epic's Marketplace systems
        Consumable<override>:logic = true
        # This is a potion, not a entitlement that gives a player a random item
        PaidRandomItem<override>:logic = false
        # This is a potion, not a entitlement that controls if a player has access to
        PaidArea<override>:logic = false
        # This potion only affects visuals for player, it has no gameplay consequences
        ConsequentialToGameplay<override>:logic = false

    # Health potion for American & Canadian players, boosts health but slows you down
    potion_thanksgiving<public> := class<concrete>(feature_example_entitlement):
        var Name<override>:message = PotionThanksgiving.Name
        var Description<override>:message = PotionThanksgiving.Description
        var ShortDescription<override>:message = PotionThanksgiving.ShortDescription
        var Icon<override>:texture = # This MUST have an Icon from your project defined here as the class is <concrete>
        MaxCount<override>:int = 5   # The Maximum number of this entitlement that you want to let a player own at once, only necessary for Consumable entitlements
        # Consumable indicates that this item is something that the Player uses and when used, your code should call ConsumeEntitlement so the consumed item is removed
        # from their entitlements owned in Epic's Marketplace systems
        Consumable<override>:logic = true
        # This is a potion, not a entitlement that gives a player a random item
        PaidRandomItem<override>:logic = false
        # This is a potion, not a entitlement that controls if a player has access to
        PaidArea<override>:logic = false
        # As a rare and powerful health potion, this is consequential to gameplay
        ConsequentialToGameplay<override>:logic = true

ExampleOffers<public> := module:
    using {EntitlementInfo}

    basic_sword<public> := class(entitlement_offer):
        var Name<override>:message                = EntitlementInfo.Sword.Name
        var Description<override>:message         = EntitlementInfo.Sword.Description
        var ShortDescription<override>:message    = EntitlementInfo.Sword.ShortDescription
        var Icon<override>:texture                = # Include an Icon here

        # Offers are linked to entitlements by entitlement type, not an instantiated entitlement object
        EntitlementType<override>:concrete_subtype(entitlement) = Entitlements.basic_sword
        Price<override>:price_dimension = MakePriceVBucks(500.0) # Prices should be between 50 and 5000 Vbucks and in increments of 50

        # Optional overrideable function you can use to inform Epic systems what the minimum age a player needs to be to purchase this offer
        GetMinPurchaseAge<override>(CountryCode:string, SubdivisionCode:string, PlatformFamily:string)<decides><computes>:int =
            # A Hypothetical example where you only want to sell swords to people who don't live in Antarctica
            CountryCode <> CountryCodes.Antarctica

            return 0

    potion<public> := class(entitlement_offer):
        var Name<override>:message                = EntitlementInfo.Potion.Name
        var Description<override>:message         = EntitlementInfo.Potion.Description
        var ShortDescription<override>:message    = EntitlementInfo.Potion.ShortDescription
        var Icon<override>:texture                = # Include an Icon here

        # Offers are linked to entitlements by entitlement type, not an instantiated entitlement object
        EntitlementType<override>:concrete_subtype(entitlement) = Entitlements.potion
        Price<override>:price_dimension = MakePriceVBucks(100.0) # Prices should be between 50 and 5000 (inclusive) Vbucks and in increments of 50

    # Potion that references violent content not suitable for minors
    potion_gib<public> := class(entitlement_offer):
        var Name<override>:message                = EntitlementInfo.PotionGib.Name
        var Description<override>:message         = EntitlementInfo.PotionGib.Description
        var ShortDescription<override>:message    = EntitlementInfo.PotionGib.ShortDescription
        var Icon<override>:texture                = # Include an Icon here

        # Offers are linked to entitlements by entitlement type, not an instantiated entitlement object
        EntitlementType<override>:concrete_subtype(entitlement) = Entitlements.potion
        Price<override>:price_dimension = MakePriceVBucks(1000.0) # Prices should be between 50 and 5000 (inclusive) Vbucks and in increments of 50

        # Optional overrideable function you can use to inform Epic systems what the minimum age a player needs to be to purchase this offer
        GetMinPurchaseAge<override>(CountryCode:string, SubdivisionCode:string, PlatformFamily:string)<decides><computes>:int =
            21 # A Player must be 21 or over to purchase this potion

    # Only players that live in Canada or the USA should be able to buy a thanksgiving potion
    potion_thanksgiving<public> := class(entitlement_offer):
        var Name<override>:message                = EntitlementInfo.PotionThanksgiving.Name
        var Description<override>:message         = EntitlementInfo.PotionThanksgiving.Description
        var ShortDescription<override>:message    = EntitlementInfo.PotionThanksgiving.ShortDescription
        var Icon<override>:texture                = # Include an Icon here

        # Offers are linked to entitlements by entitlement type, not an instantiated entitlement object
        EntitlementType<override>:concrete_subtype(entitlement) = Entitlements.potion
        Price<override>:price_dimension = MakePriceVBucks(200.0) # Prices should be between 50 and 5000 (inclusive) Vbucks and in increments of 50

        # If the Player is from the USA or Canada, then the minimum age is 0, so everyone can buy. But if they're not, this function will fail
        GetMinPurchaseAge<override>(CountryCode:string, SubdivisionCode:string, PlatformFamily:string)<decides><computes>:int =
           CountryCode = CountryCodes.UnitedStatesOfAmerica or CountryCode = CountryCodes.Canada  # If a player isn't in either of the countries this line will fail
           return 0 # Any player in the USA or CA can purchase this potion

    potion_pack<public> := class(bundle_offer) :
        var Name<override>:message                = EntitlementInfo.PotionPack.Name
        var Description<override>:message         = EntitlementInfo.PotionPack.Description
        var ShortDescription<override>:message    = EntitlementInfo.PotionPack.ShortDescription
        var Icon<override>:texture                = # Include an Icon here

        # Offers inheriting from bundle_offer offer a mechanism to sell multiple entitlements at once, that can be X entitlements of one type as well as of multiple types
        Offers<override>:[]tuple(offer, int) = array{(potion{}, PotionPack.PotionCount)}
        Price<override>:price_dimension = MakePriceVBucks(400.0) # Prices should be between 50 and 5000 (inclusive) Vbucks and in increments of 50

# An example creative device that can be placed in a level to use as a base for your experience to use the Marketplace APIs
marketplace_setup_device := class(creative_device):

    # Track which players you're listening for entitlement changes for
    var EntitlementChangeSubscription:[player]?cancelable = map{}

    # Track Player Join subscription
    var PlayerJoinSubscription:?cancelable = false

    # Track Player Left subscription
    var PlayerLeftSubscription:?cancelable = false

    # Runs when the device is started in a running game, register to listen for players joining & leaving the experience
    OnBegin<override>()<suspends>:void =
        SubJoin:= GetPlayspace().PlayerAddedEvent().Subscribe(OnPlayerJoin)
        set PlayerJoinSubscription = option{ SubJoin }

        SubLeft:= GetPlayspace().PlayerRemovedEvent().Subscribe(OnPlayerLeft)
        set PlayerLeftSubscription = option{ SubLeft }

    OnEnd<override>() : void =
        if (Subscription := PlayerJoinSubscription?):
            Subscription.Cancel()

        if (Subscription := PlayerLeftSubscription?):
            Subscription.Cancel()

    # When a player joins you subscribe to listen to any changes in the entitlements they own.
    OnPlayerJoin(InPlayer:player):void =
        Subscription := GetEntitlementsChangedEvent(InPlayer, Entitlements.feature_example_entitlement).Subscribe(OnPurchasesChanged)

        if (set EntitlementChangeSubscription[InPlayer] = option{Subscription}):
            Print("Adding entitlement Change Subscription player subscription")

        # On players joining you are likely going to want to run some validation checks to make sure that any data you save
        # in your experience matches what the Marketplace API says they own.
        spawn{ ValidatePreviousPurchases(InPlayer) }

    # clean up any Subscriptions made for that player when they leave, also you can do any other cleanup related to the player here if you choose
    OnPlayerLeft(Player:player):void =
        if (Subscription := EntitlementChangeSubscription[Player]?):
            Subscription.Cancel()

        var TempMap:[player]?cancelable = map{}

        for (Key -> Value : EntitlementChangeSubscription, Key <> Player):
            set TempMap = ConcatenateMaps(TempMap, map{Key => Value})

        set EntitlementChangeSubscription = TempMap

    # How to respond to the Player's purchases having changed for whatever reason, purchasing something
    OnPurchasesChanged(Player:player, EntitlementChanges:[]entitlement_change(entitlement)):void=
        # Adjust Game Values
        # Process refunds
        Print("On Purchases Changed callback called")


    ValidatePreviousPurchases(Player:player)<suspends>:void=
        Purchases := GetPurchasedEntitlements(Player, Entitlements.feature_example_entitlement)

        # Do any checks you need to make sure your saved data matches what Marketplace says the player owns

    # Base Implementation of how to present players with an offer to purchase in your experience
    TryBuyOffer(Player:player, Offer:entitlement_offer)<suspends>:void =
        Result := BuyOffer(Player, Offer)

        if (Result?):
            # do nothing it should respond in the purchase subscription, see OnPurchasesChanged for details
        else:
            Print("Failed to buy the offer")

    # Base Implementation of how to flag a consumable in your experience as being consumed
    TryConsumeEntitlement(Player:player, Entitlement:concrete_subtype(entitlement), NumberConsuming:int)<suspends>:void =
        Result := ConsumeEntitlement(Player, Entitlement, ?Count := NumberConsuming)

        if (Result?):
            Print("Successfully consumed entitlement!")
            # give the player the effect of consuming the thing/react in your game, you can also respond in OnPurchasesChanged as with purchase if you choose
        else:
            Print("Failed to consume the entitlement")

    # Base Implementation of how to give players a entitlement in your experience without them purchasing it
    TryGrantEntitlement(Player:player, Entitlement:concrete_subtype(entitlement), NumberToGrant:int)<suspends>:void =
        Result := GrantEntitlement(Player, Entitlement, ?Count := NumberToGrant)

        if (Result?):
            Print("Successfully granted a player your entitlement!")
            # give the player the thing/react in your game, you can also respond in OnPurchasesChanged as with purchase if you choose
        else:
            Print("Failed to grant the entitlement")

    # Base Implementation of how to show an array of offers to the player that are available for purchase
    ShowArrayOfOffers(Player:player)<suspends>:void =
        ShowOffersDialog(Player, array{ExampleOffers.basic_sword{}, ExampleOffers.potion{}, ExampleOffers.potion_pack{}, ExampleOffers.potion_thanksgiving{}, ExampleOffers.potion_gib{}})