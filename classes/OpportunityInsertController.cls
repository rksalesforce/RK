public class OpportunityInsertController {
    @AuraEnabled
    public static Opportunity save(Opportunity opp)
    {
      opp.StageName = 'Full BR with Account Online';
        //opp.Expiration_Date__c = system.today().format();
     insert opp;
        return opp;
    }
   
}