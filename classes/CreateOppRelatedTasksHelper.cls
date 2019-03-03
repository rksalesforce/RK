public class CreateOppRelatedTasksHelper{
    public static void createTasks(id oppid){
    
        opportunity opp = [select id,name,closedate,stageName,ownerID from opportunity where id=:oppid];
        system.debug('Name====: '+opp.name);
     /*   List<task> lst = [select id,Subject,ownerid,status,priority,whatid,activitydate from Task where whatid = '0067F000007wjbm'];
        for(task tt :lst){
            system.debug('LIST####'+tt.subject);
        }*/
     
       List<task> tasksList = new List<Task>();
        
       if(opp.stageName == 'Full BR with Account Online'){
            task t = new task();
            t.OwnerId = opp.ownerid;
            t.Subject = opp.stageName;
            t.Status = 'Open';
            t.Priority = 'Normal';
            t.WhatId = opp.Id;
            if((opp.closedate-120) < system.today()){
                t.ActivityDate= system.today();
            }
            else{
            t.ActivityDate= opp.closedate-120;
            }
            tasksList.add(t);
            
        }
        if(opp.stageName == 'Run Price Benchmark'){
            task t = new task();
            t.OwnerId = opp.ownerid;
            t.Subject = opp.stageName;
            t.Status = 'Open';
            t.Priority = 'Normal';
            t.WhatId = opp.Id;
            if((opp.closedate-90) < system.today()){
                t.ActivityDate= system.today();
            }
            else{
            t.ActivityDate= opp.closedate-90;
            }
            tasksList.add(t);
           
        }
        if(opp.stageName == '810 & Bureau Info'){
            task t = new task();
            t.OwnerId = opp.ownerid;
            t.Subject = opp.stageName;
            t.Status = 'Open';
            t.Priority = 'Normal';
            t.WhatId = opp.Id;
            if((opp.closedate-90) < system.today()){
                t.ActivityDate= system.today();
            }
            else{
            t.ActivityDate= opp.closedate-90;
            }
            tasksList.add(t);
           
        }
         if(opp.stageName == 'Send email #1'){
            task t = new task();
            t.OwnerId = opp.ownerid;
            t.Subject = opp.stageName;
            t.Status = 'Open';
            t.Priority = 'Normal';
            t.WhatId = opp.Id;
            if((opp.closedate-90) < system.today()){
                t.ActivityDate= system.today();
            }
            else{
            t.ActivityDate= opp.closedate-90;
            }
            tasksList.add(t);
        }
         if(opp.stageName == 'Provide Account the necessary langauge to request loss runs via email'){
            task t = new task();
            t.OwnerId = opp.ownerid;
            t.Subject = opp.stageName;
            t.Status = 'Open';
            t.Priority = 'Normal';
            t.WhatId = opp.Id;
            if((opp.closedate-89) < system.today()){
                t.ActivityDate= system.today();
            }
            else{
            t.ActivityDate= opp.closedate-89;
            }
            tasksList.add(t);
        }
        if(opp.stageName == 'Create Submission Package'){
            task t = new task();
            t.OwnerId = opp.ownerid;
            t.Subject = opp.stageName;
            t.Status = 'Open';
            t.Priority = 'Normal';
            t.WhatId = opp.Id;
            if((opp.closedate-80) < system.today()){
                t.ActivityDate= system.today();
            }
            else{
            t.ActivityDate= opp.closedate-80;
            }
            tasksList.add(t);
        }
        if(opp.stageName == 'Get Market Assignments Approved by Account'){
            task t = new task();
            t.OwnerId = opp.ownerid;
            t.Subject = opp.stageName;
            t.Status = 'Open';
            t.Priority = 'Normal';
            t.WhatId = opp.Id;
            if((opp.closedate-80) < system.today()){
                t.ActivityDate= system.today();
            }
            else{
            t.ActivityDate= opp.closedate-80;
            }
           tasksList.add(t);
        }
        if(opp.stageName == 'Submit Market Assignments and Auto Email Goes to Producers with Quote Deadline'){
            task t = new task();
            t.OwnerId = opp.ownerid;
            t.Subject = opp.stageName;
            t.Status = 'Open';
            t.Priority = 'Normal';
            t.WhatId = opp.Id;
            if((opp.closedate-79) < system.today()){
                t.ActivityDate= system.today();
            }
            else{
            t.ActivityDate= opp.closedate-79;
            }
            tasksList.add(t);
        }
        
        if(opp.stageName == 'Contact all Participating Producers That Have Not Submitted Quotes'){
            task t = new task();
            t.OwnerId = opp.ownerid;
            t.Subject = opp.stageName;
            t.Status = 'Open';
            t.Priority = 'Normal';
            t.WhatId = opp.Id;
            if((opp.closedate-23) < system.today()){
                t.ActivityDate= system.today();
            }
            else{
            t.ActivityDate= opp.closedate-23;
            }
            tasksList.add(t);
        }
        if(opp.stageName == 'Send Reminder Email to All Participating Producers of Deadline for Quote Upload'){
            task t = new task();
            t.OwnerId = opp.ownerid;
            t.Subject = opp.stageName;
            t.Status = 'Open';
            t.Priority = 'Normal';
            t.WhatId = opp.Id;
            if((opp.closedate-23) < system.today()){
                t.ActivityDate= system.today();
            }
            else{
            t.ActivityDate= opp.closedate-23;
            }
           tasksList.add(t);
        }
        if(opp.stageName == 'Quote Deadline Download All Quotes and Save'){
            task t = new task();
            t.OwnerId = opp.ownerid;
            t.Subject = opp.stageName;
            t.Status = 'Open';
            t.Priority = 'Normal';
            t.WhatId = opp.Id;
            if((opp.closedate-21) < system.today()){
                t.ActivityDate= system.today();
            }
            else{
            t.ActivityDate= opp.closedate-21;
            }
            tasksList.add(t);
        }
        if(opp.stageName == 'Create Quote Comparison Net Rate Calculator Sheet'){
            task t = new task();
            t.OwnerId = opp.ownerid;
            t.Subject = opp.stageName;
            t.Status = 'Open';
            t.Priority = 'Normal';
            t.WhatId = opp.Id;
            if((opp.closedate-19) < system.today()){
                t.ActivityDate= system.today();
            }
            else{
            t.ActivityDate= opp.closedate-19;
            }
            tasksList.add(t);
        }
        if(opp.stageName == 'Present Quote Analysis (Power Point) to Account and Choose Producers for Best and Final Offer Phase'){
            task t = new task();
            t.OwnerId = opp.ownerid;
            t.Subject = opp.stageName;
            t.Status = 'Open';
            t.Priority = 'Normal';
            t.WhatId = opp.Id;
            if((opp.closedate-15) < system.today()){
                t.ActivityDate= system.today();
            }
            else{
            t.ActivityDate= opp.closedate-15;
            }
            tasksList.add(t);
        }
        if(opp.stageName == 'Negotiate with Chosen Producers'){
            task t = new task();
            t.OwnerId = opp.ownerid;
            t.Subject = opp.stageName;
            t.Status = 'Open';
            t.Priority = 'Normal';
            t.WhatId = opp.Id;
            if((opp.closedate-11) < system.today()){
                t.ActivityDate= system.today();
            }
            else{
            t.ActivityDate= opp.closedate-11;
            }
            tasksList.add(t);
        }
        if(opp.stageName == 'Coordinate Followup Meetings for Best and Final Producers to Present to Account'){
            task t = new task();
            t.OwnerId = opp.ownerid;
            t.Subject = opp.stageName;
            t.Status = 'Open';
            t.Priority = 'Normal';
            t.WhatId = opp.Id;
            if((opp.closedate-8) < system.today()){
                t.ActivityDate= system.today();
            }
            else{
            t.ActivityDate= opp.closedate-8;
            }
            tasksList.add(t);
        }
        if(opp.stageName == 'Work with Client to Award Business'){
            task t = new task();
            t.OwnerId = opp.ownerid;
            t.Subject = opp.stageName;
            t.Status = 'Open';
            t.Priority = 'Normal';
            t.WhatId = opp.Id;
            if((opp.closedate-3) < system.today()){
                t.ActivityDate= system.today();
            }
            else{
            t.ActivityDate= opp.closedate-3;
            }
           tasksList.add(t);
        }
         if(opp.stageName == 'Business Awarded - Add Contract to Account'){
            task t = new task();
            t.OwnerId = opp.ownerid;
            t.Subject = opp.stageName;
            t.Status = 'Open';
            t.Priority = 'Normal';
            t.WhatId = opp.Id;
            if((opp.closedate-1) < system.today()){
                t.ActivityDate= system.today();
            }
            else{
            t.ActivityDate= opp.closedate-1;
            }
            tasksList.add(t);
        }
        if( opp.stageName == 'Xdate Close Date'){
            task t = new task();
            t.OwnerId = opp.ownerid;
            t.Subject = opp.stageName;
            t.Status = 'Open';
            t.Priority = 'Normal';
            t.WhatId = opp.Id;
            if((opp.closedate-1) < system.today()){
                t.ActivityDate= system.today();
            }
            else{
            t.ActivityDate= opp.closedate-1;
            }
            tasksList.add(t);
        }
        upsert tasksList;
       
    }
    
    public static void taskValidation(id oppid){
    
        opportunity opp = [select id,name from opportunity where id=:oppid];
        List<task> lstTasks = [select id,subject,status from task where whatid =:oppid];
        system.debug('Hello'+lstTasks);
        for(task t:lstTasks ){
        if(t.subject =='Full BR with Account Online' && t.status=='open' ){
            opp.adderror('You have uncompleted task');
        }
        
        if(t.subject =='Run Price Benchmark' && t.status=='open'){
            opp.adderror('You have uncompleted task');
        }
        if(t.subject =='810 & Bureau Info' && t.status=='open'){
                    opp.adderror('You have uncompleted task');
               }
                if(t.subject =='Send email #1' && t.status=='open'){
                    opp.adderror('You have uncompleted task');
               }
                if(t.subject =='Provide Account the necessary langauge to request loss runs via email' && t.status=='open' ){
                    opp.adderror('You have uncompleted task');
               }
                if(t.subject =='Create Submission Package' && t.status=='open'){
                    opp.adderror('You have uncompleted task');
               }
                if(t.subject =='Get Market Assignments Approved by Account' && t.status=='open'){
                    opp.adderror('You have uncompleted task');
               }
                if(t.subject =='Submit Market Assignments and Auto Email Goes to Producers with Quote Deadline' && t.status=='open'){
                    opp.adderror('You have uncompleted task');
               }
                
                if(t.subject =='Contact all Participating Producers That Have Not Submitted Quotes' && t.status=='open' ){
                    opp.adderror('You have uncompleted task');
               }
                if(t.subject =='Send Reminder Email to All Participating Producers of Deadline for Quote Upload' && t.status=='open'){
                    opp.adderror('You have uncompleted task');
               }
                if(t.subject =='Quote Deadline Download All Quotes and Save' && t.status=='open'){
                    opp.stagename.adderror('You have uncompleted task');
               }
                if(t.subject =='Create Quote Comparison Net Rate Calculator Sheet' && t.status=='open'){
                    opp.adderror('You have uncompleted task');
               }
                
                if(t.subject =='Present Quote Analysis (Power Point) to Account and Choose Producers for Best and Final Offer Phase' && t.status=='open' ){
                    opp.adderror('You have uncompleted task');
               }
                if(t.subject =='Negotiate with Chosen Producers' && t.status=='open'){
                    opp.adderror('You have uncompleted task');
               }
                if(t.subject =='Coordinate Followup Meetings for Best and Final Producers to Present to Account' && t.status=='open'){
                    opp.adderror('You have uncompleted task');
               }
                if(t.subject =='Work with Client to Award Business' && t.status=='open'){
                    opp.adderror('You have uncompleted task');
               }
                if(t.subject =='Business Awarded - Add Contract to Account' && t.status=='open'){
                    opp.adderror('You have uncompleted task');
               }
                if(t.subject =='Xdate Close Date' && t.status=='open'){
                    opp.stagename.adderror('You have uncompleted task');
               }
               
        }
    }
}