public with sharing class dailyChallenge {
    
    // Christmas Eve
    public static Map<Id, Integer> getContactCountsByAccount(List<Account> accounts) {

        if(accounts == null || accounts.isEmpty()){
            return new Map<Id, Integer>();
        }

        Map<Id, Integer> result = new Map<Id, Integer>();

        for(Account acc : accounts) {
            result.put(acc.Id, 0);
        }

        for(AggregateResult ar : [SELECT AccountId, COUNT(Id) contactCount FROM Contact WHERE AccountId IN :accounts GROUP BY AccountId]){
            result.put((Id)ar.get('AccountId'), (Integer)ar.get('contactCount'));
        }

        return result;

    }

    // Christmas
    public static Integer updateOpportunityAmounts(Id accountId, Decimal newAmount){
        List<Opportunity> updatedOpps = new List<Opportunity>();
        Integer oppsProcessed = 0;

        for(Opportunity opp : [SELECT Id, Amount FROM Opportunity WHERE AccountId = :accountId and StageName = 'Prospecting']){
            opp.Amount = newAmount;
            updatedOpps.add(opp);
        }

        if(!updatedOpps.isEmpty()){
            update updatedOpps;
            oppsProcessed += updatedOpps.size();
        }
        
        return oppsProcessed;
    }

    // Christmas 2
    public static Map<String, List<Contact>> groupContactsByIndustry(List<Contact> contacts){

        Map<String, List<Contact>> result = new Map<String, List<Contact>>();

        for(Contact con : contacts){
            if(con.AccountId != null && con.Account?.Industry != null){

                if(result.get(con.Account.Industry) == null){
                    result.put(con.Account.Industry, new List<Contact>());
                }

                result.get(con.Account.Industry).add(con);

            }

        }

        return result;

    }


}