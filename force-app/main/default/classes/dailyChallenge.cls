public with sharing class dailyChallenge {
    
    
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
}