public with sharing class OpportunityController{
@AuraEnabled

public static Opportunity saveOpportunity (Opportunity opp) {

upsert opp;
return opp;
}
}