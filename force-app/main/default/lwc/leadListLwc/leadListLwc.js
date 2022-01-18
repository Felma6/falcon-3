import { LightningElement, wire } from 'lwc';
import fetchLeads from '@salesforce/apex/LeadClass.fetchLeads';

export default class LeadListLwc extends LightningElement {
    @wire(fetchLeads)
    leads;

    //leads => property
    //leads.data => will have all the leads in the system
    //leads.error=> will have the error occurred during server call
    //when data is success, error is null => leads.data !=null; leads.error == null
    //when data is failure, data is null => leads.data ==null; leads.error != null
}