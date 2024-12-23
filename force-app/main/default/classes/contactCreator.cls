public with sharing class contactCreator {
    
    public static void createContactsForAccounts(List<Account> accounts) {

        List<Contact> newContacts = new List<Contact>();

        for(Account acc : accounts){
            Contact con = new Contact(LastName = acc.Name, Email = acc.Name.deleteWhiteSpace().toLowerCase()+'@test.com', AccountId=acc.Id);
            newContacts.add(con);
        }

        try{
            insert newContacts;
        } catch(Exception ex) {
            system.debug('An error occurred: ' + ex.getMessage());
        }

    }
}