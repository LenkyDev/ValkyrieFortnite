# Verse path: /Fortnite.com/Marketplace
using {/Verse.org/Simulation}
using {/Verse.org/SceneGraph}
offer_interactable_component<native><public> := class(interactable_component):
    @editable
    var Offer<public>:offer

    var SucceededEventHandle<public>:?cancelable = external {}

    CanInteract<native><native_callable><override>(Agent:agent)<decides><reads>:void

    OnBeginSimulation<override>():void = external {}

    OnSucceed<protected>(Agent:agent):void = external {}

    InteractMessage<override>(Agent:agent)<decides><reads>:message = external {}