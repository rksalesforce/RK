@isTest
public class ContactEdit_test{
static testmethod void test_edit(){
    Opportunity opp = new Opportunity(name = 'test',stageName = 'Send Email #1');
    insert opp;
    List<opportunity> lst = [select id from opportunity];
    ContactEdit c = new ContactEdit();
    c.edit();
}
}