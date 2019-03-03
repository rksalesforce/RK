@isTest
public class createMultipleTasks1_test{
    static testmethod void Test_firsdtTask(){
    List<Opportunity> oppList = new List<Opportunity>();
       Opportunity opp = new Opportunity(name = 'test',closedate = system.today().Adddays(110),stagename = 'Send Email #1');
       oppList.Add(opp);
       insert oppList;
       Task t = new Task(subject = 'test');
        Task t1 = new Task(subject = 'test1');
        insert t;
        insert t1;
        List<task> tlist = [select id,subject from Task];
        createMultipleTasks1 cm = new createMultipleTasks1();
        cm.firstTask(opp.id);
    }
}