@isTest
public class Test_PickList {
    static testmethod void test_countryNames(){
        
        Picklist p = new picklist();
        p.countryNames();
        p.show();
    }
}