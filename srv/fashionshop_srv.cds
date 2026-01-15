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
    
});
