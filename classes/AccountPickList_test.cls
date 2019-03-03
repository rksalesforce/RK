@isTest
public class AccountPickList_test{
    static testmethod void test_getAllAccounts(){
    Account acc = new Account(name ='test');
    insert acc;
        AccountPickList ap = new AccountPickList();
        ap.show();
        ap.getAllAccounts();
    }
}