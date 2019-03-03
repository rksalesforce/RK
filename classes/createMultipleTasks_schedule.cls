global class createMultipleTasks_schedule Implements Schedulable
    {
        global void execute(SchedulableContext sc)
        {
            firstTask();
        }

       public void firstTask(){
       list<Opportunity> opps = [select Id, Name,OwnerId,CreatedDate,closedate,difference__C from opportunity];
        list<task> tasks = [select Id, WhatId, ownerId, Subject, IsReminderSet, ReminderDateTime from Task];
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