using app.fashionShop from '../db/FashonShop';

service FashionShop_Service {

entity Sections as projection on fashionShop.Sections;
@cds.redirection.target : true
entity Fashion_Types as projection on fashionShop.Fashion_Types;
//entity Fashion_Items as projection on fashionShop.Fashion_Items;
entity Fashion_Items as projection on fashionShop.Fashion_Items;
entity Srv_FashionShop as projection on fashionShop.ZC_Faschion;
entity F4_FashionType as projection on fashionShop.YC_Fashion_Type;    
}

@odata.draft.enabled
annotate fashionShop.Fashion_Items with @(UI: {
    CreateHidden : false,
    UpdateHidden : false,
    DeleteHidden : false,
    HeaderInfo  : {
        $Type : 'UI.HeaderInfoType',
        TypeName : 'Online Fashion Shop',
        TypeNamePlural : 'Online Fashion Shop',
        Title : { Value: itemname},
        Description : { Value : 'Online Fashion Shop'}
    },

    SelectionFields  : [
        fashionType_id,
        itemname,
        brand,
        size,
        price
    ],

    LineItem  : [
        
        { Value : fashionType.section.name },
        { Value : fashionType.typename },
        { Value : itemname },
        { Value : brand },
        { Value : size },
        { Value : price },
        { Value : currency_code },
        { Value : isavailable }

    ],

    Facets    : [{
        $Type : 'UI.CollectionFacet',
        ID : '1',
        Label : 'Fashion Type & Section',
        Facets: [{
            $Type : 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#Section'
        }]
    },
    {
        $Type : 'UI.CollectionFacet',
        ID : '2',
        Label : 'Fashion Details',
        Facets: [{
            $Type : 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#ItemDetails'
        }]
    }
    ],

    FieldGroup #Section : {Data: [
        {Value : fashionType.id},
        {Value : fashionType.typename, ![@Common.FieldControl] : #ReadOnly},
        {Value : fashionType.description,![@Common.FieldControl] : #ReadOnly},
        {Value : fashionType.section.id,![@Common.FieldControl] : #ReadOnly},
        {Value : fashionType.section.name,![@Common.FieldControl] : #ReadOnly}
    ],
        $Type : 'UI.FieldGroupType'
        
    },

    FieldGroup #ItemDetails : {Data : [
        { Value : id },
        { Value : itemname },
        { Value : brand },
        { Value : material },
        { Value : size },
        { Value : price },

    ],
        $Type : 'UI.FieldGroupType',
        
    },
    
});

annotate FashionShop_Service.Fashion_Items with {

    fashionType @(
        title : 'Fashion Types',
        sap.value.list : 'Fixed Type',
        Common : {
            ValueListWithFixedValues,
            ValueList : {
                CollectionPath : 'F4_FashionType',
                Parameters : [
                    {
                        $Type : 'Common.ValueListParameterInOut',
                        ValueListProperty: 'fashionTypeId',
                        LocalDataProperty : fashionType_id
                    },
                    {
                        $Type : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty: 'section_name',
                        
                    },
                    {
                        $Type : 'Common.ValueListParameterInOut',
                        ValueListProperty: 'fashionTypeName'
                        
                    }

                ]
                
            },
        }
    )

};
