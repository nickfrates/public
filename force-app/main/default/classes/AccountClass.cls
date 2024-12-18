public with sharing class AccountClass {
    
    public static void makeContacts(List<Account> accounts) {
        
        List<Contact> newContacts = new List<Contact>();
        for(Account acc : accounts){
            Contact con = new Contact(LastName = acc.Name, Email = acc.Name.toLowerCase().replaceAll('\\s+','')+'@testcompany.com', AccountId = acc.Id);            
            newContacts.add(con);
        }
        insert newContacts;
    }
}