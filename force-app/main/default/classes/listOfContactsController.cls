public with sharing class listOfContactsController {
    
    @AuraEnabled(cacheable=true)
    public static List<Contact> getRecentContacts(){
        return [SELECT Id, FirstName, LastName, Email
                FROM Contact
                ORDER BY LastModifiedDate DESC
                LIMIT 5];
    }

}