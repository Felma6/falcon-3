import { LightningElement , wire } from 'lwc';
import getAccounts from '@salesforce/apex/AccountController2.getAccounts';

export default class LwcWire extends LightningElement {
    @wire(getAccounts)
    accounts;
}