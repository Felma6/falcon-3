import { LightningElement, track } from 'lwc';

export default class DecoratorsLwc extends LightningElement {
    message = 'This is default message';
    contact = {
        FirstName: 'John',
        LastName: 'Travolta'
    };

    handleClick() {
        this.message = 'This message is changed'
        this.contact.FirstName = 'John to John';
        this.contact.LastName = 'Travolta to Travolta';
    }

    get FullName() {
        return this.contact.FirstName + this.contact.LastName;
    }
}