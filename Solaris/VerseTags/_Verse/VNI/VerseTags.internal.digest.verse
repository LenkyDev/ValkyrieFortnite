# Module import path: /Verse.org/Simulation/Tags
Tags<public> := module:
    using {/Verse.org/Native}
    # An interface representing a mutable collection of tags.
    has_tags<native><public> := interface<epic_internal>:
        # Adds a `tag` instance to this container. Returns a `tag_key` that is uniquely associated with the added instance.
        AddTag<native_callable><public>(Tag:tag)<transacts>:tag_key

        # Removes the tag instance associated with the `tag_key`, succeeds if an instance was removed, fails otherwise.
        RemoveTag<native_callable><public>(Key:tag_key)<transacts><decides>:void

        @available {MinUploadedAtFNVersion := 3200}
        # Removes all tag instances of type `tag_type`, succeeds if at least one instance was removed, fails otherwise.
        RemoveAllTags<native_callable><public>(tag_type:castable_subtype(tag))<transacts><decides>:void

        @available {MinUploadedAtFNVersion := 3200}
        # Removes all tag instances that are not of type `tag_type`, succeeds if at least one instance was removed, fails otherwise.
        RemoveAllTagsExcept<native_callable><public>(tag_type:castable_subtype(tag))<transacts><decides>:void

        @available {MinUploadedAtFNVersion := 3200}
        # Removes all tag instances that are not of any of the types in `tag_types`, succeeds if at least one instance was removed, fails otherwise.
        RemoveAllTagsExcept<native_callable><public>(tag_types:[]castable_subtype(tag))<transacts><decides>:void

        @available {MinUploadedAtFNVersion := 3200}
        # Succeeds if at least one tag of type `tag_type` is found in this container, fails otherwise.
        ContainsTag<native_callable><public>(tag_type:castable_subtype(tag))<reads><decides>:void

        @available {MinUploadedAtFNVersion := 3200}
        # Fails if at least one type in `tag_types` cannot be found in this container, succeeds otherwise. Note that this means that if `tag_types` is empty this call succeeds.
        ContainsAllTags<native_callable><public>(tag_types:[]castable_subtype(tag))<reads><decides>:void

        @available {MinUploadedAtFNVersion := 3200}
        # Succeeds if at least of the types in `tag_types` is found in this container, fails otherwise. Note that this means that if `tag_types` is empty this call fails.
        ContainsAnyTag<native_callable><public>(tag_types:[]castable_subtype(tag))<reads><decides>:void

    # A base type used for tagging objects in order to hierarchically evaluate an objects classification.
    tag<native><public> := class<abstract><castable>:


    # Get a string representation of the tag. Useful for debugging.
    (/Verse.org/Simulation/Tags:)ToString<native><epic_internal>(__dupe___unnamed_parameter_63:tag)<computes>:string

    # Succeeds if Left and Right are equal.
    Equals<native><epic_internal>(Left:tag, Right:tag)<transacts><decides>:void

    # Utility function to allow for easy construction from subclass
    MakeTagFromSubClass<native><epic_internal>(tag_type:subtype(tag))<transacts><decides>:tag

    # A mutable collection of tags.
    tag_container<native><epic_internal> := class<concrete>(tag_view):
        # Add the specified tag to the container.
        Add<native><epic_internal>(Tag:tag):void

        # Remove the specified tag from the container.
        Remove<native><epic_internal>(Tag:tag)<decides>:void

        # Adds all the tags from one container to this container NOTE: From set theory, this effectively is the union of the container this is called on with TagsToAdd.
        Add<native><epic_internal>(TagsToAdd:[]tag):void

        # Removes all tags in TagsToRemove from this container.
        Remove<native><epic_internal>(TagsToRemove:[]tag):void

        # Adds all the tags from one container to this container NOTE: From set theory, this effectively is the union of the container this is called on with TagsToAdd.
        Add<native><epic_internal>(TagsToAdd:tag_container):void

        # Removes all tags in TagsToRemove from this container.
        Remove<native><epic_internal>(TagsToRemove:tag_container):void

        # Remove all tags from the container. Will maintain slack by default.
        Reset<native><epic_internal>():void

        # Remove all tags from the container. Update the amount of slack pre-allocated for tags.
        ResetWithSlack<native><epic_internal>(slack:int):void

        # Determine if TagToCheck is present in this container, also checking against parent tags {"A.1"}.Has("A") will return True, {"A"}.Has("A.1") will return False If TagToCheck is not Valid it will always return False.
        Has<native><override>(TagToCheck:tag)<reads><decides>:void

        # Checks if this container contains ANY of the tags in the specified container, also checks against parent tags {"A.1"}.HasAny({"A","B"}) will return True, {"A"}.HasAny({"A.1","B"}) will return False If InTags is empty/invalid it will always return False.
        (/Verse.org/Simulation/Tags/tag_view:)HasAny<native><override>(InTags:[]tag)<reads><decides>:void

        # Checks if this container contains ALL of the tags in the specified container, also checks against parent tags {"A.1","B.1"}.HasAll({"A","B"}) will return True, {"A","B"}.HasAll({"A.1","B.1"}) will return False If InTags is empty/invalid it will always return True, because there were no failed checks.
        (/Verse.org/Simulation/Tags/tag_view:)HasAll<native><override>(InTags:[]tag)<reads><decides>:void

        # Checks if this container contains ANY of the tags in the specified container, also checks against parent tags {"A.1"}.HasAny({"A","B"}) will return True, {"A"}.HasAny({"A.1","B"}) will return False If InTags is empty/invalid it will always return False.
        (/Verse.org/Simulation/Tags/tag_container:)HasAny<native><epic_internal>(InTags:tag_container)<reads><decides>:void

        # Checks if this container contains ALL of the tags in the specified container, also checks against parent tags {"A.1","B.1"}.HasAll({"A","B"}) will return True, {"A","B"}.HasAll({"A.1","B.1"}) will return False If InTags is empty/invalid it will always return True, because there were no failed checks.
        (/Verse.org/Simulation/Tags/tag_container:)HasAll<native><epic_internal>(InTags:tag_container)<reads><decides>:void

        # Returns the number of explicitly added tags.
        Num<native><epic_internal>()<reads>:int

        @available {MinUploadedAtFNVersion := 2930}
        # Returns a generator for the tags in this container. This is an expensive operation since it will create new tag instances for all tags in the container. Do preferably not use this function for anything else than debugging.
        GetTags<native><epic_internal>()<transacts>:generator(tag)

    # Returns abbreviated human readable Tag list. Useful for debugging.
    (/Verse.org/Simulation/Tags:)ToString<native><epic_internal>(__dupe___unnamed_parameter_66:tag_container)<computes>:string

    # Create a tag container from an array of tags.
    MakeTagContainer<native><epic_internal>(InTags:[]tag)<transacts>:tag_container

    # Succeeds if all tags in Left are found in Right and all tags in Right are found in Left.
    Equals<native><epic_internal>(Left:tag_container, Right:tag_container)<transacts><decides>:void

    @import_as("/Script/VerseTags.FVerseTagInstanceContainer")
    tag_instance_container<native><epic_internal> := struct<concrete>:


    @import_as("/*.FVerseTagKey")
    # A `tag_key` is the return value from adding a `tag` to a container implementing the `has_tags` interface, and is used to selectively remove such an instance from the same container.
    tag_key<native><public> := struct<internal>:


    tag_search_sort_type<native><public> := enum:
        Unsorted
        Sorted

    # Advanced tag search criteria
    tag_search_criteria<native><public> := class:
        # Tags required to be on the object.
        RequiredTags<native><public>:[]tag = external {}

        # Tags that are used if no required tags are specified. These are treated as if any of them will do.
        PreferredTags<native><public>:[]tag = external {}

        # Tags that may NOT be on the object. All items with these tags are excluded from the search.
        ExclusionTags<native><public>:[]tag = external {}

        # Flag to request sorting the results by tag.
        SortType<native><public>:tag_search_sort_type = external {}

    @available {MinUploadedAtFNVersion := 3200}
    @experimental
    # An experimental replacement for the `tag_container` class that uses the new `has_tags` api. as well as 
    # the new underlying overridable serializaion for tag instances.
    tag_set<native><epic_internal> := class(has_tags, diagnosable):
        # Adds a `tag` instance to this container. Returns a `tag_key` that is uniquely associated with the added instance.
        AddTag<native><override>(Tag:tag)<transacts>:tag_key

        # Removes the tag instance associated with the `tag_key`, succeeds if an instance was removed, fails otherwise.
        RemoveTag<native><override>(Key:tag_key)<transacts><decides>:void

        # Removes all tag instances of type `tag_type`, succeeds if at least one instance was removed, fails otherwise.
        RemoveAllTags<native><override>(tag_type:castable_subtype(tag))<transacts><decides>:void

        # Removes all tag instances that are not of type `tag_type`, succeeds if at least one instance was removed, fails otherwise.
        RemoveAllTagsExcept<native><override>(tag_type:castable_subtype(tag))<transacts><decides>:void

        # Removes all tag instances that are not of any of the types in `tag_types`, succeeds if at least one instance was removed, fails otherwise.
        RemoveAllTagsExcept<native><override>(tag_types:[]castable_subtype(tag))<transacts><decides>:void

        # Succeeds if at least one tag of type `tag_type` is found in this container, fails otherwise.
        ContainsTag<native><override>(tag_type:castable_subtype(tag))<reads><decides>:void

        # Fails if at least one type in `tag_types` cannot be found in this container, succeeds otherwise. Note that this means that if `tag_types` is empty this call succeeds.
        ContainsAllTags<native><override>(tag_types:[]castable_subtype(tag))<reads><decides>:void

        # Succeeds if at least of the types in `tag_types` is found in this container, fails otherwise. Note that this means that if `tag_types` is empty this call fails.
        ContainsAnyTag<native><override>(tag_types:[]castable_subtype(tag))<reads><decides>:void

        # Returns a human readable version of this `tag_set`.
        GetDiagnostic<override><native>()<reads>:diagnostic

    @import_as("/Script/VerseTags.FVerseTagTypeInfo")
    # Utility structure which allows users to select a tag when exposed to editor
    tag_type_info<native><epic_internal> := struct<concrete>:


    # Utility function to allow for easy construction from editor exposable tag_type_info
    MakeTag<native><epic_internal>(TagTypeInfo:tag_type_info)<transacts><decides>:tag

    @deprecated
    # Deprecated alias, use `tag_type_info` instead.
    tag_selector<epic_internal> := tag_type_info

    @import_as("/Script/VerseTags.FVerseTagTypeInfoContainer")
    # Utility structure which allows users to select a tag when exposed to editor
    tag_type_info_container<native><epic_internal> := struct<concrete>:


    # Utility function to allow for easy construction from editor exposable tag_type_info_container
    MakeTagContainer<native><epic_internal>(TagTypeInfoContainer:tag_type_info_container)<transacts><decides>:tag_container

    @deprecated
    # Deprecated alias, use `tag_type_info_container` instead.
    tag_selector_container<epic_internal> := tag_type_info_container

    # A queryable collection of tags.
    tag_view<native><public> := interface<epic_internal>:
        # Determine if TagToCheck is present in this container, also checking against parent tags {"A.1"}.Has("A") will return True, {"A"}.Has("A.1") will return False If TagToCheck is not Valid it will always return False.
        Has<public>(TagToCheck:tag)<reads><decides>:void

        # Checks if this container contains ANY of the tags in the specified container, also checks against parent tags {"A.1"}.HasAny({"A","B"}) will return True, {"A"}.HasAny({"A.1","B"}) will return False If InTags is empty/invalid it will always return False.
        HasAny<public>(InTags:[]tag)<reads><decides>:void

        # Checks if this container contains ALL of the tags in the specified container, also checks against parent tags {"A.1","B.1"}.HasAll({"A","B"}) will return True, {"A","B"}.HasAll({"A.1","B.1"}) will return False If InTags is empty/invalid it will always return True, because there were no failed checks.
        HasAll<public>(InTags:[]tag)<reads><decides>:void