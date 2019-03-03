@isTest
public class CompsureTaskHelper_test{
     
    static testmethod void createTask_test(){
        List<Opportunity> oppList = new List<Opportunity>();
         Opportunity o1 = new Opportunity(name = 'test',stageName='SendEnail #1',closedate = system.today());
           oppList.Add(o1);
        insert oppList;
        
        system.debug('!!!!'+opplist);
        List<id> ids = new List<id>();
        for(Opportunity oo :oppList){
            ids.add(oo.id);
        }
        for(Opportunity o : opplist){
            o.name = 'test12';
        }
        update opplist;
        system.debug('@@@'+ids);
        List<Task> lstTAsks = [select id,subject from Task where Whatid IN : ids];
        system.debug('####'+lstTAsks);
        CompsurreTasks_helper.createTasks(ids);
        CompsurreTasks_helper.updateTasks(ids);

    }
}