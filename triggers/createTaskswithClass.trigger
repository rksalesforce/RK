trigger createTaskswithClass on Opportunity (after insert,after update) {
    list<Task> tasks = new list<Task>();
    if(Trigger.isInsert){
    for(Opportunity o: Trigger.New){
       Task t1 = new Task();
        t1.WhatId = o.Id;
                  t1.ownerId = o.OwnerId;
                  t1.Subject = 'Create Folder in Sales Force and save docs (Agg letter, 810, CNDA)';
                  t1.IsReminderSet = true;
                  t1.ReminderDateTime = o.createdDate+0;
                  tasks.add(t1);
        }
        insert tasks;
    }
    if(Trigger.isUpdate){
    for(Opportunity o: Trigger.New){
        if(system.trigger.OldMap.get(o.Id).Difference__c != system.trigger.NewMap.get(o.Id).Difference__c){
            system.debug('OppId:'+o.Id);
            createMultipleTasks.followUpTask(o.Id);       
        }
    }
  }
}