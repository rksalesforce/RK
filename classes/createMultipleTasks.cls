public with sharing class createMultipleTasks {
    public list<Opportunity> opps {set;get;}
    public list<task> tasks {get;set;}
   // public list<task> existedtasks {get;set;}
    public static void firstTask(string Ids){
       list<Opportunity> opps = [select Id, Name,OwnerId,CreatedDate,closedate,Difference__c from opportunity where id =: Ids];
       list<Task> tasks = new list<Task>();
         for(opportunity o: opps){
            if(o.Difference__c <= 120 && o.Difference__c > 90){    
                  Task t1 = new Task();
                  t1.WhatId = o.Id;
                  t1.ownerId = o.OwnerId;
                  t1.Subject = 'Create Folder in Sales Force and save docs (Agg letter, 810, CNDA)';
                  t1.IsReminderSet = true;
                  t1.ReminderDateTime = o.createdDate+0;
                  tasks.add(t1);                             
          }insert tasks;
        }
    }
    public static void followUpTask(string Ids){
        list<Opportunity> opps = [select Id, Name,OwnerId,CreatedDate,closedate,Difference__c from opportunity where id =: Ids];
        list<task> existedtasks = [select Id, WhatId, ownerId, Subject, IsReminderSet, ReminderDateTime from Task where WhatId =: Ids];
        list<Task> tasks = new list<Task>();
        for(Task t: existedtasks){
            for(Opportunity o: opps){        
            system.debug('Difference:'+o.Difference__c);
            //Tasks for 120 days
            if(o.Difference__c <= 120 && o.Difference__c > 90){
                if(t.Subject == 'Create Folder in Sales Force and save docs (Agg letter, 810, CNDA)' && t.status == 'Completed'){
                    Task t1 = new Task();                    
                    t1.WhatId = t.WhatId;
                    t1.ownerId = t.OwnerId;            
                    t1.Subject = 'Create Timeline';
                    t1.IsReminderSet = true;
                  t1.ReminderDateTime = o.createdDate+0;
                  tasks.add(t1);
                }upsert tasks;
                 if(t.Subject == 'Create Timeline' && t.status == 'Completed'){
                    Task t1 = new Task();
                    t1.WhatId = t.WhatId;
                    t1.ownerId = t.OwnerId;            
                    t1.Subject = 'full BR with Account online';
                    t1.IsReminderSet = true;
                  t1.ReminderDateTime = o.createdDate+0;
                  tasks.add(t1);
                }upsert tasks;
            }
            //Tasks for 90 days
          if(o.Difference__c <= 90 && o.Difference__c > 89){
                if(t.Subject == 'full BR with Account online' && t.status == 'Completed'){
                    Task t1 = new Task();
                    t1.WhatId = t.WhatId;
                    t1.ownerId = t.OwnerId;            
                    t1.Subject = 'Run price Benchmark';
                    t1.IsReminderSet = true;
                  t1.ReminderDateTime = o.createdDate+0;
                  tasks.add(t1);
                }upsert tasks;
                 if(t.Subject == 'Run price Benchmark' && t.status == 'Completed'){
                    Task t1 = new Task();
                    t1.WhatId = t.WhatId;
                    t1.ownerId = t.OwnerId;            
                    t1.Subject = 'Use 810 form and download Bureau Data and, Xmod save in Sales Force';
                    t1.IsReminderSet = true;
                  t1.ReminderDateTime = o.createdDate+0;
                  tasks.add(t1);
                }upsert tasks;
              if(t.Subject == 'Use 810 form and download Bureau Data and, Xmod save in Sales Force' && t.status == 'Completed'){
                    Task t1 = new Task();
                    t1.WhatId = t.WhatId;
                    t1.ownerId = t.OwnerId;            
                    t1.Subject = 'Send email #1 (Internal from Online tirggered from Sale Force and External non registered Producers through Constant contact';
                    t1.IsReminderSet = true;
                  t1.ReminderDateTime = o.createdDate+0;
                  tasks.add(t1);
                }upsert tasks;
          }  
                     //Tasks for 89 days
                     if(o.Difference__c <= 89 && o.Difference__c > 80){
                if(t.Subject == 'Send email #1 (Internal from Online tirggered from Sale Force and External non registered Producers through Constant contact' && t.status == 'Completed'){
                    Task t1 = new Task();
                    t1.WhatId = t.WhatId;
                    t1.ownerId = t.OwnerId;            
                    t1.Subject = 'Provide  Account the necessary langauge to request loss runs via email';
                    t1.IsReminderSet = true;
                  t1.ReminderDateTime = o.createdDate+0;
                  tasks.add(t1);
                }upsert tasks;
            }
               
                //Tasks for 80 days  
                 if(o.Difference__c <= 80 && o.Difference__c > 79){
                if(t.Subject == 'Provide  Account the necessary langauge to request loss runs via email' && t.status == 'Completed'){
                    Task t1 = new Task();
                    t1.WhatId = t.WhatId;
                    t1.ownerId = t.OwnerId;            
                    t1.Subject = 'Create Submission package';
                    t1.IsReminderSet = true;
                  t1.ReminderDateTime = o.createdDate+0;
                  tasks.add(t1);
                }upsert tasks;
                     if(t.Subject == 'Create Submission package' && t.status == 'Completed'){
                    Task t1 = new Task();
                    t1.WhatId = t.WhatId;
                    t1.ownerId = t.OwnerId;            
                    t1.Subject = 'Get Market Assignmnts approved by Account';
                    t1.IsReminderSet = true;
                  t1.ReminderDateTime = o.createdDate+0;
                  tasks.add(t1);
                }upsert tasks;
            }
            //Tasks for 79 days  
             if(o.Difference__c <= 79 && o.Difference__c > 23){
                if(t.Subject == 'Get Market Assignmnts approved by Account' && t.status == 'Completed'){
                    Task t1 = new Task();
                    t1.WhatId = t.WhatId;
                    t1.ownerId = t.OwnerId;            
                    t1.Subject = 'Submit Market Assignments and auto email goes to Producers with quote deadline';
                    t1.IsReminderSet = true;
                  t1.ReminderDateTime = o.createdDate+0;
                  tasks.add(t1);
                }upsert tasks;
            } 
                 //Tasks for 23 days
                  if(o.Difference__c <= 23 && o.Difference__c > 21){
                if(t.Subject == 'Submit Market Assignments and auto email goes to Producers with quote deadline' && t.status == 'Completed'){
                    Task t1 = new Task();
                    t1.WhatId = t.WhatId;
                    t1.ownerId = t.OwnerId;            
                    t1.Subject = 'Contact all participating Producers that have not submitted quotes';
                    t1.IsReminderSet = true;
                  t1.ReminderDateTime = o.createdDate+0;
                  tasks.add(t1);
                }upsert tasks;
                     if(t.Subject == 'Contact all participating Producers that have not submitted quotes' && t.status == 'Completed'){
                    Task t1 = new Task();
                    t1.WhatId = t.WhatId;
                    t1.ownerId = t.OwnerId;            
                    t1.Subject = 'Send reminder email to all participating producers of deadline for quote upload';
                    t1.IsReminderSet = true;
                  t1.ReminderDateTime = o.createdDate+0;
                  tasks.add(t1);
                }upsert tasks;
            }
                //Tasks for 21 days  
             if(o.Difference__c <= 21 && o.Difference__c > 19){
                if(t.Subject == 'Send reminder email to all participating producers of deadline for quote upload' && t.status == 'Completed'){
                    Task t1 = new Task();
                    t1.WhatId = t.WhatId;
                    t1.ownerId = t.OwnerId;            
                    t1.Subject = 'Quote Deadline Download all quotes and save in Sales Force';
                    t1.IsReminderSet = true;
                  t1.ReminderDateTime = o.createdDate+0;
                  tasks.add(t1);
                }upsert tasks;
            }  
                //Tasks for 19 days  
                if(o.Difference__c <= 19 && o.Difference__c > 15){
                if(t.Subject == 'Quote Deadline Download all quotes and save in Sales Force' && t.status == 'Completed'){
                    Task t1 = new Task();
                    t1.WhatId = t.WhatId;
                    t1.ownerId = t.OwnerId;            
                    t1.Subject = 'Create quote comparison net rate calculator sheet';
                    t1.IsReminderSet = true;
                  t1.ReminderDateTime = o.createdDate+0;
                  tasks.add(t1);
                }upsert tasks;
            }
                //Tasks for 15 days  
                if(o.Difference__c <= 15 && o.Difference__c > 11){
                if(t.Subject == 'Create quote comparison net rate calculator sheet' && t.status == 'Completed'){
                    Task t1 = new Task();
                    t1.WhatId = t.WhatId;
                    t1.ownerId = t.OwnerId;            
                    t1.Subject = 'Present quote analysis (Power point) to Account and choose producers for best and final offer phase';
                    t1.IsReminderSet = true;
                  t1.ReminderDateTime = o.createdDate+0;
                  tasks.add(t1);
                }upsert tasks;
            } 
                 //Tasks for 11 days  
                if(o.Difference__c <= 11 && o.Difference__c > 8){
                if(t.Subject == 'Present quote analysis (Power point) to Account and choose producers for best and final offer phase' && t.status == 'Completed'){
                    Task t1 = new Task();
                    t1.WhatId = t.WhatId;
                    t1.ownerId = t.OwnerId;            
                    t1.Subject = 'Negotiate with Chosen Producers';
                    t1.IsReminderSet = true;
                  t1.ReminderDateTime = o.createdDate+0;
                  tasks.add(t1);
                }upsert tasks;
            } 
                 //Tasks for 8 days  
                if(o.Difference__c <= 8 && o.Difference__c > 3){
                if(t.Subject == 'Negotiate with Chosen Producers' && t.status == 'Completed'){
                    Task t1 = new Task();
                    t1.WhatId = t.WhatId;
                    t1.ownerId = t.OwnerId;            
                    t1.Subject = 'Coordinate followup meetings for Best and  Final  Producers to present to account';
                    t1.IsReminderSet = true;
                  t1.ReminderDateTime = o.createdDate+0;
                  tasks.add(t1);
                }upsert tasks;
            } 
                 //Tasks for 3 days  
                if(o.Difference__c <= 3 && o.Difference__c > 1){
                if(t.Subject == 'Coordinate followup meetings for Best and  Final  Producers to present to account' && t.status == 'Completed'){
                    Task t1 = new Task();
                    t1.WhatId = t.WhatId;
                    t1.ownerId = t.OwnerId;            
                    t1.Subject = 'Work with Client to award business';
                    t1.IsReminderSet = true;
                  t1.ReminderDateTime = o.createdDate+0;
                  tasks.add(t1);
                }upsert tasks;
            } 
                 //Tasks for 1 day
                  if(o.Difference__c == 1){
                if(t.Subject == 'Work with Client to award business' && t.status == 'Completed'){
                    Task t1 = new Task();
                    t1.WhatId = t.WhatId;
                    t1.ownerId = t.OwnerId;            
                    t1.Subject = 'Once Business awarded add Contract to Account';
                    t1.IsReminderSet = true;
                  t1.ReminderDateTime = o.createdDate+0;
                  tasks.add(t1);
                }upsert tasks;
                     if(t.Subject == 'Once Business awarded add Contract to Account' && t.status == 'Completed'){
                    Task t1 = new Task();
                    t1.WhatId = t.WhatId;
                    t1.ownerId = t.OwnerId;            
                    t1.Subject = 'Xdate Close date';
                    t1.IsReminderSet = true;
                  t1.ReminderDateTime = o.createdDate+0;
                  tasks.add(t1);
                }upsert tasks;
                }                
           } 
        }
    }
}