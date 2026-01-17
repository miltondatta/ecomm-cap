using app.fashionShop from '../db/FashonShop';

service FashionShop_Service {

entity Sections as projection on fashionShop.Sections;
entity Fashion_Types as projection on fashionShop.Fashion_Types;
//entity Fashion_Items as projection on fashionShop.Fashion_Items;
entity Fashion_Items as projection on fashionShop.Fashion_Items;
entity Srv_FashionShop as projection on fashionShop.ZC_Faschion;
    
}

annotate fashionShop.Fashion_Items with @(UI: {
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
        {Value : fashionType.typename},
        {Value : fashionType.description},
        {Value : fashionType.section.id},
        {Value : fashionType.section.name}
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
