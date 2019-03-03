@isTest
public class Hello_test{
    static testmethod void test_hel(){
    
        Contact con = new Contact(lastname = 'test');
        insert con;
     
        Account acc = new Account(name = con.lastname);
        insert acc;
         contact con1  = new Contact(lastname = 'test11',accountid = acc.id);
         insert con1;
        Hello h = new Hello();
        h.addRow();
        h.save();
    }
}