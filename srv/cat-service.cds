using db as db from '../db/data-Model/data-Model';

service CatalogService @(requires: 'authenticated-user') {
    entity Products as projection on db.PRODUCTS {
        *,
        LINK_TO_SUPPLIER : redirected to Suppliers, 
        LINK_TO_CUSTOMER : redirected to Customers,
    };

    entity Suppliers as projection on db.SUPPLIER;
    entity Customers as projection on db.CUSTOMER;
}
