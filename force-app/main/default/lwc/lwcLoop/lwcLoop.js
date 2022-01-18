import { LightningElement , track } from 'lwc';

export default class LwcLoop extends LightningElement {
    @track contacts = [
        {
            FirstName: 'Sha',
            LastName: 'Rejepov',
            ContactIndex: 1
        },
        {
            FirstName: 'Bobby',
            LastName: 'Shmurda',
            ContactIndex: 2
        },
        {
            FirstName: 'Danny',
            LastName: 'DeVito',
            ContactIndex: 3
        },
        {
            FirstName: 'Nick',
            LastName: 'Jonas',
            ContactIndex: 4
        },
        {
            FirstName: 'Roger',
            LastName: 'Federer',
            ContactIndex: 5
        }
    ];
}
