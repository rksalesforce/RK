public class CompsurreTasks_helper{
    //Create tasks
    public static void createTasks(List<id> oppId){
    List<Opportunity> oppList = [select id,name,closedate,ownerid,Opportunity_Period__c from Opportunity where id IN : oppId];
    List<Task> insertTasks = new List<Task>();
    for(Opportunity opp : oppList){
    //for Full BR with Account Online
        task t = new task(OwnerId = opp.ownerid,Subject = 'Full BR with Account Online',Status = 'Open',Priority = 'Normal',WhatId = opp.Id);
           
           t.activitydate = system.today().adddays((integer)Math.round((15*opp.Opportunity_Period__c)/100));
           t.IsReminderSet = true;
           t.ReminderDateTime = t.activitydate;  
        insertTasks.add(t);
    //For Run Price Benchmark   
        task t1 = new task(OwnerId = opp.ownerid,Subject = 'Run Price Benchmark',Status = 'Open',Priority = 'Normal',WhatId = opp.Id);
            t1.activitydate = system.today().adddays((integer)Math.round((20*opp.Opportunity_Period__c)/100));
            t1.IsReminderSet = true;
            t1.ReminderDateTime = t1.activitydate;  
        insertTasks.add(t1);
      
    //For 810 & Bureau Info   
        task t2 = new task(OwnerId = opp.ownerid,Subject = '810 & Bureau Info',Status = 'Open',Priority = 'Normal',WhatId = opp.Id);
            t2.activitydate = system.today().adddays((integer)Math.round((25*opp.Opportunity_Period__c)/100));
            t2.IsReminderSet = true;
            t2.ReminderDateTime = t2.activitydate;  
        insertTasks.add(t2);
        
    //For Send email #1 
        task t3 = new task(OwnerId = opp.ownerid,Subject = 'Send email #1',Status = 'Open',Priority = 'Normal',WhatId = opp.Id);
            t3.activitydate = system.today().adddays((integer)Math.round((30*opp.Opportunity_Period__c)/100));
            t3.IsReminderSet = true;
            t3.ReminderDateTime = t3.activitydate;  
        insertTasks.add(t3);    
    //For Provide Account the necessary langauge to request loss runs via email
        task t4 = new task(OwnerId = opp.ownerid,Subject = 'Provide Account the necessary langauge to request loss runs via email',Status = 'Open',Priority = 'Normal',WhatId = opp.Id);
            t4.activitydate = system.today().adddays((integer)Math.round((35*opp.Opportunity_Period__c)/100));
            t4.IsReminderSet = true;
            t4.ReminderDateTime = t4.activitydate;  
        insertTasks.add(t4);
    //For Create Submission Package
        task t5 = new task(OwnerId = opp.ownerid,Subject = 'Create Submission Package',Status = 'Open',Priority = 'Normal',WhatId = opp.Id);
            t5.activitydate = system.today().adddays((integer)Math.round((40*opp.Opportunity_Period__c)/100));
            t5.IsReminderSet = true;
            t5.ReminderDateTime = t5.activitydate;  
        insertTasks.add(t5);   
    //For Get Market Assignments Approved by Account
        task t6 = new task(OwnerId = opp.ownerid,Subject = 'Get Market Assignments Approved by Account',Status = 'Open',Priority = 'Normal',WhatId = opp.Id);
            t6.activitydate = system.today().adddays((integer)Math.round((45*opp.Opportunity_Period__c)/100));
            t6.IsReminderSet = true;
            t6.ReminderDateTime = t6.activitydate;  
        insertTasks.add(t6);   
    //For Submit Market Assignments and Auto Email Goes to Producers with Quote Deadline
        task t7 = new task(OwnerId = opp.ownerid,Subject = 'Submit Market Assignments and Auto Email Goes to Producers with Quote Deadline',Status = 'Open',Priority = 'Normal',WhatId = opp.Id);
            t7.activitydate = system.today().adddays((integer)Math.round((50*opp.Opportunity_Period__c)/100));
            t7.IsReminderSet = true;
            t7.ReminderDateTime = t7.activitydate;  
        insertTasks.add(t7);
    //For Contact all Participating Producers That Have Not Submitted Quotes
        task t8 = new task(OwnerId = opp.ownerid,Subject = 'Contact all Participating Producers That Have Not Submitted Quotes',Status = 'Open',Priority = 'Normal',WhatId = opp.Id);
            t8.activitydate = system.today().adddays((integer)Math.round((55*opp.Opportunity_Period__c)/100));
            t8.IsReminderSet = true;
           t8.ReminderDateTime = t8.activitydate;  
        insertTasks.add(t8);
    //For Send Reminder Email to All Participating Producers of Deadline for Quote Upload
        task t9 = new task(OwnerId = opp.ownerid,Subject = 'Send Reminder Email to All Participating Producers of Deadline for Quote Upload',Status = 'Open',Priority = 'Normal',WhatId = opp.Id);
            t9.activitydate = system.today().adddays((integer)Math.round((60*opp.Opportunity_Period__c)/100));
            t9.IsReminderSet = true;
           t9.ReminderDateTime = t9.activitydate;  
        insertTasks.add(t9);
    //For Quote Deadline Download All Quotes and Save
        task t10 = new task(OwnerId = opp.ownerid,Subject = 'Quote Deadline Download All Quotes and Save',Status = 'Open',Priority = 'Normal',WhatId = opp.Id);
            t10.activitydate = system.today().adddays((integer)Math.round((80*opp.Opportunity_Period__c)/100));
            t10.IsReminderSet = true;
           t10.ReminderDateTime = t10.activitydate;  
        insertTasks.add(t10);
    //For Create Quote Comparison Net Rate Calculator Sheet
        task t11 = new task(OwnerId = opp.ownerid,Subject = 'Create Quote Comparison Net Rate Calculator Sheet',Status = 'Open',Priority = 'Normal',WhatId = opp.Id);
            t11.activitydate = system.today().adddays((integer)Math.round((85*opp.Opportunity_Period__c)/100));
            t11.IsReminderSet = true;
           t11.ReminderDateTime = t11.activitydate;  
        insertTasks.add(t11);
    //For Present Quote Analysis (Power Point) to Account and Choose Producers for Best and Final Offer Phase
        task t12 = new task(OwnerId = opp.ownerid,Subject = 'Present Quote Analysis (Power Point) to Account and Choose Producers for Best and Final Offer Phase',Status = 'Open',Priority = 'Normal',WhatId = opp.Id);
            t12.activitydate = system.today().adddays((integer)Math.round((87*opp.Opportunity_Period__c)/100));
            t12.IsReminderSet = true;
           t12.ReminderDateTime = t12.activitydate;  
        insertTasks.add(t12);
    //For Negotiate with Chosen Producers
        task t13 = new task(OwnerId = opp.ownerid,Subject = 'Negotiate with Chosen Producers',Status = 'Open',Priority = 'Normal',WhatId = opp.Id);
            t13.activitydate = system.today().adddays((integer)Math.round((90*opp.Opportunity_Period__c)/100));
            t13.IsReminderSet = true;
           t13.ReminderDateTime = t13.activitydate;  
        insertTasks.add(t13);
    //For Coordinate Followup Meetings for Best and Final Producers to Present to Account
        task t14 = new task(OwnerId = opp.ownerid,Subject = 'Coordinate Followup Meetings for Best and Final Producers to Present to Account',Status = 'Open',Priority = 'Normal',WhatId = opp.Id);
            t14.activitydate = system.today().adddays((integer)Math.round((95*opp.Opportunity_Period__c)/100));
            t14.IsReminderSet = true;
           t14.ReminderDateTime = t14.activitydate;  
        insertTasks.add(t14);
    //For Work with Client to Award Business
        task t15 = new task(OwnerId = opp.ownerid,Subject = 'Work with Client to Award Business',Status = 'Open',Priority = 'Normal',WhatId = opp.Id);
            t15.activitydate = system.today().adddays((integer)Math.round((96*opp.Opportunity_Period__c)/100));
            t15.IsReminderSet = true;
           t15.ReminderDateTime = t15.activitydate;  
        insertTasks.add(t15);
    //For Business Awarded - Add Contract to Account
        task t16 = new task(OwnerId = opp.ownerid,Subject = 'Business Awarded - Add Contract to Account',Status = 'Open',Priority = 'Normal',WhatId = opp.Id);
            t16.activitydate = system.today().adddays((integer)Math.round((97*opp.Opportunity_Period__c)/100));
            t16.IsReminderSet = true;
           t16.ReminderDateTime = t16.activitydate;  
        insertTasks.add(t16);
    //For Xdate Close Date
        task t17 = new task(OwnerId = opp.ownerid,Subject = 'Xdate Close Date',Status = 'Open',Priority = 'Normal',WhatId = opp.Id);
            t17.activitydate = system.today().adddays((integer)Math.round((100*opp.Opportunity_Period__c)/100));
            t17.IsReminderSet = true;
           t17.ReminderDateTime = t17.activitydate;  
        insertTasks.add(t17);   
    }
    insert insertTasks;
    }
    //Update Tasks
    public static void updateTasks(List<id> oppid){
        List<opportunity> oppList = [select id,name,closedate,ownerid,StageName,expiration_date__C,Opportunity_Period__c  from opportunity where id IN:oppid];
        List<Task> lstTasks = [select id,subject,ownerid,status,Priority,WhatId,activityDate,IsReminderSet,ReminderDateTime from Task Where whatid IN :oppid];
        List<Task> updateTasks = new List<Task>();
        system.debug('Tasks'+lstTasks);
        for(Opportunity opp:opplist){
        for(Task t : lstTasks){
          if(t.subject =='Full BR with Account Online' && t.status == 'open'){
                t.activitydate = system.today().adddays((integer)Math.round((15*opp.Opportunity_Period__c)/100));
                t.IsReminderSet = true;
                t.ReminderDateTime = t.activitydate;  
            updateTasks.Add(t);
            }
            if(t.subject =='Run Price Benchmark' && t.status == 'open'){
                t.activitydate = system.today().adddays((integer)Math.round((20*opp.Opportunity_Period__c)/100));
                t.IsReminderSet = true;
                t.ReminderDateTime = t.activitydate;  
                updateTasks.Add(t);
            }  
            if(t.subject =='810 & Bureau Info' && t.status == 'open'){
                t.activitydate = system.today().adddays((integer)Math.round((25*opp.Opportunity_Period__c)/100));
                t.IsReminderSet = true;
                t.ReminderDateTime = t.activitydate;  
                updateTasks.Add(t);
            } 
            if(t.subject =='Send email #1' && t.status == 'open'){
                t.activitydate = system.today().adddays((integer)Math.round((30*opp.Opportunity_Period__c)/100));
                t.IsReminderSet = true;
                t.ReminderDateTime = t.activitydate;  
            updateTasks.Add(t);
            } 
            if(t.subject =='Provide Account the necessary langauge to request loss runs via email' && t.status == 'open'){
                t.activitydate = system.today().adddays((integer)Math.round((35*opp.Opportunity_Period__c)/100));
                t.IsReminderSet = true;
                t.ReminderDateTime = t.activitydate;  
            updateTasks.Add(t);
            }
            if(t.subject =='Create Submission Package' && t.status == 'open'){
                t.activitydate = system.today().adddays((integer)Math.round((40*opp.Opportunity_Period__c)/100));
                t.IsReminderSet = true;
                t.ReminderDateTime = t.activitydate;  
            updateTasks.Add(t);
            }
            if(t.subject =='Get Market Assignments Approved by Account' && t.status == 'open'){
                t.activitydate = system.today().adddays((integer)Math.round((45*opp.Opportunity_Period__c)/100));
                t.IsReminderSet = true;
                t.ReminderDateTime = t.activitydate;  
            updateTasks.Add(t);
            }
            if(t.subject =='Submit Market Assignments and Auto Email Goes to Producers with Quote Deadline' && t.status == 'open'){
                t.activitydate = system.today().adddays((integer)Math.round((50*opp.Opportunity_Period__c)/100));
                t.IsReminderSet = true;
                t.ReminderDateTime = t.activitydate;  
            updateTasks.Add(t);
            }
            if(t.subject =='Contact all Participating Producers That Have Not Submitted Quotes' && t.status == 'open'){
                t.activitydate = system.today().adddays((integer)Math.round((55*opp.Opportunity_Period__c)/100));
                t.IsReminderSet = true;
                t.ReminderDateTime = t.activitydate;  
            updateTasks.Add(t);
            }
            
            if(t.subject =='Send Reminder Email to All Participating Producers of Deadline for Quote Upload' && t.status == 'open'){
                t.activitydate = system.today().adddays((integer)Math.round((60*opp.Opportunity_Period__c)/100));
                t.IsReminderSet = true;
                t.ReminderDateTime = t.activitydate;  
            updateTasks.Add(t);
            }
            if(t.subject =='Quote Deadline Download All Quotes and Save' && t.status == 'open'){
                t.activitydate = system.today().adddays((integer)Math.round((80*opp.Opportunity_Period__c)/100));
                t.IsReminderSet = true;
                t.ReminderDateTime = t.activitydate;  
            updateTasks.Add(t);
            }
            if(t.subject =='Create Quote Comparison Net Rate Calculator Sheet' && t.status == 'open'){
                t.activitydate = system.today().adddays((integer)Math.round((85*opp.Opportunity_Period__c)/100));
                t.IsReminderSet = true;
                t.ReminderDateTime = t.activitydate;  
            updateTasks.Add(t);
            }
            if(t.subject =='Present Quote Analysis (Power Point) to Account and Choose Producers for Best and Final Offer Phase' && t.status == 'open'){
                t.activitydate = system.today().adddays((integer)Math.round((87*opp.Opportunity_Period__c)/100));
                t.IsReminderSet = true;
                t.ReminderDateTime = t.activitydate;  
            updateTasks.Add(t);
            }
            if(t.subject =='Negotiate with Chosen Producers' && t.status == 'open'){
                t.activitydate = system.today().adddays((integer)Math.round((90*opp.Opportunity_Period__c)/100));
                t.IsReminderSet = true;
                t.ReminderDateTime = t.activitydate;  
            updateTasks.Add(t);
            }
            if(t.subject =='Coordinate Followup Meetings for Best and Final Producers to Present to Account' && t.status == 'open'){
                t.activitydate = system.today().adddays((integer)Math.round((95*opp.Opportunity_Period__c)/100));
                t.IsReminderSet = true;
                t.ReminderDateTime = t.activitydate;  
            updateTasks.Add(t);
            }
            if(t.subject =='Work with Client to Award Business' && t.status == 'open'){
                t.activitydate = system.today().adddays((integer)Math.round((96*opp.Opportunity_Period__c)/100));
                t.IsReminderSet = true;
                t.ReminderDateTime = t.activitydate;  
            updateTasks.Add(t);
            }
            if(t.subject =='Business Awarded - Add Contract to Account' && t.status == 'open'){
                t.activitydate = system.today().adddays((integer)Math.round((97*opp.Opportunity_Period__c)/100));
                t.IsReminderSet = true;
                t.ReminderDateTime = t.activitydate;  
            updateTasks.Add(t);
            }
            if(t.subject =='Xdate Close Date' && t.status == 'open'){
                t.activitydate = system.today().adddays((integer)Math.round((100*opp.Opportunity_Period__c)/100));
                t.IsReminderSet = true;
                t.ReminderDateTime = t.activitydate;  
               
            updateTasks.Add(t);
            }
            if(t.subject =='Past Opportunity ' +opp.Name+ ' is waiting for renewal' && t.status == 'open'){
                t.activitydate = opp.Expiration_Date__c.addDays(180);
                t.IsReminderSet = true;
                t.ReminderDateTime = t.activitydate;  
               
            updateTasks.Add(t);
            }
        }
        
    }
    upsert updateTasks;
      
      Opportunity oppid1 = [Select id from Opportunity where id=:Trigger.new];
      List<Task> existtask = [Select id from Task where Subject like 'Past Opportunity%' and whatid =:oppid1.id];
      
      for(Opportunity opp1 :OppList){
           
               //Opportunity renewal Task
                Task OpportunityrenewalTask = new Task();
                
                if(opp1.stageName == 'Xdate Close Date' && existtask.size()<1){
                    OpportunityrenewalTask.OwnerId  = opp1.ownerid;
                    OpportunityrenewalTask.Subject = 'Past Opportunity ' +opp1.Name+ ' is waiting for renewal';
                    OpportunityrenewalTask.Status = 'Open';
                    OpportunityrenewalTask.Priority = 'Normal';
                    OpportunityrenewalTask.WhatId = opp1.Id;
                    OpportunityrenewalTask.activitydate = opp1.Expiration_Date__c.addDays(180);
                    OpportunityrenewalTask.IsReminderSet = true;
                    OpportunityrenewalTask.ReminderDateTime = OpportunityrenewalTask.activitydate;  
                    insert OpportunityrenewalTask;
                }
        } 
    }
}