@isTest
public class Contact_controller_test {
    static testmethod void save_test(){
            Contact con = new Contact(lastname = 'test');
        insert con;
        Contact_Controller c = new Contact_Controller();
        c.save();
    }
}