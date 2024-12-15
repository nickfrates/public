import { LightningElement, wire, api } from 'lwc';
import getContacts from '@salesforce/apex/contactController.getContacts';

export default class ContactListFilter extends LightningElement {

    @api recordId;
    lastName = '';

    columns = [
        {label: 'First Name', fieldName: 'FirstName', type: 'text'},
        {label: 'Last Name', fieldName: 'LastName', type: 'text'},
        {label: 'Email', fieldName: 'Email', type: 'text'}
    ];

    @wire(getContacts, {lastName: '$lastName'})
    contacts;

    handleLastNameChange(event){
        this.lastName = event.target.value;
    }

}