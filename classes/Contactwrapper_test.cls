@isTest
public class Contactwrapper_test {
    static testmethod void Testconwrap(){
    	Contact con = new Contact(lastname='test');
        insert con;
        Contact c = new Contact();
       // Phone p = new Phone();
    }
}