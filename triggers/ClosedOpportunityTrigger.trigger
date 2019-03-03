trigger ClosedOpportunityTrigger on Opportunity (before insert ,before update) {
     List<Task> lstTasks = new List<Task>();
    for(Opportunity opp : trigger.new){
        if(opp.StageName == 'Closed Won'){
            Task t = new Task();
            t.subject = 'Follow Up Test Task';
            t.whatid = opp.id;
            lstTasks.add(t);
        }
    }
        insert lstTasks;
   
}