public class UpdateTaskDuedate_helper{
    public static void Update_TasksDuedate(List<id> oppid){
       
        List<task> lsttasks = [select id,Subject,ownerid,status,priority,whatid,activitydate from Task where whatid IN : oppid AND status !='completed'];
           List<opportunity> oppList = [select id,name,stagename from opportunity where id=:oppid];
         
        List<Task> updatedTasks = new List<Task>();
        Task renewalOppTask = new Task();
        for(Opportunity opp : oppList){
        for(Task tt : lstTasks){
            if(opp.stagename == 'Run Price Benchmark' && tt.subject == 'Full BR with Account Online') {
                 tt.status ='completed';
                 updatedTasks.Add(tt);
            }
            if(opp.stagename == '810 & Bureau Info' && (tt.subject == 'Full BR with Account Online'||tt.subject== 'Run Price Benchmark')) {
                 tt.status ='completed';
            updatedTasks.Add(tt);
            }
            if(opp.stagename == 'Send email #1' && (tt.subject == 'Full BR with Account Online'||tt.subject== 'Run Price Benchmark'||tt.subject== '810 & Bureau Info')) {
                 tt.status ='completed';
            updatedTasks.Add(tt);
            }
            if(opp.stagename == 'Provide Account the necessary langauge to request loss runs via email' && (tt.subject == 'Full BR with Account Online'||tt.subject== 'Run Price Benchmark'||tt.subject== '810 & Bureau Info'||tt.subject== 'Send email #1')) {
                 tt.status ='completed';
            updatedTasks.Add(tt);
            }
            if(opp.stagename == 'Create Submission Package' && (tt.subject == 'Full BR with Account Online'||tt.subject== 'Run Price Benchmark'||tt.subject== '810 & Bureau Info'||tt.subject== 'Send email #1'||tt.subject== 'Provide Account the necessary langauge to request loss runs via email')) {
                 tt.status ='completed';
            updatedTasks.Add(tt);
            }
            if(opp.stagename == 'Get Market Assignments Approved by Account' && (tt.subject == 'Full BR with Account Online'||tt.subject== 'Run Price Benchmark'||tt.subject== '810 & Bureau Info'||tt.subject== 'Send email #1'||tt.subject== 'Provide Account the necessary langauge to request loss runs via email'||tt.subject== 'Create Submission Package')) {
                 tt.status ='completed';
            updatedTasks.Add(tt);
            }
            if(opp.stagename == 'Submit Market Assignments and Auto Email Goes to Producers with Quote Deadline' && (tt.subject == 'Full BR with Account Online'||tt.subject== 'Run Price Benchmark'||tt.subject== '810 & Bureau Info'||tt.subject== 'Send email #1'||tt.subject== 'Provide Account the necessary langauge to request loss runs via email'||tt.subject== 'Create Submission Package'||tt.subject== 'Get Market Assignments Approved by Account')) {
                 tt.status ='completed';
            updatedTasks.Add(tt);
            }
            if(opp.stagename == 'Contact all Participating Producers That Have Not Submitted Quotes' && (tt.subject == 'Full BR with Account Online'||tt.subject== 'Run Price Benchmark'||tt.subject== '810 & Bureau Info'||tt.subject== 'Send email #1'||tt.subject== 'Provide Account the necessary langauge to request loss runs via email'||tt.subject== 'Create Submission Package'||tt.subject== 'Get Market Assignments Approved by Account'||tt.subject== 'Submit Market Assignments and Auto Email Goes to Producers with Quote Deadline')) {
                 tt.status ='completed';
            updatedTasks.Add(tt);
            }
            if(opp.stagename == 'Send Reminder Email to All Participating Producers of Deadline for Quote Upload' && (tt.subject == 'Full BR with Account Online'||tt.subject== 'Run Price Benchmark'||tt.subject== '810 & Bureau Info'||tt.subject== 'Send email #1'||tt.subject== 'Provide Account the necessary langauge to request loss runs via email'||tt.subject== 'Create Submission Package'||tt.subject== 'Get Market Assignments Approved by Account'||tt.subject== 'Submit Market Assignments and Auto Email Goes to Producers with Quote Deadline'||tt.subject== 'Contact all Participating Producers That Have Not Submitted Quotes')) {
                 tt.status ='completed';
            updatedTasks.Add(tt);
            }
            if(opp.stagename == 'Quote Deadline Download All Quotes and Save' && (tt.subject == 'Full BR with Account Online'||tt.subject== 'Run Price Benchmark'||tt.subject== '810 & Bureau Info'||tt.subject== 'Send email #1'||tt.subject== 'Provide Account the necessary langauge to request loss runs via email'||tt.subject== 'Create Submission Package'||tt.subject== 'Get Market Assignments Approved by Account'||tt.subject== 'Submit Market Assignments and Auto Email Goes to Producers with Quote Deadline'||tt.subject== 'Contact all Participating Producers That Have Not Submitted Quotes'||tt.subject== 'Send Reminder Email to All Participating Producers of Deadline for Quote Upload')) {
                 tt.status ='completed';
            updatedTasks.Add(tt);
            }
            if(opp.stagename == 'Create Quote Comparison Net Rate Calculator Sheet' && (tt.subject == 'Full BR with Account Online'||tt.subject== 'Run Price Benchmark'||tt.subject== '810 & Bureau Info'||tt.subject== 'Send email #1'||tt.subject== 'Provide Account the necessary langauge to request loss runs via email'||tt.subject== 'Create Submission Package'||tt.subject== 'Get Market Assignments Approved by Account'||tt.subject== 'Submit Market Assignments and Auto Email Goes to Producers with Quote Deadline'||tt.subject== 'Contact all Participating Producers That Have Not Submitted Quotes'||tt.subject== 'Send Reminder Email to All Participating Producers of Deadline for Quote Upload'||tt.subject== 'Quote Deadline Download All Quotes and Save')) {
                 tt.status ='completed';
            updatedTasks.Add(tt);
            }
            if(opp.stagename == 'Present Quote Analysis (Power Point) to Account and Choose Producers for Best and Final Offer Phase' && (tt.subject == 'Full BR with Account Online'||tt.subject== 'Run Price Benchmark'||tt.subject== '810 & Bureau Info'||tt.subject== 'Send email #1'||tt.subject== 'Provide Account the necessary langauge to request loss runs via email'||tt.subject== 'Create Submission Package'||tt.subject== 'Get Market Assignments Approved by Account'||tt.subject== 'Submit Market Assignments and Auto Email Goes to Producers with Quote Deadline'||tt.subject== 'Contact all Participating Producers That Have Not Submitted Quotes'||tt.subject== 'Send Reminder Email to All Participating Producers of Deadline for Quote Upload'||tt.subject== 'Quote Deadline Download All Quotes and Save'||tt.subject== 'Create Quote Comparison Net Rate Calculator Sheet')) {
                 tt.status ='completed';
            updatedTasks.Add(tt);
            }
            if(opp.stagename == 'Negotiate with Chosen Producers' && (tt.subject == 'Full BR with Account Online'||tt.subject== 'Run Price Benchmark'||tt.subject== '810 & Bureau Info'||tt.subject== 'Send email #1'||tt.subject== 'Provide Account the necessary langauge to request loss runs via email'||tt.subject== 'Create Submission Package'||tt.subject== 'Get Market Assignments Approved by Account'||tt.subject== 'Submit Market Assignments and Auto Email Goes to Producers with Quote Deadline'||tt.subject== 'Contact all Participating Producers That Have Not Submitted Quotes'||tt.subject== 'Send Reminder Email to All Participating Producers of Deadline for Quote Upload'||tt.subject== 'Quote Deadline Download All Quotes and Save'||tt.subject== 'Create Quote Comparison Net Rate Calculator Sheet'||tt.subject== 'Present Quote Analysis (Power Point) to Account and Choose Producers for Best and Final Offer Phase')) {
                 tt.status ='completed';
            updatedTasks.Add(tt);
            }
            if(opp.stagename == 'Coordinate Followup Meetings for Best and Final Producers to Present to Account' && (tt.subject == 'Full BR with Account Online'||tt.subject== 'Run Price Benchmark'||tt.subject== '810 & Bureau Info'||tt.subject== 'Send email #1'||tt.subject== 'Provide Account the necessary langauge to request loss runs via email'||tt.subject== 'Create Submission Package'||tt.subject== 'Get Market Assignments Approved by Account'||tt.subject== 'Submit Market Assignments and Auto Email Goes to Producers with Quote Deadline'||tt.subject== 'Contact all Participating Producers That Have Not Submitted Quotes'||tt.subject== 'Send Reminder Email to All Participating Producers of Deadline for Quote Upload'||tt.subject== 'Quote Deadline Download All Quotes and Save'||tt.subject== 'Create Quote Comparison Net Rate Calculator Sheet'||tt.subject== 'Present Quote Analysis (Power Point) to Account and Choose Producers for Best and Final Offer Phase'||tt.subject== 'Negotiate with Chosen Producers')) {
                 tt.status ='completed';
            updatedTasks.Add(tt);
            }
            if(opp.stagename == 'Work with Client to Award Business' && (tt.subject == 'Full BR with Account Online'||tt.subject== 'Run Price Benchmark'||tt.subject== '810 & Bureau Info'||tt.subject== 'Send email #1'||tt.subject== 'Provide Account the necessary langauge to request loss runs via email'||tt.subject== 'Create Submission Package'||tt.subject== 'Get Market Assignments Approved by Account'||tt.subject== 'Submit Market Assignments and Auto Email Goes to Producers with Quote Deadline'||tt.subject== 'Contact all Participating Producers That Have Not Submitted Quotes'||tt.subject== 'Send Reminder Email to All Participating Producers of Deadline for Quote Upload'||tt.subject== 'Quote Deadline Download All Quotes and Save'||tt.subject== 'Create Quote Comparison Net Rate Calculator Sheet'||tt.subject== 'Present Quote Analysis (Power Point) to Account and Choose Producers for Best and Final Offer Phase'||tt.subject== 'Negotiate with Chosen Producers'||tt.subject== 'Coordinate Followup Meetings for Best and Final Producers to Present to Account')) {
                 tt.status ='completed';
            updatedTasks.Add(tt);
            }
            if(opp.stagename == 'Business Awarded - Add Contract to Account' && (tt.subject == 'Full BR with Account Online'||tt.subject== 'Run Price Benchmark'||tt.subject== '810 & Bureau Info'||tt.subject== 'Send email #1'||tt.subject== 'Provide Account the necessary langauge to request loss runs via email'||tt.subject== 'Create Submission Package'||tt.subject== 'Get Market Assignments Approved by Account'||tt.subject== 'Submit Market Assignments and Auto Email Goes to Producers with Quote Deadline'||tt.subject== 'Contact all Participating Producers That Have Not Submitted Quotes'||tt.subject== 'Send Reminder Email to All Participating Producers of Deadline for Quote Upload'||tt.subject== 'Quote Deadline Download All Quotes and Save'||tt.subject== 'Create Quote Comparison Net Rate Calculator Sheet'||tt.subject== 'Present Quote Analysis (Power Point) to Account and Choose Producers for Best and Final Offer Phase'||tt.subject== 'Negotiate with Chosen Producers'||tt.subject== 'Coordinate Followup Meetings for Best and Final Producers to Present to Account'||tt.subject== 'Work with Client to Award Business')) {
                 tt.status ='completed';
            updatedTasks.Add(tt);
            }
            if(opp.stagename == 'Xdate Close Date' && (tt.subject == 'Full BR with Account Online'||tt.subject== 'Run Price Benchmark'||tt.subject== '810 & Bureau Info'||tt.subject== 'Send email #1'||tt.subject== 'Provide Account the necessary langauge to request loss runs via email'||tt.subject== 'Create Submission Package'||tt.subject== 'Get Market Assignments Approved by Account'||tt.subject== 'Submit Market Assignments and Auto Email Goes to Producers with Quote Deadline'||tt.subject== 'Contact all Participating Producers That Have Not Submitted Quotes'||tt.subject== 'Send Reminder Email to All Participating Producers of Deadline for Quote Upload'||tt.subject== 'Quote Deadline Download All Quotes and Save'||tt.subject== 'Create Quote Comparison Net Rate Calculator Sheet'||tt.subject== 'Present Quote Analysis (Power Point) to Account and Choose Producers for Best and Final Offer Phase'||tt.subject== 'Negotiate with Chosen Producers'||tt.subject== 'Coordinate Followup Meetings for Best and Final Producers to Present to Account'||tt.subject== 'Work with Client to Award Business'||tt.subject== 'Business Awarded - Add Contract to Account'||tt.Subject=='Xdate Close Date')){
                 tt.status ='completed';
            updatedTasks.Add(tt);
            }
           /* if(opp.stagename == 'Closed Lost' && (tt.subject == 'Full BR with Account Online'||tt.subject== 'Run Price Benchmark'||tt.subject== '810 & Bureau Info'||tt.subject== 'Send email #1'||tt.subject== 'Provide Account the necessary langauge to request loss runs via email'||tt.subject== 'Create Submission Package'||tt.subject== 'Get Market Assignments Approved by Account'||tt.subject== 'Submit Market Assignments and Auto Email Goes to Producers with Quote Deadline'||tt.subject== 'Contact all Participating Producers That Have Not Submitted Quotes'||tt.subject== 'Send Reminder Email to All Participating Producers of Deadline for Quote Upload'||tt.subject== 'Quote Deadline Download All Quotes and Save'||tt.subject== 'Create Quote Comparison Net Rate Calculator Sheet'||tt.subject== 'Present Quote Analysis (Power Point) to Account and Choose Producers for Best and Final Offer Phase'||tt.subject== 'Negotiate with Chosen Producers'||tt.subject== 'Coordinate Followup Meetings for Best and Final Producers to Present to Account'||tt.subject== 'Work with Client to Award Business'||tt.subject== 'Business Awarded - Add Contract to Account'||tt.subject== 'Xdate Close Date')) {
                 tt.status ='completed';
            updatedTasks.Add(tt);
            }*/
        }
        }
        update updatedTasks;  
        
    }
}