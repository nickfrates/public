public with sharing class AccountUtility {
    
    public static Map<String, Id> createTechAccounts(List<String> accountNames){
        List<Account> newAccounts = new List<Account>();
        Map<String, Id> accNames = new Map<String, Id>();

        for(String accName : accountNames){
            Account acc = new Account(Name = accName);
            if(accName.containsIgnoreCase('Tech')){
                acc.Rating = 'Hot';
            }
            newAccounts.add(acc);
        }

        insert newAccounts;

        for(Account acc : newAccounts){
            accNames.put(acc.Name, acc.Id);
        }

        return accNames;

    }

    public static Map<Id, List<Contact>> createAccountsWithDefaultContacts(List<String> accountNames){
        List<Account> newAccounts = new List<Account>();
        List<Contact> newContacts = new List<Contact>();
        Map<Id, List<Contact>> result = new Map<Id, List<Contact>>();

        for(String acc : accountNames){
            Account a = new Account(Name=acc);
            newAccounts.add(a);
        }
        insert newAccounts;

        for(Account acc : newAccounts){
            Contact con1 = new Contact(LastName = 'con1', AccountId = acc.Id, Title = 'CEO');
            Contact con2 = new Contact(LastName = 'con2', AccountId = acc.Id, Title = 'CFO');
            newContacts.add(con1);
            newContacts.add(con2);
        }
        insert newContacts;

        for(Contact con : newContacts){
            if(!result.containsKey(con.AccountId)){
                result.put(con.AccountId, new List<Contact>());
            }
            result.get(con.AccountId).add(con);
        }

        return result;

    }
    
}