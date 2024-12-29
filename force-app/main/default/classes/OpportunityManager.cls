public class OpportunityManager{

    private Account account;
    private List<Opportunity> opps;

    public OpportunityManager(Id accountId){
        this.account = [SELECT Id, Name, Industry FROM Account WHERE Id = :accountId];
        this.opps = [SELECT Id, Amount FROM Opportunity WHERE AccountId = :accountId];
    }

    public void updateOpportunityAmount(Decimal increasePercent){
        for(Opportunity opp : this.opps){
            opp.Amount = opp.Amount * (1 + (increasePercent/100));
        }
        update this.opps;
    }

    public void setAllToClosedLost(){
        for(Opportunity opp : this.opps){
            opp.StageName = 'Closed Lost';
        }
        update this.opps;
    }

    public void makeNewTask(){
        List<Task> newTasks = new List<Task>();
        for(Opportunity opp : this.opps){
            Task t = new Task();
            t.WhatId = opp.Id;
            t.Subject = 'Please Follow Up';
            t.ownerId = UserInfo.getUserId();
            t.Priority = 'Normal';
            t.Status = 'Not Started';
            newTasks.add(t);
        }
        insert newTasks;
    }

}