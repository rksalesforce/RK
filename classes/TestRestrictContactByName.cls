@isTest
public class TestRestrictContactByName {
    static testmethod void tt1(){
        Contact con = new Contact(lastName ='INVALIDNAME');
        insert con;
    }
}