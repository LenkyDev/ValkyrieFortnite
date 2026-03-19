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

    # A queryable collection of tags.
    tag_view<native><public> := interface<epic_internal>:
        # Determine if TagToCheck is present in this container, also checking against parent tags {"A.1"}.Has("A") will return True, {"A"}.Has("A.1") will return False If TagToCheck is not Valid it will always return False.
        Has<public>(TagToCheck:tag)<reads><decides>:void

        # Checks if this container contains ANY of the tags in the specified container, also checks against parent tags {"A.1"}.HasAny({"A","B"}) will return True, {"A"}.HasAny({"A.1","B"}) will return False If InTags is empty/invalid it will always return False.
        HasAny<public>(InTags:[]tag)<reads><decides>:void

        # Checks if this container contains ALL of the tags in the specified container, also checks against parent tags {"A.1","B.1"}.HasAll({"A","B"}) will return True, {"A","B"}.HasAll({"A.1","B.1"}) will return False If InTags is empty/invalid it will always return True, because there were no failed checks.
        HasAll<public>(InTags:[]tag)<reads><decides>:void