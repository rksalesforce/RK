@isTest
public class UpdateTasksDuedate_helper_Test {
    static testmethod void Test_Update_TasksDuedate(){
       List<Opportunity> oppList = new List<Opportunity>();
        Opportunity o1 = new Opportunity(name = 'test',stageName='Run Price Benchmark',closedate = system.today());
        oppList.Add(o1);
        insert oppList;
        List<id> ids = new List<id>();
        for(Opportunity oo :oppList){
            ids.add(oo.id);
        }
        List<Task> lstTAsks = [select id,subject,status from Task where Whatid IN : ids];
        UpdateTaskDuedate_helper.Update_TasksDuedate(ids);
    }
     static testmethod void Test_Update_TasksDuedate1(){
       List<Opportunity> oppList = new List<Opportunity>();
        Opportunity o1 = new Opportunity(name = 'test',stageName='810 & Bureau Info',closedate = system.today());
        oppList.Add(o1);
        insert oppList;
        List<id> ids = new List<id>();
        for(Opportunity oo :oppList){
            ids.add(oo.id);
        }
        List<Task> lstTAsks = [select id,subject,status from Task where Whatid IN : ids];
        UpdateTaskDuedate_helper.Update_TasksDuedate(ids);
    }
    static testmethod void Test_Update_TasksDuedate2(){
       List<Opportunity> oppList = new List<Opportunity>();
        Opportunity o1 = new Opportunity(name = 'test',stageName='Send email #1',closedate = system.today());
        oppList.Add(o1);
        insert oppList;
        List<id> ids = new List<id>();
        for(Opportunity oo :oppList){
            ids.add(oo.id);
        }
        List<Task> lstTAsks = [select id,subject,status from Task where Whatid IN : ids];
        UpdateTaskDuedate_helper.Update_TasksDuedate(ids);
    }
    static testmethod void Test_Update_TasksDuedate3(){
       List<Opportunity> oppList = new List<Opportunity>();
        Opportunity o1 = new Opportunity(name = 'test',stageName='Provide Account the necessary langauge to request loss runs via email',closedate = system.today());
        oppList.Add(o1);
        insert oppList;
        List<id> ids = new List<id>();
        for(Opportunity oo :oppList){
            ids.add(oo.id);
        }
        List<Task> lstTAsks = [select id,subject,status from Task where Whatid IN : ids];
        UpdateTaskDuedate_helper.Update_TasksDuedate(ids);
    }
    static testmethod void Test_Update_TasksDuedate4(){
       List<Opportunity> oppList = new List<Opportunity>();
        Opportunity o1 = new Opportunity(name = 'test',stageName='Create Submission Package',closedate = system.today());
        oppList.Add(o1);
        insert oppList;
        List<id> ids = new List<id>();
        for(Opportunity oo :oppList){
            ids.add(oo.id);
        }
        List<Task> lstTAsks = [select id,subject,status from Task where Whatid IN : ids];
        UpdateTaskDuedate_helper.Update_TasksDuedate(ids);
    }
    static testmethod void Test_Update_TasksDuedate5(){
       List<Opportunity> oppList = new List<Opportunity>();
        Opportunity o1 = new Opportunity(name = 'test',stageName='Get Market Assignments Approved by Account',closedate = system.today());
        oppList.Add(o1);
        insert oppList;
        List<id> ids = new List<id>();
        for(Opportunity oo :oppList){
            ids.add(oo.id);
        }
        List<Task> lstTAsks = [select id,subject,status from Task where Whatid IN : ids];
        UpdateTaskDuedate_helper.Update_TasksDuedate(ids);
    }
    static testmethod void Test_Update_TasksDuedate6(){
       List<Opportunity> oppList = new List<Opportunity>();
        Opportunity o1 = new Opportunity(name = 'test',stageName='Submit Market Assignments and Auto Email Goes to Producers with Quote Deadline',closedate = system.today());
        oppList.Add(o1);
        insert oppList;
        List<id> ids = new List<id>();
        for(Opportunity oo :oppList){
            ids.add(oo.id);
        }
        List<Task> lstTAsks = [select id,subject,status from Task where Whatid IN : ids];
        UpdateTaskDuedate_helper.Update_TasksDuedate(ids);
    }
    static testmethod void Test_Update_TasksDuedate7(){
       List<Opportunity> oppList = new List<Opportunity>();
        Opportunity o1 = new Opportunity(name = 'test',stageName='Contact all Participating Producers That Have Not Submitted Quotes',closedate = system.today());
        oppList.Add(o1);
        insert oppList;
        List<id> ids = new List<id>();
        for(Opportunity oo :oppList){
            ids.add(oo.id);
        }
        List<Task> lstTAsks = [select id,subject,status from Task where Whatid IN : ids];
        UpdateTaskDuedate_helper.Update_TasksDuedate(ids);
    }
    static testmethod void Test_Update_TasksDuedate8(){
       List<Opportunity> oppList = new List<Opportunity>();
        Opportunity o1 = new Opportunity(name = 'test',stageName='Send Reminder Email to All Participating Producers of Deadline for Quote Upload',closedate = system.today());
        oppList.Add(o1);
        insert oppList;
        List<id> ids = new List<id>();
        for(Opportunity oo :oppList){
            ids.add(oo.id);
        }
        List<Task> lstTAsks = [select id,subject,status from Task where Whatid IN : ids];
        UpdateTaskDuedate_helper.Update_TasksDuedate(ids);
    }
    static testmethod void Test_Update_TasksDuedate9(){
       List<Opportunity> oppList = new List<Opportunity>();
        Opportunity o1 = new Opportunity(name = 'test',stageName='Quote Deadline Download All Quotes and Save',closedate = system.today());
        oppList.Add(o1);
        insert oppList;
        List<id> ids = new List<id>();
        for(Opportunity oo :oppList){
            ids.add(oo.id);
        }
        List<Task> lstTAsks = [select id,subject,status from Task where Whatid IN : ids];
        UpdateTaskDuedate_helper.Update_TasksDuedate(ids);
    }
    static testmethod void Test_Update_TasksDuedate10(){
       List<Opportunity> oppList = new List<Opportunity>();
        Opportunity o1 = new Opportunity(name = 'test',stageName='Create Quote Comparison Net Rate Calculator Sheet',closedate = system.today());
        oppList.Add(o1);
        insert oppList;
        List<id> ids = new List<id>();
        for(Opportunity oo :oppList){
            ids.add(oo.id);
        }
        List<Task> lstTAsks = [select id,subject,status from Task where Whatid IN : ids];
        UpdateTaskDuedate_helper.Update_TasksDuedate(ids);
    }
    static testmethod void Test_Update_TasksDuedate11(){
       List<Opportunity> oppList = new List<Opportunity>();
        Opportunity o1 = new Opportunity(name = 'test',stageName='Present Quote Analysis (Power Point) to Account and Choose Producers for Best and Final Offer Phase',closedate = system.today());
        oppList.Add(o1);
        insert oppList;
        List<id> ids = new List<id>();
        for(Opportunity oo :oppList){
            ids.add(oo.id);
        }
        List<Task> lstTAsks = [select id,subject,status from Task where Whatid IN : ids];
        UpdateTaskDuedate_helper.Update_TasksDuedate(ids);
    }
    static testmethod void Test_Update_TasksDuedate12(){
       List<Opportunity> oppList = new List<Opportunity>();
        Opportunity o1 = new Opportunity(name = 'test',stageName='Negotiate with Chosen Producers',closedate = system.today());
        oppList.Add(o1);
        insert oppList;
        List<id> ids = new List<id>();
        for(Opportunity oo :oppList){
            ids.add(oo.id);
        }
        List<Task> lstTAsks = [select id,subject,status from Task where Whatid IN : ids];
        UpdateTaskDuedate_helper.Update_TasksDuedate(ids);
    }
    static testmethod void Test_Update_TasksDuedate13(){
       List<Opportunity> oppList = new List<Opportunity>();
        Opportunity o1 = new Opportunity(name = 'test',stageName='Coordinate Followup Meetings for Best and Final Producers to Present to Account',closedate = system.today());
        oppList.Add(o1);
        insert oppList;
        List<id> ids = new List<id>();
        for(Opportunity oo :oppList){
            ids.add(oo.id);
        }
        List<Task> lstTAsks = [select id,subject,status from Task where Whatid IN : ids];
        UpdateTaskDuedate_helper.Update_TasksDuedate(ids);
    }
    static testmethod void Test_Update_TasksDuedate14(){
       List<Opportunity> oppList = new List<Opportunity>();
        Opportunity o1 = new Opportunity(name = 'test',stageName='Work with Client to Award Business',closedate = system.today());
        oppList.Add(o1);
        insert oppList;
        List<id> ids = new List<id>();
        for(Opportunity oo :oppList){
            ids.add(oo.id);
        }
        List<Task> lstTAsks = [select id,subject,status from Task where Whatid IN : ids];
        UpdateTaskDuedate_helper.Update_TasksDuedate(ids);
    }
    static testmethod void Test_Update_TasksDuedate15(){
       List<Opportunity> oppList = new List<Opportunity>();
        Opportunity o1 = new Opportunity(name = 'test',stageName='Business Awarded - Add Contract to Account',closedate = system.today());
        oppList.Add(o1);
        insert oppList;
        List<id> ids = new List<id>();
        for(Opportunity oo :oppList){
            ids.add(oo.id);
        }
        List<Task> lstTAsks = [select id,subject,status from Task where Whatid IN : ids];
        UpdateTaskDuedate_helper.Update_TasksDuedate(ids);
    }
    static testmethod void Test_Update_TasksDuedate16(){
       List<Opportunity> oppList = new List<Opportunity>();
        Opportunity o1 = new Opportunity(name = 'test',stageName='Xdate Close Date',closedate = system.today());
        oppList.Add(o1);
        insert oppList;
        List<id> ids = new List<id>();
        for(Opportunity oo :oppList){
            ids.add(oo.id);
        }
        List<Task> lstTAsks = [select id,subject,status from Task where Whatid IN : ids];
        UpdateTaskDuedate_helper.Update_TasksDuedate(ids);
    }
    static testmethod void Test_Update_TasksDuedate17(){
       List<Opportunity> oppList = new List<Opportunity>();
        Opportunity o1 = new Opportunity(name = 'test',stageName='Closed Lost',closedate = system.today());
        oppList.Add(o1);
        insert oppList;
        List<id> ids = new List<id>();
        for(Opportunity oo :oppList){
            ids.add(oo.id);
        }
        List<Task> lstTAsks = [select id,subject,status from Task where Whatid IN : ids];
        UpdateTaskDuedate_helper.Update_TasksDuedate(ids);
    }
    
    
    
}