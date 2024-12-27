public class OpportunityManager{

    private Account account;
    private List<Opportunity> opps;

    public OpportunityManager(Id accountId){
        this.account = [SELECT Id, Name, Industry FROM Account WHERE Id = :accountId];
        this.opps = [SELECT Id, Amount FROM Opportunity WHERE AccountId = :accountId];
    }

    public void updateOpportunityAmounts(Decimal increasePercent){
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
}