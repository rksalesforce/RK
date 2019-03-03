public with sharing class createMultipleTasks1 {
    public list<Opportunity> opps {set;get;}
    public list<task> tasks {get;set;}
    
    public void firstTask(string Ids){
       list<Opportunity> opps = [select Id, Name,OwnerId,CreatedDate,closedate,difference__C from opportunity where id =: Ids];
        list<task> tasks = [select Id, WhatId, ownerId, Subject, IsReminderSet, ReminderDateTime from Task where WhatId =: Ids];
        for(opportunity o: opps){
            if(o.difference__C <= 120 && o.difference__C > 90){
                Task t = new Task();
                  t.WhatId = o.Id;
                  t.ownerId = o.OwnerId;
                  t.Subject = 'Create Folder in Sales Force and save docs (Agg letter, 810, CNDA)';
                  t.IsReminderSet = true;
                  t.ReminderDateTime = o.createdDate+0;
                  tasks.add(t);
            }  upsert tasks;
        }
    }
}