public with sharing class myOpp {
    @AuraEnabled
    public static Opportunity saveOpportunity (Opportunity opp) {

    upsert opp;
    return opp;
    }
}