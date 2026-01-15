using app.fashionShop from '../db/FashonShop';

service FashionShop_Service {

entity Sections as projection on fashionShop.Sections;
entity Fashion_Types as projection on fashionShop.Fashion_Types;
//entity Fashion_Items as projection on fashionShop.Fashion_Items;
entity Fashion_Items1 as projection on fashionShop.Fashion_Items1;
entity Srv_FashionShop as projection on fashionShop.YC_Fashion_Shop;
    
}

