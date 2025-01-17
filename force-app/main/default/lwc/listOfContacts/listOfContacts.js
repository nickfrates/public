import { LightningElement, wire } from 'lwc';
import getRecentContacts from '@salesforce/apex/listOfContactsController.getRecentContacts';

export default class ListOfContacts extends LightningElement {

    contacts;
    error;
    loading = false;

    columns = [
        {label: 'First Name', fieldName: 'FirstName', type: 'text'},
        {label: 'Last Name', fieldName: 'LastName', type: 'text'},
        {label: 'Email', fieldName: 'Email', type: 'text'}
    ];


    queryContacts(){
        this.loading = true;
        getRecentContacts()
            .then(result => {
                this.contacts = result;
                this.error = undefined;
            })
            .catch(error => {
                this.error = error.body.message;
                this.contacts = undefined;
            })
            .finally(() => {
                this.loading = false;
            });
    }


}