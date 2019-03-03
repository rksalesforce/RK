trigger renewalTasks_trigger on Opportunity (after update,before insert,before update) {
if(trigger.isUpdate && trigger.isBefore){
    for(Opportunity opp :trigger.new){
       // opp.StageName = opp.Stage__C;
    }
    
}
if(trigger.isInsert&& trigger.isBefore){
    for(Opportunity opp :trigger.new){
      //  opp.StageName = opp.Stage__C;
    }
    
}

if(trigger.isUpdate && trigger.isAfter){
    List<id> oppids = new List<id>();
     List<Account> accList = [select id,name,Recently_closed_Opportunity__C,(select id,name,StageName from Opportunities where StageName = 'Xdate Close Date' AND id in:trigger.new) from Account];   
        for(Account acc : accList){
           
            for(Opportunity opp :acc.opportunities){
                if(Opp.StageName=='Xdate close date'){
                oppids.Add(opp.id);
                //  acc.Recently_closed_Opportunity__C = opp.id;
                 // acc.Register_Date__c = '';
               }
                      
                if(!oppIds.isEmpty()){
               // renewal_Class.updateTasks(oppids);
                }
            }
        }
         update acclist;

}
}