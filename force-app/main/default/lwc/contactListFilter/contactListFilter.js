import { LightningElement, wire, api } from 'lwc';
import getContacts from '@salesforce/apex/contactController.getContacts';

export default class ContactListFilter extends LightningElement {

    @api recordId;
    lastName = '';

    columns = [
        {label: 'First Name', fieldName: 'FirstName', sortable: true},
        {label: 'Last Name', fieldName: 'LastName', sortable: true},
        {label: 'Email', fieldName: 'Email', sortable: true}
    ];

    @wire(getContacts, {lastName: '$lastName'})
    contacts;

    handleLastNameChange(event){
        this.lastName = event.target.value;
    }

}