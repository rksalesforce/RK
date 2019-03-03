public class renewal_Class{
    public static void updateTasks(List<id> oppid){
       List<opportunity> oppList = [select id,name,closedate,ownerid,StageName,expiration_date__C,Opportunity_Period__c  from opportunity where id IN:oppid];
       List<Task> renewalTasks = [select id,subject from task Where whatid IN :oppid AND subject Like 'Past%'];
       List<Task> updatedrenewalTasks = new List<Task>();
      
       if(renewalTasks.isEmpty()){
       for(Opportunity opp :oppList){
                Task opportunityRenewalTask = new Task();
                OpportunityrenewalTask.OwnerId  = opp.ownerid;
                OpportunityrenewalTask.Subject = 'Past Opportunity ' +opp.Name+ ' is waiting for renewal';
                OpportunityrenewalTask.Status = 'Open';
                OpportunityrenewalTask.Priority = 'Normal';
                OpportunityrenewalTask.WhatId = opp.Id;
                OpportunityrenewalTask.activitydate = opp.Expiration_Date__c.addDays(180);
                OpportunityrenewalTask.IsReminderSet = true;
                OpportunityrenewalTask.ReminderDateTime = OpportunityrenewalTask.activitydate;  
                renewalTasks.Add(OpportunityrenewalTask);
       }
        if(!renewalTasks.isEmpty()){
           insert renewalTasks;
       }
       }
       else{
       for(Opportunity opp :oppList){
           for(Task t :renewalTasks){
                t.activitydate = opp.Expiration_Date__c.addDays(180);
                updatedrenewalTasks.Add(t);
           }
       }
       update updatedrenewalTasks;
       
       }
      
    }
}