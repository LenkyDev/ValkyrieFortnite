# Verse path: /Fortnite.com/VerseInternalTesting
# Module import path: /Fortnite.com/VerseInternalTesting/VerseFramework
VerseFramework<public> := module:
    using {/Fortnite.com/Characters}
    verse_internal_testing_utils<native><final><epic_internal> := class:
        HasServerCommandLineOption<native><epic_internal>(Option:string)<decides><reads>:void

    InjectTestInputKey<native><epic_internal>(Character:fort_character, KeyName:string, Pressed:logic)<transacts><decides>:void