namespace db;
using db.types as types from '../data-Model/types';

entity PRODUCTS {
    key ID               : UUID;
        @title: 'Product Name'
        PROD_NAME        : String(256);
        @title: 'Product Price'
        PROD_PRICE       : Int64;
        @title: 'Product Type'
        PROD_TYPE        : String(256);
        @title: 'Supplier Name'
        SUPPLIER_NAME    : String(256);
        @title: 'Customer Name'
        CUSTOMER_NAME    : String(256);
        @title: 'History'
        HISTORY          : types.HistoryT;
        @title: 'Agreement'
        AGREEMENT   : Boolean default false;

        LINK_TO_SUPPLIER : Association[1.. *] to SUPPLIER
                               on LINK_TO_SUPPLIER.DESCRIPTION = SUPPLIER_NAME;
        LINK_TO_CUSTOMER : Association[1.. *] to CUSTOMER
                               on LINK_TO_CUSTOMER.DESCRIPTION = CUSTOMER_NAME;

}

entity SUPPLIER {
    key ID          : UUID;
        DESCRIPTION : String(256);
}

entity CUSTOMER {
    key ID          : UUID;
        DESCRIPTION : String(256);
}
