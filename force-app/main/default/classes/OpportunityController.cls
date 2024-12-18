public with sharing class OpportunityController {
 
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getAccountOpportunities(Id accountId){
        return [SELECT Id, Name, StageName, CloseDate, Amount
                FROM Opportunity
                WHERE AccountId = :accountId
                ORDER BY CloseDate DESC];
    }
    
}