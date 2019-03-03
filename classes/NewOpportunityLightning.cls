public class NewOpportunityLightning {
	
    
    @AuraEnabled
    public static date accRecentopp(String accid)
    {
        account acc=[select id,name,recently_closed_Opportunity_Date__c from account where id=:accid];
        acc.recently_closed_Opportunity_Date__c=acc.recently_closed_Opportunity_Date__c.addYears(1);
        return acc.recently_closed_Opportunity_Date__c;
    }
    @AuraEnabled
    public static list<string> StageName()
    {
        List<String> pickListValuesList= new List<String>();
		Schema.DescribeFieldResult fieldResult = Opportunity.StageName.getDescribe();
		List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
		for( Schema.PicklistEntry pickListVal : ple){
			pickListValuesList.add(pickListVal.getLabel());
		}     
		return pickListValuesList;
    }
    @AuraEnabled
    public static list<string> typePickval()
    {
        List<String> pickListValuesList= new List<String>();
		Schema.DescribeFieldResult fieldResult = Opportunity.Type.getDescribe();
		List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
		for( Schema.PicklistEntry pickListVal : ple){
			pickListValuesList.add(pickListVal.getLabel());
		}     
		return pickListValuesList;
    }  
    @AuraEnabled
    public static string saveopp(opportunity opp)
    {
       // Opportunity opportunity = (Opportunity)JSON.deserialize(opp, Opportunity.Class);
      //  system.debug('opportunity::::::::'+opportunity);
      //  opp.AccountId='0017F00000vdFkEQAU';
        insert opp;
        return opp.id;
    }
    @AuraEnabled
    public static list<Opportunity> oppdetails(string accid)
    {
        list<Opportunity> lstopp=[select id,name,AccountId,Type,StageName,Probability,Expiration_Date__c,CloseDate
                                  from Opportunity where AccountId=:accid];
        return lstopp;
    }
    
}