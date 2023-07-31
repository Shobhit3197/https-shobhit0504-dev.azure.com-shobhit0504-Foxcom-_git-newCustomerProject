namespace db.types;

using {
    managed,
    sap
} from '@sap/cds/common';

type AppIdT : String(40);
type UserT  : String(256);

type HistoryT {

    @readonly
    @Common.Label : 'Created By'
    @cds.on.insert: $user
    CRTD_BY     : UserT;

    @readonly
    @Common.Label : 'Created On'
    @cds.on.insert: $now
    CRTD_DATE   : DateTime;

    @UI.Hidden
    CRTD_APP_ID : AppIdT;

    @readonly
    @Common.Label : 'Changed By'
    @cds.on.insert: $user
    @cds.on.update: $user
    CHNG_BY     : UserT;

    @readonly
    @Common.Label : 'Changed On'
    @cds.on.insert: $now
    @cds.on.update: $now
    CHNG_DATE   : DateTime;

    @UI.Hidden
    CHNG_APP_ID : AppIdT;
};
