@isTest
public class Test_ContactCreate {
    static testmethod void createcontact_test(){
        Contact cc = new Contact(lastname='test');
        Contactcreate c = new Contactcreate();
        c.createcontact();
    }
}