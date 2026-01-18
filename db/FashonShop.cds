namespace app.fashionShop;
using { Currency } from '@sap/cds/common';

type Flag : String(1);


entity Sections {
    key id: UUID @(title : 'Section ID');
        name: String(16) @(title : 'Section Name');
        description: String(64) @(title : 'Section Description');
}

entity Fashion_Types {
    key id: UUID @(title : 'Fashion Type ID');
        section: Association to Sections @(title : 'Section ID');
        typename: String(16) @(title : 'Fashion Type');
        description: String(64) @(title : 'Fashion Type Description');
}

entity Fashion_Items {
    key id: UUID @(title : 'Fashion Item ID');
        fashionType: Association to Fashion_Types @(title : 'Fashion Type ID');
        itemname: String(16) @(title : 'Item Name');
        brand: String(16) @(title : 'Item Brand');
        size: String(8) @(title : 'Size');
        material: String(100) @(title : 'Item Material');
        price: Double @(title : 'Item Price');
        currency: Currency @(title : 'Currency');
        isavailable: Flag @(title : 'Is Available');
}

view ZC_Faschion as select from Fashion_Items as fItem {
    fItem.fashionType.section.id as sectionId,
    fItem.fashionType.section.name as sectionName,
    fItem.fashionType.section.description as sectionDesc,
    fItem.fashionType.id as fashionTypeId,
    fItem.fashionType.typename as fashionTypeName,
    fItem.fashionType.description as fashionTypeDesc,
    fItem.id as fashionItemId,
    fItem.itemname as fashionItemName,
    fItem.brand as fashionItemBrand,
    fItem.material as fashionItemMat,
    fItem.price as itemPrice,
    fItem.currency as itemCurrency,
    fItem.isavailable as iTemAvailable,
    concat( fItem.brand, concat( ' ', fItem.itemname ) ) as iTemDetails : String(100),
    case
        when fItem.price >= 500 then 'Premium'
        when fItem.price >= 100 and fItem.price <= 500 then 'Mid Range'
        else 'Low Range'
    end as iTemRange : String(32)
} where fItem.isavailable = 'X' ;

view YC_Fashion_Type as select from fashionShop.Fashion_Types as fTypes
{
    fTypes.id as fashionTypeId,
    fTypes.typename as fashionTypeName,
    fTypes.section.name as section_name
}
