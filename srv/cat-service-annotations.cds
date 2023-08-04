using CatalogService as service from './cat-service';
/**
 * Annotations for Products
 */
annotate service.Products with {
    ID        @title: 'ID';
    AGREEMENT @title: 'Agreement';
}

annotate service.Products with @(
    UI.HeaderInfo     : {
        TypeName      : 'Products',
        TypeNamePlural: 'Products',
        Title         : {
            $Type: 'UI.DataField',
            Value: PROD_NAME
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: PROD_TYPE
        }

    },
    UI.SelectionFields: [
        PROD_NAME,
        PROD_TYPE,
        SUPPLIER_NAME,
        CUSTOMER_NAME
    ],

    UI.LineItem       : [
        {
            $Type        : 'UI.DataField',
            Label        : 'ID',
            Value        : ID,
            ![@UI.Hidden]: true,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Product Name',
            Value: PROD_NAME,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Product Type',
            Value: PROD_TYPE,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Customer Name',
            Value: CUSTOMER_NAME,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Supplier Name',
            Value: SUPPLIER_NAME,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Product Price',
            Value: PROD_PRICE,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Product Price',
            Value: CURRENCY
        },
        {
            $Type: 'UI.DataField',
            Label: 'Agreement',
            Value: AGREEMENT,
        }
    ]
);

annotate service.Products with @(
    UI.FieldGroup #GeneratedGroup1: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'ID',
                Value: ID
            // ![@UI.Hidden] : true,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Product Name',
                Value: PROD_NAME
            },
            {
                $Type: 'UI.DataField',
                Label: 'Product Type',
                Value: PROD_TYPE
            }
        ],
    },
    UI.FieldGroup #GeneratedGroup2: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'Customer Name',
                Value: CUSTOMER_NAME
            },
            {
                $Type: 'UI.DataField',
                Label: 'Supplier Name',
                Value: SUPPLIER_NAME
            },
            {
                $Type: 'UI.DataField',
                Label: 'Product Price',
                Value: PROD_PRICE
            },
            {
                $Type: 'UI.DataField',
                Label: 'Agreement',
                Value: AGREEMENT
            },
            {
                $Type: 'UI.DataField',
                Label: 'Currency',
                Value: CURRENCY
            },
            {
                $Type: 'UI.DataField',
                Label: 'Date of Manufacture',
                Value: DOB
            }
        ]
    },
    UI.FieldGroup #GeneratedGroup3: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'Created By',
                Value: HISTORY_CRTD_BY
            },
            {
                $Type: 'UI.DataField',
                Label: 'Created On',
                Value: HISTORY_CRTD_DATE
            },
            {
                $Type: 'UI.DataField',
                Label: 'Changed By',
                Value: HISTORY_CHNG_BY
            },
            {
                $Type: 'UI.DataField',
                Label: 'Changed On',
                Value: HISTORY_CHNG_DATE
            }
        ]
    },
    UI.Facets                     : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneratedFacet1',
            Label : 'General Information',
            Target: '@UI.FieldGroup#GeneratedGroup1',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneratedFacet2',
            Label : 'Additional Information',
            Target: '@UI.FieldGroup#GeneratedGroup2',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneratedFacet3',
            Label : 'History',
            Target: '@UI.FieldGroup#GeneratedGroup3',
        }
    ]
);


annotate service.Products with {
    PROD_NAME
    @(Common: {FieldControl: #Mandatory});
    SUPPLIER_NAME
    @(Common: {FieldControl: #Mandatory})
};

// drop down
annotate service.Products with {
    SUPPLIER_NAME @(Common: {
        Text           : LINK_TO_SUPPLIER.DESCRIPTION,
        TextArrangement: #TextOnly,        
        ValueList      : {
            CollectionPath: 'Suppliers',
            Label         : 'Supplier Name',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'DESCRIPTION',

                },
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: SUPPLIER_NAME,
                    ValueListProperty: 'ID',

                }
            ],

        }
    });
    CUSTOMER_NAME @(Common: {
        Text           : LINK_TO_CUSTOMER.DESCRIPTION,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues,
        ValueList      : {
            CollectionPath: 'Customers',
            Label         : 'Customers',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'DESCRIPTION',

                },
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: CUSTOMER_NAME,
                    ValueListProperty: 'ID',

                }
            ],

        }
    });
};

annotate service.Products with @(Capabilities.FilterRestrictions: {FilterExpressionRestrictions: [{
    Property          : SUPPLIER_NAME,
    AllowedExpressions: 'SingleValue'
}]});
