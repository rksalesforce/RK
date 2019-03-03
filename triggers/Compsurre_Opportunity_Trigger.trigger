trigger Compsurre_Opportunity_Trigger on Opportunity (before insert,after insert,before update,after update) {
 if(system.isFuture()) return;
 Task OpportunityrenewalTask = new task();
  //Before Insert
   if(trigger.isinsert&&trigger.isbefore){
        for(Opportunity opp : trigger.new){
           
        }
   }
  
    //After Insert
    
  if(trigger.isInsert && trigger.isafter){
   List<id> insertOppids = new List<Id>();
   List<id> insertRenewalOppids = new List<Id>();
      for(Opportunity opp : trigger.new){
          insertoppIds.Add(opp.id);
          if(opp.renewal__C ==true){
            insertRenewalOppids.add(opp.id); 
          }
      }
      //update oppdateids;
      CompsurreTasks_helper.createTasks(insertoppIds);
    //  opportunityRenewalIntegrationClass.opprenewal(insertRenewalOppids);
     
      /*  List<Opportunity> deleteopp = new List<opportunity>();
      for(Opportunity opp1 : trigger.new){
          if(opp1.Renewal_Status__c == 'true'){
              deleteopp.add(opp1);
               }
      }
      if(!deleteopp.isEmpty()){
          delete deleteopp;
      }*/
      ramki999Integration r = new ramki999Integration();
    ramki999Integration.insertAccount(insertOppids);
      
  }
 
  //Before Update
  if(trigger.isUpdate && trigger.isbefore){
      List<id> sendEmailIDs=new list<id>();
      Set<Id> parentIds=new Set<Id>();
       List<Id> producerIds=new List<Id>();

       
      for (Opportunity opp : trigger.new){
          
           if (opp.StageName.trim()=='Provide  Account the necessary langauge to request loss runs via email' && (opp.Send_Email_1_Status__c=='' || opp.Send_Email_1_Status__c==NULL || opp.Send_Email_1_Status__c != 'true')) {
               sendEmailIDs.Add(opp.id);
               parentIds.add(opp.accountId);
           }
           if(opp.StageName=='Work with Client to Award Business') {
               producerids.Add(opp.id);
           }  
           
           /*if (opp.StageName.trim()=='Provide  Account the necessary langauge to request loss runs via email' && (opp.Send_Email_1_Status__c=='' || opp.Send_Email_1_Status__c==NULL || opp.Send_Email_1_Status__c != 'true')) {
              parentIds.add(opp.accountId);
           }*/
        
          /*if(opp.stageName == 'Xdate Close Date'){
                OpportunityrenewalTask.OwnerId  = opp.ownerid;
                OpportunityrenewalTask.Subject = 'Past Opportunity ' +opp.Name+ ' is waiting for renewal';
                OpportunityrenewalTask.Status = 'Open';
                OpportunityrenewalTask.Priority = 'Normal';
                OpportunityrenewalTask.WhatId = opp.Id;
                OpportunityrenewalTask.activitydate = opp.Expiration_Date__c.addDays(180);
                OpportunityrenewalTask.IsReminderSet = true;
                OpportunityrenewalTask.ReminderDateTime = OpportunityrenewalTask.activitydate;  
            }
       insert OpportunityrenewalTask;*/
      }
     
       
      // create a map of all parent objects that are closed, keyed by id
       Map<Id, Account> parentMap=new Map<Id, Account>();
       parentMap.putAll([Select Id ,Name,compsure_record_id__C from Account where Compsure_record_Id__C = NULL AND id in :parentIds]);
       system.debug('Parent  '+parentMap);
       for (Opportunity op : trigger.new)
       {
           // if the parent id is in the map, that means the record save fails
          if (null!=parentMap.get(op.accountId) && op.stageName.trim()=='Provide  Account the necessary langauge to request loss runs via email'){ 
              op.addError('Please send data to Compsure and Try again.');
          }
       }
      // Compsure_SendEmail_Controller.sendEmail(sendEmailIDs);
         ProducerIntegration_controller.producerdetails(producerids);

  }
  
  //After Update
    List<id> updatedoppIDs=new list<id>();
     
    if(trigger.isUpdate && trigger.isafter){
        for(Opportunity opp : trigger.new){
            updatedoppIDs.Add(opp.id);
        }
         for(Opportunity opp : trigger.new){
          
        /*   if (opp.StageName.trim()=='Provide  Account the necessary langauge to request loss runs via email' && ( opp.send_Email_1_Response__C != 'Emails Sent Successfully')&&(opp.send_Email_1_Response__C != '')) {
            opp.AddError('Error in sending Email #1.please try again');
           }*/
      }
    CompsurreTasks_helper.updateTasks(updatedoppIDs);
    UpdateTaskDuedate_helper.Update_TasksDuedate(updatedoppIDs);
       
    }
}