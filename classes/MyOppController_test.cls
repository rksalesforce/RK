@isTest
public class MyOppController_test{
    static testmethod void Test_clearTheCheckbox(){
        opportunity opp = new Opportunity(name = 'test',stageName = 'prospecting');
        insert opp;
        ApexPages.StandardController sc = new ApexPages.StandardController(opp);
        ApexPages.currentPage().getParameters().put('Id',opp.Id);
        MyOppController mo = new MyOppController(sc);
        
        mo.clearTheCheckbox();
    }
}