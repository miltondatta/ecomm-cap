namespace app.fashionShop;
using { Currency } from '@sap/cds/common';

type Flag : String(1);


entity Sections {
    key id: UUID;
        name: String(16);
        description: String(64);
}

entity Fashion_Types {
    key id: UUID;
        section: Association to Sections;
        typename: String(16);
        description: String(64);
}

// entity Fashion_Items {
//     key id: UUID;
//         fashionType: Association to Fashion_Types;
//         itemname: String(16);
//         brand: String(16);
//         size: String(8);
//         material: String(100);
//         currency: Currency;
//         isavailable: Flag;
// }

entity Fashion_Items1 {
    key id: UUID;
        fashionType: Association to Fashion_Types;
        itemname: String(16);
        brand: String(16);
        size: String(8);
        material: String(100);
        price: Double;
        currency: Currency;
        isavailable: Flag;
}


view YC_Fashion_Shop as select from Fashion_Items1 as fItem{
    fItem.fashionType.section.id as sectionId,
    fItem.fashionType.section.name as sectionName,
    fItem.fashionType.section.description as sectionDesc,
    fItem.fashionType.id as fashionTypeId,
    fItem.fashionType.typename as fashionTypeName,
    fItem.fashionType.description as fashionTypeDesc,
    fItem.id as fashionItemId,
    fItem.itemname as fashionItemName,
    fItem.brand as brand,
    fItem.size as size,
    fItem.material as material,
    fItem.price as price,
    fItem.currency as currency,
    //fItem.isavailable as isavailable,
    concat( fItem.brand, concat( ' ', fItem.itemname) ) as itemDetails: String(64),
    case
        when fItem.price >= 500 then 'Premium'
        when fItem.price >= 100 and fItem.price <=500 then 'Mid Range'
        else 'Low Range'
    end as priceRange : String(10)
} where fItem.isavailable = 'x';