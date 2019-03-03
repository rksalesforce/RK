public class OpportunityInsert {

Public opportunity Opp{get;set;}

    public OpportunityInsert(ApexPages.StandardController controller) {
        Opp = (Opportunity) controller.getRecord(); 
    }
    public void changePickList(){
        if(opp.rapid_renewal__c= true){
          //  opp.Stage__C= 'Full BR with Account Online ';
        }
    } 
public void insertOpp (){
    insert Opp;
}
}