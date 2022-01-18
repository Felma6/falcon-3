import { LightningElement , wire } from 'lwc';
import { getObjectInfo , getObjectInfos , getPicklistValues } from 'lightning/uiObjectInfoApi';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import STATE_FIELD from '@salesforce/schema/Account.State__c';
import COUNTRY_FIELD from '@salesforce/schema/Account.Country__c';
import CITY_FIELD from '@salesforce/schema/Account.Cities__c';

export default class LdsWireGet extends LightningElement {
    @wire(getObjectInfo, { objectApiName: ACCOUNT_OBJECT })
    getObjectInfoData({ data, error }) {
        if (data) {
            console.log('getObjectInfo=>Account Info: ', JSON.stringify(data));
        } else if (error) {
            console.log('Error getObjectInfo: ', JSON.stringify(error));
        }
    }

    @wire(getObjectInfos, { objectApiNames: [CONTACT_OBJECT, ACCOUNT_OBJECT] })
    getObjectInfosData({ data, error }){
        if (data) {
            console.log('getObjectInfos=>: ', JSON.stringify(data));
        } else if (error) {
            console.log('Error getObjectInfos: ', JSON.stringify(error));
        }
    }
    //Below is for Master recordType
    //@wire(getPicklistValues, { recordTypeId: '012000000000000AAA', fieldApiName: COUNTRY_FIELD })
    //Below is for World recordType - replace the record type Id from your salesforce org
    @wire(getPicklistValues, { recordTypeId: '0125j000000QGHQ', fieldApiName: COUNTRY_FIELD })
    getCountryPicklist({ data, error }) {
        if (data) {
            console.log('Country Picklist=>: ', JSON.stringify(data));
        } else if (error) {
            console.log('Error State: ', JSON.stringify(error));
        }
    }

    //Below is for Master recordType
    //@wire(getPicklistValues, { recordTypeId: '012000000000000AAA', fieldApiName: STATE_FIELD })
    //Below is for World recordType - replace the record type Id from your salesforce org
    @wire(getPicklistValues, { recordTypeId: '0125e000000AlRn', fieldApiName: STATE_FIELD })
    getStatePicklist({ data, error }) {
        if (data) {
            console.log('State Picklist=>: ', JSON.stringify(data));
        } else if (error) {
            console.log('Error State: ', JSON.stringify(error));
        }
    }
    
    //Below is for Master recordType
    //@wire(getPicklistValues, { recordTypeId: '012000000000000AAA', fieldApiName: CITY_FIELD })
    //Below is for World recordType - replace the record type Id from your salesforce org
    @wire(getPicklistValues, { recordTypeId: '0125e000000AlRn', fieldApiName: CITY_FIELD })
    getCityPicklist({ data, error }) {
        if (data) {
            console.log('City Picklist=>: ', JSON.stringify(data));
        } else if (error) {
            console.log('Error State: ', JSON.stringify(error));
        }
    }
}