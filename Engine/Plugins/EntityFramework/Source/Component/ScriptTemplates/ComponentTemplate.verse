# Copyright Epic Games, Inc. All Rights Reserved.

using { /Verse.org }
using { /Verse.org/Native }
using { /Verse.org/SceneGraph }
using { /Verse.org/Simulation }

# A Verse-authored component that can be added to entities
new_component_template<public> := class<final_super>(component):

    # A custom variable you can expose to the editor
    @editable
    var MyCustomInt<public>:int = 10
  
    # Runs when the component should start simulating in a running game.
    OnBeginSimulation<override>():void =
        # Run OnBeginSimulation from the parent class before
        # running this component's OnBeginSimulation logic
        (super:)OnBeginSimulation()

        # TODO: Place logic to run when the component starts simulating here
        Print("OnBeginSimulation")

    # Runs when the component should start simulating in a running game.
    # Can be suspended throughout the lifetime of the component. Suspensions
    # will be automatically cancelled when the component is disposed or the
    # game ends.
    OnSimulate<override>()<suspends>:void =
        # TODO: Place simple suspends logic to run for this component here
        Print("OnSimulate")

