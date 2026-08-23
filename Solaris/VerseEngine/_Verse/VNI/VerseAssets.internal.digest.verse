# Verse path: /Verse.org
# Module import path: /Verse.org/Assets
Assets<public> := module:
    using {/Verse.org/Colors}
    using {/Verse.org/Simulation}
    using {/Verse.org/Native}
    using {/Verse.org/Restricted}
    @attribscope_class
    @customattribhandler
    asset_proxy_attribute<epic_internal> := class<computes><internal>(attribute):


    asset_proxy<constructor><epic_internal>(AssetProxy:string)<computes>:asset_proxy_attribute = external {}

    @attribscope_class
    @attribscope_struct
    @attribscope_data
    asset_locus<epic_internal> := class<computes>(attribute):
        Whence<epic_internal>:string

    # Create an asset reference to the given internal asset path
    MakeAsset<native><epic_internal>(asset_type:subtype(asset), AssetPath:string)<converges>:asset_type

    # Create a texture asset reference with dimensions sourced at manifest-generation time
    MakeTextureAsset<native><epic_internal>(AssetPath:string, Width:float, Height:float)<converges>:texture

    asset<native><epic_internal> := class<computes><epic_internal>:
        SyncLoad<native><epic_internal>():logic

        Async_Load<native><epic_internal>():sticky_event(void)

        GetAsyncLoadEvent<native><epic_internal>()<decides>:sticky_event(void)

        GetAssetType<native><epic_internal>()<transacts><decides>:subtype(asset)

        InitializeNetworkReplication<native><epic_internal>()<transacts>:void

        SetPath<native><epic_internal>(InPath:string)<transacts>:void

    client_asset<native><epic_internal> := class<abstract><computes><epic_internal>(asset):


    animation_asset<native><epic_internal> := interface<computes><epic_internal>:


    animation_sequence<native><public> := class<computes><final><epic_internal>(asset, animation_asset):


    material_like<native><epic_internal> := interface<computes><epic_internal>:


    material<native><public> := class<epic_internal>(asset, property_changed_interface, material_like):
        @transient
        MaterialPath<native><epic_internal>:string = external {}

        bUsesGetSetters<native><epic_internal>:logic = external {}

        OnPropertyChangedFromVerse<native><override>(PropertyName:string)<transacts>:void

        SetFloatProperty<native><epic_internal>(PropertyName:string, NewFloat:float)<transacts>:void

        SetColorProperty<native><epic_internal>(PropertyName:string, NewColor:color)<transacts>:void

        SetTextureProperty<native><epic_internal>(PropertyName:string, NewTexture:texture)<transacts>:void

    @available {MinUploadedAtFNVersion := 4100}
    control_rig<native><epic_internal> := class<final><epic_internal>(asset, animation_asset):


    @available {MinUploadedAtFNVersion := 4100}
    control_rig_blueprint<native><epic_internal> := class<final><epic_internal>(asset, animation_asset):


    particle_system<native><public> := class<computes><final><epic_internal>(client_asset):


    particle_data_channel<native><epic_internal> := class<computes><epic_internal>(client_asset):


    skeletal_mesh<native><epic_internal> := class<computes><final><epic_internal>(mesh):


    landscape_mesh<native><epic_internal> := class<computes><final><epic_internal>(mesh):


    mesh<native><public> := class<computes><epic_internal>(asset):


    sound<native><epic_internal> := class<computes><final><epic_internal>(client_asset):


    sound_wave<native><public> := class<computes><final><epic_internal>(client_asset):


    metasound<native><epic_internal> := class<computes><final><epic_internal>(client_asset):


    font<native><epic_internal> := class<computes><final><epic_internal>(client_asset):


    level<native><epic_internal> := class<computes><final><epic_internal>(asset):


    image_dimensions<native><epic_internal> := interface<computes>:
        Height<epic_internal>:float

        Width<epic_internal>:float

    texture_base<native><epic_internal> := class<computes><epic_internal>(asset):


    texture<native><public> := class<computes><final><epic_internal>(texture_base, material_like, image_dimensions):
        Height<native><override>:float = external {}

        Width<native><override>:float = external {}

    input_action<native><public>(t:type) := class<allocates><unique><computes><epic_internal>(asset):
        (/Verse.org/Assets/input_action:)Assets_input_action_Variance<private>():tuple(t) = external {}

        Path<native><epic_internal>:string = external {}

        RequiredByCompiler<epic_internal>:?t = external {}

    input_mapping<native><public> := class<computes><epic_internal>(asset):


    camera_rig_asset<native><epic_internal> := class<computes><epic_internal>(asset):


    network_physics_settings_data<native><epic_internal> := class<computes><epic_internal>(asset):


    # Interface that provides an icon.
    has_icon<native><public> := interface:
        @editable
        # A texture used as the 2D visual representation of this entity (e.g. an icon or portrait).
        var Icon<public>:texture

    WriteToDataChannelFromVerseInternal<native><epic_internal>((Asset:particle_data_channel, Payload:t) where t:type)<transacts>:void

    # The UClass generated by the PropertyInterface asset. It represents the property_interface verse class but with UE5 properties.
    property_interface_UE5_definition<native><epic_internal> := class<computes><final>(asset):


    # property_interface that will be generated in the digest from the Editable
    parameterized_property_interface<native><epic_internal> := class<unique>(property_changed_interface):
        UE5Class<native><epic_internal>:property_interface_UE5_definition

        OnPropertyChangedFromVerse<native><override>(PropertyName:string)<transacts>:void