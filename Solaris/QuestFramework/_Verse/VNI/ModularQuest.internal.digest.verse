using {/Verse.org/Simulation}
using {/Verse.org/SceneGraph}
using {/Verse.org/Progression}
using {/Verse.org/Native}
modular_quest<native><public> := interface<epic_internal>:
    Initialize<final><epic_internal>():void = external {}

    Uninitialize<final><epic_internal>():void = external {}

    OnInitialization<epic_internal>():void = external {}

    OnUninitialization<epic_internal>():void = external {}

    @available {MinUploadedAtFNVersion := 4000}
    CanAdd<epic_internal>(QuestOwner:quest_owner):result(comparable, []add_quest_error) = external {}

    @available {MinUploadedAtFNVersion := 4000}
    CanRemove<epic_internal>(QuestOwner:quest_owner):result(comparable, []remove_quest_error) = external {}

    @available {MinUploadedAtFNVersion := 4000}
    CanJoin<epic_internal>(QuestParticipant:quest_participant):result(comparable, []join_quest_error) = external {}

    @available {MinUploadedAtFNVersion := 4000}
    CanAbandon<epic_internal>(QuestParticipant:quest_participant):result(comparable, []abandon_quest_error) = external {}

    OnAdd<epic_internal>(QuestOwner:quest_owner):void = external {}

    OnRemove<epic_internal>(QuestOwner:quest_owner):void = external {}

    OnJoin<epic_internal>(QuestParticipant:quest_participant):void = external {}

    OnAbandon<epic_internal>(QuestParticipant:quest_participant):void = external {}

    OnComplete<epic_internal>():void = external {}

    Extensions<epic_internal>:[]quest_extension

quest_extension<native><public> := class<abstract><castable><epic_internal>:
    OnInitialization<native><epic_internal>():void

    OnUninitialization<native><epic_internal>():void

    @available {MinUploadedAtFNVersion := 4000}
    CanAdd<native><epic_internal>(Owner:quest_owner):result(void, []add_quest_error)

    @available {MinUploadedAtFNVersion := 4000}
    CanRemove<native><epic_internal>(Owner:quest_owner):result(void, []remove_quest_error)

    @available {MinUploadedAtFNVersion := 4000}
    CanJoin<native><epic_internal>(QuestParticipant:quest_participant):result(void, []join_quest_error)

    @available {MinUploadedAtFNVersion := 4000}
    CanAbandon<native><epic_internal>(QuestParticipant:quest_participant):result(void, []abandon_quest_error)

    OnAdd<native><epic_internal>(Owner:quest_owner):void

    OnRemove<native><epic_internal>(Owner:quest_owner):void

    OnJoin<native><epic_internal>(QuestParticipant:quest_participant):void

    OnAbandon<native><epic_internal>(QuestParticipant:quest_participant):void

    OnComplete<native><epic_internal>():void

    GetOwningQuest<native><epic_internal>():quest

quest_granter<native><public> := interface<epic_internal>:
    @available {MinUploadedAtFNVersion := 4000}
    CanGrant<epic_internal>(QuestOwner:quest_owner):result(comparable, []add_quest_error) = external {}

    OnGrant<epic_internal>(Quest:quest, QuestOwner:quest_owner):void = external {}

    GrantEvent<final><epic_internal>:subscribable_event_intrnl(tuple(quest, quest_owner)) = external {}

    QuestsToGrant<epic_internal>:[]subtype(quest)

@available {MinUploadedAtFNVersion := 4000}
(QuestGranter:quest_granter).GrantQuests<native><epic_internal>(QuestOwner:quest_owner)<transacts>:result([]quest, []add_quest_error)

quest_granter_component<native><public> := class<final_super><epic_internal>(component, quest_granter):


add_quest_error<native><public> := class<epic_internal>:


remove_quest_error<native><public> := class<epic_internal>:


transfer_quest_ownership_error<native><public> := class<epic_internal>:


quest_owner<native><public> := interface<epic_internal>:
    @available {MinUploadedAtFNVersion := 4000}
    CanAdd<epic_internal>(Quest:quest):result(comparable, []add_quest_error) = external {}

    @available {MinUploadedAtFNVersion := 4000}
    CanRemove<epic_internal>(Quest:quest):result(comparable, []remove_quest_error) = external {}

    OnAdd<epic_internal>(Quest:quest):void = external {}

    OnRemove<epic_internal>(Quest:quest):void = external {}

    AddEvent<final><epic_internal>:listenable(tuple(quest, quest_owner)) = external {}

    RemoveEvent<final><epic_internal>:listenable(tuple(quest, quest_owner)) = external {}

    CompleteEvent<final><epic_internal>:listenable(tuple(quest, quest_owner)) = external {}

(QuestOwner:quest_owner).GetOwnedQuests<native><epic_internal>()<reads>:[]quest

@available {MinUploadedAtFNVersion := 4000}
(QuestOwner:quest_owner).AddQuest<native><epic_internal>(Quest:quest)<transacts>:result(void, []add_quest_error)

@available {MinUploadedAtFNVersion := 4000}
(QuestOwner:quest_owner).RemoveQuest<native><epic_internal>(Quest:quest)<transacts>:result(void, []remove_quest_error)

(Quest:quest).GetOwner<native><epic_internal>()<reads><decides>:quest_owner

@available {MinUploadedAtFNVersion := 4000}
(Quest:quest).TransferOwnership<native><epic_internal>(QuestOwner:quest_owner)<transacts>:result(void, []transfer_quest_ownership_error)

quest_owner_component<native><public> := class<final_super><epic_internal>(component, quest_owner):


quest_participant<native><public> := interface<epic_internal>:
    @available {MinUploadedAtFNVersion := 4000}
    CanJoin<epic_internal>(Quest:quest):result(comparable, []join_quest_error) = external {}

    @available {MinUploadedAtFNVersion := 4000}
    CanAbandon<epic_internal>(Quest:quest):result(comparable, []abandon_quest_error) = external {}

    OnJoin<epic_internal>(Quest:quest):void = external {}

    OnAbandon<epic_internal>(Quest:quest):void = external {}

    JoinEvent<final><epic_internal>:listenable(tuple(quest, quest_participant)) = external {}

    AbandonEvent<final><epic_internal>:listenable(tuple(quest, quest_participant)) = external {}

    CompleteEvent<final><epic_internal>:listenable(tuple(quest, quest_participant)) = external {}

    OwningUser<epic_internal>:user

@available {MinUploadedAtFNVersion := 4000}
(QuestParticipant:quest_participant).JoinQuest<native><epic_internal>(Quest:quest)<transacts>:result(void, []join_quest_error)

@available {MinUploadedAtFNVersion := 4000}
(QuestParticipant:quest_participant).AbandonQuest<native><epic_internal>(Quest:quest)<transacts>:result(void, []abandon_quest_error)

quest_participant_component<native><public> := class<final_super><epic_internal>(component, quest_participant):


@available {MinUploadedAtFNVersion := 4000}
GrantQuest<native><epic_internal>(quest_type:subtype(quest), QuestOwner:quest_owner)<transacts>:result(quest_type, []add_quest_error)

@available {MinUploadedAtFNVersion := 4000}
RevokeQuest<native><epic_internal>(Quest:quest)<transacts>:result(void, []remove_quest_error)