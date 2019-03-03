trigger opprelatedTasksUpdate on Opportunity (after update,after insert,before update) {
    set<id> tasksset = new set<id>();
        Public class ContactException extends Exception{}
        if((trigger.isinsert||trigger.isUpdate)&&trigger.isafter){
        for(Opportunity opp :trigger.new){
            CreateOppRelatedTasksHelper.createTasks(opp.id);
           
        }
        }
        
        
       if(trigger.isUpdate&& trigger.isbefore){ 
           for(opportunity opp:trigger.new){
               CreateOppRelatedTasksHelper.taskValidation(opp.id);
         //  tasksset.add(opp.id);
           }
       /*List<task> lstTasks = [select id,subject,status from task where whatid IN : tasksset];
        system.debug('Hello'+lstTasks);
        opportunity opp = [select id,name from opportunity where id IN: tasksset];
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
               
        }*/
       }
}