@isTest
public class CreateOppRelatedTasksHelper_test{
    static testmethod void Test_createTasks(){
        Opportunity opp = new Opportunity(name = 'test',stageName='Full BR with Account Online',closedate = system.today());
        insert opp;
        Task t = new Task(subject = 'test',whatid = opp.id);
        insert t;
        CreateOppRelatedTasksHelper.createTasks(opp.id);
        CreateOppRelatedTasksHelper.taskValidation(opp.id);
    }
    static testmethod void Test_createTasks1(){
        Opportunity opp = new Opportunity(name = 'test',stageName='Run Price Benchmark',closedate = system.today());
        insert opp;
        Task t = new Task(subject = 'test',whatid = opp.id);
        insert t;
        CreateOppRelatedTasksHelper.createTasks(opp.id);
    }
    static testmethod void Test_createTasks2(){
        Opportunity opp = new Opportunity(name = 'test',stageName='810 & Bureau Info',closedate = system.today());
        insert opp;
        Task t = new Task(subject = 'test',whatid = opp.id);
        insert t;
        CreateOppRelatedTasksHelper.createTasks(opp.id);
    }
    static testmethod void Test_createTasks3(){
        Opportunity opp = new Opportunity(name = 'test',stageName='Send email #1',closedate = system.today());
        insert opp;
        Task t = new Task(subject = 'test',whatid = opp.id);
        insert t;
        CreateOppRelatedTasksHelper.createTasks(opp.id);
    }
    static testmethod void Test_createTasks4(){
        Opportunity opp = new Opportunity(name = 'test',stageName='Provide Account the necessary langauge to request loss runs via email',closedate = system.today());
        insert opp;
        Task t = new Task(subject = 'test',whatid = opp.id);
        insert t;
        CreateOppRelatedTasksHelper.createTasks(opp.id);
    }
    static testmethod void Test_createTasks5(){
        Opportunity opp = new Opportunity(name = 'test',stageName='Create Submission Package',closedate = system.today());
        insert opp;
        Task t = new Task(subject = 'test',whatid = opp.id);
        insert t;
        CreateOppRelatedTasksHelper.createTasks(opp.id);
    }
    static testmethod void Test_createTasks6(){
        Opportunity opp = new Opportunity(name = 'test',stageName='Get Market Assignments Approved by Account',closedate = system.today());
        insert opp;
        Task t = new Task(subject = 'test',whatid = opp.id);
        insert t;
        CreateOppRelatedTasksHelper.createTasks(opp.id);
    }
    static testmethod void Test_createTasks7(){
        Opportunity opp = new Opportunity(name = 'test',stageName='Submit Market Assignments and Auto Email Goes to Producers with Quote Deadline',closedate = system.today());
        insert opp;
        Task t = new Task(subject = 'test',whatid = opp.id);
        insert t;
        CreateOppRelatedTasksHelper.createTasks(opp.id);
    }
    static testmethod void Test_createTasks8(){
        Opportunity opp = new Opportunity(name = 'test',stageName='Contact all Participating Producers That Have Not Submitted Quotes',closedate = system.today());
        insert opp;
        Task t = new Task(subject = 'test',whatid = opp.id);
        insert t;
        CreateOppRelatedTasksHelper.createTasks(opp.id);
    }
    static testmethod void Test_createTasks9(){
        Opportunity opp = new Opportunity(name = 'test',stageName='Send Reminder Email to All Participating Producers of Deadline for Quote Upload',closedate = system.today());
        insert opp;
        Task t = new Task(subject = 'test',whatid = opp.id);
        insert t;
        CreateOppRelatedTasksHelper.createTasks(opp.id);
    }
    static testmethod void Test_createTasks10(){
        Opportunity opp = new Opportunity(name = 'test',stageName='Quote Deadline Download All Quotes and Save',closedate = system.today());
        insert opp;
        Task t = new Task(subject = 'test',whatid = opp.id);
        insert t;
        CreateOppRelatedTasksHelper.createTasks(opp.id);
    }
    static testmethod void Test_createTasks11(){
        Opportunity opp = new Opportunity(name = 'test',stageName='Create Quote Comparison Net Rate Calculator Sheet',closedate = system.today());
        insert opp;
        Task t = new Task(subject = 'test',whatid = opp.id);
        insert t;
        CreateOppRelatedTasksHelper.createTasks(opp.id);
    }
    static testmethod void Test_createTasks12(){
        Opportunity opp = new Opportunity(name = 'test',stageName='Present Quote Analysis (Power Point) to Account and Choose Producers for Best and Final Offer Phase',closedate = system.today());
        insert opp;
        Task t = new Task(subject = 'test',whatid = opp.id);
        insert t;
        CreateOppRelatedTasksHelper.createTasks(opp.id);
    }
    static testmethod void Test_createTasks13(){
        Opportunity opp = new Opportunity(name = 'test',stageName='Negotiate with Chosen Producers',closedate = system.today());
        insert opp;
        Task t = new Task(subject = 'test',whatid = opp.id);
        insert t;
        CreateOppRelatedTasksHelper.createTasks(opp.id);
    }
    static testmethod void Test_createTasks14(){
        Opportunity opp = new Opportunity(name = 'test',stageName='Coordinate Followup Meetings for Best and Final Producers to Present to Account',closedate = system.today());
        insert opp;
        Task t = new Task(subject = 'test',whatid = opp.id);
        insert t;
        CreateOppRelatedTasksHelper.createTasks(opp.id);
    }
    static testmethod void Test_createTasks15(){
        Opportunity opp = new Opportunity(name = 'test',stageName='Work with Client to Award Business',closedate = system.today());
        insert opp;
        Task t = new Task(subject = 'test',whatid = opp.id);
        insert t;
        CreateOppRelatedTasksHelper.createTasks(opp.id);
    }
    static testmethod void Test_createTasks16(){
        Opportunity opp = new Opportunity(name = 'test',stageName='Business Awarded - Add Contract to Account',closedate = system.today());
        insert opp;
        Task t = new Task(subject = 'test',whatid = opp.id);
        insert t;
        CreateOppRelatedTasksHelper.createTasks(opp.id);
    }
    static testmethod void Test_createTasks17(){
        Opportunity opp = new Opportunity(name = 'test',stageName='Xdate Close Date',closedate = system.today());
        insert opp;
        Task t = new Task(subject = 'test',whatid = opp.id);
        insert t;
        CreateOppRelatedTasksHelper.createTasks(opp.id);
    }
    
    
}