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
    
}