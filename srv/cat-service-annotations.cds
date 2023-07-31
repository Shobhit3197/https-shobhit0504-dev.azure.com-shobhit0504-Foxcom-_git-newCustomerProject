using CatalogService as service from './cat-service';

/**
 * Annotations for Products
 */

// annotate service.Products {
//     ID @UI.HiddenFilter;
// }

annotate service.Products with {
    ID        @title: 'ID';
    AGREEMENT @title: 'Agreement';
}

// annotate service.Products with @(
//   Capabilities: {
//     DeleteRestrictions: {
//       Deletable: false
//     }
//   }
// );
annotate service.Products with @(
    UI.HeaderInfo     : {
        TypeName      : 'Products',
        TypeNamePlural: 'Products'
    },
    UI.SelectionFields: [
        PROD_NAME,
        PROD_TYPE,
        SUPPLIER_NAME,
        CUSTOMER_NAME
    ],

    UI.LineItem       : [
        {
            $Type: 'UI.DataField',
            Label: 'ID',
            Value: ID,
        // ![@UI.Hidden] : true,
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
                Value: ID,
            // ![@UI.Hidden] : true,
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
            }
        ],
    },
    UI.FieldGroup #GeneratedGroup2: {
        $Type: 'UI.FieldGroupType',
        Data : [
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
                Label: 'Agreement',
                Value: AGREEMENT,
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
    SUPPLIER_NAME @(Common : {
        Text            : LINK_TO_SUPPLIER.DESCRIPTION,
        TextArrangement : #TextOnly,        
        ValueListWithFixedValues,
        ValueList       : {
            CollectionPath : 'Suppliers',
            Label          : 'Supplier Name',           
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'DESCRIPTION',
                    
                },
                {
                    $Type             : 'Common.ValueListParameterOut',
                    LocalDataProperty : SUPPLIER_NAME,
                    ValueListProperty : 'ID',
                    
                }    
            ],          

        }
    });
    // BUSINESS_UNIT_ID @(Common : {
    //     Text            : LINK_TO_BUSINESS_UNIT.DESCRIPTION,
    //     TextArrangement : #TextOnly,        
    //     ValueListWithFixedValues,
    //     ValueList       : {
    //         CollectionPath : 'BusinessUnits',
    //         Label          : 'Business Unit Description',           
    //         Parameters     : [
    //             {
    //                 $Type             : 'Common.ValueListParameterDisplayOnly',
    //                 ValueListProperty : 'DESCRIPTION',
                    
    //             },
    //             {
    //                 $Type             : 'Common.ValueListParameterOut',
    //                 LocalDataProperty : BUSINESS_UNIT_ID,
    //                 ValueListProperty : 'ID',
                    
    //             }                
    //         ],          

    //     }
    // });
};